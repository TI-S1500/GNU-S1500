/* write.c - emit .o file - Copyright(C)1986 Free Software Foundation, Inc.
   Copyright (C) 1986,1987 Free Software Foundation, Inc.

This file is part of GAS, the GNU Assembler.

GAS is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 1, or (at your option)
any later version.

GAS is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with GAS; see the file COPYING.  If not, write to
the Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.  */

/*

   Umm, with real good luck, this thing should be set up to do byteordering
   correctly, but I may have managed to miss a place or two.  Treat a.out
   very carefully until you're SURE that it works. . .

   In order to cross-assemble the target machine must have an a.out header
   similar to the one in a.out.h on THIS machine.  Byteorder doesn't matter;
   we take special care of it, but the numbers must be the same SIZE (# of
   bytes) and in the same PLACE.  If this is not true, you will have some
   trouble.
 */

#include "as.h"
#include "md.h"
#include "subsegs.h"
#include "obstack.h"
#include "struc-symbol.h"
#include "write.h"
#include "symbols.h"
#include "coff-dat.h"  /* will incorporate these into system better */
 
#ifdef SPARC
#include "sparc.h"
#endif

void  append();

#ifdef hpux
#define EXEC_MACHINE_TYPE HP9000S200_ID
#endif

/*
 * In: length of relocation (or of address) in chars: 1, 2 or 4.
 * Out: GNU LD relocation length code: 0, 1, or 2.
 */

extern int do_1500_coff;

static unsigned char

nbytes_r_length [] = {
   42, 0, 1, 42, 2
};


static struct frag * text_frag_root;
static struct frag * data_frag_root;

static struct frag * text_last_frag;   /* Last frag in segment. */
static struct frag * data_last_frag;   /* Last frag in segment. */

static struct exec_struct the_coff_exec = {
   { 0x150, 3, 0, 0, 0, 0, 0x100 },  /* clm - changed to 0x100 for lineno's */
   { ".text", 0, 0 ,0 ,sizeof(the_coff_exec) \
                  ,0 ,0 ,0 ,0 , 0x20 },
   { ".data", 0, 0 ,0 ,0 ,0 ,0 ,0 ,0 , 0x40 },
   { ".bss", 0, 0 ,0 ,0 ,0 ,0 ,0 ,0 , 0x80 }
};

#define TEXT_SECTION 1
#define DATA_SECTION 2

static struct exec   the_exec;

static long int string_byte_count;

static char *     the_object_file;

/* 05/23/90 clm - code to maintain linked list of function sizes 
   needed for the function symbol's x_fsize field. 
   The structure fsizeS is defined in coff-dat.h  */
fsizeS * fsize_rootP;
fsizeS * fsize_lastP;
/* clm - other coff stuff */
static long int   TEXT_index;
static long int   DATA_index;
static long int   BSS_index;
void coff_it_up();
#define n_endndx  sy_aux->coff_auxent.x_sym.x_fcnary.x_fcn.x_endndx  

#ifndef SPARC
static
#endif
char *      next_object_file_charP; /* Tracks object file bytes. */

static long int      size_of_the_object_file; /* # bytes in object file. */

/* static long int      length; JF unused */ /* String length, including trailing '\0'. */

static void relax_segment();
void     emit_segment();
static relax_addressT   relax_align();
static long int   fixup_segment();
#ifndef SPARC
static void    emit_relocations();
#endif



/*
 *       fix_new()
 *
 * Create a fixS in obstack 'notes'.
 */
void
#ifdef SPARC
fix_new (frag, where, size, add_symbol, sub_symbol, offset, pcrel, r_type)
#else
fix_new (frag, where, size, add_symbol, sub_symbol, offset, pcrel)
#endif
fragS *  frag;    /* Which frag? */
int   where;      /* Where in that frag? */
short int   size;    /* 1, 2  or 4 usually. */
symbolS *   add_symbol; /* X_add_symbol. */
symbolS *   sub_symbol; /* X_subtract_symbol. */
long int offset;     /* X_add_number. */
int   pcrel;      /* TRUE if PC-relative relocation. */
#ifdef SPARC
int      r_type;
#endif
{
   register fixS *   fixP;

   fixP = (fixS *)obstack_alloc(&notes,sizeof(fixS));

   fixP -> fx_frag   = frag;
   fixP -> fx_where  = where;
   fixP -> fx_size   = size;
   fixP -> fx_addsy  = add_symbol;
   fixP -> fx_subsy  = sub_symbol;
   fixP -> fx_offset = offset;
   fixP -> fx_pcrel  = pcrel;
   fixP -> fx_next   = * seg_fix_rootP;

   /* JF these 'cuz of the NS32K stuff */
   fixP -> fx_im_disp   = 0;
   fixP -> fx_pcrel_adjust = 0;
   fixP -> fx_bsr = 0;
   fixP ->fx_bit_fixP   = 0;

#ifdef SPARC
   fixP->fx_r_type = r_type;
#endif

   * seg_fix_rootP = fixP;
}


/* 05/10/90 clm - added lnno_siz for coff line number entries */
unsigned text_siz, data_siz, syms_siz, tr_siz, dr_siz, lnno_siz;


/* make sure these are not garbage */
init_fsize_chain()
{
  fsize_rootP = NULL;
  fsize_lastP = NULL;
}

/*  fsizeS *  we don't need to return anything */ 
fsize_new (long fsize)
{  
  register fsizeS *  fsizeP;

  fsizeP = (fsizeS *)obstack_alloc(&notes, sizeof(fsizeS)); 

  /* fill in field info */
  fsizeP->fcn_size = fsize;

  /* maintain linked list */
  if (fsize_lastP)
    {
      fsize_lastP -> fsize_next = fsizeP;
    }
  else
    {
      fsize_rootP = fsizeP;
    }
  fsize_lastP = fsizeP;

/*  return (fsizeP);  */
}

