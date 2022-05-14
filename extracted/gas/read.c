/* read.c - read a source file -
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

/* Changes:
   clm 04/05/91 - fixed handling of APP/NO_APP pairs when NO_APP doesn't
   appear in the same buffer as the APP.  Code was trying to allocate
   0 for the new buffer (looking for the NO_APP).  
   Fix is in read_a_source_file.
*/

#define MASK_CHAR (0xFF)	/* If your chars aren't 8 bits, you will
				   change this a bit.  But then, GNU isn't
				   spozed to run on your machine anyway.
				   (RMS is so shortsighted sometimes.)
				 */

#define MAXIMUM_NUMBER_OF_CHARS_FOR_FLOAT (16)
				/* This is the largest known floating point */
				/* format (for now). It will grow when we */
				/* do 4361 style flonums. */


/* Routines that read assembler source text to build spagetti in memory. */
/* Another group of these functions is in the as-expr.c module */

#include <ctype.h>
#include <sys/types.h>
#include <sys/stat.h>
#include "as.h"
#include "read.h"
#include "md.h"
#include "hash.h"
#include "obstack.h"
#include "frags.h"
#include "flonum.h"
#include "struc-symbol.h"
#include "expr.h"
#include "symbols.h"
#include <string.h>
#include "coff.h"  /* new for coff directives */

#ifdef SPARC
#include "sparc.h"
#endif

/* clm 02/22/91 - added pragma for gnu extensions to prevent compiler
   warnings for those extensions.  */
#ifdef ti1500
#pragma EXTENSIONS
#endif


char *	input_line_pointer;	/* -> next char of source file to parse. */

extern int do_1500_coff;

#if BITS_PER_CHAR != 8
The following table is indexed by [ (char) ] and will break if
a char does not have exactly 256 states (hopefully 0:255!) !
#endif

char				/* used by is_... macros. our ctype[] */
lex_type [256] = {
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,       /* @ABCDEFGHIJKLMNO */
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,       /* PQRSTUVWXYZ[\]^_ */
  0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0,       /* _!"#$%&'()*+,-./ */
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0,       /* 0123456789:;<=>? */
  0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,       /* @ABCDEFGHIJKLMNO */
  3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0, 3,       /* PQRSTUVWXYZ[\]^_ */
  0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,       /* `abcdefghijklmno */
  3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0, 0, 0,       /* pqrstuvwxyz{|}~. */
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 
};


/*
 * In: a character.
 * Out: TRUE if this character ends a line.
 */
#define _ (0)
char is_end_of_line [256] = {
 _, _, _, _, _, _, _, _, _, _,99, _, _, _, _, _, /* @abcdefghijklmno */
 _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, /*                  */
 _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, /*                  */
 _, _, _, _, _, _, _, _, _, _, _,99, _, _, _, _, /* 0123456789:;<=>? */
 _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, /*                  */
 _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, /*                  */
 _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, /*                  */
 _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, /*                  */
 _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, /*                  */
 _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, /*                  */
 _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, /*                  */
 _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, /*                  */
 _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _  /*                  */
};
#undef _

				/* Functions private to this file. */
void			equals();
void			big_cons();
void			cons();
static char*		demand_copy_C_string();
static char*		demand_copy_string();
static char*            demand_copy_symbol();    
void			demand_empty_rest_of_line();
static char*            demand_copy_symbol();    
void			float_cons();
long int		get_absolute_expression();
static char		get_absolute_expression_and_terminator();
static segT		get_known_segmented_expression();
void			ignore_rest_of_line();
static int		is_it_end_of_statement();
static void		pobegin();
static void		pseudo_set();
static void		stab();
static void		stringer();

extern char line_comment_chars[];

static char *	buffer_limit;	/* -> 1 + last char in buffer. */

static char *	bignum_low;	/* Lowest char of bignum. */
static char *	bignum_limit;	/* 1st illegal address of bignum. */
static char *	bignum_high;	/* Highest char of bignum. */
				/* May point to (bignum_start-1). */
				/* Never >= bignum_limit. */
static char *old_buffer = 0;	/* JF a hack */
static char *old_input;
static char *old_limit;

#ifndef WORKING_DOT_WORD
struct broken_word *broken_words;
int new_broken_words = 0;
#endif

static void grow_bignum ();
static int next_char_of_string ();

/* the new coff stuff - may go into its own file soon */

/* function prototypes */
static int field_index();
void begin_static_symbols();
int coff_tab_memq();

/* clm 05/07/90 - new for COFF assembly.  This helps keep track of a 
   symbol's index into the symbol table.  Necessary for debug info
   for structures. It will be initialized to 0, and incremented 
   each time symbol_new is called.  Can also be used as a current
   counter of the number of symbols read to this point. */

long int symbol_index;
/* warning: hard coding these fields like this is bound to break
   at some point, either new directives will be added, or other
   previously unknown directives will surface.  The only way to
   handle this is to warn when we see a new directive and enter 
   it into our table of "knowns" */
#define numfields 7  /* the number of different fields in a coff directive */
enum fnames {VAL, SCL, TYPE, LINE, SIZE, TAG, DIM};
static field_name
ftable[] =
{
  { ".val",   VAL },
  { ".scl",   SCL },
  { ".type",  TYPE },
  { ".line",  LINE },
  { ".size",  SIZE },
  { ".tag",   TAG  },
  { ".dim",   DIM  },
  { NULL }  /* end of table */
};

/* this function returns the index into the field table of
   this field name */
static int
field_index(char * fname)
{
  char *  s;
  field_name * slot;
  int     index;
  int     found = 0;

  slot = ftable;
  /* need to get a numeric index for a symbolic field name */
  while (s = slot->fname)
    {
      if (strcmp(fname,s) == 0)
        { 
	  index = slot->ndx;
	  found = 1;
	  break;
	} 
      slot++;
    }   /* end while */
  if (!found) {
    index = -1;
    as_warn("didn't find an entry for %s\n", fname);
  }
  return(index);
}

/* a handy table of known coff directive names */
char *
coff_tab[] = {".bf", ".bb", ".ef", ".eb", ".eos", ".dim"};
#define COFFTABSIZE 6

int 
coff_tab_memq(char * x)
{
  /* if x is a member of the coff_tab return an index */
  int    i;

  for(i=0;i<COFFTABSIZE;i++) 
    {
      if(strcmp(x, coff_tab[i]) == 0)
	return(i);
    }
  return(-1);
}


/*
 *      lineno_new
 *
 * generate a new lineno entry structure
 * args: addr - either a symbol table index or a physical address
 *              depending on the value of the second arg
 *       lnno - if zero, addr is an index into the symbol table;
 *              if greater than zero, addr is a physical address
 * true?
 */
linenoS *
lineno_new (long addr, unsigned short lnno)
{
  register linenoS *  linenoP;

  linenoP = (linenoS *)obstack_alloc(&notes, sizeof(linenoS)); 
  
  /* fill in field info */
  if (lnno == 0) 
    linenoP->coff_lineno.l_addr.l_symndx = addr; 
  else
    linenoP->coff_lineno.l_addr.l_paddr = addr;
  linenoP->ln_number = lineno_index++;
  linenoP->ln_next = NULL;
  linenoP->coff_lineno.l_lnno =  lnno;
  /*
   *  keep a chain of these entries like that for symbols 
   */
  if (lineno_lastP)
    {
      lineno_lastP -> ln_next = linenoP;
    }
  else
    {
      lineno_rootP = linenoP;
    }
  lineno_lastP = linenoP;

  return (linenoP);
}

/*
  *
  *      auxent_new
  *
  * Create a new auxiliary entry structure
  * All the information needed to fill in the structure
  * is in the calling function s_def.  Here we only generate
  * an empty structure and pass it back.  
  */
auxentS * 
auxent_new()
{
  register auxentS *  auxentP;

  auxentP = (auxentS *)obstack_alloc(&notes, sizeof(auxentS)); 
  memset(auxentP, 0 , sizeof(auxentS));
  return (auxentP);

}


linenoS * lineno_rootP;  /* all the line number entries */
linenoS * lineno_lastP;  /* last lineno entry made, or NULL */

long lineno_index;

/* globals needed to implement the linked list structure for 
   functions and structures for COFF debugging. */ 
symbolS * current_function;
symbolS * current_bf;
symbolS * current_ef;
symbolS * current_bb;
symbolS * current_struct;  
symbolS * current_struct_eos;  
short inside_current_struct  = 0;
symbolS * current_entry;  
long current_function_bgn;
unsigned short current_function_bf = 0;
long int static_symbol_start_index;
#define n_endndx  sy_aux->coff_auxent.x_sym.x_fcnary.x_fcn.x_endndx
  
/* clm 12/06/90 - support for the .ident directive */
commentS * comment_rootP;
commentS * comment_lastP;
void    comment_new();
int comment_section = 0;
/* function to maintain the linked list of comments */
void
comment_new (char * comnt)
{  
  commentS *  commentP;

  commentP = (commentS *)obstack_alloc(&notes, sizeof(commentS)); 
  /* fill in field info */
  commentP->comment =  comnt;
  /* maintain linked list */
  if (comment_lastP)
    {
      comment_lastP -> comment_next = commentP;
    }
  else
    {
     comment_rootP = commentP;
    }
  comment_lastP = commentP;
}

/* in order to make our objects acceptable to the linker, 
   we must put the .text .data .bss and their
   auxents after all the function/structure symbols and
   before the static/global symbols.
*/
static int statics_emitted = 0;