void
write_object_file()
{
   register struct frchain *  frchainP; /* Track along all frchains. */
   register fragS *     fragP;   /* Track along all frags. */
   register struct frchain *  next_frchainP;
   register fragS * *      prev_fragPP;
   register char *      name;
   register symbolS *      symbolP;
   register symbolS **     symbolPP;
   /* register fixS *      fixP; JF unused */

   unsigned
   number_of_trs,      /* number of text relocation entries  */
   number_of_drs,       /* number of data relocation entries  */
     coff_counter;

   register linenoS *      linenoP;
   unsigned number_of_linenos;     /* number of line number entries */
   register long int    fsize = 0;  /* used to calculate fcn size */
   register fsizeS * fsizeP;

   void output_file_create();
   void output_file_append();
   void output_file_close();
   void gdb_emit();
   void gdb_end();
   extern long omagic;     /* JF magic # to write out.  Is different for
                     Suns and Vaxen and other boxes */

   /* new for coff directives - we keep a chain of function sizes */ 
   init_fsize_chain();
   coff_it_up(); /* moved this up to see something */ 
#ifdef   VMS
   /*
   *  Under VMS we try to be compatible with VAX-11 "C".  Thus, we
   *  call a routine to check for the definition of the procedure
   *  "_main", and if so -- fix it up so that it can be program
   *  entry point.
   */
   VMS_Check_For_Main();
#endif /* VMS */
   /*
   * After every sub-segment, we fake an ".align ...". This conforms to BSD4.2
   * brane-damage. We then fake ".fill 0" because that is the kind of frag
   * that requires least thought. ".align" frags like to have a following
   * frag since that makes calculating their intended length trivial.
   */
#define SUB_SEGMENT_ALIGN (2)
   for ( frchainP=frchain_root; frchainP; frchainP=frchainP->frch_next )
   {
#ifdef   VMS
      /*
       * Under VAX/VMS, the linker (and PSECT specifications)
       * take care of correctly aligning the segments.
       * Doing the alignment here (on initialized data) can
       * mess up the calculation of global data PSECT sizes.
       */
#undef   SUB_SEGMENT_ALIGN
#define  SUB_SEGMENT_ALIGN ((frchainP->frch_seg != SEG_DATA) ? 2 : 0)
#endif   /* VMS */
      subseg_new (frchainP -> frch_seg, frchainP -> frch_subseg);
      frag_align (SUB_SEGMENT_ALIGN, 0);
      /* frag_align will have left a new frag. */
      /* Use this last frag for an empty ".fill". */
      /*
       * For this segment ...
       * Create a last frag. Do not leave a "being filled in frag".
       */
      frag_wane (frag_now);
      frag_now -> fr_fix   = 0;
      know( frag_now -> fr_next == NULL );
      /* know( frags . obstack_c_base == frags . obstack_c_next_free ); */
      /* Above shows we haven't left a half-completed object on obstack. */
   }

   /*
   * From now on, we don't care about sub-segments.
   * Build one frag chain for each segment. Linked thru fr_next.
   * We know that there is at least 1 text frchain & at least 1 data frchain.
   */
   prev_fragPP = &text_frag_root;
   for ( frchainP=frchain_root; frchainP; frchainP=next_frchainP )
   {
      know( frchainP -> frch_root );
      * prev_fragPP = frchainP -> frch_root;
      prev_fragPP = & frchainP -> frch_last -> fr_next;
      if (   ((next_frchainP = frchainP->frch_next) == NULL)
          || next_frchainP == data0_frchainP)
      {
         prev_fragPP = & data_frag_root;
         if ( next_frchainP )
         {
            text_last_frag = frchainP -> frch_last;
         }
         else
         {
            data_last_frag = frchainP -> frch_last;
         }
      }
   }           /* for(each struct frchain) */

   /*
   * We have two segments. If user gave -R flag, then we must put the
   * data frags into the text segment. Do this before relaxing so
   * we know to take advantage of -R and make shorter addresses.
   */
   if ( flagseen [ 'R' ] )
   {
      fixS *tmp;

      text_last_frag -> fr_next = data_frag_root;
      text_last_frag = data_last_frag;
      data_last_frag = NULL;
      data_frag_root = NULL;
      if(text_fix_root) {
         for(tmp=text_fix_root;tmp->fx_next;tmp=tmp->fx_next)
            ;
         tmp->fx_next=data_fix_root;
      } else
         text_fix_root=data_fix_root;
      data_fix_root=NULL;
   }

   relax_segment (text_frag_root, SEG_TEXT);
   relax_segment (data_frag_root, SEG_DATA);
   /*
   * Now the addresses of frags are correct within the segment.
   */

   know(   text_last_frag -> fr_type   == rs_fill && text_last_frag -> fr_offset == 0 );
   text_siz=text_last_frag->fr_address;
#ifdef SPARC
   text_siz= (text_siz+7)&(~7);
   text_last_frag->fr_address=text_siz;
#endif
   if (do_1500_coff) {
     md_number_to_chars((char *)&the_coff_exec.text_scn.s_size,text_siz, 
			sizeof(the_coff_exec.text_scn.s_size));
   }
   md_number_to_chars((char *)&the_exec.a_text,text_siz, sizeof(the_exec.a_text));
   /* the_exec . a_text = text_last_frag -> fr_address; */


   /*
   * Join the 2 segments into 1 huge segment.
   * To do this, re-compute every rn_address in the SEG_DATA frags.
   * Then join the data frags after the text frags.
   *
   * Determine a_data [length of data segment].
   */
   if (data_frag_root)
   {
      register relax_addressT slide;

      know(   text_last_frag -> fr_type   == rs_fill && text_last_frag -> fr_offset == 0 );
      data_siz=data_last_frag->fr_address;
#ifdef SPARC
      data_siz += (8 - (data_siz % 8)) % 8;
      data_last_frag->fr_address = data_siz;
#endif
		if (do_1500_coff) {
      	md_number_to_chars((char *)&the_coff_exec.data_scn.s_size,
				data_siz,sizeof(the_coff_exec.data_scn.s_size));
		}
      md_number_to_chars((char *)&the_exec.a_data,data_siz,sizeof(the_exec.a_data));
      /* the_exec . a_data = data_last_frag -> fr_address; */
      slide = text_siz; /* Address in file of the data segment. */
      for (fragP = data_frag_root;
          fragP;
          fragP = fragP -> fr_next)
      {
         fragP -> fr_address += slide;
      }
      know( text_last_frag );
      text_last_frag -> fr_next = data_frag_root;
   }
   else {

		if (do_1500_coff) {
      	md_number_to_chars((char *)&the_coff_exec.data_scn.s_size,0,
				sizeof(the_coff_exec.data_scn.s_size));
		}
      md_number_to_chars((char *)&the_exec.a_data, 0 ,sizeof(the_exec.a_data));
      data_siz = 0;
   }

   bss_address_frag . fr_address = text_siz + data_siz;
#ifdef SPARC
   local_bss_counter=(local_bss_counter+7)&(~7);
#endif
	if (do_1500_coff) {
   	md_number_to_chars((char *)&the_coff_exec.bss_scn.s_size,
			local_bss_counter,sizeof(the_coff_exec.bss_scn.s_size));
	}
   md_number_to_chars((char *)&the_exec.a_bss,local_bss_counter,sizeof(the_exec.a_bss));


   /*
   *
   * Crawl the symbol chain.
   *
   * For each symbol whose value depends on a frag, take the address of
   * that frag and subsume it into the value of the symbol.
   * After this, there is just one way to lookup a symbol value.
   * Values are left in their final state for object file emission.
   * We adjust the values of 'L' local symbols, even if we do
   * not intend to emit them to the object file, because their values
   * are needed for fix-ups.
   *
   * Unless we saw a -L flag, remove all symbols that begin with 'L'
   * from the symbol chain.
   *
   * Count the (length of the nlists of the) (remaining) symbols.
   * Assign a symbol number to each symbol.
   * Count the number of string-table chars we will emit.
   *
   * Also count the number of auxents - these will have to figure into
   * syms_siz.  To make things faster, should just count auxents at read time.
   *
   */
   know( zero_address_frag . fr_address == 0 );
   string_byte_count = sizeof( string_byte_count );

   /* JF deal with forward references first. . . */
   for(symbolP=symbol_rootP;symbolP;symbolP=symbolP->sy_next) {
      if(symbolP->sy_forward) {
         symbolP->sy_value+=symbolP->sy_forward->sy_value+symbolP->sy_forward->sy_frag->fr_address;
         symbolP->sy_forward=0;
      }
   }

   /* clm - this function takes all the externals and puts them
      at the end of the symbol table - coff-ishly */
/*   coff_it_up();  */

   symbolPP = & symbol_rootP; /* -> last symbol chain link. */
   {
      register long int    symbol_number;
      register long int    auxent_number;

      symbol_number = 0;

      while (symbolP  = * symbolPP)
      {
         name = symbolP -> sy_name;
         if(flagseen['R'] && (symbolP->sy_nlist.n_type&N_DATA)) {
            symbolP->sy_nlist.n_type&= ~N_DATA;
            symbolP->sy_nlist.n_type|= N_TEXT;
         }
         /* if(symbolP->sy_forward) {
	    symbolP->sy_value += symbolP->sy_forward->sy_value + symbolP->sy_forward->sy_frag->fr_address;
	    } */

	 if (do_1500_coff) {
	   if (symbolP->coff_sy_nlist.n_sclass == C_ARG ||
	       ( symbolP->coff_sy_nlist.n_sclass == C_EXT &&
		(symbolP->coff_sy_nlist.n_scnum == N_BSS ||
		 symbolP->coff_sy_nlist.n_scnum == N_UNDF) &&
		!ISFCN(symbolP->coff_sy_nlist.n_type))  ) {
	     as_warn("not reseting value for external");
	   }
	   else symbolP -> sy_value += symbolP -> sy_frag -> fr_address;
	 }
         else symbolP -> sy_value += symbolP -> sy_frag -> fr_address;
         /* JF the 128 bit is a hack so stabs like
         "LET_STMT:23. . ."  don't go away */
         /* CPH: 128 bit hack is moby loser.  N_SO for file "Lower.c"
      fell through the cracks.  I think that N_STAB should be
      used instead of 128. */
         /* JF the \001 bit is to make sure that local labels
         ( 1: - 9: don't make it into the symtable either */
#ifndef  VMS   /* Under VMS we need to keep local symbols */
         if ( !name || (symbolP->sy_nlist.n_type&N_STAB)
             || (name[0]!='\001' && (flagseen ['L'] || name [0] != 'L' ))
	     && (strcmp(name, ".ln") != 0) )
#endif   /* not VMS */
         {
            symbolP -> sy_number = symbol_number ++;
	    if (symbolP->coff_sy_nlist.n_numaux)
	      symbol_number++;  /* auxents count as one entry in table */
#ifndef  VMS
            if (name)
            {        /* Ordinary case. */
               symbolP -> sy_name_offset = string_byte_count;
	       if (do_1500_coff) {
		 if (strlen(symbolP->sy_name) > SYMNMLEN)
		   string_byte_count += strlen (symbolP  -> sy_name) + 1;
	       }
	       else 
		 string_byte_count += strlen (symbolP  -> sy_name) + 1;
            }
            else /* .Stabd case. */
#endif   /* not VMS */
               symbolP -> sy_name_offset = 0;
            symbolPP = & (symbolP -> sy_next);
         }
#ifndef  VMS
         else
            * symbolPP = symbolP -> sy_next;
#endif   /* not VMS */
       }           /* for each symbol */


      if (do_1500_coff) {
      	syms_siz = sizeof( struct syment) * symbol_number;
      	md_number_to_chars((char *)&the_coff_exec.the_filehdr.f_nsyms,
			   symbol_number,
			   sizeof(the_coff_exec.the_filehdr.f_nsyms));
      }			
      else {
      	syms_siz = sizeof( struct nlist) * symbol_number;
      	md_number_to_chars((char *)&the_exec.a_syms,syms_siz,
			   sizeof(the_exec.a_syms));
      }
      /* the_exec . a_syms = sizeof( struct nlist) * symbol_number; */
   }

   /*
   * Addresses of frags now reflect addresses we use in the object file.
   * Symbol values are correct.
   * Scan the frags, converting any ".org"s and ".align"s to ".fill"s.
   * Also converting any machine-dependent frags using md_convert_frag();
   */
   subseg_change( SEG_TEXT, 0);

   for (fragP = text_frag_root;  fragP;  fragP = fragP -> fr_next)
   {
      switch (fragP -> fr_type)
      {
      case rs_align:
      case rs_org:
         fragP -> fr_type = rs_fill;
         know( fragP -> fr_var == 1 );
         know( fragP -> fr_next );
         fragP -> fr_offset
             =     fragP -> fr_next -> fr_address
             -   fragP -> fr_address
             - fragP -> fr_fix;
         break;

      case rs_fill:
         break;

      case rs_machine_dependent:
         md_convert_frag (fragP);
         /*
      * After md_convert_frag, we make the frag into a ".space 0".
      * Md_convert_frag() should set up any fixSs and constants
      * required.
      */
         frag_wane (fragP);
         break;

#ifndef WORKING_DOT_WORD
      case rs_broken_word:
         {
            struct broken_word *lie;
            extern md_short_jump_size;
            extern md_long_jump_size;

            if(fragP->fr_subtype) {
               fragP->fr_fix+=md_short_jump_size;
               for(lie=(struct broken_word *)(fragP->fr_symbol);lie && lie->dispfrag==fragP;lie=
                   lie->next_broken_word)
                  if(lie->added==1)
                     fragP->fr_fix+=md_long_jump_size;
            }
            frag_wane(fragP);
         }
         break;
#endif

      default:
         BAD_CASE( fragP -> fr_type );
         break;
      }        /* switch (fr_type) */
   }           /* for each frag. */

#ifndef WORKING_DOT_WORD
   {
      struct broken_word *lie;
      struct broken_word **prevP;

      prevP= &broken_words;
      for(lie=broken_words; lie; lie=lie->next_broken_word)
         if(!lie->added) {
#ifdef SPARC
            fix_new(lie->frag,lie->word_goes_here - lie->frag->fr_literal,2,lie->add,lie->sub,lie->addnum,
                0, NO_RELOC);
#else
            fix_new(lie->frag,lie->word_goes_here - lie->frag->fr_literal,2,lie->add,lie->sub,lie->addnum,
                0);
#endif
            /* md_number_to_chars(lie->word_goes_here,
                lie->add->sy_value
                + lie->addnum
                - (lie->sub->sy_value),
              2); */
            *prevP=lie->next_broken_word;
         }
         else
            prevP= &(lie->next_broken_word);

      for(lie=broken_words;lie;) {
         struct broken_word *untruth;
         char  *table_ptr;
         long  table_addr;
         long  from_addr,
         to_addr;
         int   n,
         m;

         extern   md_short_jump_size;
         extern   md_long_jump_size;
         void  md_create_short_jump();
         void  md_create_long_jump();



         fragP=lie->dispfrag;

         /* Find out how many broken_words go here */
         n=0;
         for(untruth=lie;untruth && untruth->dispfrag==fragP;untruth=untruth->next_broken_word)
            if(untruth->added==1)
               n++;

         table_ptr=lie->dispfrag->fr_opcode;
         table_addr=lie->dispfrag->fr_address+(table_ptr - lie->dispfrag->fr_literal);
         /* Create the jump around the long jumps */
         /* This is a short jump from table_ptr+0 to table_ptr+n*long_jump_size */
         from_addr=table_addr;
         to_addr = table_addr + md_short_jump_size + n * md_long_jump_size;
         md_create_short_jump(table_ptr,from_addr,to_addr,lie->dispfrag,lie->add);
         table_ptr+=md_short_jump_size;
         table_addr+=md_short_jump_size;

         for(m=0;lie && lie->dispfrag==fragP;m++,lie=lie->next_broken_word) {
            if(lie->added==2)
               continue;
            /* Patch the jump table */
            /* This is the offset from ??? to table_ptr+0 */
            to_addr =   table_addr
                - (lie->sub->sy_value);
            md_number_to_chars(lie->word_goes_here,to_addr,2);
            for(untruth=lie->next_broken_word;untruth && untruth->dispfrag==fragP;untruth=untruth->next_broken_word) {
               if(untruth->use_jump==lie)
                  md_number_to_chars(untruth->word_goes_here,to_addr,2);
            }

            /* Install the long jump */
            /* this is a long jump from table_ptr+0 to the final target */
            from_addr=table_addr;
            to_addr=lie->add->sy_value+lie->addnum;
            md_create_long_jump(table_ptr,from_addr,to_addr,lie->dispfrag,lie->add);
            table_ptr+=md_long_jump_size;
            table_addr+=md_long_jump_size;
         }
      }
   }
#endif
#ifndef  VMS
   /*
   * Scan every FixS performing fixups. We had to wait until now to do
   * this because md_convert_frag() may have made some fixSs.
   */
   /* the_exec . a_trsize
    = sizeof(struct relocation_info) * fixup_segment (text_fix_root, N_TEXT);
  the_exec . a_drsize
    = sizeof(struct relocation_info) * fixup_segment (data_fix_root, N_DATA); */

	if (do_1500_coff) {
   	number_of_trs = fixup_segment (text_fix_root, N_TEXT);
   	tr_siz=sizeof(struct reloc) * number_of_trs;
	}
	else {
   	tr_siz=sizeof(struct relocation_info) * 
				fixup_segment (text_fix_root, N_TEXT);
   	md_number_to_chars((char *)&the_exec.a_trsize, tr_siz ,
			sizeof(the_exec.a_trsize));
	}

	if (do_1500_coff) {
   	number_of_drs = fixup_segment (data_fix_root, N_DATA);
   	dr_siz=sizeof(struct reloc) * number_of_drs;
	}
	else {
   	dr_siz=sizeof(struct relocation_info) * 
			fixup_segment (data_fix_root, N_DATA);
   	md_number_to_chars((char *)&the_exec.a_drsize, dr_siz, 
			sizeof(the_exec.a_drsize));
	}

#ifdef EXEC_MACHINE_TYPE
   md_number_to_chars((char *)&the_exec.a_machtype, EXEC_MACHINE_TYPE, sizeof(the_exec.a_machtype));
#endif

	if (!do_1500_coff) {
   	md_number_to_chars((char *)&the_exec.a_magic,omagic,
			sizeof(the_exec.a_magic));
   	md_number_to_chars((char *)&the_exec.a_entry,0,sizeof(the_exec.a_entry));
	}
   /* the_exec . a_entry = 0; */

   /* 05/10/90 clm now have coff line number entries */
   if (do_1500_coff)
     lnno_siz = sizeof( struct lineno) * lineno_index;
   
   size_of_the_object_file =
       text_siz +
       data_siz +
       syms_siz +
       tr_siz +
       dr_siz;
	if (do_1500_coff) {
   	size_of_the_object_file +=
       sizeof( the_coff_exec ) +
		 12;
		if (string_byte_count > sizeof(string_byte_count) )
			size_of_the_object_file += string_byte_count;
	}
	else {
   	size_of_the_object_file +=
       sizeof( the_exec ) +
		 string_byte_count;
	}


   if (do_1500_coff)
     size_of_the_object_file += lnno_siz;


   next_object_file_charP
       = the_object_file
       = xmalloc ( size_of_the_object_file );

   output_file_create (out_file_name);

   /*
  Set up all the section headers for ti1500 coff format.
  05/09/90 clm - added lineno entries.
*/
	if (do_1500_coff) {
   	the_coff_exec.text_scn.s_size = text_siz;
   	the_coff_exec.text_scn.s_relptr = 
			sizeof(the_coff_exec) + text_siz + data_siz;
   	the_coff_exec.the_filehdr.f_symptr = the_coff_exec.text_scn.s_relptr +
       	dr_siz + tr_siz + lnno_siz;
	the_coff_exec.text_scn.s_lnnoptr = the_coff_exec.text_scn.s_relptr +
	  dr_siz + tr_siz;
   	the_coff_exec.text_scn.s_nreloc = number_of_trs;
	the_coff_exec.text_scn.s_nlnno = lineno_index; 
   	the_coff_exec.data_scn.s_scnptr = 
			the_coff_exec.text_scn.s_scnptr + text_siz;
   	the_coff_exec.data_scn.s_size = data_siz;
   	the_coff_exec.data_scn.s_paddr = 
			the_coff_exec.data_scn.s_vaddr = text_siz;
   	the_coff_exec.data_scn.s_nreloc = number_of_drs;
		if (number_of_drs) 
      	the_coff_exec.data_scn.s_relptr = 
				the_coff_exec.text_scn.s_relptr + tr_siz;
		else 
      	the_coff_exec.data_scn.s_relptr = 0;
	
   	the_coff_exec.bss_scn.s_paddr = the_coff_exec.bss_scn.s_vaddr =
       	(text_siz + data_siz);
	
   	append (& next_object_file_charP, (char *)(&the_coff_exec), 
			(unsigned long)sizeof(the_coff_exec));
	}
	else {
   	append (& next_object_file_charP, (char *)(&the_exec), 
			(unsigned long)sizeof(the_exec));
	}


   /*
   * Emit code.
   */
   for (fragP = text_frag_root;  fragP;  fragP = fragP -> fr_next)
   {
      register long int    count;
      register char *      fill_literal;
      register long int    fill_size;


      know( fragP -> fr_type == rs_fill );



      /* debug stuff */
      if (do_1500_coff) {

	if (fragP->fr_fix) 
	  fsize += fragP->fr_fix;

	if ( ( fragP->fr_fix == 0 ||
	      (fragP->fr_symbol == 0 &&
	       fragP->fr_opcode == 0) ) &&
	    fsize ) {
	  /* we have read in a complete function */
	  /* maintain a linked list of these sizes which
	     we will later associate with the function symbols */
	  fsize_new(fsize);
	  fsize = 0; /* reset fsize for next function */
	}
      }

      append (& next_object_file_charP, fragP -> fr_literal, (unsigned long)fragP -> fr_fix);
      fill_literal= fragP -> fr_literal + fragP -> fr_fix;
      fill_size   = fragP -> fr_var;
      know( fragP -> fr_offset >= 0 );
      for (count = fragP -> fr_offset;  count;  count --)
         append (& next_object_file_charP, fill_literal, (unsigned long)fill_size);
   }           /* for each code frag. */

   /*
   * Emit relocations.
   */
	if (do_1500_coff) {
   	emit_relocations (text_fix_root, (relax_addressT)0,TEXT_SECTION);
   	emit_relocations (data_fix_root, text_last_frag -> fr_address, 
			DATA_SECTION);
	}
	else {
   	emit_relocations (text_fix_root, (relax_addressT)0);
   	emit_relocations (data_fix_root, text_last_frag -> fr_address);
	}

   /*
    * Emit line number entries.
    * the symbol associated with the lineno entry contains the correct
    * physical address. use it
    */
   if (do_1500_coff) {
     for (linenoP = lineno_rootP; linenoP; linenoP = linenoP->ln_next)
       {
	 if (linenoP->coff_lineno.l_lnno) { 
	 linenoP->coff_lineno.l_addr.l_paddr =
	   linenoP->ln_sym->sy_nlist.n_value;
	 md_number_to_chars((char *)&(linenoP->coff_lineno.l_addr.l_paddr),
			    linenoP->coff_lineno.l_addr.l_paddr,
			    sizeof(linenoP->coff_lineno.l_addr.l_paddr));   
       }

	 append (& next_object_file_charP, 
		   (char *)(&linenoP->coff_lineno),
		   (unsigned long)sizeof(struct lineno));
       }
   }

   /*
   * Emit all symbols left in the symbol chain.
   * Any symbol still undefined is made N_EXT.
   */

   /* use fsizeP for function size */
   if (do_1500_coff)
     fsizeP = fsize_rootP;

   for (   coff_counter = 0 , symbolP = symbol_rootP;   symbolP;   
				symbolP = symbolP -> sy_next   )
   {
      register char *   temp;
      int coff_string;
      int coff_dir;

      temp = symbolP -> sy_nlist . n_un . n_name;

	/* as a final step must check for the .text, .data .bss 
	   symbols to fill in their auxent data */
	if (do_1500_coff &&
	    strcmp(temp, ".text") == 0) {
	  symbolP->coff_sy_nlist.n_value = 0;
	  symbolP->sy_nlist.n_value = 0;
	  symbolP->sy_aux->coff_auxent.x_scn.x_scnlen = text_siz;
	  symbolP->sy_aux->coff_auxent.x_scn.x_nreloc = number_of_trs;
	  symbolP->sy_aux->coff_auxent.x_scn.x_nlinno = lineno_index;
	}
	if (do_1500_coff &&
	    strcmp(temp, ".data") == 0) {
	  symbolP->coff_sy_nlist.n_value = symbolP->sy_nlist.n_value = 
	    the_coff_exec.data_scn.s_paddr;  
	  symbolP->sy_aux->coff_auxent.x_scn.x_scnlen = data_siz;
	  symbolP->sy_aux->coff_auxent.x_scn.x_nreloc = number_of_drs;
	  symbolP->sy_aux->coff_auxent.x_scn.x_nlinno = 0;	 
	}
	if (do_1500_coff &&
	    strcmp(temp, ".bss") == 0) {
	  symbolP->coff_sy_nlist.n_value = symbolP->sy_nlist.n_value = 
	    the_coff_exec.bss_scn.s_paddr;
	  symbolP->sy_aux->coff_auxent.x_scn.x_scnlen = 0;
	  symbolP->sy_aux->coff_auxent.x_scn.x_nreloc = 0;
	  symbolP->sy_aux->coff_auxent.x_scn.x_nlinno = 0;
	}

      /* JF fix the numbers up. Call by value RULES! */
      if (do_1500_coff) {
      	if (!symbolP->coff_sy_nlist. _n . _n_nptr[0] ) {
         	coff_string = 1;
         	md_number_to_chars((char *)&(symbolP -> coff_sy_name ),
             	symbolP -> sy_name_offset,sizeof(symbolP -> coff_sy_name ));
      	}
      	else coff_string = 0;
/*  -- debug --  md_number_to_chars can't handle negative numbers */
	if (symbolP->coff_sy_nlist.n_value >= 0)
	  md_number_to_chars((char *)&(symbolP->coff_sy_nlist.n_value),
			     symbolP->sy_nlist.n_value,
			     sizeof(symbolP->coff_sy_nlist.n_value));

		}

      md_number_to_chars((char *)&(symbolP -> sy_nlist  . n_un . n_strx ),
		   symbolP -> sy_name_offset,
			sizeof(symbolP -> sy_nlist  . n_un . n_strx ));

      md_number_to_chars((char *)&(symbolP->sy_nlist.n_desc),
			symbolP->sy_nlist.n_desc,sizeof(symbolP -> sy_nlist . n_desc));

      md_number_to_chars((char *)&(symbolP->sy_nlist.n_value),
			symbolP->sy_nlist.n_value,sizeof(symbolP->sy_nlist.n_value));

      /* symbolP -> sy_nlist  . n_un . n_strx = symbolP -> sy_name_offset;
			 JF replaced by md above */

      if (symbolP -> sy_type == N_UNDF)
         symbolP -> sy_type |= N_EXT; /* Any undefined symbols become >N_EXT. */

      if (do_1500_coff) {
	if (!symbolP->coff_sy_nlist.n_scnum) {
	  if (symbolP->sy_nlist.n_type & N_BSS) {
	    if (symbolP->coff_sy_nlist.n_sclass == C_EXT)
	      symbolP->coff_sy_nlist.n_scnum = 0;
	    else symbolP->coff_sy_nlist.n_scnum = 3;
	  }
	  else {
	    if ((symbolP->sy_nlist.n_type & N_DATA) == N_DATA)
	      symbolP->coff_sy_nlist.n_scnum = 2;
	    else
	      if (symbolP->sy_nlist.n_type & N_TEXT) {
		if (symbolP->coff_sy_nlist.n_scnum != COFF_N_ABS)
		  symbolP->coff_sy_nlist.n_scnum = 1;
	      }
	      else symbolP->coff_sy_nlist.n_scnum = 0;
	  }
	}
	if (!symbolP->coff_sy_nlist.n_sclass) { 
	  /*  (!symbolP->coff_sy_nlist.n_numaux) */
	  /* these have been handled */
	  if (symbolP->sy_nlist.n_type & N_EXT) 
         	symbolP->coff_sy_nlist.n_sclass = C_EXT;
	  else symbolP->coff_sy_nlist.n_sclass = C_STAT;
	}

      	append (& next_object_file_charP, (char *)(& symbolP -> coff_sy_nlist),
          	(unsigned long)sizeof(struct syment));
	if (symbolP->coff_sy_nlist.n_numaux) {
	  /* affraid i have to do number-to-char conversion on all 
	     the fields */
	  /* need convoluted logic to convert the auxent */
	  coff_dir = coff_tab_memq(temp);

	  switch (coff_dir) {
	  case bf:
      /* n_lnno */
      md_number_to_chars((char *)&(symbolP->sy_aux->coff_auxent.x_sym.x_misc.x_lnsz.x_lnno),
			 symbolP->sy_aux->coff_auxent.x_sym.x_misc.x_lnsz.x_lnno,
			 sizeof(symbolP->sy_aux->coff_auxent.x_sym.x_misc.x_lnsz.x_lnno));
      /* x_endndx */
      md_number_to_chars((char *)&(symbolP->sy_aux->coff_auxent.x_sym.x_fcnary.x_fcn.x_endndx),
			 symbolP->sy_aux->coff_auxent.x_sym.x_fcnary.x_fcn.x_endndx,
			 sizeof(symbolP->sy_aux->coff_auxent.x_sym.x_fcnary.x_fcn.x_endndx));
      break;
	  case bb:
	    break;
	  case ef:
      /* n_lnno */
      md_number_to_chars((char *)&(symbolP->sy_aux->coff_auxent.x_sym.x_misc.x_lnsz.x_lnno),
			 symbolP->sy_aux->coff_auxent.x_sym.x_misc.x_lnsz.x_lnno,
			 sizeof(symbolP->sy_aux->coff_auxent.x_sym.x_misc.x_lnsz.x_lnno));
	    break;
	  case eb:
	    break;
	  case eos:
	    break;
	  case dim:
	    break;
	  default:
      /* not a directive but a function/structure/array aux entry */
      if ( ISFCN(symbolP->coff_sy_nlist.n_type) ) {
	/* function entry - need the var for this magic number */
	/* x_tagndx */
/*	md_number_to_chars((char *)&(symbolP->sy_aux->coff_auxent.x_sym.x_tagndx),
			   symbolP->sy_aux->coff_auxent.x_sym.x_tagndx,
			   sizeof(symbolP->sy_aux->coff_auxent.x_sym.x_tagndx));
*/
        /* x_fsize */
	symbolP->sy_aux->coff_auxent.x_sym.x_misc.x_fsize = fsizeP->fcn_size;
	fsizeP = fsizeP->fsize_next;

/*	md_number_to_chars((char *)&(symbolP->sy_aux->coff_auxent.x_sym.x_misc.x_fsize),
			   symbolP->sy_aux->coff_auxent.x_sym.x_misc.x_fsize,
			   sizeof(symbolP->sy_aux->coff_auxent.x_sym.x_misc.x_fsize));
  */    
	/* x_lnnoptr */
	/* not sure all this md conversion stuff is necessary */

/*	md_number_to_chars((char *)&(symbolP->sy_aux->coff_auxent.x_sym.x_fcnary.x_fcn.x_lnnoptr),
			   symbolP->sy_aux->coff_auxent.x_sym.x_fcnary.x_fcn.x_lnnoptr,
			   sizeof(symbolP->sy_aux->coff_auxent.x_sym.x_fcnary.x_fcn.x_lnnoptr));
*/
      /* x_endndx */
	if (!symbolP->sy_aux->coff_auxent.x_sym.x_fcnary.x_fcn.x_endndx)
	  /* ie it's the last function in the chain, then it must point
	     supposedly off the the beginning of the static symbols.
	     As a trial, we point to the next symbol and hope. */
	  symbolP->sy_aux->coff_auxent.x_sym.x_fcnary.x_fcn.x_endndx =
 	    current_ef->sy_next->sy_number;     
	/* a problem with this solution is that there may not be another
	   symbol */
	md_number_to_chars((char *)&(symbolP->sy_aux->coff_auxent.x_sym.x_fcnary.x_fcn.x_endndx),
			   symbolP->sy_aux->coff_auxent.x_sym.x_fcnary.x_fcn.x_endndx,
			   sizeof(symbolP->sy_aux->coff_auxent.x_sym.x_fcnary.x_fcn.x_endndx)); 
      }

      /* if .text is really the beginning of the statics, then the last 
	 structure should point to it --- but that doesn't work yuch */
	    break;
    }
	  append (& next_object_file_charP, 
		  (char *)(& symbolP->sy_aux->coff_auxent),
		  (unsigned long)sizeof(union auxent));
	}
      	if (coff_string) symbolP -> coff_sy_name = temp;
      }
      else {
      	append (& next_object_file_charP, (char *)(& symbolP -> sy_nlist),
          	(unsigned long)sizeof(struct nlist));
      }

      symbolP -> sy_name = temp;

   }           /* for each symbol */

   /*
   * next_object_file_charP -> slot for next object byte.
   * Emit strings.
   * Find strings by crawling along symbol table chain.
   */
   /* Gotta do md_ byte-ordering stuff for string_byte_count first - KWK */
   md_number_to_chars((char *)&string_byte_count, string_byte_count, sizeof(string_byte_count));

	if (do_1500_coff) {
		if (string_byte_count > sizeof(string_byte_count) ) {
   	append (& next_object_file_charP, (char *)&string_byte_count, 
				(unsigned long)sizeof(string_byte_count));
		}
	}
	else {
   	append (& next_object_file_charP, (char *)&string_byte_count, 
			(unsigned long)sizeof(string_byte_count));
	}
   for ( coff_counter = 0,  symbolP = symbol_rootP;   symbolP;   
				symbolP = symbolP -> sy_next   )
     if (strcmp(symbolP->sy_name, ".ln") == 0)
       as_warn("skipping a lnno entry when doing the string table");
     else
       {
	 if (do_1500_coff) {
	   /* skip the first four symbols */
	   /* no longer a 'first four symbols' problem */
	   /*
	   if (!coff_counter) {
	     for(;coff_counter < 4; coff_counter++) {
	       symbolP = symbolP -> sy_next;
	     }
	   }
	   */
	   if (! symbolP -> coff_sy_nlist ._n  . _n_nptr[0])
	     {
	       append (& next_object_file_charP, symbolP -> coff_sy_name,
		       (unsigned long)(strlen (symbolP -> coff_sy_name) + 1));
	     }
	 }
	 else {
      	if (symbolP -> sy_name)
      	{        /* Ordinary case: not .stabd. */
         	append (& next_object_file_charP, symbolP -> sy_name,
             	(unsigned long)(strlen (symbolP -> sy_name) + 1));
      	}
		}
	      }           /* for each symbol */
   know( next_object_file_charP == the_object_file + size_of_the_object_file );

   output_file_append (the_object_file, size_of_the_object_file, out_file_name);

   if (flagseen['G'])      /* GDB symbol file to be appended? */
   {
      gdb_emit (out_file_name);
      gdb_end ();
   }

   output_file_close (out_file_name);
#else /* VMS */
   /*
   *  Now do the VMS-dependent part of writing the object file
   */
   VMS_write_object_file(text_siz, data_siz, text_frag_root, data_frag_root);
#endif   /* VMS */
}           /* write_object_file() */


/*
 *       relax_segment()
 *
 * Now we have a segment, not a crowd of sub-segments, we can make fr_address
 * values.
 *
 * Relax the frags.
 *
 * After this, all frags in this segment have addresses that are correct
 * within the segment. Since segments live in different file addresses,
 * these frag addresses may not be the same as final object-file addresses.
 */
#ifndef  VMS
static
#endif   /* not VMS */
void
relax_segment (segment_frag_root, segment_type)
struct frag *  segment_frag_root;
segT     segment_type; /* N_DATA or N_TEXT */
{
   register struct frag *  fragP;
   register relax_addressT address;
   /* register relax_addressT old_address; JF unused */
   /* register relax_addressT new_address; JF unused */

   know( segment_type == SEG_DATA || segment_type == SEG_TEXT );

   /* In case md_estimate_size_before_relax() wants to make fixSs. */
   subseg_change (segment_type, 0);

   /*
   * For each frag in segment: count and store  (a 1st guess of) fr_address.
   */
   address = 0;
   for ( fragP = segment_frag_root;   fragP;   fragP = fragP -> fr_next )
   {
      fragP -> fr_address = address;
      address += fragP -> fr_fix;
      switch (fragP -> fr_type)
      {
      case rs_fill:
         address += fragP -> fr_offset * fragP -> fr_var;
         break;

      case rs_align:
         address += relax_align (address, fragP -> fr_offset);
         break;

      case rs_org:
         /*
      * Assume .org is nugatory. It will grow with 1st relax.
      */
         break;

      case rs_machine_dependent:
         address += md_estimate_size_before_relax
             (fragP, seg_N_TYPE [(int) segment_type]);
         break;

#ifndef WORKING_DOT_WORD
         /* Broken words don't concern us yet */
      case rs_broken_word:
         break;
#endif

      default:
         BAD_CASE( fragP -> fr_type );
         break;
      }        /* switch(fr_type) */
   }           /* for each frag in the segment */


   /*
   * Do relax().
   */
   {
      register long int stretch; /* May be any size, 0 or negative. */
      /* Cumulative number of addresses we have */
      /* relaxed this pass. */
      /* We may have relaxed more than one address. */
      register long int stretched;  /* Have we stretched on this pass? */
      /* This is 'cuz stretch may be zero, when,
                 in fact some piece of code grew, and
                 another shrank.  If a branch instruction
                 doesn't fit anymore, we could be scrod */

      do
      {
         stretch = stretched = 0;
         for (fragP = segment_frag_root;  fragP;  fragP = fragP -> fr_next)
         {
            register long int growth;
            register long int was_address;
            /* register long int var; */
            register long int offset;
            register symbolS *   symbolP;
            register long int target;
            register long int after;
            register long int aim;

            was_address = fragP -> fr_address;
            address = fragP -> fr_address += stretch;
            symbolP = fragP -> fr_symbol;
	    /* clm 6/8/90 - added to handle symbols within
	       instructions that refer to a later coff defined 
	       symbol. eg hell9.c */
	    if (do_1500_coff &&
		symbolP &&
		symbolP->sy_number == 0 &&
		symbolP->sy_name[0] != 'L' &&
		/* these appear to be compiler generated constants? */ 
		/* this is going to byte us somewhere */
		symbolP->sy_name[0] != '_') {
	      /* this refers to a symbol that has 
		 been removed from one place in the symbol table
		 because at a later point a coff directive 
		 created the symbol again.  The relocation
		 informatin should be based on that symbol. */
	      symbolP = symbol_find(symbolP->sy_name);
	      if (!symbolP->sy_number)
		as_warn("got shit here "); 
	    }
            offset = fragP -> fr_offset;
            /* var = fragP -> fr_var; */
            switch (fragP -> fr_type)
            {
            case rs_fill:  /* .fill never relaxes. */
               growth = 0;
               break;

#ifndef WORKING_DOT_WORD
               /* JF:  This is RMS's idea.  I do *NOT* want to be blamed
         for it I do not want to write it.  I do not want to have
         anything to do with it.  This is not the proper way to
         implement this misfeature. */
            case rs_broken_word:
               {
                  struct broken_word *lie;
                  struct broken_word *untruth;
                  extern int md_short_jump_size;
                  extern int md_long_jump_size;

                  /* Yes this is ugly (storing the broken_word pointer
            in the symbol slot).  Still, this whole chunk of
            code is ugly, and I don't feel like doing anything
            about it.  Think of it as stubbornness in action */
                  growth=0;
                  for(lie=(struct broken_word *)(fragP->fr_symbol);
                      lie && lie->dispfrag==fragP;
                      lie=lie->next_broken_word) {

                     if(lie->added)
                        continue;
                     offset=  lie->add->sy_frag->fr_address+lie->add->sy_value + lie->addnum
                         -
                         (lie->sub->sy_frag->fr_address+lie->sub->sy_value);
                     if(offset<=-32768 || offset>=32767) {
                        if(flagseen['k'])
/* code folded from here */
   /* code folded from here */
   as_warn(".word %s-%s+%ld didn't fit",lie->add->sy_name,
       lie->sub->sy_name,lie->addnum);
/* unfolding */
                        /* unfolding */
                        lie->added=1;
                        if(fragP->fr_subtype==0) {
/* code folded from here */
   /* code folded from here */
   fragP->fr_subtype++;
   growth+=md_short_jump_size;
   /* unfolding */
/* unfolding */
                        }
                        for(untruth=lie->next_broken_word;untruth && untruth->dispfrag==lie->dispfrag;untruth=untruth->next_broken_word)
/* code folded from here */
   /* code folded from here */
   if(untruth->add->sy_frag==lie->add->sy_frag && untruth->add->sy_value==lie->add->sy_value) {
      untruth->added=2;
      untruth->use_jump=lie;
   }
/* unfolding */
                        /* unfolding */
                        growth+=md_long_jump_size;
                     }
                  }
               }
               break;
#endif
            case rs_align:
               growth = relax_align ((relax_addressT)(address + fragP -> fr_fix), offset)
                   - relax_align ((relax_addressT)(was_address +  fragP -> fr_fix), offset);
               break;

            case rs_org:
               target = offset;
               if (symbolP)
               {
                  know(   ((symbolP -> sy_type & N_TYPE) == N_ABS) || ((symbolP -> sy_type
                      & N_TYPE) == N_DATA) || ((symbolP -> sy_type & N_TYPE) == N_TEXT));
                  know( symbolP -> sy_frag );
                  know( (symbolP->sy_type&N_TYPE)!=N_ABS || symbolP->sy_frag==&zero_address_frag
                      );
                  target +=
                      symbolP -> sy_value
                      + symbolP -> sy_frag -> fr_address;
               }
               know( fragP -> fr_next );
               after = fragP -> fr_next -> fr_address;
               growth = (target <= address + fragP -> fr_fix) ? 0 : target - after;
               /* Growth may be -ve, but variable part */
               /* of frag cannot have < 0 chars. */
               /* That is, we can't .org backwards. */
               break;

            case rs_machine_dependent:
               {
                  register relax_typeS *  this_type;
                  register relax_typeS *  start_type;
                  register relax_substateT   next_state;
                  register relax_substateT   this_state;

                  start_type = this_type
                      = md_relax_table + (this_state = fragP -> fr_subtype);
                  target = offset;
                  if (symbolP)
                  {
                     know(   ((symbolP -> sy_type & N_TYPE) == N_ABS) || ((symbolP ->
                         sy_type &
                         N_TYPE) == N_DATA) || ((symbolP -> sy_type & N_TYPE) == N_TEXT));
                     know( symbolP -> sy_frag );
                     know( (symbolP->sy_type&N_TYPE)!=N_ABS || symbolP->sy_frag==&zero_address_frag
                         );
                     target +=
                         symbolP -> sy_value
                         + symbolP -> sy_frag -> fr_address;

                     /* If frag has yet to be reached on this pass,
            assume it will move by STRETCH just as we did.
            If this is not so, it will be because some frag
            between grows, and that will force another pass.  */

                     /* JF was just address */
                     /* JF also added isdnrange hack */
                     /* There's gotta be a better/faster/etc way
               to do this. . . */
                     if (symbolP->sy_frag->fr_address > was_address && isdnrange(fragP,
                         symbolP->sy_frag))
                        target += stretch;

                  }
                  aim = target - address - fragP -> fr_fix;
                  if (aim < 0)
                  {
                     /* Look backwards. */
                     for (next_state = this_type -> rlx_more;  next_state;  )
                     {
                        if (aim >= this_type -> rlx_backward)
/* code folded from here */
   /* code folded from here */
   next_state = 0;
   /* unfolding */
/* unfolding */
                        else
                        {  /* Grow to next state. */
/* code folded from here */
   /* code folded from here */
   this_type = md_relax_table + (this_state = next_state);
   next_state = this_type -> rlx_more;
   /* unfolding */
/* unfolding */
                        }
                     }
                  }
                  else
                  {
#ifdef DONTDEF
                     /* JF these next few lines of code are for the mc68020 which can't handle short
   offsets of zero in branch instructions.  What a kludge! */
                     if(aim==0 && this_state==(1<<2+0)) {   /* FOO hard encoded from m.c */
                        aim=this_type->rlx_forward+1; /* Force relaxation into word mode */
                     }
#endif
                     /* JF end of 68020 code */
                     /* Look forwards. */
                     for (next_state = this_type -> rlx_more;  next_state;  )
                     {
                        if (aim <= this_type -> rlx_forward)
/* code folded from here */
   /* code folded from here */
   next_state = 0;
   /* unfolding */
/* unfolding */
                        else
                        {  /* Grow to next state. */
/* code folded from here */
   /* code folded from here */
   this_type = md_relax_table + (this_state = next_state);
   next_state = this_type -> rlx_more;
   /* unfolding */
/* unfolding */
                        }
                     }
                  }
                  if (growth = this_type -> rlx_length - start_type -> rlx_length)
                     fragP -> fr_subtype = this_state;
               }
               break;

            default:
               BAD_CASE( fragP -> fr_type );
               break;
            }
            if(growth) {
               stretch += growth;
               stretched++;
            }
         }        /* For each frag in the segment. */
      } while (stretched); /* Until nothing further to relax. */
   }

   /*
   * We now have valid fr_address'es for each frag.
   */

   /*
   * All fr_address's are correct, relative to their own segment.
   * We have made all the fixS we will ever make.
   */
}           /* relax_segment() */