void
emit_static_symbols()
{
 symbolS * symbolP;
 symbolS * symbolP_temp;  /* temporarily hold symbol_lastP here */

  /* need to do some ugly linked list splicing here */

  if (symbol_rootP == symbol_lastP ||
      symbol_lastP == current_ef || 
      symbol_lastP == current_struct || 
      symbol_lastP == current_struct_eos) 
	/* don't need to hack the list */
    /* may also have a structure as the last thing */
    symbolP_temp = NULL;  
  else {
    symbolP_temp = symbol_lastP;      
    for (symbolP = symbol_rootP; symbolP;  symbolP = symbolP->sy_next) {
      /* need the symbol that points to the last symbol - could use 
	 a doubly linked list here, but no such luck */
      if (symbolP->sy_next == symbol_lastP) {
	symbol_lastP = symbolP;
	break;
      }
    }
  }
      
  symbolP = symbol_new(".text",N_TEXT,0,0,0,0);

  symbolP->coff_sy_nlist.n_value = 0;
  symbolP->coff_sy_nlist.n_scnum = 1;
  symbolP->coff_sy_nlist.n_type = 0;
  symbolP->coff_sy_nlist.n_sclass = C_STAT;
  symbolP->coff_sy_nlist.n_numaux = 1;
  /* symbol_temp is an external that didn't affect the 
     symbol_index, so the symbol number for these symbols
     begins with the current symbol_index */
  symbolP->sy_number = symbol_index++;
  /* make sure the last function or structure points to the first static */
  if (current_function &&
      !current_function->n_endndx)
    current_function->n_endndx = symbolP->sy_number;
  else if (current_struct &&
	   !current_struct->n_endndx)
    current_struct->n_endndx = symbolP->sy_number;
  symbolP->sy_aux = auxent_new();
  symbol_index++;
  symbol_table_insert(symbolP);

  symbolP = symbol_new(".data",N_DATA,0,0,0,0);
  symbolP->sy_number = symbol_index++;
  symbolP->coff_sy_nlist.n_value = 0;
  symbolP->coff_sy_nlist.n_scnum = 2;
  symbolP->coff_sy_nlist.n_type = 0;
  symbolP->coff_sy_nlist.n_sclass = C_STAT;
  symbolP->coff_sy_nlist.n_numaux = 1;
  symbolP->sy_aux = auxent_new();
  symbol_index++;
  symbol_table_insert(symbolP);

  symbolP = symbol_new(".bss",N_BSS,0,0,0,0);
  symbolP->sy_number = symbol_index++;
  symbolP->coff_sy_nlist.n_value = 0;
  symbolP->coff_sy_nlist.n_type = 0;
  symbolP->coff_sy_nlist.n_scnum = 3;
  symbolP->coff_sy_nlist.n_sclass = C_STAT;
  symbolP->coff_sy_nlist.n_numaux = 1;
  symbolP->sy_aux = auxent_new();
  symbol_index++; 
  symbol_table_insert(symbolP); 

  if (comment_section) {
    symbolP = symbol_new(".comment",0,0,0,0,0);
    symbolP->sy_number = symbol_index++;
    symbolP->sy_nlist.n_value = 0;  /* not sure what the value should be yet */
    symbolP->coff_sy_nlist.n_scnum = 0;
    symbolP->coff_sy_nlist.n_type = 0;
    symbolP->coff_sy_nlist.n_sclass = C_STAT;
    symbolP->coff_sy_nlist.n_numaux = 1;
    symbolP->sy_aux = auxent_new();
    symbol_index++;
    symbol_table_insert(symbolP);
  }

  /* splice the previous last symbol back into list 
     unless the last symbol was indeed the last symbol
     (i.e. equal to current_ef) */
  if (symbolP_temp &&
      symbolP_temp != current_ef) {
    symbolP_temp->sy_number = symbol_index - 1; 
    symbolP->sy_next = symbolP_temp;
    symbol_lastP = symbolP_temp;
  }
  statics_emitted = 1;

}



/* ******************************************************* */

void
read_begin()
{
  pobegin();
  obstack_begin( &notes, 5000 );
#define BIGNUM_BEGIN_SIZE (16)
  bignum_low = xmalloc((long)BIGNUM_BEGIN_SIZE);
  bignum_limit = bignum_low + BIGNUM_BEGIN_SIZE;
  /* clm 05/08/90 - for want of a better place, initilize
     lineno_index here.  Used for COFF debugging. */
  lineno_rootP = NULL;
  lineno_lastP = NULL;
  lineno_index = 0;
  symbol_index = 0; /* clm 05/07/90 - new for COFF debugging */
}

/* set up pseudo-op tables */

static struct hash_control *
po_hash = NULL;			/* use before set up: NULL-> address error */


void	s_abort(),	s_align(),	s_comm(),	s_data();
void	s_desc(),	s_even(),	s_file(),	s_fill();
void	s_gdbbeg(),	s_gdbblock(),	s_gdbend(),	s_gdbsym();
void	s_globl(),	s_lcomm(),	s_line(),	s_lsym();
void	s_org(),	s_set(),	s_space(),	s_text();
void	s_gdbline(),	s_gdblinetab();
void    s_def(),        s_ln();
/* clm 12/06/90 - support for the new .ident directive */
void    s_ident();

void	stringer();
void	cons();
void	float_cons();
void	big_cons();
void	stab();

static pseudo_typeS
potable[] =
{
  { "abort",	s_abort,	0	},
  { "align",	s_align,	0	},
  { "ascii",	stringer,	0	},
  { "asciz",	stringer,	1	},
  { "byte",	cons,		1	},
  { "comm",	s_comm,		0	},
  { "data",	s_data,		0	},
  { "def",      s_def,          0       }, 
  { "desc",	s_desc,		0	},
  { "double",	float_cons,	'd'	},
  { "file",	s_file,		0	},
  { "fill",	s_fill,		0	},
  { "float",	float_cons,	'f'	},
  { "gdbbeg",	s_gdbbeg,	0	},
  { "gdbblock",	s_gdbblock,	0	},
  { "gdbend",	s_gdbend,	0	},
  { "gdbsym",	s_gdbsym,	0	},
  { "gdbline",	s_gdbline,	0	},
  { "gdblinetab",s_gdblinetab,	0	},
  { "globl",	s_globl,	0	},
  { "int",	cons,		4	},
  { "lcomm",	s_lcomm,	0	},
  { "line",	s_line,		0	},
  { "ln",       s_ln,           0       },
  { "long",	cons,		4	},
  { "lsym",	s_lsym,		0	},
  { "octa",	big_cons,	16	},
  { "org",	s_org,		0	},
  { "quad",	big_cons,	8	},
  { "set",	s_set,		0	},
  { "short",	cons,		2	},
  { "single",	float_cons,	'f'	},
  { "space",	s_space,	0	},
  { "stabd",	stab,		'd'	},
  { "stabn",	stab,		'n'	},
  { "stabs",	stab,		's'	},
  { "text",	s_text,		0	},
#ifndef SPARC
  { "word",	cons,		2	},
#endif
/* clm 12/06/90 - support for .ident directive */ 
  { "ident",	s_ident,	0	},
  { NULL}	/* end sentinel */
};

static void
pobegin()
{
  char *	errtxt;		/* error text */
  pseudo_typeS * pop;

  po_hash = hash_new();
  errtxt = "";			/* OK so far */
  for (pop=potable; pop->poc_name && !*errtxt; pop++)
    {
      errtxt = hash_insert (po_hash, pop->poc_name, (char *)pop);
    }

  for(pop=md_pseudo_table; pop->poc_name && !*errtxt; pop++)
      errtxt = hash_insert (po_hash, pop->poc_name, (char *)pop);

  if (*errtxt)
    {
      as_fatal ("error constructing pseudo-op table");
    }
}				/* pobegin() */

/*			read_a_source_file()
 *
 * File has already been opened, and will be closed by our caller.
 *
 * We read the file, putting things into a web that
 * represents what we have been reading.
 */
void
read_a_source_file (buffer)
     char *	buffer;		/* 1st character of each buffer of lines is here. */
{
  register char		c;
  register char *	s;	/* string of symbol, '\0' appended */
  register int		temp;
  /* register struct frag * fragP; JF unused */	/* a frag we just made */
  pseudo_typeS	*pop;
  void gdb_block_beg();
  void gdb_block_position();
  void gdb_block_end();
  void gdb_symbols_fixup();

  subseg_new (SEG_TEXT, 0);
  while ( buffer_limit = input_scrub_next_buffer (&buffer) )
    {				/* We have another line to parse. */
      know( buffer_limit [-1] == '\n' ); /* Must have a sentinel. */
      input_line_pointer = buffer;
 contin:	/* JF this goto is my fault I admit it.  Someone brave please re-write
		   the whole input section here?  Pleeze??? */
      while ( input_line_pointer < buffer_limit )
	{			/* We have more of this buffer to parse. */
	  /*
	   * We now have input_line_pointer -> 1st char of next line.
	   * If input_line_pointer [-1] == '\n' then we just
	   * scanned another line: so bump line counters.
	   */
	  if (input_line_pointer [-1] == '\n')
	    {
	      bump_line_counters ();
	    }
	  /*
	   * We are at the begining of a line, or similar place.
	   * We expect a well-formed assembler statement.
	   * A "symbol-name:" is a statement.
	   *
	   * Depending on what compiler is used, the order of these tests
	   * may vary to catch most common case 1st.
	   * Each test is independent of all other tests at the (top) level.
	   * PLEASE make a compiler that doesn't use this assembler.
	   * It is crufty to waste a compiler's time encoding things for this
	   * assembler, which then wastes more time decoding it.
	   * (And communicating via (linear) files is silly!
	   * If you must pass stuff, please pass a tree!)
	   */
	  if ( (c= * input_line_pointer ++) == '\t' || c == ' ' || c=='\f')
	    {
	      c = * input_line_pointer ++;
	    }
	  know( c != ' ' );	/* No further leading whitespace. */
	  /*
	   * C is the 1st significant character.
	   * Input_line_pointer points after that character.
	   */
	  if ( is_name_beginner(c) )
	    {			/* want user-defined label or pseudo/opcode */
	      s = -- input_line_pointer;
	      c = get_symbol_end(); /* name's delimiter */
	      /*
	       * C is character after symbol.
	       * That character's place in the input line is now '\0'.
	       * S points to the beginning of the symbol.
	       *   [In case of pseudo-op, s -> '.'.]
	       * Input_line_pointer -> '\0' where c was.
	       */
	      if ( c == ':' )
		{
		  colon(s);	/* user-defined label */
		  * input_line_pointer ++ = ':'; /* Put ':' back for error messages' sake. */
				/* Input_line_pointer -> after ':'. */
		  SKIP_WHITESPACE();
		}
	      else if(c=='=' || input_line_pointer[1]=='=')		/* JF deal with FOO=BAR */
	        {
		  equals(s);
		  demand_empty_rest_of_line();
		}
	      else
		{		/* expect pseudo-op or machine instruction */
		  if ( *s=='.' )
		    {
		      /*
		       * PSEUDO - OP.
		       *
		       * WARNING: c has next char, which may be end-of-line.
		       * We lookup the pseudo-op table with s+1 because we
		       * already know that the pseudo-op begins with a '.'.
		       */

		      pop= (pseudo_typeS *) hash_find (po_hash, s+1);
				/* Put it back for error messages etc. */
		      * input_line_pointer = c;
				/* The following skip of whitespace is compulsory. */
				/* A well shaped space is sometimes all that seperates keyword from operands. */
		      if ( c == ' ' || c == '\t' )
			{	/* Skip seperator after keyword. */
			  input_line_pointer ++;
			}
		      /*
		       * Input_line is restored.
		       * Input_line_pointer -> 1st non-blank char
		       * after pseudo-operation.
		       */
		        if(!pop) {
			  as_warn("Unknown pseudo-op");
			  ignore_rest_of_line();
			  break;
			}
			else
			  (*pop->poc_handler)(pop->poc_val);
		    }
		  else
		    {		/* machine instruction */
		      /* WARNING: c has char, which may be end-of-line. */
		      /* Also: input_line_pointer -> `\0` where c was. */
		      * input_line_pointer = c;
		      while ( ! is_end_of_line [* input_line_pointer] )
			{
			  input_line_pointer ++;
			}
		      c = * input_line_pointer;
		      * input_line_pointer = '\0';
		      md_assemble (s);	/* Assemble 1 instruction. */
		      * input_line_pointer ++ = c;
		      /* We resume loop AFTER the end-of-line from this instruction */
		    }		/* if (*s=='.') */
		}		/* if c==':' */
	      continue;
	    }			/* if (is_name_beginner(c) */


	  if ( is_end_of_line [c] )
	    {			/* empty statement */
	      continue;
	    }

	  if ( isdigit(c) )
	    {			/* local label  ("4:") */
	      temp = c - '0';
#ifdef SUN_ASM_SYNTAX
	      if( *input_line_pointer=='$')
		input_line_pointer++;
#endif
	      if ( * input_line_pointer ++ == ':' )
		{
		  local_colon (temp);
		}
	      else
		{
		  as_warn( "Spurious digit %d.", temp);
		  input_line_pointer -- ;
		  ignore_rest_of_line();
		}
	      continue;
	    }
	  if(c && index(line_comment_chars,c)) {
	    /* Its a comment.  Better say APP or NO_APP */
		char *ends;
		char *strstr();
		char	*new_buf;
		char	*new_tmp;
		int	new_length;
		char	*tmp_buf = 0;
		extern char *scrub_string,*scrub_last_string;
		int	scrub_from_string();
		void	scrub_to_string();

		bump_line_counters();
		s=input_line_pointer;
		if(strncmp(s,"APP\n",4))
			continue;	/* We ignore it */
		s+=4;

		ends=strstr(s,"#NO_APP\n");

		if(!ends) {
			int	tmp_len;
			int	num;

			/* The end of the #APP wasn't in this buffer.  We
			   keep reading in buffers until we find the #NO_APP
			   that goes with this #APP  There is one.  The specs
 			   guarentee it. . .*/
			tmp_len=buffer_limit-s;
			/* clm 04/01/91 - if the above two are the same, we
			   try to alloc 0, which fails; in that case, alloc
			   enough for the length of the string s.
			   */
			if (!tmp_len)  
			  tmp_len = strlen(s);
			tmp_buf=xmalloc(tmp_len);
			bcopy(s,tmp_buf,tmp_len);
			do {
			  new_tmp = input_scrub_next_buffer(&buffer);
			  if(!new_tmp)
			    break;
			  else
			    buffer_limit = new_tmp;
			  input_line_pointer = buffer;
			  ends = strstr(buffer,"#NO_APP\n");
			  if(ends)
			    num=ends-buffer;
			  else
			    num=buffer_limit-buffer;
			  
			  tmp_buf=xrealloc(tmp_buf,tmp_len+num);
			  bcopy(buffer,tmp_buf+tmp_len,num);
			  tmp_len+=num;
			} while(!ends);

			input_line_pointer= ends ? ends+8 : NULL;

			s=tmp_buf;
			ends=s+tmp_len;

		} else {
			input_line_pointer=ends+8;
		}
		new_buf=xmalloc(100);
		new_length=100;
		new_tmp=new_buf;

		scrub_string=s;
		scrub_last_string = ends;
		for(;;) {
			int ch;

			ch=do_scrub_next_char(scrub_from_string,scrub_to_string);
			if(ch==EOF) break;
			*new_tmp++=ch;
			if(new_tmp==new_buf+new_length) {
				new_buf=xrealloc(new_buf,new_length+100);
				new_tmp=new_buf+new_length;
				new_length+=100;
			}
		}

		if(tmp_buf)
			free(tmp_buf);
		old_buffer=buffer;
		old_input=input_line_pointer;
		old_limit=buffer_limit;
		buffer=new_buf;
		input_line_pointer=new_buf;
		buffer_limit=new_tmp;
		continue;
	  }

	  as_warn("Junk character %d.",c);
	  ignore_rest_of_line();
	}			/* while (input_line_pointer<buffer_limit )*/
	if(old_buffer) {
		bump_line_counters();
		if(old_input == 0)
			return;
		buffer=old_buffer;
		input_line_pointer=old_input;
		buffer_limit=old_limit;
		old_buffer = 0;
		goto contin;
	}
    }				/* while (more bufrers to scan) */

  /* the last symbols to be emitted will be the .text .data and .bss
     statics.  in the write phase we will move the externals below them */
  if (do_1500_coff &&
      !statics_emitted)
    emit_static_symbols();


}				/* read_a_source_file() */