/*
 * Relax_align. Advance location counter to next address that has 'alignment'
 * lowest order bits all 0s.
 */

static relax_addressT      /* How many addresses does the .align take? */
relax_align (address, alignment)
register relax_addressT address; /* Address now. */
register long int    alignment; /* Alignment (binary). */
{
   relax_addressT mask;
   relax_addressT new_address;

   mask = ~ ( (~0) << alignment );
   new_address = (address + mask) & (~ mask);
   return (new_address - address);
}


/*
 *       fixup_segment()
 */
static long int
fixup_segment (fixP, this_segment_type)
register fixS *   fixP;
int      this_segment_type; /* N_TYPE bits for segment. */
{
   register long int    seg_reloc_count;
   /* JF these all used to be local to the for loop, but GDB doesn't seem to be able to deal with them there, so I moved them here for a bit. */
   register symbolS *   add_symbolP;
   register symbolS *   sub_symbolP;
   register long int    add_number;
   register int      size;
   register char *      place;
   register long int    where;
   register char     pcrel;
   register fragS *     fragP;
   register int      add_symbol_N_TYPE;


   seg_reloc_count = 0;
   for ( ;  fixP;  fixP = fixP -> fx_next)
   {
      fragP       = fixP  -> fx_frag;
      know( fragP );
      where   = fixP  -> fx_where;
      place       = fragP -> fr_literal + where;
      size    = fixP  -> fx_size;
      add_symbolP = fixP  -> fx_addsy;
      if (do_1500_coff &&
	  add_symbolP &&
	  add_symbolP->sy_number == 0 &&
	  /* doesn't concern local labels */
	  add_symbolP->sy_name[0] != 'L' &&
	  /* these appear to be compiler generated constants? */ 
	  add_symbolP->sy_name[0] != '_') {
	/* this external refers to a symbol that has 
	   been removed from one place in the symbol table
	   because at a later point a coff directive 
	   created the symbol again.  The relocation
	   informatin should be based on that symbol. */
	add_symbolP = symbol_find(add_symbolP->sy_name);
	if (!add_symbolP->sy_number)
	  as_warn("got add shit here "); 
      }
      sub_symbolP = fixP  -> fx_subsy;
      if (do_1500_coff &&
	  sub_symbolP &&
	  sub_symbolP->sy_number == 0 &&
	  /* doesn't concern local labels */
	  sub_symbolP->sy_name[0] != 'L' &&
	  /* these appear to be compiler generated constants? */ 
	  sub_symbolP->sy_name[0] != '_') {
	/* this external refers to a symbol that has 
	   been removed from one place in the symbol table
	   because at a later point a coff directive 
	   created the symbol again.  The relocation
	   informatin should be based on that symbol. */
	sub_symbolP = symbol_find(sub_symbolP->sy_name);
	if (!sub_symbolP->sy_number)
	  as_warn("got sub shit here "); 
      }
      add_number  = fixP  -> fx_offset;
      pcrel   = fixP  -> fx_pcrel;
      if(add_symbolP)
         add_symbol_N_TYPE = add_symbolP -> sy_type & N_TYPE;
      if (sub_symbolP)
      {
         if(!add_symbolP)  /* Its just -sym */
         {
            if(sub_symbolP->sy_type!=N_ABS)
               as_warn("Negative of non-absolute symbol %s", sub_symbolP->sy_name);
            add_number-=sub_symbolP->sy_value;
         }
         else if (   ((sub_symbolP -> sy_type ^ add_symbol_N_TYPE) & N_TYPE) == 0
             && (   add_symbol_N_TYPE == N_DATA
             || add_symbol_N_TYPE == N_TEXT
             || add_symbol_N_TYPE == N_BSS
             || add_symbol_N_TYPE == N_ABS))
         {
            /* Difference of 2 symbols from same segment. */
            /* Can't make difference of 2 undefineds: 'value' means */
            /* something different for N_UNDF. */
            add_number += add_symbolP -> sy_value - sub_symbolP -> sy_value;
            add_symbolP = NULL;
            fixP -> fx_addsy = NULL;
         }
         else
         {
            /* Different segments in subtraction. */
            know( sub_symbolP -> sy_type != (N_ABS | N_EXT))
                if (sub_symbolP -> sy_type == N_ABS)
               add_number -= sub_symbolP -> sy_value;
            else
            {
               as_warn("Can't emit reloc {- %s-seg symbol \"%s\"} @ file address %d.",
                   seg_name[(int)N_TYPE_seg[sub_symbolP->sy_type&N_TYPE]],
                   sub_symbolP -> sy_name, fragP -> fr_address + where);
            }
         }
      }
      if (add_symbolP)
      {
         if (add_symbol_N_TYPE == this_segment_type && pcrel)
	   {
            /*
          * This fixup was made when the symbol's segment was
          * SEG_UNKNOWN, but it is now in the local segment.
          * So we know how to do the address without relocation.
          */
            add_number += add_symbolP -> sy_value;
            add_number -= size + where + fragP -> fr_address;
            pcrel = 0;  /* Lie. Don't want further pcrel processing. */
            fixP -> fx_addsy = NULL; /* No relocations please. */
            /*
          * It would be nice to check that the address does not overflow.
          * I didn't do this check because:
          * +  It is machine dependent in the general case (eg 32032)
          * +  Compiler output will never need this checking, so why
          *    slow down the usual case?
          */
         }
         else
         {
            switch (add_symbol_N_TYPE)
            {
            case N_ABS:
               add_number += add_symbolP -> sy_value;
               fixP -> fx_addsy = NULL;
               add_symbolP = NULL;
               break;

            case N_BSS:
            case N_DATA:
            case N_TEXT:
               seg_reloc_count ++;
               add_number += add_symbolP -> sy_value;
               break;

            case N_UNDF:
	       /* the ti1500 linker expects common data to have a value.
		  I dont fully understand yet  */
	       if (do_1500_coff) {
		 if (add_symbolP -> sy_type & N_EXT ||
		     add_symbolP->coff_sy_nlist.n_sclass == C_EXT)
		   add_number += add_symbolP -> sy_value;
	       }
               seg_reloc_count ++;
               break;

	     default:
               BAD_CASE( add_symbol_N_TYPE );
               break;
	     }     /* switch on symbol seg */
	  }        /* if not in local seg */
       }        /* if there was a + symbol */
      if (pcrel)
      {
         add_number -= size + where + fragP -> fr_address;
         if (add_symbolP == 0)
         {
            fixP -> fx_addsy = & abs_symbol;
            seg_reloc_count ++;
         }
      }
      /* OVE added fx_im_disp for ns32k and others */
      if (!fixP->fx_bit_fixP) {
         /* JF I hope this works . . . */
         if((size==1 && (add_number& ~0xFF)   && (add_number&~0xFF!=(-1&~0xFF))) ||
             (size==2 && (add_number& ~0xFFFF) && (add_number&~0xFFFF!=(-1&~0xFFFF))))
            as_warn("Fixup of %d too large for field width of %d",add_number, size);

         switch (fixP->fx_im_disp) {
         case 0:
#ifdef SPARC
            fixP->fx_addnumber = add_number;
            md_number_to_imm(place, add_number, size, fixP, this_segment_type);
#else
            md_number_to_imm (place, add_number, size);
            /* OVE: the immediates, like disps, have lsb at lowest address */
#endif
            break;
         case 1:
            md_number_to_disp (place,
                fixP->fx_pcrel ? add_number+fixP->fx_pcrel_adjust:add_number,
                size);
            break;
         case 2: /* fix requested for .long .word etc */
            md_number_to_chars (place, add_number, size);
            break;
         default:
            as_fatal("Internal error in write.c in fixup_segment");
         } /* OVE: maybe one ought to put _imm _disp _chars in one md-func */
      } else {
         md_number_to_field (place, add_number, fixP->fx_bit_fixP);
      }
   }           /* For each fixS in this segment. */
   return (seg_reloc_count);
}           /* fixup_segment() */


/* The sparc needs its own emit_relocations() */
#ifndef SPARC
/*
 *    emit_relocations()
 *
 * Crawl along a fixS chain. Emit the segment's relocations.
 */
static void
emit_relocations (fixP, segment_address_in_file,which_section)
register fixS *   fixP; /* Fixup chain for this segment. */
relax_addressT segment_address_in_file;
int which_section;
{
   struct relocation_info  ri;
   register symbolS *      symbolP;
   struct sorted_relocs {
      struct sorted_relocs *next;
      struct reloc coff_ri;
   } sorted_reloc;
   struct sorted_relocs *temp_reloc,*temp2_reloc;

   /* JF this is for paranoia */
   bzero((char *)&ri,sizeof(ri));
   bzero((char *)&sorted_reloc,sizeof(struct sorted_relocs));
   for ( ;  fixP;  fixP = fixP -> fx_next)
   {
      if (symbolP = fixP -> fx_addsy)
      {
		if (do_1500_coff) {
         (char *)temp_reloc = (char *)xmalloc(sizeof(struct sorted_relocs));
         temp_reloc->next = 0;	
		}

#ifndef hpux
         /* These two 'cuz of NS32K */
         ri . r_bsr     = fixP -> fx_bsr;
         ri . r_disp    = fixP -> fx_im_disp;
#endif

         ri . r_length     = nbytes_r_length [fixP -> fx_size];
         ri . r_pcrel      = fixP -> fx_pcrel;
			if (do_1500_coff) {
         	if (ri.r_pcrel) {
            	switch(fixP->fx_size) {
            	case 1:
               	temp_reloc->coff_ri.r_type = R_PCRBYTE;
               	break;
            	case 2:
               	temp_reloc->coff_ri.r_type = R_PCRWORD;
               	break;
            	case 4:
               	temp_reloc->coff_ri.r_type = R_PCRLONG;
               	break;
            	default:
               	break;
            	}
         	}
         	else {
            	switch(fixP->fx_size) {
            	case 1:
               	temp_reloc->coff_ri.r_type = R_RELBYTE;
               	break;
            	case 2:
               	temp_reloc->coff_ri.r_type = R_RELWORD;
               	break;
            	case 4:
               	temp_reloc->coff_ri.r_type = R_RELLONG;
               	break;
            	default:
               	break;
            	}
         	}
	      }
		ri . r_address = fixP -> fx_frag -> fr_address
		  +   fixP -> fx_where - segment_address_in_file;

		if (do_1500_coff) {
		  temp_reloc->coff_ri.r_address = ri.r_address;
		}
		if (do_1500_coff &&
		    symbolP->sy_number == 0 &&
		    /* doesn't concern local labels */
		    symbolP->sy_name[0] != 'L' &&
		    /* these appear to be compiler generated constants? */ 
		    symbolP->sy_name[0] != '_') {
		  /* this external refers to a symbol that has 
		     been removed from one place in the symbol table
		     because at a later point a coff directive 
		     created the symbol again.  The relocation
		     informatin should be based on that symbol. */
		  symbolP = symbol_find(symbolP->sy_name);
		  if (!symbolP->sy_number)
		    as_warn("got shit here "); 
		}
         if ((symbolP -> sy_type & N_TYPE) == N_UNDF)
         {

            ri . r_extern  = 1;
            ri . r_symbolnum  = symbolP -> sy_number;
	    if (do_1500_coff) {
	      if (which_section == DATA_SECTION) {
		temp_reloc->coff_ri.r_address += text_siz;
	      }
	      temp_reloc->coff_ri.r_symbolnum = ri.r_symbolnum;
	      symbolP -> coff_sy_nlist.n_sclass = C_EXT;
	    }
	  }
         else
	   {
            ri . r_extern  = 0;
            ri . r_symbolnum  = symbolP -> sy_type & N_TYPE;
	    if (do_1500_coff) {
	      if (!symbolP -> coff_sy_nlist.n_sclass)
		  symbolP -> coff_sy_nlist.n_sclass = C_EXT; 
	      /* not sure why he's unconditionally changing 
		 everything to an external????? */
	      if (which_section == DATA_SECTION) {
		temp_reloc->coff_ri.r_address += text_siz;
	      }
	      /* clm - DATA_index et al. are calculated in 
		 coff_it_up, where we hack the symbol table */
	      if ((symbolP-> sy_type & N_DATA) == N_DATA )
		temp_reloc->coff_ri.r_symbolnum = DATA_index; 
	      else if ((symbolP-> sy_type & N_BSS )) {
		symbolP -> coff_sy_nlist.n_sclass = C_STAT;
		temp_reloc->coff_ri.r_symbolnum = BSS_index; 
	      }
	      else {  /* the reference is to something in text */
		temp_reloc->coff_ri.r_symbolnum = TEXT_index; 
	      }
	    }
	  }

         /*
       The 68k machines assign bit-fields from higher bits to
       lower bits ("left-to-right") within the int.  VAXen assign
       bit-fields from lower bits to higher bits ("right-to-left").
       Both handle multi-byte numbers in their usual fashion
       (Big-endian and little-endian stuff).
       Thus we need a machine dependent routine to make
       sure the structure is written out correctly.  FUN!
      */
         md_ri_to_chars((char *) &ri, ri);
			if (do_1500_coff) {
         	for( temp2_reloc = &sorted_reloc ;temp2_reloc->next;
             	temp2_reloc = temp2_reloc->next) {
            	if (temp2_reloc->next->coff_ri.r_address >
                	temp_reloc->coff_ri.r_address)
               	break;
         	}
         	temp_reloc->next = temp2_reloc->next;
         	temp2_reloc->next = temp_reloc;
			}
			else {
   	      append (&next_object_file_charP, (char *)& ri, 
					(unsigned long)sizeof(ri));
			}
      }
   }
	if (do_1500_coff) {
   	for(temp_reloc = sorted_reloc.next; temp_reloc;
       	temp_reloc = temp_reloc->next) {
      	append (&next_object_file_charP,
          	(char *)&temp_reloc->coff_ri, (unsigned long)sizeof( struct reloc));
      	xfree(temp_reloc);
   	}
	}

}
#endif