void
s_abort()
{
	as_fatal(".abort detected.  Abandoning ship.");
}

void
s_align()
{
	register int temp;
	register long int temp_fill;

	temp = get_absolute_expression ();
#define MAX_ALIGNMENT (15)
	if ( temp > MAX_ALIGNMENT )
		as_warn("Alignment too large: %d. assumed.", temp = MAX_ALIGNMENT);
	else if ( temp < 0 ) {
		as_warn("Alignment negative. 0 assumed.");
		temp = 0;
	}
	if ( *input_line_pointer == ',' ) {
		input_line_pointer ++;
		temp_fill = get_absolute_expression ();
	} else
		temp_fill = 0;
	/* Only make a frag if we HAVE to. . . */
	if ( temp && ! need_pass_2 )
		frag_align (temp, (int)temp_fill);
	demand_empty_rest_of_line();
}

void
s_comm()
{
	register char *name;
	register char c;
	register char *p;
	register int temp;
	register symbolS *	symbolP;
	register int coff_size;


	name = input_line_pointer;
	c = get_symbol_end();
	/* just after name is now '\0' */
	p = input_line_pointer;
	*p = c;
	SKIP_WHITESPACE();
	if ( * input_line_pointer != ',' ) {
		as_warn("Expected comma after symbol-name");
		ignore_rest_of_line();
		return;
	}
	input_line_pointer ++; /* skip ',' */
	if ( (temp = get_absolute_expression ()) < 0 ) {
		as_warn(".COMMon length (%d.) <0! Ignored.", temp);
		ignore_rest_of_line();
		return;
	}
	*p = 0;
	/* before we as .comm symbols we put the .text, etc symbols
	   into the table */
	if (do_1500_coff &&
	    !statics_emitted &&
	    symbol_find(name))
	  /* if the symbol isn't found, that indicates that this is 
	     a symbol without a coff directive predecessor, which
	     also means that more text info could follow. so we don't
	     emit the statics yet */
	  emit_static_symbols();
	symbolP = symbol_find_or_make (name);
	*p = c;
	/* there may have been a previous coff directive which defined
	   this symbol.  If there is, use the value read here (temp)
	   for the symbol value. */
	if (do_1500_coff &&   
	    symbolP->coff_sy_nlist.n_sclass) {  
	  /* use n_sclass as a flag to indicate coff made the symbol */
	  symbolP->sy_value = temp;
	  symbolP->coff_sy_nlist.n_value = temp;
	  symbolP->coff_sy_nlist.n_scnum = N_UNDEF; 
	}
	else {
	  if ( (symbolP -> sy_type & N_TYPE) != N_UNDF ||
	      symbolP -> sy_other != 0 || symbolP -> sy_desc != 0) {
	    as_warn( "Ignoring attempt to re-define symbol");
	    ignore_rest_of_line();
	    return;
	  }
	  if (symbolP -> sy_value) {
	    if (symbolP -> sy_value != temp)
	      as_warn("Length of .comm \"%s\" is already %d. Not changed to %d.",
		      symbolP -> sy_name, symbolP -> sy_value, temp);
	  } else {
	    symbolP -> sy_value = temp;
	    symbolP -> sy_type |= N_EXT;
	  }
	}
	know( symbolP -> sy_frag == &zero_address_frag );
	demand_empty_rest_of_line();
}

void
s_data()
{
	register int temp;

	temp = get_absolute_expression ();
	subseg_new (SEG_DATA, (subsegT)temp);
	demand_empty_rest_of_line();
}

void
s_desc()
{
	register char *name;
	register char c;
	register char *p;
	register symbolS *	symbolP;
	register int temp;

	/*
	 * Frob invented at RMS' request. Set the n_desc of a symbol.
	 */
	name = input_line_pointer;
	c = get_symbol_end();
	p = input_line_pointer;
	symbolP = symbol_table_lookup (name);
	* p = c;
	SKIP_WHITESPACE();
	if ( * input_line_pointer != ',' ) {
		*p = 0;
		as_warn("Expected comma after name \"%s\"", name);
		*p = c;
		ignore_rest_of_line();
	} else {
		input_line_pointer ++;
		temp = get_absolute_expression ();
		*p = 0;
		symbolP = symbol_find_or_make (name);
		*p = c;
		symbolP -> sy_desc = temp;
	}
	demand_empty_rest_of_line();
}

void
s_file()
{
	register char *s;
	int	length;
	register symbolS * symbolP;

	/* Some assemblers tolerate immediately following '"' */
	if ( s = demand_copy_string( & length ) ) {
		new_logical_line (s, -1);
		demand_empty_rest_of_line();
	}
#ifdef ti1500
	if (do_1500_coff) {
	  symbolP = symbol_new(".file",0,0,0,0,0);
	  symbolP->sy_number = symbol_index++;
	  symbolP->sy_nlist.n_value = 0;
	  symbolP->coff_sy_nlist.n_scnum = 0xfffe;
	  symbolP->coff_sy_nlist.n_type = 0;
	  symbolP->coff_sy_nlist.n_sclass = C_FILE;
	  symbolP->coff_sy_nlist.n_numaux = 1;
	  symbolP->sy_aux = auxent_new();
	  symbol_index++;
	  strcpy(symbolP->sy_aux->coff_auxent.x_file.x_fname, s);
	  symbol_table_insert(symbolP);
	}
#endif
}

/* clm 12/13/90 - new for .ident handling */
void
s_ident()
{
  /* .comment is a static symbol belonging to the group .text, .data and .bss.
     Here we just set a flag indicating we need to create the symbol with the
     other statics and do the actual creation in emit_static_symbols. But we need 
     to maintain the linked list of comments here. */ 
 
  char *s;
  int	length;
  symbolS * symbolP;

/*  to parse out whitespace would need something like this in a for loop
  if ( (c= * input_line_pointer ++) == '\t' || c == ' ' || c=='\f')
    {
      c = * input_line_pointer ++;
    }
*/
  if ( s = demand_copy_string( & length ) ) {
    demand_empty_rest_of_line();
  }

  /* keep a linked list of comments */
  comment_new(s);

  comment_section = 1;

}

void
s_fill()
{
	long int temp_repeat;
	long int temp_size;
	register long int temp_fill;
	char	*p;

	if ( get_absolute_expression_and_terminator(& temp_repeat) != ',' ) {
		input_line_pointer --; /* Backup over what was not a ','. */
		as_warn("Expect comma after rep-size in .fill");
		ignore_rest_of_line();
		return;
	}
	if ( get_absolute_expression_and_terminator( & temp_size) != ',' ) {
		  input_line_pointer --; /* Backup over what was not a ','. */
		  as_warn("Expected comma after size in .fill");
		  ignore_rest_of_line();
		  return;
	}
	/*
	 * This is to be compatible with BSD 4.2 AS, not for any rational reason.
	 */
#define BSD_FILL_SIZE_CROCK_8 (8)
	if ( temp_size > BSD_FILL_SIZE_CROCK_8 ) {
		as_warn(".fill size clamped to %d.", BSD_FILL_SIZE_CROCK_8);
		temp_size = BSD_FILL_SIZE_CROCK_8 ;
	} if ( temp_size < 0 ) {
		as_warn("Size negative: .fill ignored.");
		temp_size = 0;
	} else if ( temp_repeat <= 0 ) {
		as_warn("Repeat < 0, .fill ignored");
		temp_size = 0;
	}
	temp_fill = get_absolute_expression ();
	if ( temp_size && !need_pass_2 ) {
		p = frag_var (rs_fill, (int)temp_size, (int)temp_size, (relax_substateT)0, (symbolS *)0, temp_repeat, (char *)0);
		bzero (p, (int)temp_size);
/*
 * The magic number BSD_FILL_SIZE_CROCK_4 is from BSD 4.2 VAX flavoured AS.
 * The following bizzare behaviour is to be compatible with above.
 * I guess they tried to take up to 8 bytes from a 4-byte expression
 * and they forgot to sign extend. Un*x Sux.
 */
#define BSD_FILL_SIZE_CROCK_4 (4)
		md_number_to_chars (p, temp_fill, temp_size > BSD_FILL_SIZE_CROCK_4 ? BSD_FILL_SIZE_CROCK_4 : (int)temp_size);
/*
 * Note: .fill (),0 emits no frag (since we are asked to .fill 0 bytes)
 * but emits no error message because it seems a legal thing to do.
 * It is a degenerate case of .fill but could be emitted by a compiler.
 */
	}
	demand_empty_rest_of_line();
}