int
isdnrange(f1,f2)
struct frag *f1,*f2;
{
   while(f1) {
      if(f1->fr_next==f2)
         return 1;
      f1=f1->fr_next;
   }
   return 0;
}


/* need a function to loop through the symbol table 
   fixing it up so that externals are placed at the bottom of 
   the list where they belong */
/*  necessary because the linker moves these out of the function
    area of the symbol table down into the .bss section of the
    symbol table, but our symbol table indices are all based 
    on these symbols being where the appear in the code  */

    
long int
dont_coff_it_up(long int symbol_number)
{
  register symbolS * symbolP;
  register symbolS * ext_symbol_rootP;
  register symbolS * ext_symbol_lastP;
  register symbolS * last_symbolP;   /* to keep track of the last symbol */
  register symbolS * temp_symbolP;  
  long int symbol_index = 0;
  long int saved_sy_number;
  symbolS * current_struc = NULL;
  symbolS * current_fcn = NULL;
  symbolS * current_bf = NULL;
  symbolS * current_bb = NULL;
  int               sclass;
  int               inside_fcn = 0;
  int               inside_bb = 0;
  linenoS *         current_linenoP = lineno_rootP;
  linenoS *         linenoP;
  int               forward_ref = 0;

  for (symbolP=symbol_rootP;symbolP;symbolP=symbolP->sy_next) {
    /* check the scl of the symbol to see if it's external */
    sclass = symbolP->coff_sy_nlist.n_sclass;

    if (sclass == 0) {
      /* unlink the symbol from the regular symbol chain */
      last_symbolP->sy_next = symbolP->sy_next;
      /* and before linking into the external symbols, check
	 to see that this is not a forward reference to a
	 later defined function */
      forward_ref = 0;
      for (temp_symbolP=symbolP->sy_next;temp_symbolP;temp_symbolP=temp_symbolP->sy_next) {
	if (strcmp(symbolP->sy_name, temp_symbolP->sy_name) == 0) {
	  forward_ref = 1;
	  break;
	}
     } 

      /*
       * Link to end of external symbol chain.
       */
      if (forward_ref) 
	symbol_number--;
      else {
	if (ext_symbol_lastP)
	  {
	    ext_symbol_lastP->sy_next = symbolP;
	  }
	else
	  {
	    ext_symbol_rootP = symbolP;
	  }

	ext_symbol_lastP = symbolP;

	  ext_symbol_lastP->sy_next = NULL;
	  /* this external doesn't exist at this point, set th
	     clock back to the last symbol */
	  symbolP = last_symbolP;
      }

	}
	else {   /* just a normal symbol */
	  /* save the old sy_number in case we need it to
	     fix up a fcn lineno entry */
	  saved_sy_number = symbolP->sy_number;
	  symbolP->sy_number = symbol_index++;
	  if (symbolP->coff_sy_nlist.n_numaux) 
	    symbol_index++;

	  switch (sclass) {
	  case C_STRTAG:
	  case C_UNTAG:
	  case C_ENTAG:
	    if (current_struc &&
		!current_struc->n_endndx) {
	      current_struc->n_endndx = symbolP->sy_number;
	    }
	    /* previous entry was a function not a structure */ 
	    else if (current_fcn &&
		     !current_fcn->n_endndx) {
	      if (!inside_fcn) {  /* if struct defined within a fcn pass */
		current_fcn->n_endndx = symbolP->sy_number;
		/* the associated .bf entry should point to the same place 
		   according to the sysv manual */
		current_bf->n_endndx = symbolP->sy_number;
	      }
	    }
	    current_struc = symbolP;
	    current_struc->n_endndx = NULL;
	    break;
	  case C_BLOCK:
	    /* this has blocks pointing to the next block
	       which isn't what the sys v book says to do */
	    if (strcmp(symbolP->sy_name, ".bb") == 0) {
	      if (current_bb)
		current_bb->n_endndx = symbolP->sy_number;
	      inside_bb++;
	      current_bb = symbolP;
	      current_bb->n_endndx = NULL;
	    }
	    else {  /* have a .eb */
	      inside_bb--;  /* inside_bb may not be necessary */
	    }
	    break;
	  case C_FCN:
	    if (strcmp(symbolP->sy_name, ".bf") == 0) {
	      if (current_bf)
		current_bf->n_endndx = symbolP->sy_number;
	      current_bf = symbolP;
	      current_bf->n_endndx = NULL;
	      current_fcn->sy_aux->coff_auxent.x_sym.x_tagndx =
		symbolP->sy_number;
	      inside_fcn = 1;
	    }  
	    else /* have an .ef */
	      inside_fcn = 0;
	    break;
	  default:
	    if (ISFCN(symbolP->coff_sy_nlist.n_type)) {
	      /* was previous entry a fcn */
	      if (current_fcn &&
		  !current_fcn->n_endndx) {
		current_fcn->n_endndx = symbolP->sy_number;
	      }
	      /* was previous entry a struct */
	      else if (current_struc &&
		       !current_struc->n_endndx) {
		current_struc->n_endndx = symbolP->sy_number;
	      }
	      current_fcn = symbolP;
	      current_fcn->n_endndx = NULL;
	      /* need to fix up this function's lineno entry
		 search the lineno entry list for his previous 
		 symtab index - saved in saved_sy_number  */
	      for (linenoP=current_linenoP;linenoP;linenoP=linenoP->ln_next){  
		if (linenoP->coff_lineno.l_lnno == 0 &&
		    linenoP->coff_lineno.l_addr.l_symndx == saved_sy_number){
		  linenoP->coff_lineno.l_addr.l_symndx = symbolP->sy_number;
		  /* so that we don't traverse the same ground */
		  current_linenoP = linenoP; 
		  break;
		}
	      }
	    }
	    break;

	  }


	  last_symbolP = symbolP;
	  if (strcmp(symbolP->sy_name, ".text") == 0)
	    TEXT_index = symbolP->sy_number;
	  if (strcmp(symbolP->sy_name, ".data") == 0)
	    DATA_index = symbolP->sy_number;
	  if (strcmp(symbolP->sy_name, ".bss") == 0)
	    BSS_index = symbolP->sy_number;
      }


  }  /* for all the symbols */
  /* having removed the externals from the symbol table, we now need to
     shove them onto the end of the table after all teh other symbols */
  /* need to update the symbol number of these symbols now */
  for ( symbolP = ext_symbol_rootP; symbolP; symbolP = symbolP->sy_next) {
    symbolP->sy_number = symbol_index++;
  }
  if (ext_symbol_rootP) {
    last_symbolP->sy_next = ext_symbol_rootP;
    ext_symbol_lastP->sy_next = NULL;
  }
  return (symbol_number);
}