void
s_gdbbeg()
{
	register int temp;

	temp = get_absolute_expression ();
	if (temp < 0)
		as_warn( "Block number <0. Ignored." );
	else if (flagseen ['G'])
		gdb_block_beg ( (long int) temp, frag_now, (long int)(obstack_next_free(& frags) - frag_now -> fr_literal));
	demand_empty_rest_of_line ();
}

void
s_gdbblock()
{
	register int	position;
	int	temp;

	if (get_absolute_expression_and_terminator (&temp) != ',') {
		as_warn( "expected comma before position in .gdbblock");
		--input_line_pointer;
		ignore_rest_of_line ();
		return;
	}
	position = get_absolute_expression ();
	if (flagseen ['G'])
		gdb_block_position ((long int) temp, (long int) position);
	demand_empty_rest_of_line ();
}

void
s_gdbend()
{
	register int temp;

	temp = get_absolute_expression ();
	if (temp < 0)
		as_warn( "Block number <0. Ignored." );
	else if (flagseen ['G'])
		gdb_block_end ( (long int) temp, frag_now, (long int)(obstack_next_free(& frags) - frag_now -> fr_literal));
	demand_empty_rest_of_line ();
}

void
s_gdbsym()
{
	register char *name,
			*p;
	register char c;
	register symbolS *	symbolP;
	register int temp;

	name = input_line_pointer;
	c = get_symbol_end();
	p = input_line_pointer;
	symbolP = symbol_find_or_make (name);
	*p = c;
	SKIP_WHITESPACE();
	if ( * input_line_pointer != ',' ) {
		as_warn("Expected comma after name");
		ignore_rest_of_line();
		return;
	}
	input_line_pointer ++;
	if ( (temp = get_absolute_expression ()) < 0 ) {
		as_warn("Bad GDB symbol file offset (%d.) <0! Ignored.", temp);
		ignore_rest_of_line();
		return;
	}
	if (flagseen ['G'])
		gdb_symbols_fixup (symbolP, (long int)temp);
	demand_empty_rest_of_line ();
}

void
s_gdbline()
{
	int	file_number,
		lineno;

	if(get_absolute_expression_and_terminator(&file_number) != ',') {
		as_warn("expected comman after filenum in .gdbline");
		ignore_rest_of_line();
		return;
	}
	lineno=get_absolute_expression();
	if(flagseen['G'])
		gdb_line(file_number,lineno);
	demand_empty_rest_of_line();
}


void
s_gdblinetab()
{
	int	file_number,
		offset;

	if(get_absolute_expression_and_terminator(&file_number) != ',') {
		as_warn("expected comman after filenum in .gdblinetab");
		ignore_rest_of_line();
		return;
	}
	offset=get_absolute_expression();
	if(flagseen['G'])
		gdb_line_tab(file_number,offset);
	demand_empty_rest_of_line();
}
	

void
s_globl()
{
	register char *name;
	register int c;
	register symbolS *	symbolP;

	do {
		name = input_line_pointer;
		c = get_symbol_end();
		symbolP = symbol_find_or_make (name);
		* input_line_pointer = c;
		SKIP_WHITESPACE();
		symbolP -> sy_type |= N_EXT;
		if(c==',') {
			input_line_pointer++;
			SKIP_WHITESPACE();
			if(*input_line_pointer=='\n')
				c='\n';
		}
	} while(c==',');
	demand_empty_rest_of_line();
}

void
s_lcomm()
{
  register char *name;
  register char c;
  register char *p;
  register int temp;
  register symbolS *	symbolP;
  
  
  name = input_line_pointer;
  c = get_symbol_end();
  p = input_line_pointer;
  *p = c;
  SKIP_WHITESPACE();
  if ( * input_line_pointer != ',' ) {
    as_warn("Expected comma after name");
    ignore_rest_of_line();
    return;
  }
  input_line_pointer ++;
  if ( (temp = get_absolute_expression ()) < 0 ) {
    as_warn("BSS length (%d.) <0! Ignored.", temp);
    ignore_rest_of_line();
    return;
  }

  *p = 0;
  /* before we as .comm symbols we put the .text, etc symbols
     into the table */
  if (do_1500_coff &&
      !statics_emitted &&
      symbol_find(name))
    /* if the symbol isn't found, that indicates that this is 
       a symbol without a coff directive predecessor, which
       also means that more text info could follow. so we don't
       emit the statics yet */
    emit_static_symbols();
  symbolP = symbol_find_or_make (name);
  *p = c;
  if (   symbolP -> sy_other == 0
      && symbolP -> sy_desc  == 0
      && (   (   symbolP -> sy_type  == N_BSS
	      && symbolP -> sy_value == local_bss_counter)
	  || (   (symbolP -> sy_type & N_TYPE) == N_UNDF
	      && symbolP -> sy_value == 0))) {
    symbolP -> sy_value = local_bss_counter;
    symbolP -> sy_type  = N_BSS;
    symbolP -> sy_frag  = & bss_address_frag;
    if (do_1500_coff) {
      symbolP->coff_sy_nlist.n_value = local_bss_counter;
      /* symbolP->coff_sy_nlist.n_type = N_BSS; */
    }
    local_bss_counter += temp;
  } else
    as_warn( "Ignoring attempt to re-define symbol from %d. to %d.",
	    symbolP -> sy_value, local_bss_counter );
  demand_empty_rest_of_line();
}

void
s_line()
{
	/* Assume delimiter is part of expression. */
	/* BSD4.2 as fails with delightful bug, so we */
	/* are not being incompatible here. */
	new_logical_line ((char *)NULL, (int)(get_absolute_expression ()));
	demand_empty_rest_of_line();
}

void
s_long()
{
	cons(4);
}

void
s_int()
{
	cons(4);
}

void
s_lsym()
{
	register char *name;
	register char c;
	register char *p;
	register segT segment;
	expressionS exp;
	register symbolS *symbolP;

	/* we permit ANY expression: BSD4.2 demands constants */
	name = input_line_pointer;
	c = get_symbol_end();
	p = input_line_pointer;
	*p = c;
	SKIP_WHITESPACE();
	if ( * input_line_pointer != ',' ) {
		*p = 0;
		as_warn("Expected comma after name \"%s\"", name);
		*p = c;
		ignore_rest_of_line();
		return;
	}
	input_line_pointer ++;
	segment = expression (& exp);
	if (   segment != SEG_ABSOLUTE && segment != SEG_DATA &&
 segment != SEG_TEXT && segment != SEG_BSS) {
		as_warn("Bad expression: %s", seg_name [(int)segment]);
		ignore_rest_of_line();
		return;
	}
 know(   segment == SEG_ABSOLUTE || segment == SEG_DATA || segment == SEG_TEXT || segment == SEG_BSS );
	*p = 0;
	symbolP = symbol_new (name,(unsigned char)(seg_N_TYPE [(int) segment]),
 0, 0, (valueT)(exp . X_add_number), & zero_address_frag);
	*p = c;
	demand_empty_rest_of_line();
}

void
s_org()
{
	register segT segment;
	expressionS exp;
	register long int temp_fill;
	register char *p;
/*
 * Don't believe the documentation of BSD 4.2 AS.
 * There is no such thing as a sub-segment-relative origin.
 * Any absolute origin is given a warning, then assumed to be segment-relative.
 * Any segmented origin expression ("foo+42") had better be in the right
 * segment or the .org is ignored.
 *
 * BSD 4.2 AS warns if you try to .org backwards. We cannot because we
 * never know sub-segment sizes when we are reading code.
 * BSD will crash trying to emit -ve numbers of filler bytes in certain
 * .orgs. We don't crash, but see as-write for that code.
 */
/*
 * Don't make frag if need_pass_2==TRUE.
 */
	segment = get_known_segmented_expression(& exp);
	if ( *input_line_pointer == ',' ) {
		input_line_pointer ++;
		temp_fill = get_absolute_expression ();
	} else
		temp_fill = 0;
	if ( ! need_pass_2 ) {
		if (segment != now_seg && segment != SEG_ABSOLUTE)
			as_warn("Illegal segment \"%s\". Segment \"%s\" assumed.",
 seg_name [(int) segment], seg_name [(int) now_seg]);
		p = frag_var (rs_org, 1, 1, (relax_substateT)0, exp . X_add_symbol,
 exp . X_add_number, (char *)0);
		* p = temp_fill;
	} /* if (ok to make frag) */
	demand_empty_rest_of_line();
}

void
s_set()
{
	register char *name;
	register char delim;
	register char *end_name;
	register symbolS *symbolP;

	/*
	 * Especial apologies for the random logic:
	 * this just grew, and could be parsed much more simply!
	 * Dean in haste.
	 */
	name = input_line_pointer;
	delim = get_symbol_end();
	end_name = input_line_pointer;
	*end_name = delim;
	SKIP_WHITESPACE();
	if ( * input_line_pointer != ',' ) {
		*end_name = 0;
		as_warn("Expected comma after name \"%s\"", name);
		*end_name = delim;
		ignore_rest_of_line();
		return;
	}
	input_line_pointer ++;
	*end_name = 0;
	if(name[0]=='.' && name[1]=='\0') {
	  /* Turn '. = mumble' into a .org mumble */
	  register segT segment;
	  expressionS exp;
	  register char *ptr;

	  segment = get_known_segmented_expression(& exp);
	  if ( ! need_pass_2 ) {
	    if (segment != now_seg && segment != SEG_ABSOLUTE)
	      as_warn("Illegal segment \"%s\". Segment \"%s\" assumed.",
		      seg_name [(int) segment], seg_name [(int) now_seg]);
	    ptr = frag_var (rs_org, 1, 1, (relax_substateT)0, exp.X_add_symbol,
			  exp.X_add_number, (char *)0);
	    *ptr= 0;
	  } /* if (ok to make frag) */
	  *end_name = delim;
	  return;
	}
	symbolP = symbol_find_or_make (name);
	*end_name = delim;
	pseudo_set (symbolP);
	demand_empty_rest_of_line ();
}

void
s_space()
{
	long int temp_repeat;
	register long int temp_fill;
	register char *p;

	/* Just like .fill, but temp_size = 1 */
	if ( get_absolute_expression_and_terminator( & temp_repeat) == ',' ) {
		temp_fill = get_absolute_expression ();
	} else {
		input_line_pointer --; /* Backup over what was not a ','. */
		temp_fill = 0;
	}
	if ( temp_repeat <= 0 ) {
		as_warn("Repeat < 0, .space ignored");
		ignore_rest_of_line();
		return;
	}
	if ( ! need_pass_2 ) {
		p = frag_var (rs_fill, 1, 1, (relax_substateT)0, (symbolS *)0,
 temp_repeat, (char *)0);
		* p = temp_fill;
	}
	demand_empty_rest_of_line();
}

void
s_text()
{
	register int temp;

	temp = get_absolute_expression ();
	subseg_new (SEG_TEXT, (subsegT)temp);
	demand_empty_rest_of_line();
}


/*( JF was static, but can't be if machine dependent pseudo-ops are to use it */

void
demand_empty_rest_of_line()
{
  SKIP_WHITESPACE();
  if ( is_end_of_line [* input_line_pointer] )
    {
      input_line_pointer ++;
    }
  else
    {
      ignore_rest_of_line();
    }
				/* Return having already swallowed end-of-line. */
}				/* Return pointing just after end-of-line. */


void
ignore_rest_of_line()		/* For suspect lines: gives warning. */
{
  if ( ! is_end_of_line [* input_line_pointer])
    {
      as_warn("Rest of line ignored. 1st junk character valued %d."
	      , * input_line_pointer);
      while (   input_line_pointer < buffer_limit
	     && ! is_end_of_line [* input_line_pointer] )
	{
	  input_line_pointer ++;
	}
    }
  input_line_pointer ++;	/* Return pointing just after end-of-line. */
  know( is_end_of_line [input_line_pointer [-1]] );
}

/*
 *			stab()
 *
 * Handle .stabX directives, which used to be open-coded.
 * So much creeping featurism overloaded the semantics that we decided
 * to put all .stabX thinking in one place. Here.
 *
 * We try to make any .stabX directive legal. Other people's AS will often
 * do assembly-time consistency checks: eg assigning meaning to n_type bits
 * and "protecting" you from setting them to certain values. (They also zero
 * certain bits before emitting symbols. Tut tut.)
 *
 * If an expression is not absolute we either gripe or use the relocation
 * information. Other people's assemblers silently forget information they
 * don't need and invent information they need that you didn't supply.
 *
 * .stabX directives always make a symbol table entry. It may be junk if
 * the rest of your .stabX directive is malformed.
 */
static void
stab (what)
int what;
{
  register symbolS *	symbolP;
  register char *	string;
	   int		saved_type;
  	   int		length;
  	   int		goof;	/* TRUE if we have aborted. */
	   long int	longint;

/*
 * Enter with input_line_pointer pointing past .stabX and any following
 * whitespace.
 */
	goof = FALSE; /* JF who forgot this?? */
	if (what == 's') {
		string = demand_copy_C_string (& length);
		SKIP_WHITESPACE();
		if (* input_line_pointer == ',')
			input_line_pointer ++;
		else {
			as_warn( "I need a comma after symbol's name" );
			goof = TRUE;
		}
	} else
		string = "";

/*
 * Input_line_pointer->after ','.  String -> symbol name.
 */
	if (! goof) {
		symbolP = symbol_new (string, 0,0,0,0,(struct frag *)0);
		switch (what) {
		case 'd':
			symbolP->sy_name = NULL; /* .stabd feature. */
			symbolP->sy_value = obstack_next_free(& frags) - frag_now->fr_literal;
			symbolP->sy_frag = frag_now;
			break;

		case 'n':
			symbolP->sy_frag = &zero_address_frag;
			break;

		case 's':
			symbolP->sy_frag = & zero_address_frag;
			break;

		default:
			BAD_CASE( what );
			break;
		}
		if (get_absolute_expression_and_terminator (& longint) == ',')
			symbolP->sy_type = saved_type = longint;
		else {
			as_warn( "I want a comma after the n_type expression" );
			goof = TRUE;
			input_line_pointer --; /* Backup over a non-',' char. */
		}
	}
	if (! goof) {
		if (get_absolute_expression_and_terminator (& longint) == ',')
			symbolP->sy_other = longint;
		else {
			as_warn( "I want a comma after the n_other expression" );
			goof = TRUE;
			input_line_pointer --; /* Backup over a non-',' char. */
		}
	}
	if (! goof) {
		symbolP->sy_desc = get_absolute_expression ();
		if (what == 's' || what == 'n') {
			if (* input_line_pointer != ',') {
				as_warn( "I want a comma after the n_desc expression" );
				goof = TRUE;
			} else {
				input_line_pointer ++;
			}
		}
	}
	if ((! goof) && (what=='s' || what=='n')) {
		pseudo_set (symbolP);
		symbolP->sy_type = saved_type;
	}
	if (goof)
		ignore_rest_of_line ();
	else
		demand_empty_rest_of_line ();
}