void 
coff_it_up()
{
  register symbolS * symbolP;
  register symbolS * last_symbolP;   /* to keep track of the last symbol */
  register symbolS * ext_symbol_rootP = NULL;
  register symbolS * ext_symbol_lastP = NULL;
  register symbolS * temp_sym = NULL;
  int      sclass;
  long int symbol_index = 0;
  char *   name;
  int      forward_ref;
  
  for (symbolP=symbol_rootP;symbolP;symbolP=symbolP->sy_next) {
    name = symbolP->sy_name;
    if (name [0] != 'L'	&& 
	strcmp(name, ".ln") != 0) {
      /* check the scl of the symbol to see if it's external */

      sclass = symbolP->coff_sy_nlist.n_sclass;


      if ((sclass == 0 ||
	  sclass == C_EXT ||
	  sclass == C_STAT) &&
	  !ISFCN(symbolP->coff_sy_nlist.n_type) &&
	  strcmp(name,".text") != 0 &&
	  strcmp(name,".data") != 0 &&
	  strcmp(name,".bss") != 0) {
	/* unlink the symbol from the regular symbol chain */
	last_symbolP->sy_next = symbolP->sy_next;
	/* before we link this symbol to the externals, make sure 
	   this isn't a forward reference to a symbol that has been 
	   defined later in the file with a .def directive.
	   this means must loop through the symbol list yet another
	   time.  */
	forward_ref = 0;
	for (temp_sym=symbolP->sy_next;temp_sym;temp_sym=temp_sym->sy_next) {
	  if (strcmp(symbolP->sy_name, temp_sym->sy_name) == 0) {
	    forward_ref = 1;
	    break;
	  }
	}
	
	/*
	 * Link to end of external symbol chain.
	 */
	if (!forward_ref) {
	  if (ext_symbol_lastP)
	    {
	      ext_symbol_lastP->sy_next = symbolP;
	    }
	  else
	    {
	      ext_symbol_rootP = symbolP;
	    }

	  ext_symbol_lastP = symbolP;

	  ext_symbol_lastP->sy_next = NULL;

	  symbolP = last_symbolP;
	}  /* else !forward_ref */
      }

      else {
	if (strcmp(symbolP->sy_name, ".text") == 0)
	  TEXT_index = symbolP->sy_number;
	if (strcmp(symbolP->sy_name, ".data") == 0)
	  DATA_index = symbolP->sy_number;
	if (strcmp(symbolP->sy_name, ".bss") == 0)
	  BSS_index = symbolP->sy_number;
	last_symbolP = symbolP;
      }
    }
    else last_symbolP = symbolP;
  }
  /* having removed the externals from the symbol table, we now need to
     shove them onto the end of the table after all teh other symbols */
  /* need to update the symbol number of these symbols now */
  /* $$$$$$$$$$$ something along these lines $$$$$$$$ */
  if (ext_symbol_rootP) {
    symbol_index = last_symbolP->sy_number + 1;
    for ( symbolP = ext_symbol_rootP; symbolP; symbolP = symbolP->sy_next) {
      symbolP->sy_number = symbol_index++;
    }
    last_symbolP->sy_next = ext_symbol_rootP;
    ext_symbol_lastP->sy_next = NULL;
  }
}

/* End: as-write.c */