void 
s_def()
{
/* handle a .def directive */
  char *        name;
  long int      fval;   
  char *        fcn_tgn_sym;
  char *        tag_sym;   /* for the .tag field value */
  char          c;
  char *        p;
  int           i,j;
  char *        s;
  int           length;
  char          term[] = ".endef";
  char  *       fname;
  int           memres;
  int           index;
  long          coff_data[numfields];
  register symbolS * symbolP;
  symbolS * temp_sym;
  register linenoS *  lineP;
  short         function_entry = 0;
  short         tagname_entry = 0;
  long          empty = 0xabab;
  long          temp_val;
  int           sclass;
  unsigned short dim_count = 0;
  unsigned short dims[4] = { 0, 0 ,0, 0 };
  int predefined_sym = 0;

  for (i = 0; i < numfields; i++)
    coff_data[i] = empty;  /* flag indicating empty slot */
  /* first get the name of the symbol, then parse the fields */
  name = demand_copy_symbol(&length);
  /* after we parse the symbol's  name we parse for the fields, each
     beginning with a '.', followed by the value of the field and 
     terminated with a ';'.  The .def directive is terminated with an
     .endef  */
  /* main parsing mechanism */
  if ( (c = *input_line_pointer) == '\t')
    {
     input_line_pointer ++;  /* should be a tab between each field */
    }
  while ( strcmp((fname = demand_copy_symbol(&length)), term) != 0)
    {
      /* fname holds the field name */ 
      index = field_index(fname); /* have the index where to place value */
      switch (index) {
      case VAL: 
	if (*input_line_pointer == '.') {
	   coff_data[index] =  obstack_next_free(&frags) - 
	                                   frag_now->fr_literal;
	   input_line_pointer ++;
	 }
	else if (*input_line_pointer == '_') {
	  /* value is symbolic.  Two possibilities here: either this is
	     a function name symbol or it is a tagname definition.
	     In either case we use the relocatable address for n_value. */
	  /* another case has arisen, a symbol with a value of another
	     symbol name.  in this case the other symbol may not have
	     been created by a coff directive so we need to something
	     other than sy_value */
	  fcn_tgn_sym = demand_copy_symbol(&length); /* read name */
	  if (strcmp(fcn_tgn_sym,name) != 0) {
	    /* this is a structure/symbol of some 'other' type */
	    temp_sym = symbol_find(fcn_tgn_sym);  /* bullit proof please */
	    coff_data[index] = temp_sym->sy_value;
	    predefined_sym = 1;
	  }
	  else coff_data[index] = obstack_next_free(&frags) -
	                                frag_now->fr_literal; 
	}
	else coff_data[index] = get_absolute_expression();
	break;
      case SCL: 
	coff_data[index] = get_absolute_expression();
	break;
      case SIZE:
      case LINE:	
	coff_data[index] = get_absolute_expression();
	break;
      case TYPE:
	coff_data[index] = get_absolute_expression();
	temp_val = coff_data[index];
	/* we need these special flags to let later processing know
	   that we have function or tagname entries.  These entries
	   must be marked as undefined so that when their non-coff
	   definitions are encountered they can be handled correctly */

	if ( ISFCN(temp_val) &&
	     coff_data[SCL] != C_TPDEF)
	  function_entry = 1;
	/* this is silly, should be able to do some bit checking */
	else if ( (temp_val == T_STRUCT ||
		   temp_val == T_UNION  ||
		   temp_val == T_ENUM) ||
		  (ISPTR(temp_val) &&
		   (temp_val == T_STRUCT ||
		   temp_val == T_UNION  ||
		   temp_val == T_ENUM)) )
	  tagname_entry = 1;  /* for tagnames */
	break;
      case TAG: 
	tag_sym = demand_copy_symbol(&length);
	coff_data[index] = 1; /* flag indicating we have a value */
	break;
      case DIM:
	coff_data[index] = 1; 
	dims[dim_count] = get_absolute_expression(); 
	dim_count++;
	break;
      default: 
	as_warn("have an unknown coff directive field: %s", fname);	
      } 	

      if (*input_line_pointer == ';')
	input_line_pointer ++;
      if (*input_line_pointer != '\t')
        as_warn("should be a tab between fields");
        else input_line_pointer ++; 
    }

  /* create a new empty symbol struct for this symbol 
     unless the SCL value is -1.  This indicates physical end 
     of function and no symbol table entry is created. */
  sclass = coff_data[SCL];
  if (sclass >= 0 &&
      !predefined_sym) {  /* determined that predefined symbols are
			     just confusing things, so we ignore
			     them.  left the hooks in below in case
			     they become relevant again. */
    symbolP = symbol_new(name,0,0,0,0,(struct frag *)0); 
    /* if this is an external or static it will be moved to the 
       end of the symbol table, so we don't want the index messed up
       */
    if ((sclass == C_EXT ||
	sclass == C_STAT) &&
	!ISFCN(coff_data[TYPE])) {
	  symbolP->sy_number = 0;
    }
    else symbolP->sy_number = symbol_index++;  
    symbolP->sy_frag = frag_now;
    /* make an initial check to see if an auxent will be necessary 
       we know that coff directives such as bb, bf, eb, ef etc. will
       need one.  this won't catch tagname declarations or definitions
       or arrays (?).  those will have to be caught while parsing the
       fields. */ 

    if (function_entry) 
      symbolP->sy_type = N_UNDF;

    symbol_table_insert (symbolP);  /* put all symbols into the symbol_table */

    if((memres = coff_tab_memq(name)) >= 0 ||
       coff_data[SCL] == C_STRTAG ||
       coff_data[SCL] == C_UNTAG ||
       coff_data[SCL] == C_ENTAG ||
       coff_data[SCL] == C_FILE ||
       coff_data[TAG] == 1 ||
       coff_data[SIZE] != empty ||
       coff_data[DIM] != empty ||
       ISFCN(coff_data[TYPE])  ||
       ISARY(coff_data[TYPE])  /*   ||  */
       /* ISPTR(coff_data[TYPE])   no auxents for simple pointers */
       )
      {
	/* special handling for auxents */
	/* so far seen only need for 1 auxent */
	symbolP->coff_sy_nlist.n_numaux = 1;
	/* create a true auxent */
	symbolP->sy_aux = auxent_new();
	if ((sclass != C_EXT &&
	     sclass != C_STAT) ||
	    ISFCN(coff_data[TYPE]))
	  symbol_index++;
	/* the symbol table index value must be */
	/* incremented also, as these do take up space */
	/* in the table */ 
      }

    for (i = 0; i < numfields; i++) {
      if (coff_data[i] == empty)
	continue;
      switch (i) {
      case VAL:
	symbolP->coff_sy_nlist.n_value = coff_data[VAL];
	symbolP->sy_nlist.n_value = coff_data[VAL];
	break;
      case SCL:
	fval = coff_data[SCL];
	symbolP->coff_sy_nlist.n_sclass = fval;
	/* the storage class will help determine the scnum */
	switch (fval) {
	case C_AUTO:
	case C_REG:
	case C_MOS:
	case C_ARG:
	case C_MOU:
	case C_MOE:
	case C_REGPARM:
	case C_FIELD:
	case C_EOS:
	  symbolP->coff_sy_nlist.n_scnum = COFF_N_ABS;
	  if (fval == C_EOS) {
	    inside_current_struct = 0;
	    current_struct_eos = symbolP;
	  }
	  break;
	case C_STRTAG:
	case C_UNTAG:
	case C_ENTAG:
	  symbolP->coff_sy_nlist.n_scnum = N_DEBUG;
	  /* structure and function entries are linked together via the 
	     x_endndx field. */
	  if (current_entry) 
	    current_entry->n_endndx = symbolP->sy_number;
	  /* initialization probably not necessary */
	  symbolP->n_endndx = NULL;
	  current_struct = symbolP;
	  current_entry = symbolP;
	  break;
	case C_TPDEF:
	case C_FILE:
	case C_ALIAS: 
	  symbolP->coff_sy_nlist.n_scnum = N_DEBUG;
	  break;
	case C_BLOCK:
	case C_FCN:
	case C_EFCN:  
	  symbolP->coff_sy_nlist.n_scnum = now_seg;
	  symbolP->sy_nlist.n_type = N_TEXT;
	  if (fval == C_FCN &&
	      (strcmp(name,".bf") == 0)) {
	    /* assuming that if we have a .bf we must have current_function */ 
	    /* !!! if the current_function already has a value in its 
	       tagndx field, then it is returning a ptr to a structure. in
	       that case, we don't want to lose this info as it would cause
	       confusion at run time.  now not even sure it's necessary
	       to keep the .bf pointer in a functions tagndx field at all */
	    if (!current_function->sy_aux->coff_auxent.x_sym.x_tagndx)
	      current_function->sy_aux->coff_auxent.x_sym.x_tagndx =
		symbolP->sy_number;
	    if (current_bf)
	      current_bf->n_endndx = symbolP->sy_number;
	    current_bf = symbolP;
	  }
	      
	  else if (fval == C_BLOCK &&
		   (strcmp(name,".bb") == 0)) {
	    if (current_bb)
	      current_bb->n_endndx = symbolP->sy_number;
	    current_bb = symbolP;
	  }
	  break;
	case C_LABEL:
	  break;
	case C_NULL: 
	case C_ULABEL:
	case C_USTATIC:  
	  symbolP->coff_sy_nlist.n_scnum = N_UNDEF;
	  break;
	case C_EXTDEF:  
	case C_LINE:
	case C_HIDDEN:
	  /* not sure what needs to be done with these */
	  break; 
	case C_EXT:   
	case C_STAT:
	  if ( ISFCN(coff_data[TYPE]) )
	    symbolP->coff_sy_nlist.n_scnum = 1;  /* in the text section */
	  else if (predefined_sym) {
	    /* special case - cannot pass this through as undefined
	       its definition is from a previously defined symbol
	       an ugly assumption here is that these fields are good */
	    symbolP->sy_value = temp_sym->sy_value;
	    symbolP->sy_nlist.n_type = temp_sym->sy_nlist.n_type;
	    symbolP->coff_sy_nlist.n_value = temp_sym->sy_value; 
	    symbolP->coff_sy_nlist.n_type = temp_sym->sy_nlist.n_type; 
	  }
	  else {
	    /* just pass this through as undefined and let
	       traditional handling happen */
	    coff_data[VAL] = 0;   
	    symbolP->coff_sy_nlist.n_scnum = 3;  /* in the bss section */
	    symbolP->sy_value = 0;
	    symbolP->coff_sy_nlist.n_value = 0; 
	    /* to prevent TYPE handling from undoing this */
	    symbolP->coff_sy_nlist.n_type = coff_data[TYPE]; 
	    symbolP->sy_nlist.n_type = N_UNDF;
	    coff_data[TYPE] = empty;
	  }
	  break;
	default:
	  as_warn("got an unrecognized scl value: %d", fval);
	  break;
	}	
	break;
      case TYPE:
	/* for now must maintain info in both structures */
	symbolP->coff_sy_nlist.n_type = coff_data[TYPE];
	if ((function_entry ||
	     tagname_entry) &&
	    (coff_data[SCL] != C_ARG &&
	     coff_data[SCL] != C_REG))
	  symbolP->sy_nlist.n_type = N_UNDF;
	else symbolP->sy_nlist.n_type = coff_data[TYPE];
	temp_val = coff_data[TYPE];
	if ( ISFCN(temp_val) &&
	     coff_data[SCL] != C_TPDEF) {
	  /* i.e., a function beginning */
	  /* fill in previous function's next function pointer field */
	  if (current_entry)  
	    current_entry->n_endndx = symbolP->sy_number;
	  else /* this is the first function we've run into and it appears 
		  the linker wants the last structure auxent's x_endndx
		  field to use this value */
	    static_symbol_start_index = symbolP->sy_number;
	  symbolP->n_endndx = NULL;
	  /* need current_function for upcoming .bf directive */
	  current_function = symbolP;
	  /* need current_entry to maintain links for ld */
	  current_entry = symbolP;

	  lineP = lineno_new(symbolP->sy_number, 0);  	  
	  symbolP->sy_aux->coff_auxent.x_sym.x_fcnary.x_fcn.x_lnnoptr =
	    lineP->ln_number;  
	  lineP->ln_sym = symbolP;  
	}
	break;
      case LINE:
	/* need to bullet proof this - the assumption is that the .bf
	   directive will come before others with a .line field */
	if ( strcmp(name,".bf") == 0 ) {
	  current_function_bf = coff_data[LINE];
	  /* we also need this value for the previous function lineno entry,
	     which we shall say is the same as the .bf line value  */
	   lineno_lastP->coff_lineno.l_lnno =  1; /*  current_function_bf; */
	}
	if (strcmp(name, ".ef") == 0) {
	  coff_data[LINE] += (current_function_bf - 1);
	  current_ef = symbolP;
	}
	symbolP->sy_aux->coff_auxent.x_sym.x_misc.x_lnsz.x_lnno = 
	  coff_data[LINE];
	break;
      case SIZE:
	/* if this is a function and we read a size field, that value is
	   the size of the structure that this function, returns, not
	   the size of the function.  since the x_size and x_fsize fields
	   overlap, this shouldn't cause a problem... but just in case. */
 	if (!ISFCN(coff_data[TYPE]))  
	  symbolP->sy_aux->coff_auxent.x_sym.x_misc.x_lnsz.x_size = 
	    coff_data[SIZE];
	break;
      case TAG:
	/* clm 7/25/90 - problem with multiple symbols.  Can't use
	   symbol_find as that finds the first, and perhaps not 
	   the correct, occurance of the symbol in our growing list.
	   Manually search the list, making sure we pick up the 
	   the correct STRTAG, ENTAG or UNTAG symbol.
	   */

	/* For nested structure the x_tagndx might not get set at this point
	   since the tag is not in the symbol table yet. So, set up a
           flag and fill the information in after the symbol table is 
	   complete -- Shawn Islam */

	   
	for (temp_sym = symbol_rootP;temp_sym;temp_sym = temp_sym->sy_next) {
	  /* must increment tag_sym because symbols in the symbol list
	     have already had their leading "_" characters removed.
	     */
	  if ((strcmp((tag_sym+1), temp_sym->sy_name) == 0) &&
	      (temp_sym->coff_sy_nlist.n_sclass == C_STRTAG ||
	       temp_sym->coff_sy_nlist.n_sclass == C_UNTAG ||
	       temp_sym->coff_sy_nlist.n_sclass == C_ENTAG)) {
	    symbolP->sy_aux->coff_auxent.x_sym.x_tagndx = temp_sym->sy_number; 
	    break;
	  }
	}
	/* previous method : temp_sym = symbol_find(tag_sym); */
	break;
      case DIM:
	for (j = 0; j < dim_count; j++)
	  symbolP->sy_aux->coff_auxent.x_sym.x_fcnary.x_ary.x_dimen[i] =
	    dims[j];
	break;
      default:
	as_warn("Have an unknown COFF directive field."); 
	break;
	}
    }
  }
}

static void
s_ln()
{
  register linenoS *  lineP;
  unsigned short      line_number;
  long                addr;
  register symbolS *  symbolP;
  
  line_number = get_absolute_expression();

  /* in order to have the correct physical address when we 
     write out the lineno's, we need to keep a symbol in the
     symbol table that will have as its value the current physical
     address.  at write time these addresses will be fixed up when
     we fix up the symbol table */
  symbolP = symbol_new(".ln",0,0,0,0,(struct frag *)0); 
  addr = obstack_next_free(&frags) - frag_now->fr_literal;
  symbolP->sy_frag = frag_now;
  symbolP->sy_value = addr;
    
  lineP = lineno_new(addr, line_number);  
  lineP->ln_sym = symbolP;
}


/* a copy of the demand_copy_string function needed to work   */
/* on coff symbolic directives ... clm 04/27/90 */
static char *
demand_copy_symbol(lenP)
      int *    lenP;
{
  register int		c;
  register int		len;
	   char *	retval;

  len = 0;
  SKIP_WHITESPACE();
  /* strip off leading '_' */
  while ( (c = * input_line_pointer ++) != ';' && 
	     c != '\t' &&
             c != '\n' ) {
         obstack_1grow ( &notes, c );
	 len ++;
	}
  obstack_1grow(&notes,'\0');
  retval=obstack_finish( &notes);
  * lenP = len;
  return (retval);
}



/*
 *			pseudo_set()
 *
 * In:	Pointer to a symbol.
 *	Input_line_pointer -> expression.
 *
 * Out:	Input_line_pointer -> just after any whitespace after expression.
 *	Tried to set symbol to value of expression.
 *	Will change sy_type, sy_value, sy_frag;
 *	May set need_pass_2 == TRUE.
 */
static void
pseudo_set (symbolP)
     symbolS *	symbolP;
{
  expressionS	exp;
  register segT	segment;

  know( symbolP );		/* NULL pointer is logic error. */
  if ((segment = expression( & exp )) == SEG_NONE)
    {
      as_warn( "Missing expression: absolute 0 assumed" );
      exp . X_seg		= SEG_ABSOLUTE;
      exp . X_add_number	= 0;
    }
  switch (segment)
    {
    case SEG_BIG:
      as_warn( "%s number illegal. Absolute 0 assumed.",
	      exp . X_add_number > 0 ? "Bignum" : "Floating-Point" );
      symbolP -> sy_type = N_ABS;
      symbolP -> sy_value = 0;
      symbolP -> sy_frag = & zero_address_frag;
      break;

    case SEG_NONE:
      as_warn("No expression:  Using absolute 0");
      symbolP -> sy_type = N_ABS;
      symbolP -> sy_value = 0;
      symbolP -> sy_frag = & zero_address_frag;
      break;

    case SEG_DIFFERENCE:
      as_warn( "Complex expression. Absolute segment assumed." );
    case SEG_ABSOLUTE:
      symbolP -> sy_type = N_ABS;
      symbolP -> sy_value = exp . X_add_number;
      symbolP -> sy_frag = & zero_address_frag;
      break;
 
    case SEG_DATA:
    case SEG_TEXT:
    case SEG_BSS:
      symbolP -> sy_type = seg_N_TYPE [(int) segment];
      symbolP -> sy_value= exp . X_add_number + exp . X_add_symbol -> sy_value;
      symbolP -> sy_frag = exp . X_add_symbol -> sy_frag;
      break;
      
    case SEG_PASS1:		/* Not an error. Just try another pass. */
      symbolP->sy_forward=exp.X_add_symbol;
      as_warn("Unknown expression");
      know( need_pass_2 == TRUE );
      break;
      
    case SEG_UNKNOWN:
      symbolP->sy_forward=exp.X_add_symbol;
      /* as_warn("unknown symbol"); */
      /* need_pass_2 = TRUE; */
      break;
      
    default:
      BAD_CASE( segment );
      break;
    }
}

/*
 *			cons()
 *
 * CONStruct more frag of .bytes, or .words etc.
 * Should need_pass_2 be TRUE then emit no frag(s).
 * This understands EXPRESSIONS, as opposed to big_cons().
 *
 * Bug (?)
 *
 * This has a split personality. We use expression() to read the
 * value. We can detect if the value won't fit in a byte or word.
 * But we can't detect if expression() discarded significant digits
 * in the case of a long. Not worth the crocks required to fix it.
 */
void
cons(nbytes)			/* worker to do .byte etc statements */
				/* clobbers input_line_pointer, checks */
				/* end-of-line. */
     register int	nbytes;	/* 1=.byte, 2=.word, 4=.long */
{
  register char		c;
  register long int	mask;	/* High-order bits we will left-truncate, */
				/* but includes sign bit also. */
  register long int     get;	/* what we get */
  register long int	use;	/* get after truncation. */
  register long int	unmask;	/* what bits we will store */
  register char *	p;
  register segT		segment;
           expressionS	exp;
  void	fix_new();

  /*
   * Input_line_pointer -> 1st char after pseudo-op-code and could legally
   * be a end-of-line. (Or, less legally an eof - which we cope with.)
   */
  /* JF << of >= number of bits in the object is undefined.  In particular
     SPARC (Sun 4) has problems */
  if(nbytes>=sizeof(long int))
    mask = 0;
  else 
    mask = ~0 << (BITS_PER_CHAR * nbytes); /* Don't store these bits. */
  unmask = ~ mask;		/* Do store these bits. */
#ifdef NEVER
  "Do this mod if you want every overflow check to assume SIGNED 2's complement data.";
  mask = ~ (unmask >> 1);	/* Includes sign bit now. */
#endif
  /*
   * The following awkward logic is to parse ZERO or more expressions,
   * comma seperated. Recall an expression includes its leading &
   * trailing blanks. We fake a leading ',' if there is (supposed to
   * be) a 1st expression, and keep demanding 1 expression for each ','.
   */
  if (is_it_end_of_statement())
    {
      c = 0;			/* Skip loop. */
      input_line_pointer ++;	/* Matches end-of-loop 'correction'. */
    }
  else
      c = ',';			/* Do loop. */
  while ( c == ','  )
    {
      segment = expression( &exp ); /* At least scan over the expression. */
      if ( ! need_pass_2 )
	{			/* Still worthwhile making frags. */

	  /* Don't call this if we are going to junk this pass anyway! */
	  know( segment != SEG_PASS1 );

	  if ( segment == SEG_DIFFERENCE && exp . X_add_symbol == NULL )
	    {
	      as_warn( "Subtracting symbol \"%s\"(segment\"%s\") is too hard. Absolute segment assumed.",
		      exp . X_subtract_symbol -> sy_name,
		      seg_name [(int) N_TYPE_seg [exp . X_subtract_symbol -> sy_type & N_TYPE]]);
	      segment = SEG_ABSOLUTE;
	      /* Leave exp . X_add_number alone. */
	    }
	  p = frag_more (nbytes);
	  switch (segment)
	    {
	    case SEG_BIG:
	      as_warn( "%s number illegal. Absolute 0 assumed.",
		      exp . X_add_number > 0 ? "Bignum" : "Floating-Point");
	      md_number_to_chars (p, (long)0, nbytes);
	      break;

	    case SEG_NONE:
	      as_warn( "0 assumed for missing expression" );
	      exp . X_add_number = 0;
	      know( exp . X_add_symbol == NULL );
	      /* fall into SEG_ABSOLUTE */
	    case SEG_ABSOLUTE:
	      get = exp . X_add_number;
	      use = get & unmask;
	      if ( (get & mask) && (get & mask) != mask )
		{		/* Leading bits contain both 0s & 1s. */
		  as_warn("Value x%x truncated to x%x.", get, use);
		}
	      md_number_to_chars (p, use, nbytes); /* put bytes in right order. */
	      break;

	    case SEG_DIFFERENCE:
#ifndef WORKING_DOT_WORD
	      if(nbytes==2) {
		struct broken_word *x;

		x=(struct broken_word *)xmalloc(sizeof(struct broken_word));
		x->next_broken_word=broken_words;
		broken_words=x;
		x->frag=frag_now;
		x->word_goes_here=p;
		x->dispfrag=0;
		x->add=exp.X_add_symbol;
		x->sub=exp.X_subtract_symbol;
		x->addnum=exp.X_add_number;
		x->added=0;
		new_broken_words++;
		break;
	      }
	      /* Else Fall through into. . . */
#endif
	    case SEG_BSS:
	    case SEG_UNKNOWN:
	    case SEG_TEXT:
	    case SEG_DATA:
#ifdef SPARC
	      fix_new (frag_now, p - frag_now -> fr_literal, nbytes,
		       exp . X_add_symbol, exp . X_subtract_symbol,
		       exp . X_add_number, 0, RELOC_32);
#else
	      fix_new (frag_now, p - frag_now -> fr_literal, nbytes,
		       exp . X_add_symbol, exp . X_subtract_symbol,
		       exp . X_add_number, 0);
#endif
	      break;

	    default:
	      BAD_CASE( segment );
	      break;
	    }			/* switch(segment) */
	}			/* if(!need_pass_2) */
      c = * input_line_pointer ++;
    }				/* while(c==',') */
  input_line_pointer --;	/* Put terminator back into stream. */
  demand_empty_rest_of_line();
}				/* cons() */

/*
 *			big_cons()
 *
 * CONStruct more frag(s) of .quads, or .octa etc.
 * Makes 0 or more new frags.
 * If need_pass_2 == TRUE, generate no frag.
 * This understands only bignums, not expressions. Cons() understands
 * expressions.
 *
 * Constants recognised are '0...'(octal) '0x...'(hex) '...'(decimal).
 *
 * This creates objects with struct obstack_control objs, destroying
 * any context objs held about a partially completed object. Beware!
 *
 *
 * I think it sucks to have 2 different types of integers, with 2
 * routines to read them, store them etc.
 * It would be nicer to permit bignums in expressions and only
 * complain if the result overflowed. However, due to "efficiency"...
 */
void
big_cons(nbytes)		/* worker to do .quad etc statements */
				/* clobbers input_line_pointer, checks */
				/* end-of-line. */
     register int	nbytes;	/* 8=.quad 16=.octa ... */
{
  register char		c;	/* input_line_pointer -> c. */
  register int		radix;
  register long int	length;	/* Number of chars in an object. */
  register int		digit;	/* Value of 1 digit. */
  register int		carry;	/* For multi-precision arithmetic. */
  register int		work;	/* For multi-precision arithmetic. */
  register char *	p;	/* For multi-precision arithmetic. */

  extern char hex_value[];	/* In hex_value.c. */

  /*
   * The following awkward logic is to parse ZERO or more strings,
   * comma seperated. Recall an expression includes its leading &
   * trailing blanks. We fake a leading ',' if there is (supposed to
   * be) a 1st expression, and keep demanding 1 expression for each ','.
   */
  if (is_it_end_of_statement())
    {
      c = 0;			/* Skip loop. */
    }
  else
    {
      c = ',';			/* Do loop. */
      -- input_line_pointer;
    }
  while (c == ',')
    {
      ++ input_line_pointer;
      SKIP_WHITESPACE();
      c = * input_line_pointer;
      /* C contains 1st non-blank character of what we hope is a number. */
      if (c == '0')
	{
	  c = * ++ input_line_pointer;
	  if (c == 'x' || c=='X')
	    {
	      c = * ++ input_line_pointer;
	      radix = 16;
	    }
	  else
	    {
	      radix = 8;
	    }
	}
      else
	{
	  radix = 10;
	}
      /*
       * This feature (?) is here to stop people worrying about
       * mysterious zero constants: which is what they get when
       * they completely omit digits.
       */
      if (hex_value[c] >= radix)
	{
	  as_warn( "Missing digits. 0 assumed." );
	}
      bignum_high = bignum_low - 1; /* Start constant with 0 chars. */
      for(   ;   (digit = hex_value [c]) < radix;   c = * ++ input_line_pointer)
	{
	  /* Multiply existing number by radix, then add digit. */
	  carry = digit;
	  for (p=bignum_low;   p <= bignum_high;   p++)
	    {
	      work = (*p & MASK_CHAR) * radix + carry;
	      *p = work & MASK_CHAR;
	      carry = work >> BITS_PER_CHAR;
	    }
	  if (carry)
	    {
	      grow_bignum();
	      * bignum_high = carry & MASK_CHAR;
	      know( (carry & ~ MASK_CHAR) == 0);
	    }
	}
      length = bignum_high - bignum_low + 1;
      if (length > nbytes)
	{
	  as_warn( "Most significant bits truncated in integer constant." );
	}
      else
	{
	  register long int	leading_zeroes;

	  for(leading_zeroes = nbytes - length;
	      leading_zeroes;
	      leading_zeroes --)
	    {
	      grow_bignum();
	      * bignum_high = 0;
	    }
	}
      if (! need_pass_2)
	{
	  p = frag_more (nbytes);
	  bcopy (bignum_low, p, (int)nbytes);
	}
      /* C contains character after number. */
      SKIP_WHITESPACE();
      c = * input_line_pointer;
      /* C contains 1st non-blank character after number. */
    }
  demand_empty_rest_of_line();
}				/* big_cons() */

static void
grow_bignum()			/* Extend bignum by 1 char. */
{
  register long int	length;

  bignum_high ++;
  if (bignum_high >= bignum_limit)
    {
      length = bignum_limit - bignum_low;
      bignum_low = xrealloc (bignum_low, length + length);
      bignum_high = bignum_low + length;
      bignum_limit = bignum_low + length + length;
    }
}				/* grow_bignum(); */

/*
 *			float_cons()
 *
 * CONStruct some more frag chars of .floats .ffloats etc.
 * Makes 0 or more new frags.
 * If need_pass_2 == TRUE, no frags are emitted.
 * This understands only floating literals, not expressions. Sorry.
 *
 * A floating constant is defined by atof_generic(), except it is preceded
 * by 0d 0f 0g or 0h. After observing the STRANGE way my BSD AS does its
 * reading, I decided to be incompatible. This always tries to give you
 * rounded bits to the precision of the pseudo-op. Former AS did premature
 * truncatation, restored noisy bits instead of trailing 0s AND gave you
 * a choice of 2 flavours of noise according to which of 2 floating-point
 * scanners you directed AS to use.
 *
 * In:	input_line_pointer -> whitespace before, or '0' of flonum.
 *
 */

void	/* JF was static, but can't be if VAX.C is goning to use it */
float_cons(float_type)		/* Worker to do .float etc statements. */
				/* Clobbers input_line-pointer, checks end-of-line. */
     register float_type;	/* 'f':.ffloat ... 'F':.float ... */
{
  register char *	p;
  register char		c;
  int	length;	/* Number of chars in an object. */
  register char *	err;	/* Error from scanning floating literal. */
  char		temp [MAXIMUM_NUMBER_OF_CHARS_FOR_FLOAT];

  /*
   * The following awkward logic is to parse ZERO or more strings,
   * comma seperated. Recall an expression includes its leading &
   * trailing blanks. We fake a leading ',' if there is (supposed to
   * be) a 1st expression, and keep demanding 1 expression for each ','.
   */
  if (is_it_end_of_statement())
    {
      c = 0;			/* Skip loop. */
      ++ input_line_pointer;	/* -> past termintor. */
    }
  else
    {
      c = ',';			/* Do loop. */
    }
  while (c == ',')
    {
      /* input_line_pointer -> 1st char of a flonum (we hope!). */
      SKIP_WHITESPACE();
      /* Skip any 0{letter} that may be present. Don't even check if the
       * letter is legal. Someone may invent a "z" format and this routine
       * has no use for such information. Lusers beware: you get
       * diagnostics if your input is ill-conditioned.
       */

      if(input_line_pointer[0]=='0' && isalpha(input_line_pointer[1]))
	  input_line_pointer+=2;
      
      err = md_atof (float_type, temp, &length);
      know( length <=  MAXIMUM_NUMBER_OF_CHARS_FOR_FLOAT);
      know( length > 0 );
      if (* err)
	{
	  as_warn( "Bad floating literal: %s", err);
	  ignore_rest_of_line();
	  /* Input_line_pointer -> just after end-of-line. */
	  c = 0;		/* Break out of loop. */
	}
      else
	{
	  if ( ! need_pass_2)
	    {
	      p = frag_more (length);
	      bcopy (temp, p, length);
	    }
	  SKIP_WHITESPACE();
	  c = * input_line_pointer ++;
	  /* C contains 1st non-white character after number. */
	  /* input_line_pointer -> just after terminator (c). */
	}
    }
  -- input_line_pointer;		/* -> terminator (is not ','). */
  demand_empty_rest_of_line();
}				/* float_cons() */

/*
 *			stringer()
 *
 * We read 0 or more ',' seperated, double-quoted strings.
 *
 * Caller should have checked need_pass_2 is FALSE because we don't check it.
 */
static void
stringer(append_zero)		/* Worker to do .ascii etc statements. */
				/* Checks end-of-line. */
     register int append_zero;	/* 0: don't append '\0', else 1 */
{
  /* register char *	p; JF unused */
  /* register int		length; JF unused */	/* Length of string we read, excluding */
				/* trailing '\0' implied by closing quote. */
  /* register char *	where; JF unused */
  /* register fragS *	fragP; JF unused */
  register int c;

  /*
   * The following awkward logic is to parse ZERO or more strings,
   * comma seperated. Recall a string expression includes spaces
   * before the opening '\"' and spaces after the closing '\"'.
   * We fake a leading ',' if there is (supposed to be)
   * a 1st, expression. We keep demanding expressions for each
   * ','.
   */
  if (is_it_end_of_statement())
    {
      c = 0;			/* Skip loop. */
      ++ input_line_pointer;	/* Compensate for end of loop. */
    }
  else
    {
      c = ',';			/* Do loop. */
    }
  for (   ;   c == ',';   c = *input_line_pointer ++)
    {
      SKIP_WHITESPACE();
      if (* input_line_pointer == '\"')
	{
	  ++ input_line_pointer; /* -> 1st char of string. */
	  while ( (c = next_char_of_string()) >= 0)
	    {
	      FRAG_APPEND_1_CHAR( c );
	    }
	  if (append_zero)
	    {
	      FRAG_APPEND_1_CHAR( 0 );
	    }
	  know( input_line_pointer [-1] == '\"' );
	}
      else
	{
	  as_warn( "Expected \"-ed string" );
	}
      SKIP_WHITESPACE();
    }
  -- input_line_pointer;
  demand_empty_rest_of_line();
}				/* stringer() */

static int
next_char_of_string ()
{
  register int c;

  c = * input_line_pointer ++;
  switch (c)
    {
    case '\"':
      c = -1;
      break;

    case '\\':
      switch (c = * input_line_pointer ++)
	{
	case 'b':
	  c = '\b';
	  break;

	case 'f':
	  c = '\f';
	  break;

	case 'n':
	  c = '\n';
	  break;

	case 'r':
	  c = '\r';
	  break;

	case 't':
	  c = '\t';
	  break;

	case '\\':
	case '"':
	  break;		/* As itself. */

	case '0':
	case '1':
	case '2':
	case '3':
	case '4':
	case '5':
	case '6':
	case '7':
	case '8':
	case '9':
	  {
	    long int number;

	    for (number = 0;   isdigit(c);   c = * input_line_pointer ++)
	      {
		number = number * 8 + c - '0';
	      }
	    c = number;
	  }
	  -- input_line_pointer;
	  break;

	case '\n':
/*	  as_fatal( "Unterminated string - use app!" ); */
/* To be compatible with BSD 4.2 as: give the luser a linefeed!! */
	  c = '\n';
	  break;

	default:
	  as_warn( "Bad escaped character in string, '?' assumed" );
	  c = '?';
	  break;
	}
      break;

    default:
      break;
    }
  return (c);
}

static segT
get_segmented_expression ( expP )
     register expressionS *	expP;
{
  register segT		retval;

  if ( (retval = expression( expP )) == SEG_PASS1 || retval == SEG_NONE || retval == SEG_BIG )
    {
      as_warn("Expected address expression: absolute 0 assumed");
      retval = expP -> X_seg = SEG_ABSOLUTE;
      expP -> X_add_number   = 0;
      expP -> X_add_symbol   = expP -> X_subtract_symbol = 0;
    }
  return (retval);		/* SEG_ ABSOLUTE,UNKNOWN,DATA,TEXT,BSS */
}

static segT
get_known_segmented_expression ( expP )
     register expressionS *	expP;
{
  register segT		retval;
  register char *	name1;
  register char *	name2;

  if (   (retval = get_segmented_expression (expP)) == SEG_UNKNOWN
      )
    {
      name1 = expP -> X_add_symbol ? expP -> X_add_symbol -> sy_name : "";
      name2 = expP -> X_subtract_symbol ? expP -> X_subtract_symbol -> sy_name : "";
      if ( name1 && name2 )
	{
	  as_warn("Symbols \"%s\" \"%s\" are undefined: absolute 0 assumed.",
		  name1, name2);
	}
      else
	{
	  as_warn("Symbol \"%s\" undefined: absolute 0 assumed.",
		  name1 ? name1 : name2);
	}
      retval = expP -> X_seg = SEG_ABSOLUTE;
      expP -> X_add_number   = 0;
      expP -> X_add_symbol   = expP -> X_subtract_symbol = NULL;
    }
 know(   retval == SEG_ABSOLUTE || retval == SEG_DATA || retval == SEG_TEXT || retval == SEG_BSS || retval == SEG_DIFFERENCE );
  return (retval);
}				/* get_known_segmented_expression() */



/* static */ long int /* JF was static, but can't be if the MD pseudos are to use it */
get_absolute_expression ()
{
  expressionS	exp;
  register segT s;

  if ( (s = expression(& exp)) != SEG_ABSOLUTE )
    {
      if ( s != SEG_NONE )
	{
	  as_warn( "Bad Absolute Expression, absolute 0 assumed.");
	}
      exp . X_add_number = 0;
    }
  return (exp . X_add_number);
}

static char			/* return terminator */
get_absolute_expression_and_terminator( val_pointer)
     long int *		val_pointer; /* return value of expression */
{
  * val_pointer = get_absolute_expression ();
  return ( * input_line_pointer ++ );
}

/*
 *			demand_copy_C_string()
 *
 * Like demand_copy_string, but return NULL if the string contains any '\0's.
 * Give a warning if that happens.
 */
static char *
demand_copy_C_string (len_pointer)
     int *	len_pointer;
{
  register char *	s;

  if (s = demand_copy_string (len_pointer))
    {
      register int	len;

      for (len = * len_pointer;
	   len > 0;
	   len--)
	{
	  if (* s == 0)
	    {
	      s = 0;
	      len = 1;
	      * len_pointer = 0;
	      as_warn( "This string may not contain \'\\0\'" );
	    }
	}
    }
  return (s);
}

/*
 *			demand_copy_string()
 *
 * Demand string, but return a safe (=private) copy of the string.
 * Return NULL if we can't read a string here.
 */
static char *
demand_copy_string (lenP)
     int *	lenP;
{
  register int		c;
  register int		len;
	   char *	retval;

  len = 0;
  SKIP_WHITESPACE();
  if (* input_line_pointer == '\"')
    {
      input_line_pointer ++;	/* Skip opening quote. */
      while ( (c = next_char_of_string()) >= 0 ) {
	  obstack_1grow ( &notes, c );
	  len ++;
	}
      /* JF this next line is so demand_copy_C_string will return a null
         termanated string. */
      obstack_1grow(&notes,'\0');
      retval=obstack_finish( &notes);
  } else {
      as_warn( "Missing string" );
      retval = NULL;
      ignore_rest_of_line ();
    }
  * lenP = len;
  return (retval);
}

/*
 *		is_it_end_of_statement()
 *
 * In:	Input_line_pointer -> next character.
 *
 * Do:	Skip input_line_pointer over all whitespace.
 *
 * Out:	TRUE if input_line_pointer -> end-of-line.
 */
static int
is_it_end_of_statement()
{
  SKIP_WHITESPACE();
  return (is_end_of_line [* input_line_pointer]);
}

void
equals(sym_name)
char *sym_name;
{
  register struct symbol * symbolP; /* symbol we are working with */

  if(sym_name[0]=='.' && sym_name[1]=='\0') {
    /* Turn '. = mumble' into a .org mumble */
    register segT segment;
    expressionS exp;
    register char *p;

    if(input_line_pointer[1]=='=')
      input_line_pointer+=2;
    else
      *input_line_pointer++='=';		/* Put it back */
    if(*input_line_pointer==' ' || *input_line_pointer=='\t')
    	input_line_pointer++;
    segment = get_known_segmented_expression(& exp);
    if ( ! need_pass_2 ) {
      if (segment != now_seg && segment != SEG_ABSOLUTE)
        as_warn("Illegal segment \"%s\". Segment \"%s\" assumed.",
                seg_name [(int) segment], seg_name [(int) now_seg]);
      p = frag_var (rs_org, 1, 1, (relax_substateT)0, exp.X_add_symbol,
                    exp.X_add_number, (char *)0);
      * p = 0;
    } /* if (ok to make frag) */
    return;
  }

  symbolP=symbol_find_or_make(sym_name);
  if(input_line_pointer[1]=='=')
    input_line_pointer+=2;
  else
    *input_line_pointer++='=';		/* Put it back */
  pseudo_set(symbolP);
}

/* end: read.c */

