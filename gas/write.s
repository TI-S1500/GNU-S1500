#APP
	.file	"write.c"
.text
	.def	_FILE;	.scl	10;	.type	010;	.size	14;	.endef
	.def	__cnt;	.val	0;	.scl	8;	.type	04;	.endef
	.def	__ptr;	.val	4;	.scl	8;	.type	034;	.endef
	.def	__base;	.val	8;	.scl	8;	.type	034;	.endef
	.def	__flag;	.val	12;	.scl	8;	.type	02;	.endef
	.def	__file;	.val	13;	.scl	8;	.type	02;	.endef
	.def	.eos;	.val	14;	.scl	102;	.tag	_FILE;	.size	14;	.endef
	.def	_FILE;	.scl	13;	.tag	_FILE;	.size	14;	.type	010;	.endef
	.def	_segT;	.scl	15;	.type	012;	.size	4;	.endef
	.def	_SEG_ABSOLUTE;	.val	0;	.scl	16;	.type	013;	.endef
	.def	_SEG_TEXT;	.val	1;	.scl	16;	.type	013;	.endef
	.def	_SEG_DATA;	.val	2;	.scl	16;	.type	013;	.endef
	.def	_SEG_BSS;	.val	3;	.scl	16;	.type	013;	.endef
	.def	_SEG_UNKNOWN;	.val	4;	.scl	16;	.type	013;	.endef
	.def	_SEG_NONE;	.val	5;	.scl	16;	.type	013;	.endef
	.def	_SEG_PASS1;	.val	6;	.scl	16;	.type	013;	.endef
	.def	_SEG_GOOF;	.val	7;	.scl	16;	.type	013;	.endef
	.def	_SEG_BIG;	.val	8;	.scl	16;	.type	013;	.endef
	.def	_SEG_DIFFERENCE;	.val	9;	.scl	16;	.type	013;	.endef
	.def	.eos;	.val	4;	.scl	102;	.tag	_segT;	.size	4;	.endef
	.def	_segT;	.scl	13;	.tag	_segT;	.size	4;	.type	012;	.endef
	.def	_subsegT;	.scl	13;	.type	014;	.endef
	.def	_relax_stateT;	.scl	15;	.type	012;	.size	4;	.endef
	.def	_rs_fill;	.val	0;	.scl	16;	.type	013;	.endef
	.def	_rs_align;	.val	1;	.scl	16;	.type	013;	.endef
	.def	_rs_org;	.val	2;	.scl	16;	.type	013;	.endef
	.def	_rs_machine_dependent;	.val	3;	.scl	16;	.type	013;	.endef
	.def	_rs_broken_word;	.val	4;	.scl	16;	.type	013;	.endef
	.def	.eos;	.val	4;	.scl	102;	.tag	_relax_stateT;	.size	4;	.endef
	.def	_relax_stateT;	.scl	13;	.tag	_relax_stateT;	.size	4;	.type	012;	.endef
	.def	_relax_substateT;	.scl	13;	.type	016;	.endef
	.def	_relax_addressT;	.scl	13;	.type	016;	.endef
	.def	_frag;	.scl	10;	.type	010;	.size	40;	.endef
	.def	_fr_address;	.val	0;	.scl	8;	.type	016;	.endef
	.def	_fr_next;	.val	4;	.scl	8;	.tag	_frag;	.size	40;	.type	030;	.endef
	.def	_fr_fix;	.val	8;	.scl	8;	.type	04;	.endef
	.def	_fr_var;	.val	12;	.scl	8;	.type	04;	.endef
	.def	_fr_symbol;	.val	16;	.scl	8;	.size	0;	.type	030;	.endef
	.def	_fr_offset;	.val	20;	.scl	8;	.type	04;	.endef
	.def	_fr_opcode;	.val	24;	.scl	8;	.type	022;	.endef
	.def	_fr_type;	.val	28;	.scl	8;	.tag	_relax_stateT;	.size	4;	.type	012;	.endef
	.def	_fr_subtype;	.val	32;	.scl	8;	.type	016;	.endef
	.def	_fr_pcrel_adjust;	.val	36;	.scl	8;	.type	02;	.endef
	.def	_fr_bsr;	.val	37;	.scl	8;	.type	02;	.endef
	.def	_fr_literal;	.val	38;	.scl	8;	.dim	1;	.size	1;	.type	062;	.endef
	.def	.eos;	.val	40;	.scl	102;	.tag	_frag;	.size	40;	.endef
	.def	_fragS;	.scl	13;	.tag	_frag;	.size	40;	.type	010;	.endef
	.def	_pseudo_typeS;	.scl	10;	.type	010;	.size	12;	.endef
	.def	_poc_name;	.val	0;	.scl	8;	.type	022;	.endef
	.def	_poc_handler;	.val	4;	.scl	8;	.type	0224;	.endef
	.def	_poc_val;	.val	8;	.scl	8;	.type	04;	.endef
	.def	.eos;	.val	12;	.scl	102;	.tag	_pseudo_typeS;	.size	12;	.endef
	.def	_pseudo_typeS;	.scl	13;	.tag	_pseudo_typeS;	.size	12;	.type	010;	.endef
	.def	_relax_typeS;	.scl	10;	.type	010;	.size	14;	.endef
	.def	_rlx_forward;	.val	0;	.scl	8;	.type	04;	.endef
	.def	_rlx_backward;	.val	4;	.scl	8;	.type	04;	.endef
	.def	_rlx_length;	.val	8;	.scl	8;	.type	014;	.endef
	.def	_rlx_more;	.val	10;	.scl	8;	.type	016;	.endef
	.def	.eos;	.val	14;	.scl	102;	.tag	_relax_typeS;	.size	14;	.endef
	.def	_relax_typeS;	.scl	13;	.tag	_relax_typeS;	.size	14;	.type	010;	.endef
	.def	_frchain;	.scl	10;	.type	010;	.size	18;	.endef
	.def	_frch_root;	.val	0;	.scl	8;	.tag	_frag;	.size	40;	.type	030;	.endef
	.def	_frch_last;	.val	4;	.scl	8;	.tag	_frag;	.size	40;	.type	030;	.endef
	.def	_frch_next;	.val	8;	.scl	8;	.tag	_frchain;	.size	18;	.type	030;	.endef
	.def	_frch_seg;	.val	12;	.scl	8;	.tag	_segT;	.size	4;	.type	012;	.endef
	.def	_frch_subseg;	.val	16;	.scl	8;	.type	014;	.endef
	.def	.eos;	.val	18;	.scl	102;	.tag	_frchain;	.size	18;	.endef
	.def	_frchainS;	.scl	13;	.tag	_frchain;	.size	18;	.type	010;	.endef
	.def	_aux_entry;	.scl	10;	.type	010;	.size	22;	.endef
	.def	_coff_auxent;	.val	0;	.scl	8;	.size	18;	.type	011;	.endef
	.def	_aux_next;	.val	18;	.scl	8;	.tag	_aux_entry;	.size	22;	.type	030;	.endef
	.def	.eos;	.val	22;	.scl	102;	.tag	_aux_entry;	.size	22;	.endef
	.def	_relocation_info;	.scl	10;	.type	010;	.size	8;	.endef
	.def	_r_address;	.val	0;	.scl	8;	.type	04;	.endef
	.def	_r_symbolnum;	.val	32;	.scl	18;	.type	04;	.size	24;	.endef
	.def	_r_pcrel;	.val	56;	.scl	18;	.type	04;	.size	1;	.endef
	.def	_r_length;	.val	57;	.scl	18;	.type	04;	.size	2;	.endef
	.def	_r_extern;	.val	59;	.scl	18;	.type	04;	.size	1;	.endef
	.def	_r_bsr;	.val	60;	.scl	18;	.type	04;	.size	1;	.endef
	.def	_r_disp;	.val	61;	.scl	18;	.type	04;	.size	1;	.endef
	.def	_nuthin;	.val	62;	.scl	18;	.type	04;	.size	2;	.endef
	.def	.eos;	.val	8;	.scl	102;	.tag	_relocation_info;	.size	8;	.endef
	.def	_reloc;	.scl	10;	.type	010;	.size	10;	.endef
	.def	_r_address;	.val	0;	.scl	8;	.type	04;	.endef
	.def	_r_symbolnum;	.val	4;	.scl	8;	.type	04;	.endef
	.def	_r_type;	.val	8;	.scl	8;	.type	015;	.endef
	.def	.eos;	.val	10;	.scl	102;	.tag	_reloc;	.size	10;	.endef
	.def	_nlist;	.scl	10;	.type	010;	.size	12;	.endef
	.def	_n_un;	.val	0;	.scl	8;	.size	4;	.type	011;	.endef
	.def	_n_type;	.val	4;	.scl	8;	.type	02;	.endef
	.def	_n_other;	.val	5;	.scl	8;	.type	02;	.endef
	.def	_n_desc;	.val	6;	.scl	8;	.type	03;	.endef
	.def	_n_value;	.val	8;	.scl	8;	.type	016;	.endef
	.def	.eos;	.val	12;	.scl	102;	.tag	_nlist;	.size	12;	.endef
	.def	_auxent;	.scl	12;	.type	011;	.size	18;	.endef
	.def	_x_sym;	.val	0;	.scl	11;	.size	18;	.type	010;	.endef
	.def	_x_file;	.val	0;	.scl	11;	.size	14;	.type	010;	.endef
	.def	_x_scn;	.val	0;	.scl	11;	.size	8;	.type	010;	.endef
	.def	_x_tv;	.val	0;	.scl	11;	.size	10;	.type	010;	.endef
	.def	.eos;	.val	18;	.scl	102;	.tag	_auxent;	.size	18;	.endef
	.def	_syment;	.scl	10;	.type	010;	.size	18;	.endef
	.def	__n;	.val	0;	.scl	8;	.size	8;	.type	011;	.endef
	.def	_n_value;	.val	8;	.scl	8;	.type	04;	.endef
	.def	_n_scnum;	.val	12;	.scl	8;	.type	03;	.endef
	.def	_n_type;	.val	14;	.scl	8;	.type	015;	.endef
	.def	_n_sclass;	.val	16;	.scl	8;	.type	02;	.endef
	.def	_n_numaux;	.val	17;	.scl	8;	.type	02;	.endef
	.def	.eos;	.val	18;	.scl	102;	.tag	_syment;	.size	18;	.endef
	.def	_exec;	.scl	10;	.type	010;	.size	32;	.endef
	.def	_a_magic;	.val	0;	.scl	8;	.type	04;	.endef
	.def	_a_text;	.val	4;	.scl	8;	.type	016;	.endef
	.def	_a_data;	.val	8;	.scl	8;	.type	016;	.endef
	.def	_a_bss;	.val	12;	.scl	8;	.type	016;	.endef
	.def	_a_syms;	.val	16;	.scl	8;	.type	016;	.endef
	.def	_a_entry;	.val	20;	.scl	8;	.type	016;	.endef
	.def	_a_trsize;	.val	24;	.scl	8;	.type	016;	.endef
	.def	_a_drsize;	.val	28;	.scl	8;	.type	016;	.endef
	.def	.eos;	.val	32;	.scl	102;	.tag	_exec;	.size	32;	.endef
	.def	_exec_struct;	.scl	10;	.type	010;	.size	140;	.endef
	.def	_the_filehdr;	.val	0;	.scl	8;	.size	20;	.type	010;	.endef
	.def	_text_scn;	.val	20;	.scl	8;	.size	40;	.type	010;	.endef
	.def	_data_scn;	.val	60;	.scl	8;	.size	40;	.type	010;	.endef
	.def	_bss_scn;	.val	100;	.scl	8;	.size	40;	.type	010;	.endef
	.def	.eos;	.val	140;	.scl	102;	.tag	_exec_struct;	.size	140;	.endef
	.def	_scnhdr;	.scl	10;	.type	010;	.size	40;	.endef
	.def	_s_name;	.val	0;	.scl	8;	.dim	8;	.size	8;	.type	062;	.endef
	.def	_s_paddr;	.val	8;	.scl	8;	.type	04;	.endef
	.def	_s_vaddr;	.val	12;	.scl	8;	.type	04;	.endef
	.def	_s_size;	.val	16;	.scl	8;	.type	04;	.endef
	.def	_s_scnptr;	.val	20;	.scl	8;	.type	04;	.endef
	.def	_s_relptr;	.val	24;	.scl	8;	.type	04;	.endef
	.def	_s_lnnoptr;	.val	28;	.scl	8;	.type	04;	.endef
	.def	_s_nreloc;	.val	32;	.scl	8;	.type	015;	.endef
	.def	_s_nlnno;	.val	34;	.scl	8;	.type	015;	.endef
	.def	_s_flags;	.val	36;	.scl	8;	.type	04;	.endef
	.def	.eos;	.val	40;	.scl	102;	.tag	_scnhdr;	.size	40;	.endef
	.def	_filehdr;	.scl	10;	.type	010;	.size	20;	.endef
	.def	_f_magic;	.val	0;	.scl	8;	.type	015;	.endef
	.def	_f_nscns;	.val	2;	.scl	8;	.type	015;	.endef
	.def	_f_timdat;	.val	4;	.scl	8;	.type	04;	.endef
	.def	_f_symptr;	.val	8;	.scl	8;	.type	04;	.endef
	.def	_f_nsyms;	.val	12;	.scl	8;	.type	04;	.endef
	.def	_f_opthdr;	.val	16;	.scl	8;	.type	015;	.endef
	.def	_f_flags;	.val	18;	.scl	8;	.type	015;	.endef
	.def	.eos;	.val	20;	.scl	102;	.tag	_filehdr;	.size	20;	.endef
	.def	_obstack;	.scl	10;	.type	010;	.size	36;	.endef
	.def	_chunk_size;	.val	0;	.scl	8;	.type	04;	.endef
	.def	_chunk;	.val	4;	.scl	8;	.size	12;	.type	030;	.endef
	.def	_object_base;	.val	8;	.scl	8;	.type	022;	.endef
	.def	_next_free;	.val	12;	.scl	8;	.type	022;	.endef
	.def	_chunk_limit;	.val	16;	.scl	8;	.type	022;	.endef
	.def	_temp;	.val	20;	.scl	8;	.type	04;	.endef
	.def	_alignment_mask;	.val	24;	.scl	8;	.type	04;	.endef
	.def	_chunkfun;	.val	28;	.scl	8;	.size	12;	.type	0630;	.endef
	.def	_freefun;	.val	32;	.scl	8;	.type	0224;	.endef
	.def	.eos;	.val	36;	.scl	102;	.tag	_obstack;	.size	36;	.endef
	.def	__obstack_chunk;	.scl	10;	.type	010;	.size	12;	.endef
	.def	_limit;	.val	0;	.scl	8;	.type	022;	.endef
	.def	_prev;	.val	4;	.scl	8;	.tag	__obstack_chunk;	.size	12;	.type	030;	.endef
	.def	_contents;	.val	8;	.scl	8;	.dim	4;	.size	4;	.type	062;	.endef
	.def	.eos;	.val	12;	.scl	102;	.tag	__obstack_chunk;	.size	12;	.endef
	.def	_.0fake;	.scl	12;	.type	011;	.size	4;	.endef
	.def	_n_name;	.val	0;	.scl	11;	.type	022;	.endef
	.def	_n_next;	.val	0;	.scl	11;	.tag	_nlist;	.size	12;	.type	030;	.endef
	.def	_n_strx;	.val	0;	.scl	11;	.type	04;	.endef
	.def	.eos;	.val	4;	.scl	102;	.tag	_.0fake;	.size	4;	.endef
	.def	_.4fake;	.scl	10;	.type	010;	.size	10;	.endef
	.def	_x_tvfill;	.val	0;	.scl	8;	.type	04;	.endef
	.def	_x_tvlen;	.val	4;	.scl	8;	.type	015;	.endef
	.def	_x_tvran;	.val	6;	.scl	8;	.dim	2;	.size	4;	.type	075;	.endef
	.def	.eos;	.val	10;	.scl	102;	.tag	_.4fake;	.size	10;	.endef
	.def	_.3fake;	.scl	10;	.type	010;	.size	8;	.endef
	.def	_x_scnlen;	.val	0;	.scl	8;	.type	04;	.endef
	.def	_x_nreloc;	.val	4;	.scl	8;	.type	015;	.endef
	.def	_x_nlinno;	.val	6;	.scl	8;	.type	015;	.endef
	.def	.eos;	.val	8;	.scl	102;	.tag	_.3fake;	.size	8;	.endef
	.def	_.2fake;	.scl	10;	.type	010;	.size	14;	.endef
	.def	_x_fname;	.val	0;	.scl	8;	.dim	14;	.size	14;	.type	062;	.endef
	.def	.eos;	.val	14;	.scl	102;	.tag	_.2fake;	.size	14;	.endef
	.def	_.1fake;	.scl	10;	.type	010;	.size	18;	.endef
	.def	_x_tagndx;	.val	0;	.scl	8;	.type	04;	.endef
	.def	_x_misc;	.val	4;	.scl	8;	.size	4;	.type	011;	.endef
	.def	_x_fcnary;	.val	8;	.scl	8;	.size	8;	.type	011;	.endef
	.def	_x_tvndx;	.val	16;	.scl	8;	.type	015;	.endef
	.def	.eos;	.val	18;	.scl	102;	.tag	_.1fake;	.size	18;	.endef
	.def	_.7fake;	.scl	12;	.type	011;	.size	8;	.endef
	.def	_x_fcn;	.val	0;	.scl	11;	.size	8;	.type	010;	.endef
	.def	_x_ary;	.val	0;	.scl	11;	.size	8;	.type	010;	.endef
	.def	.eos;	.val	8;	.scl	102;	.tag	_.7fake;	.size	8;	.endef
	.def	_.9fake;	.scl	10;	.type	010;	.size	8;	.endef
	.def	_x_dimen;	.val	0;	.scl	8;	.dim	4;	.size	8;	.type	075;	.endef
	.def	.eos;	.val	8;	.scl	102;	.tag	_.9fake;	.size	8;	.endef
	.def	_.8fake;	.scl	10;	.type	010;	.size	8;	.endef
	.def	_x_lnnoptr;	.val	0;	.scl	8;	.type	04;	.endef
	.def	_x_endndx;	.val	4;	.scl	8;	.type	04;	.endef
	.def	.eos;	.val	8;	.scl	102;	.tag	_.8fake;	.size	8;	.endef
	.def	_.6fake;	.scl	12;	.type	011;	.size	4;	.endef
	.def	_x_lnsz;	.val	0;	.scl	11;	.size	4;	.type	010;	.endef
	.def	_x_fsize;	.val	0;	.scl	11;	.type	04;	.endef
	.def	.eos;	.val	4;	.scl	102;	.tag	_.6fake;	.size	4;	.endef
	.def	_.10fake;	.scl	10;	.type	010;	.size	4;	.endef
	.def	_x_lnno;	.val	0;	.scl	8;	.type	015;	.endef
	.def	_x_size;	.val	2;	.scl	8;	.type	015;	.endef
	.def	.eos;	.val	4;	.scl	102;	.tag	_.10fake;	.size	4;	.endef
	.def	_.5fake;	.scl	12;	.type	011;	.size	8;	.endef
	.def	__n_name;	.val	0;	.scl	11;	.dim	8;	.size	8;	.type	062;	.endef
	.def	__n_n;	.val	0;	.scl	11;	.size	8;	.type	010;	.endef
	.def	__n_nptr;	.val	0;	.scl	11;	.dim	2;	.size	8;	.type	0162;	.endef
	.def	.eos;	.val	8;	.scl	102;	.tag	_.5fake;	.size	8;	.endef
	.def	_.11fake;	.scl	10;	.type	010;	.size	8;	.endef
	.def	__n_zeroes;	.val	0;	.scl	8;	.type	04;	.endef
	.def	__n_offset;	.val	4;	.scl	8;	.type	04;	.endef
	.def	.eos;	.val	8;	.scl	102;	.tag	_.11fake;	.size	8;	.endef
	.def	_auxentS;	.scl	13;	.tag	_aux_entry;	.size	22;	.type	010;	.endef
	.def	_symbol;	.scl	10;	.type	010;	.size	54;	.endef
	.def	_coff_sy_nlist;	.val	0;	.scl	8;	.tag	_syment;	.size	18;	.type	010;	.endef
	.def	_sy_nlist;	.val	18;	.scl	8;	.tag	_nlist;	.size	12;	.type	010;	.endef
	.def	_sy_name_offset;	.val	30;	.scl	8;	.type	016;	.endef
	.def	_sy_number;	.val	34;	.scl	8;	.type	04;	.endef
	.def	_sy_next;	.val	38;	.scl	8;	.tag	_symbol;	.size	54;	.type	030;	.endef
	.def	_sy_frag;	.val	42;	.scl	8;	.tag	_frag;	.size	40;	.type	030;	.endef
	.def	_sy_forward;	.val	46;	.scl	8;	.tag	_symbol;	.size	54;	.type	030;	.endef
	.def	_sy_aux;	.val	50;	.scl	8;	.tag	_aux_entry;	.size	22;	.type	030;	.endef
	.def	.eos;	.val	54;	.scl	102;	.tag	_symbol;	.size	54;	.endef
	.def	_symbolS;	.scl	13;	.tag	_symbol;	.size	54;	.type	010;	.endef
	.def	_valueT;	.scl	13;	.type	016;	.endef
	.def	_bit_fix;	.scl	10;	.type	010;	.size	28;	.endef
	.def	_fx_bit_size;	.val	0;	.scl	8;	.type	04;	.endef
	.def	_fx_bit_offset;	.val	4;	.scl	8;	.type	04;	.endef
	.def	_fx_bit_base;	.val	8;	.scl	8;	.type	04;	.endef
	.def	_fx_bit_base_adj;	.val	12;	.scl	8;	.type	04;	.endef
	.def	_fx_bit_max;	.val	16;	.scl	8;	.type	04;	.endef
	.def	_fx_bit_min;	.val	20;	.scl	8;	.type	04;	.endef
	.def	_fx_bit_add;	.val	24;	.scl	8;	.type	04;	.endef
	.def	.eos;	.val	28;	.scl	102;	.tag	_bit_fix;	.size	28;	.endef
	.def	_broken_word;	.scl	10;	.type	010;	.size	36;	.endef
	.def	_next_broken_word;	.val	0;	.scl	8;	.tag	_broken_word;	.size	36;	.type	030;	.endef
	.def	_frag;	.val	4;	.scl	8;	.tag	_frag;	.size	40;	.type	030;	.endef
	.def	_word_goes_here;	.val	8;	.scl	8;	.type	022;	.endef
	.def	_dispfrag;	.val	12;	.scl	8;	.tag	_frag;	.size	40;	.type	030;	.endef
	.def	_add;	.val	16;	.scl	8;	.tag	_symbol;	.size	54;	.type	030;	.endef
	.def	_sub;	.val	20;	.scl	8;	.tag	_symbol;	.size	54;	.type	030;	.endef
	.def	_addnum;	.val	24;	.scl	8;	.type	04;	.endef
	.def	_added;	.val	28;	.scl	8;	.type	04;	.endef
	.def	_use_jump;	.val	32;	.scl	8;	.tag	_broken_word;	.size	36;	.type	030;	.endef
	.def	.eos;	.val	36;	.scl	102;	.tag	_broken_word;	.size	36;	.endef
	.def	_bit_fixS;	.scl	13;	.tag	_bit_fix;	.size	28;	.type	010;	.endef
	.def	_fix;	.scl	10;	.type	010;	.size	36;	.endef
	.def	_fx_frag;	.val	0;	.scl	8;	.tag	_frag;	.size	40;	.type	030;	.endef
	.def	_fx_where;	.val	4;	.scl	8;	.type	04;	.endef
	.def	_fx_addsy;	.val	8;	.scl	8;	.tag	_symbol;	.size	54;	.type	030;	.endef
	.def	_fx_subsy;	.val	12;	.scl	8;	.tag	_symbol;	.size	54;	.type	030;	.endef
	.def	_fx_offset;	.val	16;	.scl	8;	.type	04;	.endef
	.def	_fx_next;	.val	20;	.scl	8;	.tag	_fix;	.size	36;	.type	030;	.endef
	.def	_fx_size;	.val	24;	.scl	8;	.type	03;	.endef
	.def	_fx_pcrel;	.val	26;	.scl	8;	.type	02;	.endef
	.def	_fx_pcrel_adjust;	.val	27;	.scl	8;	.type	02;	.endef
	.def	_fx_im_disp;	.val	28;	.scl	8;	.type	02;	.endef
	.def	_fx_bit_fixP;	.val	30;	.scl	8;	.tag	_bit_fix;	.size	28;	.type	030;	.endef
	.def	_fx_bsr;	.val	34;	.scl	8;	.type	02;	.endef
	.def	.eos;	.val	36;	.scl	102;	.tag	_fix;	.size	36;	.endef
	.def	_fixS;	.scl	13;	.tag	_fix;	.size	36;	.type	010;	.endef
	.def	_lineno_entry;	.scl	10;	.type	010;	.size	18;	.endef
	.def	_coff_lineno;	.val	0;	.scl	8;	.size	6;	.type	010;	.endef
	.def	_ln_number;	.val	6;	.scl	8;	.type	04;	.endef
	.def	_ln_sym;	.val	10;	.scl	8;	.tag	_symbol;	.size	54;	.type	030;	.endef
	.def	_ln_next;	.val	14;	.scl	8;	.tag	_lineno_entry;	.size	18;	.type	030;	.endef
	.def	.eos;	.val	18;	.scl	102;	.tag	_lineno_entry;	.size	18;	.endef
	.def	_lineno;	.scl	10;	.type	010;	.size	6;	.endef
	.def	_l_addr;	.val	0;	.scl	8;	.size	4;	.type	011;	.endef
	.def	_l_lnno;	.val	4;	.scl	8;	.type	015;	.endef
	.def	.eos;	.val	6;	.scl	102;	.tag	_lineno;	.size	6;	.endef
	.def	_.12fake;	.scl	12;	.type	011;	.size	4;	.endef
	.def	_l_symndx;	.val	0;	.scl	11;	.type	04;	.endef
	.def	_l_paddr;	.val	0;	.scl	11;	.type	04;	.endef
	.def	.eos;	.val	4;	.scl	102;	.tag	_.12fake;	.size	4;	.endef
	.def	_linenoS;	.scl	13;	.tag	_lineno_entry;	.size	18;	.type	010;	.endef
	.def	_fieldn;	.scl	10;	.type	010;	.size	8;	.endef
	.def	_fname;	.val	0;	.scl	8;	.type	022;	.endef
	.def	_ndx;	.val	4;	.scl	8;	.type	04;	.endef
	.def	.eos;	.val	8;	.scl	102;	.tag	_fieldn;	.size	8;	.endef
	.def	_field_name;	.scl	13;	.tag	_fieldn;	.size	8;	.type	010;	.endef
	.def	_coff_dirs;	.scl	15;	.type	012;	.size	4;	.endef
	.def	_bf;	.val	0;	.scl	16;	.type	013;	.endef
	.def	_bb;	.val	1;	.scl	16;	.type	013;	.endef
	.def	_ef;	.val	2;	.scl	16;	.type	013;	.endef
	.def	_eb;	.val	3;	.scl	16;	.type	013;	.endef
	.def	_eos;	.val	4;	.scl	16;	.type	013;	.endef
	.def	_dim;	.val	5;	.scl	16;	.type	013;	.endef
	.def	.eos;	.val	4;	.scl	102;	.tag	_coff_dirs;	.size	4;	.endef
	.def	_coff_dirs;	.scl	13;	.tag	_coff_dirs;	.size	4;	.type	012;	.endef
	.def	_fsize_entry;	.scl	10;	.type	010;	.size	8;	.endef
	.def	_fcn_size;	.val	0;	.scl	8;	.type	04;	.endef
	.def	_fsize_next;	.val	4;	.scl	8;	.tag	_fsize_entry;	.size	8;	.type	030;	.endef
	.def	.eos;	.val	8;	.scl	102;	.tag	_fsize_entry;	.size	8;	.endef
	.def	_fsizeS;	.scl	13;	.tag	_fsize_entry;	.size	8;	.type	010;	.endef
	.def	_comment_entry;	.scl	10;	.type	010;	.size	8;	.endef
	.def	_comment;	.val	0;	.scl	8;	.type	022;	.endef
	.def	_comment_next;	.val	4;	.scl	8;	.tag	_comment_entry;	.size	8;	.type	030;	.endef
	.def	.eos;	.val	8;	.scl	102;	.tag	_comment_entry;	.size	8;	.endef
	.def	_commentS;	.scl	13;	.tag	_comment_entry;	.size	8;	.type	010;	.endef
	.def	_nbytes_r_length;	.val	_nbytes_r_length;	.scl	3;	.dim	5;	.size	5;	.type	074;	.endef
.data
_nbytes_r_length:
	.byte 42
	.byte 0
	.byte 1
	.byte 42
	.byte 2
.text
	.def	_the_coff_exec;	.val	_the_coff_exec;	.scl	3;	.tag	_exec_struct;	.size	140;	.type	010;	.endef
.data
	.align 2
_the_coff_exec:
	.word 336
	.word 3
	.long 0
	.long 0
	.long 0
	.word 0
	.word 256
	.ascii ".text\0"
	.skip 2
	.long 0
	.long 0
	.long 0
	.long 140
	.long 0
	.long 0
	.word 0
	.word 0
	.long 32
	.ascii ".data\0"
	.skip 2
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.word 0
	.word 0
	.long 64
	.ascii ".bss\0"
	.skip 3
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.word 0
	.word 0
	.long 128
.text
	.def	_comment_scnhdr;	.val	_comment_scnhdr;	.scl	3;	.tag	_scnhdr;	.size	40;	.type	010;	.endef
.data
	.align 2
_comment_scnhdr:
	.ascii ".comment"
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.word 0
	.word 0
	.long 512
.text
	.def	_keep_the_underscore;	.val	_keep_the_underscore;	.scl	2;	.type	04;	.endef
.globl _keep_the_underscore
.data
	.align 2
_keep_the_underscore:
	.long 0
.text
	.even
	.def	_fix_new;	.val	_fix_new;	.scl	2;	.type	044;	.endef
.globl _fix_new
_fix_new:
	.ln	1
	link a6,#0
	moveml #0x1c20,sp@-
	.def	.bf;	.val	.;	.scl	101;	.line	163;	.endef
	.def	_frag;	.val	8;	.scl	9;	.tag	_frag;	.size	40;	.type	030;	.endef
	.def	_where;	.val	12;	.scl	9;	.type	04;	.endef
	.def	_size;	.val	16;	.scl	9;	.type	04;	.endef
	.def	_add_symbol;	.val	20;	.scl	9;	.tag	_symbol;	.size	54;	.type	030;	.endef
	.def	_sub_symbol;	.val	24;	.scl	9;	.tag	_symbol;	.size	54;	.type	030;	.endef
	.def	_offset;	.val	28;	.scl	9;	.type	04;	.endef
	.def	_pcrel;	.val	32;	.scl	9;	.type	04;	.endef
	.def	_size;	.val	5;	.scl	4;	.type	03;	.endef
	movew a6@(18),d5
	.def	.bb;	.val	.;	.scl	100;	.line	1;	.endef
	.def	.bb;	.val	.;	.scl	100;	.line	1;	.endef
	.def	___h;	.val	4;	.scl	4;	.tag	_obstack;	.size	36;	.type	030;	.endef
	.ln	14
	movel #_notes,d4
	.def	.bb;	.val	.;	.scl	100;	.line	14;	.endef
	.def	___o;	.val	10;	.scl	4;	.tag	_obstack;	.size	36;	.type	030;	.endef
	.def	___len;	.val	3;	.scl	4;	.type	04;	.endef
	movel d4,a2
	moveq #36,d3
	movel d3,d0
	addl _notes+12,d0
	cmpl _notes+16,d0
	jls L3
	movel d3,sp@-
	movel d4,sp@-
	jbsr __obstack_newchunk
L3:
	addl d3,a2@(12)
	.def	.eb;.val	.;	.scl	100;	.line	14;	.endef
	.def	.bb;	.val	.;	.scl	100;	.line	14;	.endef
	.def	___o;	.val	8;	.scl	4;	.tag	_obstack;	.size	36;	.type	030;	.endef
	.def	_value;	.val	9;	.scl	4;	.type	024;	.endef
	movel d4,a0
	movel a0@(8),a1
	movel a0@(12),d0
	addl a0@(24),d0
	movel a0@(24),d1
	notl d1
	andl d1,d0
	movel d0,a0@(12)
	subl a0@(4),d0
	movel a0@(16),d1
	subl a0@(4),d1
	cmpl d0,d1
	jge L5
	movel a0@(16),a0@(12)
L5:
	movel a0@(12),a0@(8)
	.def	.eb;.val	.;	.scl	100;	.line	14;	.endef
	.def	.eb;.val	.;	.scl	100;	.line	14;	.endef
	.ln	16
	movel a6@(8),a1@
	.ln	17
	movel a6@(12),a1@(4)
	.ln	18
	movew d5,a1@(24)
	.ln	19
	movel a6@(20),a1@(8)
	.ln	20
	movel a6@(24),a1@(12)
	.ln	21
	movel a6@(28),a1@(16)
	.ln	22
	moveb a6@(35),a1@(26)
	.ln	23
	movel _seg_fix_rootP,a0
	movel a0@,a1@(20)
	.ln	26
	clrb a1@(28)
	.ln	27
	clrb a1@(27)
	.ln	28
	clrb a1@(34)
	.ln	29
	clrl a1@(30)
	.ln	35
	movel a1,a0@
	.def	.eb;.val	.;	.scl	100;	.line	35;	.endef
	.ln	36
	.def	.ef;	.val	.;	.scl	101;	.line	36;	.endef
	moveml a6@(-16),#0x438
	unlk a6
	rts
	.def	fix_new;	.val	.;	.scl	-1;	.endef
	.even
	.def	_init_fsize_chain;	.val	_init_fsize_chain;	.scl	2;	.type	044;	.endef
.globl _init_fsize_chain
_init_fsize_chain:
	.ln	1
	link a6,#0
	.def	.bf;	.val	.;	.scl	101;	.line	208;	.endef
	.ln	2
	clrl _fsize_rootP
	.ln	3
	clrl _fsize_lastP
	.ln	4
	.def	.ef;	.val	.;	.scl	101;	.line	4;	.endef
	unlk a6
	rts
	.def	init_fsize_chain;	.val	.;	.scl	-1;	.endef
	.even
	.def	_fsize_new;	.val	_fsize_new;	.scl	2;	.type	044;	.endef
.globl _fsize_new
_fsize_new:
	.ln	1
	link a6,#0
	moveml #0x1820,sp@-
	.def	.bf;	.val	.;	.scl	101;	.line	215;	.endef
	.def	_fsize;	.val	8;	.scl	9;	.type	04;	.endef
	.def	.bb;	.val	.;	.scl	100;	.line	1;	.endef
	.def	_fsizeP;	.val	9;	.scl	4;	.tag	_fsize_entry;	.size	8;	.type	030;	.endef
	.def	.bb;	.val	.;	.scl	100;	.line	1;	.endef
	.def	___h;	.val	4;	.scl	4;	.tag	_obstack;	.size	36;	.type	030;	.endef
	.ln	4
	movel #_notes,d4
	.def	.bb;	.val	.;	.scl	100;	.line	4;	.endef
	.def	___o;	.val	10;	.scl	4;	.tag	_obstack;	.size	36;	.type	030;	.endef
	.def	___len;	.val	3;	.scl	4;	.type	04;	.endef
	movel d4,a2
	moveq #8,d3
	movel d3,d0
	addl _notes+12,d0
	cmpl _notes+16,d0
	jls L9
	movel d3,sp@-
	movel d4,sp@-
	jbsr __obstack_newchunk
L9:
	addl d3,a2@(12)
	.def	.eb;.val	.;	.scl	100;	.line	4;	.endef
	.def	.bb;	.val	.;	.scl	100;	.line	4;	.endef
	.def	___o;	.val	8;	.scl	4;	.tag	_obstack;	.size	36;	.type	030;	.endef
	.def	_value;	.val	2;	.scl	4;	.type	024;	.endef
	movel d4,a0
	movel a0@(8),d2
	movel a0@(12),d0
	addl a0@(24),d0
	movel a0@(24),d1
	notl d1
	andl d1,d0
	movel d0,a0@(12)
	subl a0@(4),d0
	movel a0@(16),d1
	subl a0@(4),d1
	cmpl d0,d1
	jge L11
	movel a0@(16),a0@(12)
L11:
	movel a0@(12),a0@(8)
	.def	.eb;.val	.;	.scl	100;	.line	4;	.endef
	.def	.eb;.val	.;	.scl	100;	.line	4;	.endef
	movel d2,a1
	.ln	7
	movel a6@(8),a1@
	.ln	10
	tstl _fsize_lastP
	jeq L12
	.ln	12
	movel _fsize_lastP,a0
	movel a1,a0@(4)
	jra L13
L12:
	.ln	16
	movel a1,_fsize_rootP
L13:
	.ln	18
	movel a1,_fsize_lastP
	.def	.eb;.val	.;	.scl	100;	.line	18;	.endef
	.ln	21
	.def	.ef;	.val	.;	.scl	101;	.line	21;	.endef
	moveml a6@(-12),#0x418
	unlk a6
	rts
	.def	fsize_new;	.val	.;	.scl	-1;	.endef
.data
LC0:
	.ascii ".ln\0"
LC1:
	.ascii "write.c\0"
LC2:
	.ascii "Case fragP -> fr_type %d unexpected at line %d of file \"%s\"\12\0"
LC3:
	.ascii "\0"
LC4:
	.ascii ".text\0"
LC5:
	.ascii ".data\0"
LC6:
	.ascii ".bss\0"
LC7:
	.ascii ".comment\0"
LC8:
	.ascii ".ln\0"
LC9:
	.ascii "skipping a lnno entry when doing the string table\0"
.text
	.even
	.def	_write_object_file;	.val	_write_object_file;	.scl	2;	.type	044;	.endef
.globl _write_object_file
_write_object_file:
	.ln	1
	link a6,#-16
	moveml #0x1f3c,sp@-
	.def	.bf;	.val	.;	.scl	101;	.line	239;	.endef
	.def	.bb;	.val	.;	.scl	100;	.line	1;	.endef
	.def	_frchainP;	.val	10;	.scl	4;	.tag	_frchain;	.size	18;	.type	030;	.endef
	.def	_fragP;	.val	12;	.scl	4;	.tag	_frag;	.size	40;	.type	030;	.endef
	.def	_next_frchainP;	.val	0;	.scl	4;	.tag	_frchain;	.size	18;	.type	030;	.endef
	.def	_prev_fragPP;	.val	8;	.scl	4;	.tag	_frag;	.size	40;	.type	0130;	.endef
	.def	_name;	.val	10;	.scl	4;	.type	022;	.endef
	.def	_symbolP;	.val	11;	.scl	4;	.tag	_symbol;	.size	54;	.type	030;	.endef
	.def	_symbolPP;	.val	12;	.scl	4;	.tag	_symbol;	.size	54;	.type	0130;	.endef
	.def	_number_of_trs;	.val	-4;	.scl	1;	.type	016;	.endef
	.def	_number_of_drs;	.val	-8;	.scl	1;	.type	016;	.endef
	.def	_linenoP;	.val	10;	.scl	4;	.tag	_lineno_entry;	.size	18;	.type	030;	.endef
	.def	_fsize;	.val	6;	.scl	4;	.type	04;	.endef
	.def	_fsizeP;	.val	-12;	.scl	1;	.tag	_fsize_entry;	.size	8;	.type	030;	.endef
	.def	_commentP;	.val	10;	.scl	4;	.tag	_comment_entry;	.size	8;	.type	030;	.endef
	.ln	18
	clrl d6
	.ln	33
	jbsr _init_fsize_chain
	.ln	34
	jbsr _fixup_coff_symbol_table
	.ln	51
	movel _frchain_root,a2
	tstl a2
	jeq L265
	clrl d3
L18:
	.ln	63
	moveb a2@(16),d3
	movel d3,sp@-
	movel a2@(12),sp@-
	jbsr _subseg_new
	.ln	64
	clrl sp@-
	pea 2:w
	jbsr _frag_align
	.ln	71
	movel _frag_now,sp@-
	jbsr _frag_wane
	.ln	72
	movel _frag_now,a0
	clrl a0@(8)
	.ln	51
	addw #20,sp
	movel a2@(8),a2
	tstl a2
	jne L18
L265:
	.ln	83
	lea _text_frag_root,a0
	.ln	84
	movel _frchain_root,a2
	tstl a2
	jeq L264
L26:
	.ln	87
	movel a2@,a0@
	.ln	88
	movel a2@(4),a0
	addqw #4,a0
	.ln	90
	movel a2@(8),d0
	jeq L23
	cmpl _data0_frchainP,d0
	jne L21
L23:
	.ln	92
	lea _data_frag_root,a0
	.ln	93
	tstl d0
	jeq L24
	.ln	95
	movel a2@(4),_text_last_frag
	jra L21
L24:
	.ln	99
	movel a2@(4),_data_last_frag
	.ln	84
L21:
	movel d0,a2
	tstl a2
	jne L26
L264:
	.ln	109
	tstb _flagseen+82
	jeq L27
	.def	.bb;	.val	.;	.scl	100;	.line	109;	.endef
	.def	_tmp;	.val	8;	.scl	4;	.tag	_fix;	.size	36;	.type	030;	.endef
	.ln	113
	movel _text_last_frag,a0
	movel _data_frag_root,a0@(4)
	.ln	114
	movel _data_last_frag,_text_last_frag
	.ln	115
	clrl _data_last_frag
	.ln	116
	clrl _data_frag_root
	.ln	117
	tstl _text_fix_root
	jeq L28
	.ln	118
	movel _text_fix_root,a0
	tstl a0@(20)
	jeq L263
L31:
	movel a0@(20),a0
	tstl a0@(20)
	jne L31
L263:
	.ln	120
	movel _data_fix_root,a0@(20)
	jra L33
L28:
	.ln	122
	movel _data_fix_root,_text_fix_root
L33:
	.ln	123
	clrl _data_fix_root
	.def	.eb;.val	.;	.scl	100;	.line	123;	.endef
L27:
	.ln	126
	pea 1:w
	movel _text_frag_root,sp@-
	lea _relax_segment,a2
	jbsr a2@
	.ln	127
	pea 2:w
	movel _data_frag_root,sp@-
	jbsr a2@
	.ln	133
	movel _text_last_frag,a0
	movel a0@,_text_siz
	.ln	138
	addw #16,sp
	tstl _do_1500_coff
	jeq L34
	.ln	140
	pea 4:w
	movel _text_siz,sp@-
	pea _the_coff_exec+36
	jbsr _md_number_to_chars
	addw #12,sp
L34:
	.ln	142
	pea 4:w
	movel _text_siz,sp@-
	pea _the_exec+4
	lea _md_number_to_chars,a2
	jbsr a2@
	.ln	153
	addw #12,sp
	tstl _data_frag_root
	jeq L35
	.def	.bb;	.val	.;	.scl	100;	.line	153;	.endef
	.def	_slide;	.val	0;	.scl	4;	.type	016;	.endef
	.ln	158
	movel _data_last_frag,a0
	movel a0@,_data_siz
	.ln	163
	tstl _do_1500_coff
	jeq L36
	.ln	165
	pea 4:w
	movel _data_siz,sp@-
	pea _the_coff_exec+76
	jbsr a2@
	addw #12,sp
L36:
	.ln	167
	pea 4:w
	movel _data_siz,sp@-
	pea _the_exec+8
	jbsr _md_number_to_chars
	.ln	169
	movel _text_siz,d0
	.ln	170
	movel _data_frag_root,a4
	addw #12,sp
	tstl a4
	jeq L262
L40:
	.ln	174
	addl d0,a4@
	.ln	172
	movel a4@(4),a4
	.ln	171
	tstl a4
	jne L40
L262:
	.ln	177
	movel _text_last_frag,a0
	movel _data_frag_root,a0@(4)
	.def	.eb;.val	.;	.scl	100;	.line	177;	.endef
	jra L41
L35:
	.ln	181
	tstl _do_1500_coff
	jeq L42
	.ln	183
	pea 4:w
	clrl sp@-
	pea _the_coff_exec+76
	jbsr _md_number_to_chars
	addw #12,sp
L42:
	.ln	185
	pea 4:w
	clrl sp@-
	pea _the_exec+8
	jbsr _md_number_to_chars
	.ln	186
	clrl _data_siz
	addw #12,sp
L41:
	.ln	189
	movel _text_siz,d2
	addl _data_siz,d2
	movel d2,_bss_address_frag
	.ln	193
	tstl _do_1500_coff
	jeq L43
	.ln	195
	pea 4:w
	movel _local_bss_counter,sp@-
	pea _the_coff_exec+116
	jbsr _md_number_to_chars
	addw #12,sp
L43:
	.ln	197
	pea 4:w
	movel _local_bss_counter,sp@-
	pea _the_exec+12
	jbsr _md_number_to_chars
	.ln	224
	moveq #4,d2
	movel d2,_string_byte_count
	.ln	227
	movel _symbol_rootP,a3
	addw #12,sp
	tstl a3
	jeq L261
L48:
	.ln	228
	tstl a3@(46)
	jeq L46
	.ln	229
	movel a3@(46),a0
	movel a0@(42),a1
	movel a0@(26),d0
	addl a1@,d0
	addl d0,a3@(26)
	.ln	230
	clrl a3@(46)
	.ln	227
L46:
	movel a3@(38),a3
	tstl a3
	jne L48
L261:
	.ln	234
	lea _symbol_rootP,a4
	.def	.bb;	.val	.;	.scl	100;	.line	234;	.endef
	.def	_symbol_number;	.val	3;	.scl	4;	.type	04;	.endef
	.ln	239
	clrl d3
	.ln	241
	jra L49
L70:
	.ln	243
	movel a3@(18),a2
	.ln	244
	tstb _flagseen+82
	jeq L51
	moveb a3@(22),d0
	andb #6,d0
	jeq L51
	.ln	245
	andb #-7,a3@(22)
	.ln	246
	orb #4,a3@(22)
L51:
	.ln	252
	tstl _do_1500_coff
	jeq L52
	.ln	257
	cmpb #9,a3@(16)
	jeq L56
	cmpb #2,a3@(16)
	jne L54
	cmpw #8,a3@(12)
	jeq L55
	tstw a3@(12)
	jne L54
L55:
	movew a3@(14),d0
	andw #48,d0
	cmpw #32,d0
	jne L56
L54:
	.ln	258
L52:
	.ln	261
	movel a3@(42),a0
	movel a0@,d2
	addl d2,a3@(26)
L56:
	.ln	272
	tstl a2
	jeq L58
	moveb a3@(22),d0
	andl #224,d0
	jne L58
	cmpb #1,a2@
	jeq L57
	tstb _flagseen+76
	jne L59
	cmpb #76,a2@
	jeq L57
L59:
	pea LC0
	movel a2,sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jeq L57
L58:
	.ln	275
	movel d3,a3@(34)
	addql #1,d3
	.ln	276
	tstb a3@(17)
	jeq L60
	.ln	277
	addql #1,d3
L60:
	.ln	279
	tstl a2
	jeq L61
	.ln	281
	movel _string_byte_count,a3@(30)
	.ln	282
	tstl _do_1500_coff
	jeq L62
	.ln	283
	movel a3@(18),sp@-
	lea _strlen,a4
	jbsr a4@
	addqw #4,sp
	moveq #8,d2
	cmpl d0,d2
	jge L68
	.ln	287
	cmpb #95,a2@
	jne L64
	movel a2,sp@-
	jbsr _L_symbol_p
	addqw #4,sp
	tstl d0
	jeq L64
	.ln	290
	movel a3@(18),sp@-
	jbsr a4@
	subql #1,d0
	addqw #4,sp
	moveq #8,d2
	cmpl d0,d2
	jge L68
	.ln	291
	movel a3@(18),sp@-
	jbsr a4@
	addl d0,_string_byte_count
	addqw #4,sp
	jra L68
L64:
	.ln	295
L62:
	.ln	299
	movel a3@(18),sp@-
	jbsr _strlen
	movel _string_byte_count,d1
	addql #1,d1
	addl d0,d1
	movel d1,_string_byte_count
	addqw #4,sp
	jra L68
L61:
	.ln	303
	clrl a3@(30)
L68:
	.ln	304
	lea a3@(38),a4
	jra L49
L57:
	.ln	308
	movel a3@(38),a4@
L49:
	movel a4@,a3
	tstl a3
	jne L70
	.ln	313
	tstl _do_1500_coff
	jeq L71
	.ln	314
	movel d3,a5
	lea a5@(d3:l:8),a5
	movel a5,d0
	asll #1,d0
	movel d0,_syms_siz
	.ln	317
	pea 4:w
	movel d3,sp@-
	pea _the_coff_exec+12
	jra L266
L71:
	.ln	320
	movel d3,a5
	lea a5@(d3:l:2),a5
	movel a5,d0
	asll #2,d0
	movel d0,_syms_siz
	.ln	322
	pea 4:w
	movel d0,sp@-
	pea _the_exec+16
L266:
	jbsr _md_number_to_chars
	addw #12,sp
	.def	.eb;.val	.;	.scl	100;	.line	322;	.endef
	.ln	333
	clrl sp@-
	pea 1:w
	jbsr _subseg_change
	.ln	335
	movel _text_frag_root,a4
	addqw #8,sp
	tstl a4
	jeq L259
L90:
	.ln	337
	movel a4@(28),d0
	moveq #4,d2
	cmpl d2,d0
	jhi L88
LI89:
	movew pc@(L89-LI89-2:b,d0:l:2),d2
	jmp pc@(2,d2:w)
L89:
	.word L75-L89
	.word L78-L89
	.word L78-L89
	.word L80-L89
	.word L81-L89
L78:
	.ln	341
	clrl a4@(28)
	.ln	347
	movel a4@(4),a0
	movel a0@,d0
	subl a4@,d0
	subl a4@(8),d0
	movel d0,a4@(20)
	.ln	348
	jra L75
	.ln	351
L80:
	.ln	354
	movel a4,sp@-
	jbsr _md_convert_frag
	.ln	360
	movel a4,sp@-
	jbsr _frag_wane
	.ln	361
	addqw #8,sp
	jra L75
L81:
	.def	.bb;	.val	.;	.scl	100;	.line	361;	.endef
	.def	_lie;	.val	8;	.scl	4;	.tag	_broken_word;	.size	36;	.type	030;	.endef
	.ln	370
	tstl a4@(32)
	jeq L82
	.ln	371
	movel _md_short_jump_size,d2
	addl d2,a4@(8)
	.ln	372
	movel a4@(16),a0
	tstl a0
	jeq L82
L87:
	cmpl a0@(12),a4
	jne L82
	.ln	374
	moveq #1,d2
	cmpl a0@(28),d2
	jne L85
	.ln	375
	movel _md_long_jump_size,d2
	addl d2,a4@(8)
	.ln	373
L85:
	movel a0@,a0
	tstl a0
	jne L87
L82:
	.ln	377
	movel a4,sp@-
	jbsr _frag_wane
	.def	.eb;.val	.;	.scl	100;	.line	377;	.endef
	.ln	379
	addqw #4,sp
	jra L75
L88:
	.def	.bb;	.val	.;	.scl	100;	.line	379;	.endef
	.ln	383
	pea LC1
	pea 621:w
	movel a4@(28),sp@-
	pea LC2
	jbsr _as_fatal
	.def	.eb;.val	.;	.scl	100;	.line	383;	.endef
	.ln	384
	addw #16,sp
	.ln	335
L75:
	movel a4@(4),a4
	tstl a4
	jne L90
L259:
	.def	.bb;	.val	.;	.scl	100;	.line	335;	.endef
	.def	_lie;	.val	11;	.scl	4;	.tag	_broken_word;	.size	36;	.type	030;	.endef
	.def	_prevP;	.val	10;	.scl	4;	.tag	_broken_word;	.size	36;	.type	0130;	.endef
	.ln	393
	lea _broken_words,a2
	.ln	394
	movel _broken_words,a3
	tstl a3
	jeq L257
L96:
	.ln	395
	tstl a3@(28)
	jne L94
	.ln	401
	clrl sp@-
	movel a3@(24),sp@-
	movel a3@(20),sp@-
	movel a3@(16),sp@-
	pea 2:w
	moveq #-38,d0
	addl a3@(8),d0
	subl a3@(4),d0
	movel d0,sp@-
	movel a3@(4),sp@-
	jbsr _fix_new
	.ln	408
	movel a3@,a2@
	addw #28,sp
	jra L93
L94:
	.ln	411
	movel a3,a2
	.ln	394
L93:
	movel a3@,a3
	tstl a3
	jne L96
L257:
	.ln	413
	movel _broken_words,a3
L267:
	tstl a3
	jeq L256
	.def	.bb;	.val	.;	.scl	100;	.line	413;	.endef
	.def	_untruth;	.val	10;	.scl	4;	.tag	_broken_word;	.size	36;	.type	030;	.endef
	.def	_table_ptr;	.val	5;	.scl	4;	.type	022;	.endef
	.def	_table_addr;	.val	4;	.scl	4;	.type	04;	.endef
	.def	_to_addr;	.val	3;	.scl	4;	.type	04;	.endef
	.def	_n;	.val	1;	.scl	4;	.type	04;	.endef
	.ln	429
	movel a3@(12),a4
	.ln	432
	clrl d1
	.ln	433
	movel a3,a2
	tstl a2
	jeq L101
L104:
	cmpl a2@(12),a4
	jne L101
	.ln	434
	moveq #1,d2
	cmpl a2@(28),d2
	jne L102
	.ln	435
	addql #1,d1
	.ln	433
L102:
	movel a2@,a2
	tstl a2
	jne L104
L101:
	.ln	437
	movel a3@(12),a0
	movel a0@(24),d5
	.ln	438
	moveq #-38,d0
	addl d5,d0
	subl a3@(12),d0
	movel d0,d4
	addl a0@,d4
	.ln	441
	.ln	442
	movel d4,a1
	addl _md_short_jump_size,a1
	movel d1,d0
	mulsl _md_long_jump_size,d0
	.ln	443
	movel a3@(16),sp@-
	movel a0,sp@-
	pea a1@(d0:l)
	movel d4,sp@-
	movel d5,sp@-
	jbsr _md_create_short_jump
	.ln	444
	addl _md_short_jump_size,d5
	.ln	445
	addl _md_short_jump_size,d4
	.ln	447
	addw #20,sp
	tstl a3
	jeq L267
L114:
	cmpl a3@(12),a4
	jne L267
	.ln	448
	moveq #2,d2
	cmpl a3@(28),d2
	jeq L107
	.ln	449
	.ln	453
	movel a3@(20),a0
	movel d4,d3
	subl a0@(26),d3
	.ln	454
	pea 2:w
	movel d3,sp@-
	movel a3@(8),sp@-
	jbsr _md_number_to_chars
	.ln	455
	movel a3@,a2
	addw #12,sp
	tstl a2
	jeq L110
L113:
	cmpl a2@(12),a4
	jne L110
	.ln	456
	cmpl a2@(32),a3
	jne L111
	.ln	457
	pea 2:w
	movel d3,sp@-
	movel a2@(8),sp@-
	jbsr _md_number_to_chars
	addw #12,sp
	.ln	455
L111:
	movel a2@,a2
	tstl a2
	jne L113
L110:
	.ln	462
	.ln	463
	movel a3@(16),a0
	movel a0@(26),d3
	addl a3@(24),d3
	.ln	464
	movel a0,sp@-
	movel a3@(12),sp@-
	movel d3,sp@-
	movel d4,sp@-
	movel d5,sp@-
	jbsr _md_create_long_jump
	.ln	465
	addl _md_long_jump_size,d5
	.ln	466
	addl _md_long_jump_size,d4
	.ln	447
	addw #20,sp
L107:
	movel a3@,a3
	tstl a3
	jne L114
	.def	.eb;.val	.;	.scl	100;	.line	447;	.endef
	.ln	413
	jra L267
L256:
	.def	.eb;.val	.;	.scl	100;	.line	413;	.endef
	.ln	481
	tstl _do_1500_coff
	jeq L116
	.ln	482
	pea 4:w
	movel _text_fix_root,sp@-
	jbsr _fixup_segment
	movel d0,a6@(-4)
	.ln	483
	movel d0,d2
	movel d0,a5
	lea a5@(d2:l:4),a5
	movel a5,d0
	asll #1,d0
	movel d0,_tr_siz
	addqw #8,sp
	jra L117
L116:
	.ln	487
	pea 4:w
	movel _text_fix_root,sp@-
	jbsr _fixup_segment
	asll #3,d0
	movel d0,_tr_siz
	.ln	489
	pea 4:w
	movel d0,sp@-
	pea _the_exec+24
	jbsr _md_number_to_chars
	addw #20,sp
L117:
	.ln	492
	tstl _do_1500_coff
	jeq L118
	.ln	493
	pea 6:w
	movel _data_fix_root,sp@-
	jbsr _fixup_segment
	movel d0,a6@(-8)
	.ln	494
	movel d0,d2
	movel d0,a5
	lea a5@(d2:l:4),a5
	movel a5,d0
	asll #1,d0
	movel d0,_dr_siz
	addqw #8,sp
	jra L119
L118:
	.ln	498
	pea 6:w
	movel _data_fix_root,sp@-
	jbsr _fixup_segment
	asll #3,d0
	movel d0,_dr_siz
	.ln	500
	pea 4:w
	movel d0,sp@-
	pea _the_exec+28
	jbsr _md_number_to_chars
	addw #20,sp
L119:
	.ln	507
	tstl _do_1500_coff
	jne L120
	.ln	509
	pea 4:w
	movel _omagic,sp@-
	pea _the_exec
	lea _md_number_to_chars,a2
	jbsr a2@
	.ln	510
	pea 4:w
	clrl sp@-
	pea _the_exec+20
	jbsr a2@
	addw #24,sp
L120:
	.ln	519
	movel _text_siz,d0
	addl _data_siz,d0
	addl _syms_siz,d0
	addl _tr_siz,d0
	addl _dr_siz,d0
	movel d0,_size_of_the_object_file
	.ln	520
	tstl _do_1500_coff
	jeq L121
	.ln	523
	addl #152,_size_of_the_object_file
	.ln	524
	moveq #4,d2
	cmpl _string_byte_count,d2
	jcc L123
	.ln	525
	movel _string_byte_count,d2
	addl d2,_size_of_the_object_file
	jra L123
L121:
	.ln	530
	moveq #32,d0
	addl _size_of_the_object_file,d0
	addl _string_byte_count,d0
	movel d0,_size_of_the_object_file
L123:
	.ln	534
	tstl _do_1500_coff
	jeq L124
	.ln	535
	movel _lineno_index,d0
	asll #1,d0
	addl _lineno_index,d0
	asll #1,d0
	movel d0,_lnno_siz
	.ln	536
	addl d0,_size_of_the_object_file
L124:
	.ln	541
	tstl _comment_rootP
	jeq L125
	.ln	542
	clrl _comment_siz
	.ln	544
	movel _comment_rootP,a2
	tstl a2
	jeq L252
L129:
	.ln	545
	movel a2@,sp@-
	jbsr _strlen
	movel _comment_siz,d1
	addql #1,d1
	addl d0,d1
	movel d1,_comment_siz
	.ln	544
	addqw #4,sp
	movel a2@(4),a2
	tstl a2
	jne L129
L252:
	.ln	551
	movel _comment_siz,d0
	addql #4,d0
	moveq #3,d1
	andl _comment_siz,d1
	subl d1,d0
	movel d0,_comment_siz
	.ln	554
	moveq #40,d0
	addl _size_of_the_object_file,d0
	addl _comment_siz,d0
	movel d0,_size_of_the_object_file
	.ln	556
	addqw #1,_the_coff_exec+2
L125:
	.ln	561
	movel _size_of_the_object_file,sp@-
	jbsr _xmalloc
	movel d0,_the_object_file
	movel d0,_next_object_file_charP
	.ln	563
	movel _out_file_name,sp@-
	jbsr _output_file_create
	.ln	572
	addqw #8,sp
	tstl _do_1500_coff
	jeq L130
	.ln	574
	lea _the_coff_exec+36,a0
	movel _text_siz,a0@
	.ln	576
	lea a0@(8),a1
	movel _data_siz,d0
	addl #140,d0
	addl _text_siz,d0
	movel d0,a1@
	.ln	577
	tstl _comment_rootP
	jeq L131
	.ln	579
	moveq #40,d0
	addl a1@,d0
	addl _comment_siz,d0
	movel d0,a1@
	.ln	580
	moveq #40,d2
	addl d2,a0@(4)
L131:
	.ln	583
	lea _the_coff_exec+8,a0
	lea a0@(36),a1
	movel a1@,d0
	addl _dr_siz,d0
	addl _tr_siz,d0
	addl _lnno_siz,d0
	movel d0,a0@
	.ln	585
	movel a1@,d0
	addl _dr_siz,d0
	addl _tr_siz,d0
	movel d0,a0@(40)
	.ln	586
	movew a6@(-2),a0@(44)
	.ln	587
	movew _lineno_index+2,a0@(46)
	.ln	590
	movel a0@(32),d2
	addl _text_siz,d2
	movel d2,a0@(72)
	.ln	591
	movel _data_siz,a0@(68)
	.ln	593
	movel _text_siz,d0
	movel d0,a0@(64)
	movel d0,a0@(60)
	.ln	594
	movew a6@(-6),a0@(84)
	.ln	595
	tstl a6@(-8)
	jeq L132
	.ln	597
	movel a1@,d2
	addl _tr_siz,d2
	movel d2,a0@(76)
	jra L133
L132:
	.ln	599
	clrl _the_coff_exec+84
L133:
	.ln	602
	lea _the_coff_exec+108,a2
	movel _text_siz,d0
	addl _data_siz,d0
	movel d0,a2@(4)
	movel d0,a2@
	.ln	605
	pea 140:w
	pea _the_coff_exec
	pea _next_object_file_charP
	lea _append,a3
	jbsr a3@
	.ln	606
	addw #12,sp
	tstl _comment_rootP
	jeq L135
	.ln	608
	lea _comment_scnhdr+16,a0
	movel _comment_siz,a0@+
	.ln	610
	movel a2@(-28),d2
	addl _data_siz,d2
	movel d2,a0@
	.ln	612
	pea 40:w
	pea _comment_scnhdr
	pea _next_object_file_charP
	jbsr a3@
	jra L268
L130:
	.ln	617
	pea 32:w
	pea _the_exec
	pea _next_object_file_charP
	jbsr _append
L268:
	addw #12,sp
L135:
	.ln	625
	movel _text_frag_root,a4
	tstl a4
	jeq L251
	moveq #1,d7
L162:
	.def	.bb;	.val	.;	.scl	100;	.line	625;	.endef
	.def	_count;	.val	3;	.scl	4;	.type	04;	.endef
	.def	_fill_literal;	.val	5;	.scl	4;	.type	022;	.endef
	.def	_fill_size;	.val	4;	.scl	4;	.type	04;	.endef
	.def	_bc;	.val	1;	.scl	4;	.type	04;	.endef
	.def	_fcnp;	.val	7;	.scl	4;	.type	04;	.endef
	.ln	638
	tstl _do_1500_coff
	jeq L139
	.ln	640
	tstl a4@(8)
	jeq L140
	.ln	641
	addl a4@(8),d6
L140:
	.ln	646
	tstl a4@(8)
	jne L141
	tstl d6
	jne L154
	.ln	647
	.ln	648
L141:
	.ln	652
	tstl a4@(16)
	jne L139
	tstl a4@(24)
	jne L139
	tstl d6
	jeq L139
	.ln	654
	cmpl a4@(8),d6
	jne L144
	.ln	657
	clrl d1
	jra L269
L149:
	.ln	659
	cmpb #78,a4@(38,d1:l)
	jne L147
	cmpb #117,a4@(39,d1:l)
	jne L147
	.ln	660
	movel a4@(8),d0
	subql #2,d0
	subl d1,d0
	subl d0,d6
	.ln	661
	.ln	662
	jra L146
	.ln	657
L147:
	addql #1,d1
L269:
	movel a4@(8),d0
	subql #1,d0
	cmpl d1,d0
	jgt L149
L146:
	.ln	665
	tstl d7
	jne L154
	.ln	666
	.ln	667
	.ln	669
	clrl d6
	jra L139
L144:
	.ln	675
	clrl d1
	jra L270
L157:
	.ln	677
	cmpb #78,a4@(38,d1:l)
	jne L155
	cmpb #117,a4@(39,d1:l)
	jne L155
	.ln	678
	movel a4@(8),d0
	subql #2,d0
	subl d1,d0
	subl d0,d6
	.ln	679
	jra L154
	.ln	675
L155:
	addql #1,d1
L270:
	movel a4@(8),d0
	subql #1,d0
	cmpl d1,d0
	jgt L157
L154:
	.ln	683
	movel d6,sp@-
	jbsr _fsize_new
	.ln	684
	clrl d6
	addqw #4,sp
L139:
	.ln	689
	movel a4@(8),sp@-
	pea a4@(38)
	pea _next_object_file_charP
	jbsr _append
	.ln	690
	moveq #38,d0
	addl a4@(8),d0
	movel a4,d5
	addl d0,d5
	.ln	691
	movel a4@(12),d4
	.ln	693
	movel a4@(20),d3
	addw #12,sp
	jeq L248
L161:
	.ln	694
	movel d4,sp@-
	movel d5,sp@-
	pea _next_object_file_charP
	jbsr _append
	.ln	693
	addw #12,sp
	subql #1,d3
	jne L161
L248:
	.def	.eb;.val	.;	.scl	100;	.line	693;	.endef
	.ln	625
	movel a4@(4),a4
	tstl a4
	jne L162
L251:
	.ln	700
	tstl _comment_rootP
	jeq L163
	.def	.bb;	.val	.;	.scl	100;	.line	700;	.endef
	.def	_bytes_out;	.val	3;	.scl	4;	.type	04;	.endef
	.ln	701
	clrl d3
	.ln	704
	movel _comment_rootP,a2
	tstl a2
	jeq L247
L167:
	.ln	705
	movel a2@,sp@-
	jbsr _strlen
	addql #1,d0
	.ln	706
	addl d0,d3
	.ln	708
	movel d0,sp@-
	movel a2@,sp@-
	pea _next_object_file_charP
	jbsr _append
	.ln	704
	addw #16,sp
	movel a2@(4),a2
	tstl a2
	jne L167
L247:
	.ln	710
	cmpl _comment_siz,d3
	jcc L163
	.def	.bb;	.val	.;	.scl	100;	.line	710;	.endef
	.def	_tempi;	.val	3;	.scl	4;	.type	04;	.endef
	.ln	712
	cmpl _comment_siz,d3
	jcc L163
L172:
	.ln	713
	pea 1:w
	pea LC3
	pea _next_object_file_charP
	jbsr _append
	.ln	712
	addw #12,sp
	addql #1,d3
	cmpl _comment_siz,d3
	jcs L172
	.def	.eb;.val	.;	.scl	100;	.line	712;	.endef
	.def	.eb;.val	.;	.scl	100;	.line	712;	.endef
L163:
	.ln	719
	tstl _do_1500_coff
	jeq L173
	.ln	720
	pea 1:w
	clrl sp@-
	movel _text_fix_root,sp@-
	lea _emit_relocations,a2
	jbsr a2@
	.ln	722
	pea 2:w
	movel _text_last_frag,a0
	movel a0@,sp@-
	movel _data_fix_root,sp@-
	jbsr a2@
	addw #24,sp
	jra L174
L173:
	.ln	725
	clrl sp@-
	movel _text_fix_root,sp@-
	lea _emit_relocations,a2
	jbsr a2@
	.ln	726
	movel _text_last_frag,a0
	movel a0@,sp@-
	movel _data_fix_root,sp@-
	jbsr a2@
	addw #16,sp
L174:
	.ln	734
	tstl _do_1500_coff
	jeq L175
	.ln	735
	movel _lineno_rootP,a2
	tstl a2
	jeq L175
L180:
	.ln	737
	tstw a2@(4)
	jeq L179
	.ln	739
	movel a2@(10),a0
	movel a0@(26),a2@
	.ln	742
	pea 4:w
	movel a2@,sp@-
	movel a2,sp@-
	jbsr _md_number_to_chars
	addw #12,sp
L179:
	.ln	747
	pea 6:w
	movel a2,sp@-
	pea _next_object_file_charP
	jbsr _append
	.ln	735
	addw #12,sp
	movel a2@(14),a2
	tstl a2
	jne L180
L175:
	.ln	757
	tstl _do_1500_coff
	jeq L181
	.ln	758
	movel _fsize_rootP,a6@(-12)
L181:
	.ln	760
	movel _symbol_rootP,a3
	tstl a3
	jeq L244
L228:
	.def	.bb;	.val	.;	.scl	100;	.line	760;	.endef
	.def	_temp;	.val	12;	.scl	4;	.type	022;	.endef
	.def	_coff_string;	.val	-16;	.scl	1;	.type	04;	.endef
	.def	_name_length;	.val	3;	.scl	4;	.type	04;	.endef
	.def	_temp2;	.val	10;	.scl	4;	.type	022;	.endef
	.ln	769
	movel a3@(18),a4
	.ln	775
	tstl _do_1500_coff
	jeq L185
	cmpb #95,a4@
	jne L185
	movel a4,sp@-
	jbsr _L_symbol_p
	addqw #4,sp
	tstl d0
	jeq L185
	.ln	776
	tstl a3@
	jne L186
	.ln	783
	movel a3@(4),sp@-
	lea _strlen,a2
	jbsr a2@
	movel d0,d3
	.ln	784
	movel a3@(4),sp@-
	jbsr a2@
	subql #1,d0
	addqw #8,sp
	moveq #8,d2
	cmpl d0,d2
	jge L187
	.def	.bb;	.val	.;	.scl	100;	.line	784;	.endef
	.ln	785
	movel a3@(4),a2
	.ln	786
	movel a4,sp@-
	movel a2,sp@-
	jbsr _strcpy
	.ln	787
	.ln	789
	movel d3,sp@-
	pea a2@(1)
	movel a3@(4),sp@-
	jbsr _memcpy
	.def	.eb;.val	.;	.scl	100;	.line	789;	.endef
	addw #20,sp
	jra L185
L187:
	.def	.bb;	.val	.;	.scl	100;	.line	789;	.endef
	.ln	792
	.ln	793
	.ln	794
	.ln	796
	.def	.eb;.val	.;	.scl	100;	.line	796;	.endef
L186:
	.def	.bb;	.val	.;	.scl	100;	.line	796;	.endef
	.ln	800
	movel a4,sp@-
	jbsr _strlen
	movel d0,d3
	.ln	801
	addqw #1,a4
	.ln	802
	pea 8:w
	clrl sp@-
	movel a3,sp@-
	jbsr _memset
	.ln	804
	movel d3,sp@-
	movel a4,sp@-
	movel a3,sp@-
	jbsr _memcpy
	.def	.eb;.val	.;	.scl	100;	.line	804;	.endef
	addw #28,sp
L185:
	.ln	814
	tstl _do_1500_coff
	jeq L190
	pea LC4
	movel a4,sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L190
	.ln	815
	clrl a3@(8)
	.ln	816
	clrl a3@(26)
	.ln	817
	movel a3@(50),a0
	movel _text_siz,a0@
	.ln	818
	movel a3@(50),a0
	movew a6@(-2),a0@(4)
	.ln	819
	movel a3@(50),a0
	movew _lineno_index+2,a0@(6)
L190:
	.ln	822
	tstl _do_1500_coff
	jeq L191
	pea LC5
	movel a4,sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L191
	.ln	824
	movel _the_coff_exec+68,d0
	movel d0,a3@(26)
	movel d0,a3@(8)
	.ln	825
	movel a3@(50),a0
	movel _data_siz,a0@
	.ln	826
	movel a3@(50),a0
	movew a6@(-6),a0@(4)
	.ln	827
	movel a3@(50),a0
	clrw a0@(6)
L191:
	.ln	830
	tstl _do_1500_coff
	jeq L192
	pea LC6
	movel a4,sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L192
	.ln	832
	movel _the_coff_exec+108,d0
	movel d0,a3@(26)
	movel d0,a3@(8)
	.ln	833
	movel a3@(50),a0
	clrl a0@
	.ln	834
	movel a3@(50),a0
	clrw a0@(4)
	.ln	835
	movel a3@(50),a0
	clrw a0@(6)
L192:
	.ln	838
	tstl _comment_rootP
	jeq L193
	pea LC7
	movel a4,sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L193
	.ln	839
	clrl a3@(26)
	clrl a3@(8)
	.ln	840
	movel a3@(50),a0
	clrl a0@
	.ln	841
	movel a3@(50),a0
	clrw a0@(4)
	.ln	842
	movel a3@(50),a0
	clrw a0@(6)
L193:
	.ln	846
	tstl _do_1500_coff
	jeq L194
	.ln	847
	tstl a3@
	jne L195
	.ln	848
	moveq #1,d2
	movel d2,a6@(-16)
	.ln	850
	pea 4:w
	movel a3@(30),sp@-
	pea a3@(4)
	jbsr _md_number_to_chars
	addw #12,sp
	jra L196
L195:
	.ln	852
	clrl a6@(-16)
L196:
	.ln	854
	tstl a3@(8)
	jlt L194
	.ln	857
	pea 4:w
	movel a3@(26),sp@-
	pea a3@(8)
	jbsr _md_number_to_chars
	addw #12,sp
L194:
	.ln	863
	pea 4:w
	movel a3@(30),sp@-
	pea a3@(18)
	lea _md_number_to_chars,a2
	jbsr a2@
	.ln	866
	pea 2:w
	movew a3@(24),a5
	movel a5,sp@-
	pea a3@(24)
	jbsr a2@
	.ln	869
	pea 4:w
	movel a3@(26),sp@-
	pea a3@(26)
	jbsr a2@
	.ln	874
	addw #36,sp
	tstb a3@(22)
	jne L198
	.ln	875
	orb #1,a3@(22)
L198:
	.ln	877
	tstl _do_1500_coff
	jeq L199
	.ln	878
	tstw a3@(12)
	jne L200
	.ln	879
	btst #3,a3@(22)
	jeq L201
	.ln	880
	cmpb #2,a3@(16)
	jeq L207
	.ln	881
	.ln	882
	movew #3,a3@(12)
	jra L200
L201:
	.ln	885
	moveb a3@(22),d0
	andb #6,d0
	cmpb #6,d0
	jne L205
	.ln	886
	movew #2,a3@(12)
	jra L200
L205:
	.ln	888
	btst #2,a3@(22)
	jeq L207
	.ln	889
	cmpw #-1,a3@(12)
	jeq L200
	.ln	890
	movew #1,a3@(12)
	jra L200
L207:
	.ln	892
	clrw a3@(12)
L200:
	.ln	896
	tstb a3@(16)
	jeq L211
	cmpb #2,a3@(16)
	jne L210
L211:
	.ln	900
	btst #0,a3@(22)
	jeq L212
	.ln	901
	moveb #2,a3@(16)
	jra L210
L212:
	.ln	902
	moveb #3,a3@(16)
L210:
	.ln	906
	pea 18:w
	movel a3,sp@-
	pea _next_object_file_charP
	jbsr _append
	.ln	907
	addw #12,sp
	tstb a3@(17)
	jeq L214
	.ln	910
	movel a4,sp@-
	jbsr _coff_tab_memq
	.ln	911
	addqw #4,sp
	moveq #5,d2
	cmpl d2,d0
	jhi L222
LI225:
	movew pc@(L225-LI225-2:b,d0:l:2),d2
	jmp pc@(2,d2:w)
L225:
	.word L216-L225
	.word L215-L225
	.word L218-L225
	.word L215-L225
	.word L215-L225
	.word L215-L225
L216:
	.ln	916
	pea 2:w
	movel a3@(50),a0
	clrl d0
	movew a0@(4),d0
	movel d0,sp@-
	movel a3@(50),d2
	addql #4,d2
	movel d2,sp@-
	lea _md_number_to_chars,a2
	jbsr a2@
	.ln	920
	pea 4:w
	movel a3@(50),a0
	movel a0@(12),sp@-
	moveq #12,d2
	addl a0,d2
	movel d2,sp@-
	jbsr a2@
	.ln	921
	addw #24,sp
	jra L215
	.ln	923
L218:
	.ln	928
	pea 2:w
	movel a3@(50),a0
	clrl d0
	movew a0@(4),d0
	movel d0,sp@-
	movel a3@(50),d2
	addql #4,d2
	.ln	929
	jra L271
	.ln	931
	.ln	933
	.ln	935
L222:
	.ln	938
	movew a3@(14),d0
	andw #48,d0
	cmpw #32,d0
	jne L215
	.ln	945
	movel a3@(50),a0
	movel a6@(-12),a5
	movel a5@,a0@(4)
	.ln	946
	movel a5@(4),a6@(-12)
	.ln	960
	movel a3@(50),a1
	tstl a1@(12)
	jne L224
	.ln	963
	movel _current_ef,a0
	movel a0@(38),a0
	movel a0@(34),a1@(12)
L224:
	.ln	966
	pea 4:w
	movel a3@(50),a0
	movel a0@(12),sp@-
	moveq #12,d2
	addl a0,d2
L271:
	movel d2,sp@-
	jbsr _md_number_to_chars
	addw #12,sp
	.ln	968
L215:
	.ln	972
	pea 18:w
	movel a3@(50),sp@-
	pea _next_object_file_charP
	jbsr _append
	addw #12,sp
L214:
	.ln	974
	tstl a6@(-16)
	jeq L227
	movel a4,a3@(4)
	jra L227
L199:
	.ln	978
	pea 12:w
	pea a3@(18)
	pea _next_object_file_charP
	jbsr _append
	addw #12,sp
L227:
	.ln	981
	movel a4,a3@(18)
	.def	.eb;.val	.;	.scl	100;	.line	981;	.endef
	.ln	761
	movel a3@(38),a3
	tstl a3
	jne L228
L244:
	.ln	991
	pea 4:w
	movel _string_byte_count,sp@-
	pea _string_byte_count
	jbsr _md_number_to_chars
	.ln	993
	addw #12,sp
	tstl _do_1500_coff
	jeq L229
	.ln	994
	moveq #4,d2
	cmpl _string_byte_count,d2
	jcc L231
	.ln	996
L229:
	.ln	1001
	pea 4:w
	pea _string_byte_count
	pea _next_object_file_charP
	jbsr _append
	addw #12,sp
L231:
	.ln	1003
	movel _symbol_rootP,a3
	tstl a3
	jeq L243
L241:
	.ln	1005
	pea LC8
	movel a3@(18),sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L235
	.ln	1007
	pea LC9
	jbsr _as_warn
	addqw #4,sp
	jra L234
L235:
	.ln	1010
	tstl _do_1500_coff
	jeq L237
	.ln	1011
	tstl a3@
	jne L234
	.ln	1014
	movel a3@(4),sp@-
	jbsr _strlen
	movel d0,a0
	pea a0@(1)
	movel a3@(4),sp@-
	jra L272
L237:
	.ln	1018
	tstl a3@(18)
	jeq L234
	.ln	1021
	movel a3@(18),sp@-
	jbsr _strlen
	movel d0,a0
	pea a0@(1)
	movel a3@(18),sp@-
L272:
	pea _next_object_file_charP
	jbsr _append
	addw #16,sp
	.ln	1004
L234:
	movel a3@(38),a3
	tstl a3
	jne L241
L243:
	.ln	1027
	movel _out_file_name,sp@-
	movel _size_of_the_object_file,sp@-
	movel _the_object_file,sp@-
	jbsr _output_file_append
	.ln	1029
	addw #12,sp
	tstb _flagseen+71
	jeq L242
	.ln	1031
	movel _out_file_name,sp@-
	jbsr _gdb_emit
	.ln	1032
	jbsr _gdb_end
	addqw #4,sp
L242:
	.ln	1035
	movel _out_file_name,sp@-
	jbsr _output_file_close
	.def	.eb;.val	.;	.scl	100;	.line	1035;	.endef
	.ln	1042
	.def	.ef;	.val	.;	.scl	101;	.line	1042;	.endef
	moveml a6@(-52),#0x3cf8
	unlk a6
	rts
	.def	write_object_file;	.val	.;	.scl	-1;	.endef
.data
LC10:
	.ascii "write.c\0"
LC11:
	.ascii "Case fragP -> fr_type %d unexpected at line %d of file \"%s\"\12\0"
LC12:
	.ascii ".word %s-%s+%ld didn't fit\0"
LC13:
	.ascii "write.c\0"
LC14:
	.ascii "Case fragP -> fr_type %d unexpected at line %d of file \"%s\"\12\0"
.text
	.even
	.def	_relax_segment;	.val	_relax_segment;	.scl	3;	.type	044;	.endef
_relax_segment:
	.ln	1
	link a6,#-4
	moveml #0x1f3c,sp@-
	.def	.bf;	.val	.;	.scl	101;	.line	1300;	.endef
	.def	_segment_frag_root;	.val	8;	.scl	9;	.tag	_frag;	.size	40;	.type	030;	.endef
	.def	_segment_type;	.val	12;	.scl	9;	.tag	_segT;	.size	4;	.type	012;	.endef
	.def	.bb;	.val	.;	.scl	100;	.line	1;	.endef
	.def	_fragP;	.val	12;	.scl	4;	.tag	_frag;	.size	40;	.type	030;	.endef
	.def	_address;	.val	5;	.scl	4;	.type	016;	.endef
	.ln	12
	clrl sp@-
	movel a6@(12),sp@-
	jbsr _subseg_change
	.ln	17
	clrl d5
	.ln	18
	movel a6@(8),a4
	addqw #8,sp
	tstl a4
	jeq L343
L285:
	.ln	20
	movel d5,a4@
	.ln	21
	addl a4@(8),d5
	.ln	22
	movel a4@(28),d0
	moveq #4,d2
	cmpl d2,d0
	jhi L283
LI284:
	movew pc@(L284-LI284-2:b,d0:l:2),d2
	jmp pc@(2,d2:w)
L284:
	.word L278-L284
	.word L279-L284
	.word L276-L284
	.word L281-L284
	.word L276-L284
L278:
	.ln	25
	movel a4@(20),d0
	mulsl a4@(12),d0
	addl d0,d5
	.ln	26
	jra L276
L279:
	.ln	29
	movel a4@(20),sp@-
	movel d5,sp@-
	jbsr _relax_align
	.ln	30
	jra L344
	.ln	36
L281:
	.ln	40
	lea _seg_N_TYPE,a0
	movel a6@(12),d2
	movel a0@(d2:l:4),sp@-
	movel a4,sp@-
	jbsr _md_estimate_size_before_relax
L344:
	addl d0,d5
	.ln	41
	addqw #8,sp
	jra L276
	.ln	46
L283:
	.def	.bb;	.val	.;	.scl	100;	.line	46;	.endef
	.ln	50
	pea LC10
	pea 1349:w
	movel a4@(28),sp@-
	pea LC11
	jbsr _as_fatal
	.def	.eb;.val	.;	.scl	100;	.line	50;	.endef
	.ln	51
	addw #16,sp
	.ln	18
L276:
	movel a4@(4),a4
	tstl a4
	jne L285
L343:
	.def	.bb;	.val	.;	.scl	100;	.line	18;	.endef
	.def	_stretch;	.val	13;	.scl	4;	.type	04;	.endef
	.def	_stretched;	.val	-4;	.scl	1;	.type	04;	.endef
	.ln	70
L286:
	.ln	72
	clrl a6@(-4)
	subl a5,a5
	.ln	73
	movel a6@(8),a4
	tstl a4
	jeq L342
L337:
	.def	.bb;	.val	.;	.scl	100;	.line	73;	.endef
	.def	_growth;	.val	3;	.scl	4;	.type	04;	.endef
	.def	_was_address;	.val	7;	.scl	4;	.type	04;	.endef
	.def	_offset;	.val	4;	.scl	4;	.type	04;	.endef
	.def	_symbolP;	.val	9;	.scl	4;	.tag	_symbol;	.size	54;	.type	030;	.endef
	.def	_target;	.val	3;	.scl	4;	.type	04;	.endef
	.def	_after;	.val	1;	.scl	4;	.type	04;	.endef
	.def	_aim;	.val	1;	.scl	4;	.type	04;	.endef
	.ln	84
	movel a4@,d7
	.ln	85
	movel a5,d0
	addl d7,d0
	movel d0,a4@
	movel d0,d5
	.ln	86
	movel a4@(16),a1
	.ln	91
	moveq #2,d2
	cmpl a6@(12),d2
	jne L292
	.ln	92
	tstl a1
	jeq L292
	.ln	93
	subl a1,a1
L292:
	.ln	102
	movel a4@(20),d4
	.ln	104
	movel a4@(28),d0
	moveq #4,d2
	cmpl d2,d0
	jhi L334
LI335:
	movew pc@(L335-LI335-2:b,d0:l:2),d2
	jmp pc@(2,d2:w)
L335:
	.word L295-L335
	.word L311-L335
	.word L312-L335
	.word L316-L335
	.word L296-L335
L295:
	.ln	107
	clrl d3
	.ln	108
	jra L294
L296:
	.def	.bb;	.val	.;	.scl	100;	.line	108;	.endef
	.def	_lie;	.val	11;	.scl	4;	.tag	_broken_word;	.size	36;	.type	030;	.endef
	.def	_untruth;	.val	8;	.scl	4;	.tag	_broken_word;	.size	36;	.type	030;	.endef
	.ln	126
	clrl d3
	.ln	127
	movel a4@(16),a3
	tstl a3
	jeq L294
L310:
	cmpl a3@(12),a4
	jne L294
	.ln	131
	tstl a3@(28)
	jne L299
	.ln	132
	.ln	135
	movel a3@(16),a0
	movel a0@(42),a1
	movel a1@,d0
	addl a0@(26),d0
	addl a3@(24),d0
	movel a3@(20),a0
	movel a0@(42),a1
	movel a1@,d1
	addl a0@(26),d1
	movel d0,d4
	subl d1,d4
	.ln	136
	cmpl #-32768,d4
	jle L302
	cmpl #32766,d4
	jle L299
L302:
	.def	.bb;	.val	.;	.scl	100;	.line	136;	.endef
	.ln	137
	tstb _flagseen+107
	jeq L303
	.ln	141
	movel a3@(24),sp@-
	movel a3@(20),a0
	movel a0@(18),sp@-
	movel a3@(16),a0
	movel a0@(18),sp@-
	pea LC12
	jbsr _as_warn
	addw #16,sp
L303:
	.ln	144
	moveq #1,d2
	movel d2,a3@(28)
	.ln	145
	tstl a4@(32)
	jne L304
	.ln	148
	addql #1,a4@(32)
	.ln	149
	addl _md_short_jump_size,d3
L304:
	.ln	153
	movel a3@,a0
	tstl a0
	jeq L306
L309:
	movel a0@(12),d2
	cmpl a3@(12),d2
	jne L306
	.ln	156
	movel a0@(16),a2
	movel a3@(16),a1
	movel a2@(42),d2
	cmpl a1@(42),d2
	jne L307
	movel a2@(26),d2
	cmpl a1@(26),d2
	jne L307
	.ln	157
	moveq #2,d2
	movel d2,a0@(28)
	.ln	158
	movel a3,a0@(32)
	.ln	153
L307:
	movel a0@,a0
	tstl a0
	jne L309
L306:
	.ln	162
	addl _md_long_jump_size,d3
	.def	.eb;.val	.;	.scl	100;	.line	162;	.endef
	.ln	129
L299:
	movel a3@,a3
	.ln	128
	tstl a3
	jne L310
	.def	.eb;.val	.;	.scl	100;	.line	128;	.endef
	.ln	166
	jra L294
L311:
	.ln	170
	movel d4,sp@-
	addl a4@(8),d5
	movel d5,sp@-
	lea _relax_align,a2
	jbsr a2@
	movel d0,d3
	movel d4,sp@-
	addl a4@(8),d7
	movel d7,sp@-
	jbsr a2@
	subl d0,d3
	.ln	171
	jra L345
L312:
	.ln	174
	movel d4,d3
	.ln	175
	tstl a1
	jeq L313
	.ln	184
	movel a1@(42),a0
	movel a1@(26),d0
	addl a0@,d0
	addl d0,d3
L313:
	.ln	187
	movel a4@(4),a0
	movel a0@,d1
	.ln	188
	movel d5,d0
	addl a4@(8),d0
	cmpl d3,d0
	jcs L314
	clrl d0
	jra L315
L314:
	movel d3,d0
	subl d1,d0
L315:
	movel d0,d3
	.ln	192
	jra L294
L316:
	.def	.bb;	.val	.;	.scl	100;	.line	192;	.endef
	.def	_this_type;	.val	10;	.scl	4;	.tag	_relax_typeS;	.size	14;	.type	030;	.endef
	.def	_start_type;	.val	11;	.scl	4;	.tag	_relax_typeS;	.size	14;	.type	030;	.endef
	.def	_next_state;	.val	0;	.scl	4;	.type	016;	.endef
	.def	_this_state;	.val	6;	.scl	4;	.type	016;	.endef
	.ln	202
	movel a4@(32),d6
	moveq #14,d0
	mulsl d6,d0
	movel d0,a2
	addl #_md_relax_table,a2
	movel a2,a3
	.ln	203
	movel d4,d3
	.ln	204
	tstl a1
	jeq L317
	.def	.bb;	.val	.;	.scl	100;	.line	204;	.endef
	.ln	214
	movel a1@(42),a0
	movel a1@(26),d0
	addl a0@,d0
	addl d0,d3
	.ln	226
	cmpl a0@,d7
	jcc L317
	movel a0,sp@-
	movel a4,sp@-
	jbsr _isdnrange
	addqw #8,sp
	tstl d0
	jeq L317
	.ln	227
	addl a5,d3
	.def	.eb;.val	.;	.scl	100;	.line	227;	.endef
L317:
	.ln	230
	movel d3,d0
	subl d5,d0
	movel d0,d1
	subl a4@(8),d1
	.ln	231
	jpl L346
	.ln	234
	movel a2@(10),d0
	jeq L326
L325:
	.ln	236
	cmpl a2@(4),d1
	jlt L323
	.ln	239
	clrl d0
	jra L320
L323:
	.ln	246
	movel d0,d6
	moveq #14,d0
	mulsl d6,d0
	movel d0,a2
	addl #_md_relax_table,a2
	.ln	247
	movel a2@(10),d0
	.ln	234
L320:
	tstl d0
	jne L325
	jra L326
	.ln	265
L332:
	.ln	267
	cmpl a2@,d1
	jgt L330
	.ln	270
	clrl d0
	jra L327
L330:
	.ln	277
	movel d0,d6
	moveq #14,d0
	mulsl d6,d0
	movel d0,a2
	addl #_md_relax_table,a2
	.ln	278
L346:
	movel a2@(10),d0
	.ln	265
L327:
	tstl d0
	jne L332
L326:
	.ln	284
	clrl d0
	moveb a2@(8),d0
	clrl d1
	moveb a3@(8),d1
	movel d0,d3
	subl d1,d3
	jeq L294
	.ln	285
	movel d6,a4@(32)
	.def	.eb;.val	.;	.scl	100;	.line	285;	.endef
	.ln	287
	jra L294
L334:
	.def	.bb;	.val	.;	.scl	100;	.line	287;	.endef
	.ln	290
	pea LC13
	pea 1589:w
	movel a4@(28),sp@-
	pea LC14
	jbsr _as_fatal
	.def	.eb;.val	.;	.scl	100;	.line	290;	.endef
	.ln	291
L345:
	addw #16,sp
L294:
	.ln	293
	tstl d3
	jeq L291
	.ln	294
	addl d3,a5
	.ln	295
	addql #1,a6@(-4)
	.def	.eb;.val	.;	.scl	100;	.line	295;	.endef
	.ln	73
L291:
	movel a4@(4),a4
	tstl a4
	jne L337
L342:
	.ln	298
	tstl a6@(-4)
	jne L286
	.def	.eb;.val	.;	.scl	100;	.line	298;	.endef
	.def	.eb;.val	.;	.scl	100;	.line	298;	.endef
	.ln	309
	.def	.ef;	.val	.;	.scl	101;	.line	309;	.endef
	moveml a6@(-40),#0x3cf8
	unlk a6
	rts
	.def	relax_segment;	.val	.;	.scl	-1;	.endef
	.even
	.def	_relax_align;	.val	_relax_align;	.scl	3;	.type	056;	.endef
_relax_align:
	.ln	1
	link a6,#0
	movel d3,sp@-
	.def	.bf;	.val	.;	.scl	101;	.line	1618;	.endef
	.def	_address;	.val	8;	.scl	9;	.type	016;	.endef
	.def	_alignment;	.val	12;	.scl	9;	.type	04;	.endef
	.def	_address;	.val	2;	.scl	4;	.type	016;	.endef
	movel a6@(8),d2
	.def	.bb;	.val	.;	.scl	100;	.line	1;	.endef
	.def	_mask;	.val	1;	.scl	4;	.type	016;	.endef
	.def	_new_address;	.val	0;	.scl	4;	.type	016;	.endef
	.ln	7
	moveq #-1,d1
	movel a6@(12),d3
	asll d3,d1
	notl d1
	.ln	8
	movel d2,d0
	addl d1,d0
	notl d1
	andl d1,d0
	.ln	9
	subl d2,d0
	.def	.eb;.val	.;	.scl	100;	.line	9;	.endef
	.ln	10
	.def	.ef;	.val	.;	.scl	101;	.line	10;	.endef
	movel a6@(-4),d3
	unlk a6
	rts
	.def	relax_align;	.val	.;	.scl	-1;	.endef
.data
LC15:
	.ascii "Negative of non-absolute symbol %s\0"
LC16:
	.ascii "Can't emit reloc {- %s-seg symbol \"%s\"} @ file address %d.\0"
LC17:
	.ascii "write.c\0"
LC18:
	.ascii "Case add_symbol_N_TYPE %d unexpected at line %d of file \"%s\"\12\0"
LC19:
	.ascii "Fixup of %d too large for field width of %d\0"
LC20:
	.ascii "Internal error in write.c in fixup_segment\0"
.text
	.even
	.def	_fixup_segment;	.val	_fixup_segment;	.scl	3;	.type	044;	.endef
_fixup_segment:
	.ln	1
	link a6,#-12
	moveml #0x1f3c,sp@-
	.def	.bf;	.val	.;	.scl	101;	.line	1635;	.endef
	.def	_fixP;	.val	8;	.scl	9;	.tag	_fix;	.size	36;	.type	030;	.endef
	.def	_this_segment_type;	.val	12;	.scl	9;	.type	04;	.endef
	.def	_fixP;	.val	13;	.scl	4;	.tag	_fix;	.size	36;	.type	030;	.endef
	movel a6@(8),a5
	.def	.bb;	.val	.;	.scl	100;	.line	1;	.endef
	.def	_seg_reloc_count;	.val	7;	.scl	4;	.type	04;	.endef
	.def	_add_symbolP;	.val	12;	.scl	4;	.tag	_symbol;	.size	54;	.type	030;	.endef
	.def	_sub_symbolP;	.val	11;	.scl	4;	.tag	_symbol;	.size	54;	.type	030;	.endef
	.def	_add_number;	.val	3;	.scl	4;	.type	04;	.endef
	.def	_size;	.val	5;	.scl	4;	.type	04;	.endef
	.def	_place;	.val	-4;	.scl	1;	.type	022;	.endef
	.def	_where;	.val	-8;	.scl	1;	.type	04;	.endef
	.def	_pcrel;	.val	6;	.scl	4;	.type	02;	.endef
	.def	_fragP;	.val	-12;	.scl	1;	.tag	_frag;	.size	40;	.type	030;	.endef
	.def	_add_symbol_N_TYPE;	.val	4;	.scl	4;	.type	04;	.endef
	.def	_temp_sym;	.val	10;	.scl	4;	.tag	_symbol;	.size	54;	.type	030;	.endef
	.ln	17
	clrl d7
	.ln	18
	tstl a5
	jeq L407
L404:
	.ln	20
	movel a5@,a6@(-12)
	.ln	22
	movel a5@(4),a6@(-8)
	.ln	23
	movel a6@(-8),d1
	movel a6@(-12),a1
	lea a1@(38,d1:l),a1
	movel a1,a6@(-4)
	.ln	24
	movew a5@(24),d5
	extl d5
	.ln	25
	movel a5@(8),a4
	.ln	30
	tstl _do_1500_coff
	jeq L352
	tstl a4
	jeq L352
	tstl a4@(34)
	jne L352
	movel a4@(18),a0
	cmpb #76,a0@
	jeq L352
	.ln	36
	movel _symbol_rootP,a2
	tstl a2
	jeq L352
L357:
	.ln	47
	movel a2@(18),sp@-
	movel a4@(18),sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L355
	cmpb #9,a2@(16)
	jeq L355
	cmpb #4,a2@(16)
	jeq L355
	cmpb #11,a2@(16)
	jeq L355
	cmpb #8,a2@(16)
	jeq L355
	cmpb #18,a2@(16)
	jeq L355
	cmpb #16,a2@(16)
	jeq L355
	cmpb #1,a2@(16)
	jeq L355
	cmpb #10,a2@(16)
	jeq L355
	cmpb #12,a2@(16)
	jeq L355
	cmpb #15,a2@(16)
	jeq L355
	.ln	48
	movel a2,a4
	.ln	49
	jra L352
	.ln	36
L355:
	movel a2@(38),a2
	tstl a2
	jne L357
L352:
	.ln	53
	movel a5@(12),a3
	.ln	58
	tstl _do_1500_coff
	jeq L358
	tstl a3
	jeq L358
	tstl a3@(34)
	jne L358
	movel a3@(18),a0
	cmpb #76,a0@
	jeq L358
	.ln	64
	movel _symbol_rootP,a2
	tstl a2
	jeq L358
L363:
	.ln	75
	movel a2@(18),sp@-
	movel a3@(18),sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L361
	cmpb #9,a2@(16)
	jeq L361
	cmpb #4,a2@(16)
	jeq L361
	cmpb #11,a2@(16)
	jeq L361
	cmpb #8,a2@(16)
	jeq L361
	cmpb #18,a2@(16)
	jeq L361
	cmpb #16,a2@(16)
	jeq L361
	cmpb #1,a2@(16)
	jeq L361
	cmpb #10,a2@(16)
	jeq L361
	cmpb #12,a2@(16)
	jeq L361
	cmpb #15,a2@(16)
	jeq L361
	.ln	76
	movel a2,a3
	.ln	77
	jra L358
	.ln	64
L361:
	movel a2@(38),a2
	tstl a2
	jne L363
L358:
	.ln	81
	movel a5@(16),d3
	.ln	82
	moveb a5@(26),d6
	.ln	83
	tstl a4
	jeq L364
	.ln	84
	moveb a4@(22),d4
	moveq #30,d1
	andl d1,d4
L364:
	.ln	85
	tstl a3
	jeq L365
	.ln	87
	tstl a4
	jne L366
	.def	.bb;	.val	.;	.scl	100;	.line	87;	.endef
	.ln	89
	cmpb #2,a3@(22)
	jeq L408
	.ln	90
	movel a3@(18),sp@-
	pea LC15
	jbsr _as_warn
	addqw #8,sp
	.ln	91
	.def	.eb;.val	.;	.scl	100;	.line	91;	.endef
	jra L408
L366:
	.ln	97
	moveb a3@(22),d0
	extbl d0
	eorl d4,d0
	moveq #30,d1
	andl d1,d0
	jne L369
	moveq #6,d1
	cmpl d4,d1
	jeq L370
	moveq #4,d1
	cmpl d4,d1
	jeq L370
	moveq #8,d1
	cmpl d4,d1
	jeq L370
	moveq #2,d1
	cmpl d4,d1
	jne L369
L370:
	.ln	102
	movel a4@(26),d0
	subl a3@(26),d0
	addl d0,d3
	.ln	103
	subl a4,a4
	.ln	104
	clrl a5@(8)
	jra L365
L369:
	.ln	110
	cmpb #2,a3@(22)
	jne L372
	.ln	111
L408:
	subl a3@(26),d3
	jra L365
L372:
	.def	.bb;	.val	.;	.scl	100;	.line	111;	.endef
	.ln	116
	movel a6@(-8),d1
	movel a6@(-12),a1
	addl a1@,d1
	movel d1,sp@-
	movel a3@(18),sp@-
	moveb a3@(22),d0
	moveq #30,d1
	andl d1,d0
	lea _N_TYPE_seg,a0
	movel a0@(d0:l:4),d0
	lea _seg_name,a0
	movel a0@(d0:l:4),sp@-
	pea LC16
	jbsr _as_warn
	.def	.eb;.val	.;	.scl	100;	.line	116;	.endef
	addw #16,sp
L365:
	.ln	120
	tstl a4
	jeq L374
	.ln	122
	cmpl a6@(12),d4
	jne L375
	tstb d6
	jeq L375
	.ln	129
	addl a4@(26),d3
	.ln	130
	movel d5,d0
	addl a6@(-8),d0
	movel a6@(-12),a1
	addl a1@,d0
	subl d0,d3
	.ln	131
	clrb d6
	.ln	132
	clrl a5@(8)
	jra L374
L375:
	.ln	143
	moveq #8,d1
	cmpl d1,d4
	jhi L386
LI387:
	movew pc@(L387-LI387-2:b,d4:l:2),d1
	jmp pc@(2,d1:w)
L387:
	.word L382-L387
	.word L386-L387
	.word L378-L387
	.word L386-L387
	.word L381-L387
	.word L386-L387
	.word L381-L387
	.word L386-L387
	.word L381-L387
L378:
	.ln	146
	addl a4@(26),d3
	.ln	147
	clrl a5@(8)
	.ln	148
	subl a4,a4
	.ln	149
	jra L374
L381:
	.ln	154
	addql #1,d7
	.ln	155
	addl a4@(26),d3
	.ln	156
	jra L374
L382:
	.ln	161
	tstl _do_1500_coff
	jeq L383
	.ln	163
	btst #0,a4@(22)
	jne L385
	cmpb #2,a4@(16)
	jne L383
L385:
	.ln	164
	addl a4@(26),d3
L383:
	.ln	166
	addql #1,d7
	.ln	167
	jra L374
L386:
	.def	.bb;	.val	.;	.scl	100;	.line	167;	.endef
	.ln	170
	pea LC17
	pea 1804:w
	movel d4,sp@-
	pea LC18
	jbsr _as_fatal
	.def	.eb;.val	.;	.scl	100;	.line	170;	.endef
	.ln	171
	addw #16,sp
L374:
	.ln	175
	tstb d6
	jeq L388
	.ln	177
	movel d5,d0
	addl a6@(-8),d0
	movel a6@(-12),a1
	addl a1@,d0
	subl d0,d3
	.ln	178
	tstl a4
	jne L388
	.ln	180
	movel #_abs_symbol,a5@(8)
	.ln	181
	addql #1,d7
L388:
	.ln	185
	tstl a5@(30)
	jne L390
	.def	.bb;	.val	.;	.scl	100;	.line	185;	.endef
	.ln	188
	moveq #1,d1
	moveq #2,d1
	.ln	189
	.ln	191
	moveb a5@(28),d0
	cmpb #1,d0
	jeq L396
	jgt L402
	tstb d0
	jeq L395
	jra L400
L402:
	cmpb #2,d0
	jeq L399
	jra L400
	.def	.bb;	.val	.;	.scl	100;	.line	191;	.endef
L395:
	.ln	197
	movel d5,sp@-
	movel d3,sp@-
	movel a6@(-4),sp@-
	jbsr _md_number_to_imm
	.ln	200
	jra L409
L396:
	.ln	204
	movel d5,sp@-
	tstb a5@(26)
	jeq L397
	moveb a5@(27),d0
	extbl d0
	addl d3,d0
	jra L398
L397:
	movel d3,d0
L398:
	movel d0,sp@-
	movel a6@(-4),sp@-
	jbsr _md_number_to_disp
	.ln	205
	jra L409
L399:
	.ln	207
	movel d5,sp@-
	movel d3,sp@-
	movel a6@(-4),sp@-
	jbsr _md_number_to_chars
	.ln	208
	jra L409
L400:
	.ln	210
	pea LC20
	jbsr _as_fatal
	.def	.eb;.val	.;	.scl	100;	.line	210;	.endef
	addqw #4,sp
	.def	.eb;.val	.;	.scl	100;	.line	210;	.endef
	jra L351
L390:
	.def	.bb;	.val	.;	.scl	100;	.line	210;	.endef
	.ln	213
	movel a5@(30),sp@-
	movel d3,sp@-
	movel a6@(-4),sp@-
	jbsr _md_number_to_field
	.def	.eb;.val	.;	.scl	100;	.line	213;	.endef
L409:
	addw #12,sp
	.ln	18
L351:
	movel a5@(20),a5
	tstl a5
	jne L404
L407:
	.ln	216
	movel d7,d0
	.def	.eb;.val	.;	.scl	100;	.line	216;	.endef
	.ln	217
	.def	.ef;	.val	.;	.scl	101;	.line	217;	.endef
	moveml a6@(-48),#0x3cf8
	unlk a6
	rts
	.def	fixup_segment;	.val	.;	.scl	-1;	.endef
	.even
	.def	_emit_relocations;	.val	_emit_relocations;	.scl	3;	.type	044;	.endef
_emit_relocations:
	.ln	1
	link a6,#-24
	moveml #0x183c,sp@-
	.def	.bf;	.val	.;	.scl	101;	.line	1863;	.endef
	.def	_fixP;	.val	8;	.scl	9;	.tag	_fix;	.size	36;	.type	030;	.endef
	.def	_segment_address_in_file;	.val	12;	.scl	9;	.type	016;	.endef
	.def	_which_section;	.val	16;	.scl	9;	.type	04;	.endef
	.def	_fixP;	.val	13;	.scl	4;	.tag	_fix;	.size	36;	.type	030;	.endef
	.def	_segment_address_in_file;	.val	4;	.scl	4;	.type	016;	.endef
	.def	_which_section;	.val	3;	.scl	4;	.type	04;	.endef
	movel a6@(8),a5
	movel a6@(12),d4
	movel a6@(16),d3
	.def	.bb;	.val	.;	.scl	100;	.line	1;	.endef
	.def	_sorted_relocs;	.scl	10;	.type	010;	.size	14;	.endef
	.def	_next;	.val	0;	.scl	8;	.tag	_sorted_relocs;	.size	14;	.type	030;	.endef
	.def	_coff_ri;	.val	4;	.scl	8;	.tag	_reloc;	.size	10;	.type	010;	.endef
	.def	.eos;	.val	14;	.scl	102;	.tag	_sorted_relocs;	.size	14;	.endef
	.def	_ri;	.val	-24;	.scl	1;	.tag	_relocation_info;	.size	8;	.type	010;	.endef
	.def	_symbolP;	.val	11;	.scl	4;	.tag	_symbol;	.size	54;	.type	030;	.endef
	.def	_temp_sym;	.val	10;	.scl	4;	.tag	_symbol;	.size	54;	.type	030;	.endef
	.def	_sorted_reloc;	.val	-16;	.scl	1;	.tag	_sorted_relocs;	.size	14;	.type	010;	.endef
	.def	_temp_reloc;	.val	12;	.scl	4;	.tag	_sorted_relocs;	.size	14;	.type	030;	.endef
	.def	_temp2_reloc;	.val	9;	.scl	4;	.tag	_sorted_relocs;	.size	14;	.type	030;	.endef
	.ln	16
	pea 8:w
	clrl sp@-
	pea a6@(-24)
	lea _memset,a2
	jbsr a2@
	.ln	17
	pea 14:w
	clrl sp@-
	pea a6@(-16)
	jbsr a2@
	.ln	18
	addw #24,sp
	tstl a5
	jeq L475
L465:
	.ln	20
	movel a5@(8),a3
	tstl a3
	jeq L413
	.def	.bb;	.val	.;	.scl	100;	.line	20;	.endef
	.ln	22
	tstl _do_1500_coff
	jeq L415
	.ln	23
	pea 14:w
	jbsr _xmalloc
	movel d0,a4
	.ln	24
	clrl a4@
	addqw #4,sp
L415:
	.ln	29
	moveb a5@(34),d0
	extbl d0
	bfins d0,a6@(-17){#4:#1}
	.ln	30
	moveb a5@(28),d0
	extbl d0
	bfins d0,a6@(-17){#5:#1}
	.ln	33
	movew a5@(24),a0
	lea _nbytes_r_length,a1
	clrl d0
	moveb a0@(a1:l),d0
	bfins d0,a6@(-17){#1:#2}
	.ln	34
	moveb a5@(26),d0
	extbl d0
	bfins d0,a6@(-17){#0:#1}
	.ln	35
	tstl _do_1500_coff
	jeq L416
	.ln	36
	tstb a6@(-17)
	jge L417
	.ln	37
	movew a5@(24),d0
	cmpw #2,d0
	jeq L420
	jgt L424
	cmpw #1,d0
	jeq L419
	jra L416
L424:
	cmpw #4,d0
	jeq L421
	jra L416
L419:
	.ln	39
	movew #18,a4@(12)
	.ln	40
	jra L416
L420:
	.ln	42
	movew #19,a4@(12)
	.ln	43
	jra L416
L421:
	.ln	45
	movew #20,a4@(12)
	.ln	46
	.ln	48
	jra L416
L417:
	.ln	52
	movew a5@(24),d0
	cmpw #2,d0
	jeq L428
	jgt L432
	cmpw #1,d0
	jeq L427
	jra L416
L432:
	cmpw #4,d0
	jeq L429
	jra L416
L427:
	.ln	54
	movew #15,a4@(12)
	.ln	55
	jra L416
L428:
	.ln	57
	movew #16,a4@(12)
	.ln	58
	jra L416
L429:
	.ln	60
	movew #17,a4@(12)
	.ln	61
	.ln	63
L416:
	.ln	68
	movel a5@,a0
	movel a0@,d0
	addl a5@(4),d0
	subl d4,d0
	movel d0,a6@(-24)
	.ln	70
	tstl _do_1500_coff
	jeq L433
	.ln	71
	movel d0,a4@(4)
L433:
	.ln	76
	tstl _do_1500_coff
	jeq L434
	tstl a3@(34)
	jne L434
	movel a3@(18),a0
	cmpb #76,a0@
	jeq L434
	.ln	82
	cmpb #95,a0@
	jne L435
	.ln	86
	moveq #1,d1
	movel d1,_keep_the_underscore
L435:
	.ln	96
	movel _symbol_rootP,a2
	tstl a2
	jeq L437
L440:
	.ln	107
	movel a2@(18),sp@-
	movel a3@(18),sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L438
	cmpb #9,a2@(16)
	jeq L438
	cmpb #4,a2@(16)
	jeq L438
	cmpb #11,a2@(16)
	jeq L438
	cmpb #8,a2@(16)
	jeq L438
	cmpb #18,a2@(16)
	jeq L438
	cmpb #16,a2@(16)
	jeq L438
	cmpb #1,a2@(16)
	jeq L438
	cmpb #10,a2@(16)
	jeq L438
	cmpb #12,a2@(16)
	jeq L438
	cmpb #15,a2@(16)
	jeq L438
	.ln	108
	movel a2,a3
	.ln	109
	jra L437
	.ln	96
L438:
	movel a2@(38),a2
	tstl a2
	jne L440
L437:
	.ln	112
	clrl _keep_the_underscore
	.ln	113
	tstl a3@(34)
	jne L434
	.ln	122
	movel _symbol_rootP,a2
	tstl a2
	jeq L434
L446:
	.ln	123
	movel a2@(18),sp@-
	movel a3@(18),sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L444
	.ln	124
	movel a2,a3
	.ln	125
	jra L434
	.ln	122
L444:
	movel a2@(38),a2
	tstl a2
	jne L446
L434:
	.ln	131
	moveb a3@(22),d0
	andb #30,d0
	jne L447
	.ln	134
	orb #16,a6@(-17)
	.ln	135
	movel a3@(34),d1
	bfins d1,a6@(-20){#0:#24}
	.ln	136
	tstl _do_1500_coff
	jeq L450
	.ln	137
	moveq #2,d1
	cmpl d3,d1
	jne L449
	.ln	138
	movel _text_siz,d1
	addl d1,a4@(4)
L449:
	.ln	140
	bfextu a6@(-20){#0:#24},d1
	movel d1,a4@(8)
	.ln	141
	moveb #2,a3@(16)
	jra L450
L447:
	.ln	146
	andb #239,a6@(-17)
	.ln	147
	moveb a3@(22),d0
	moveq #30,d1
	andl d1,d0
	bfins d0,a6@(-20){#0:#24}
	.ln	148
	tstl _do_1500_coff
	jeq L450
	.ln	149
	tstb a3@(16)
	jne L452
	.ln	150
	moveb #2,a3@(16)
L452:
	.ln	151
	moveq #2,d1
	cmpl d3,d1
	jne L453
	.ln	152
	movel _text_siz,d1
	addl d1,a4@(4)
L453:
	.ln	154
	moveb a3@(22),d0
	andb #6,d0
	cmpb #6,d0
	jne L454
	.ln	155
	movel _DATA_index,a4@(8)
	jra L450
L454:
	.ln	156
	btst #3,a3@(22)
	jeq L456
	.ln	157
	moveb #3,a3@(16)
	.ln	158
	movel _BSS_index,a4@(8)
	jra L450
L456:
	.ln	161
	movel _TEXT_index,a4@(8)
L450:
	.ln	175
	movel a6@(-20),sp@-
	movel a6@(-24),sp@-
	pea a6@(-24)
	jbsr _md_ri_to_chars
	.ln	176
	addw #12,sp
	tstl _do_1500_coff
	jeq L458
	.ln	177
	lea a6@(-16),a1
	tstl a1@
	jeq L460
L463:
	.ln	180
	movel a1@,a0
	movel a0@(4),d1
	cmpl a4@(4),d1
	jgt L460
	.ln	181
	.ln	178
	movel a0,a1
	tstl a1@
	jne L463
L460:
	.ln	183
	movel a1@,a4@
	.ln	184
	movel a4,a1@
	jra L413
L458:
	.ln	188
	pea 8:w
	pea a6@(-24)
	pea _next_object_file_charP
	jbsr _append
	addw #12,sp
	.def	.eb;.val	.;	.scl	100;	.line	188;	.endef
	.ln	18
L413:
	movel a5@(20),a5
	tstl a5
	jne L465
L475:
	.ln	192
	tstl _do_1500_coff
	jeq L466
	.ln	193
	movel a6@(-16),a4
	tstl a4
	jeq L466
L470:
	.ln	196
	pea 10:w
	pea a4@(4)
	pea _next_object_file_charP
	jbsr _append
	.ln	197
	movel a4,sp@-
	jbsr _free
	.ln	194
	addw #16,sp
	movel a4@,a4
	tstl a4
	jne L470
L466:
	.def	.eb;.val	.;	.scl	100;	.line	194;	.endef
	.ln	201
	.def	.ef;	.val	.;	.scl	101;	.line	201;	.endef
	moveml a6@(-48),#0x3c18
	unlk a6
	rts
	.def	emit_relocations;	.val	.;	.scl	-1;	.endef
	.even
	.def	_isdnrange;	.val	_isdnrange;	.scl	2;	.type	044;	.endef
.globl _isdnrange
_isdnrange:
	.ln	1
	link a6,#0
	.def	.bf;	.val	.;	.scl	101;	.line	2068;	.endef
	.def	_f1;	.val	8;	.scl	9;	.tag	_frag;	.size	40;	.type	030;	.endef
	.def	_f2;	.val	12;	.scl	9;	.tag	_frag;	.size	40;	.type	030;	.endef
	.def	_f1;	.val	8;	.scl	4;	.tag	_frag;	.size	40;	.type	030;	.endef
	.def	_f2;	.val	0;	.scl	4;	.tag	_frag;	.size	40;	.type	030;	.endef
	movel a6@(8),a0
	movel a6@(12),d0
	.ln	3
	tstl a0
	jeq L481
L480:
	.ln	4
	cmpl a0@(4),d0
	jne L479
	.ln	5
	moveq #1,d0
	jra L476
L479:
	.ln	6
	movel a0@(4),a0
	tstl a0
	jne L480
L481:
	.ln	8
	clrl d0
	.ln	9
L476:
	.def	.ef;	.val	.;	.scl	101;	.line	9;	.endef
	unlk a6
	rts
	.def	isdnrange;	.val	.;	.scl	-1;	.endef
.data
LC21:
	.ascii ".ln\0"
LC22:
	.ascii ".text\0"
LC23:
	.ascii ".data\0"
LC24:
	.ascii ".bss\0"
LC25:
	.ascii ".comment\0"
LC26:
	.ascii ".text\0"
LC27:
	.ascii ".data\0"
LC28:
	.ascii ".bss\0"
.text
	.even
	.def	_fixup_coff_symbol_table;	.val	_fixup_coff_symbol_table;	.scl	2;	.type	044;	.endef
.globl _fixup_coff_symbol_table
_fixup_coff_symbol_table:
	.ln	1
	link a6,#0
	moveml #0x1f3c,sp@-
	.def	.bf;	.val	.;	.scl	101;	.line	2090;	.endef
	.def	.bb;	.val	.;	.scl	100;	.line	1;	.endef
	.def	_symbolP;	.val	11;	.scl	4;	.tag	_symbol;	.size	54;	.type	030;	.endef
	.def	_last_symbolP;	.val	13;	.scl	4;	.tag	_symbol;	.size	54;	.type	030;	.endef
	.def	_ext_symbol_rootP;	.val	7;	.scl	4;	.tag	_symbol;	.size	54;	.type	030;	.endef
	.def	_ext_symbol_lastP;	.val	6;	.scl	4;	.tag	_symbol;	.size	54;	.type	030;	.endef
	.def	_temp_sym;	.val	10;	.scl	4;	.tag	_symbol;	.size	54;	.type	030;	.endef
	.def	_sclass;	.val	5;	.scl	4;	.type	04;	.endef
	.def	_symbol_index;	.val	0;	.scl	4;	.type	04;	.endef
	.def	_name;	.val	10;	.scl	4;	.type	022;	.endef
	.def	_forward_ref;	.val	4;	.scl	4;	.type	04;	.endef
	.ln	4
	clrl d7
	.ln	5
	clrl d6
	.ln	6
	.ln	8
	.ln	12
	movel _symbol_rootP,a3
	tstl a3
	jeq L524
L514:
	.ln	13
	movel a3@(18),a2
	.ln	15
	cmpb #76,a2@
	jeq L486
	pea LC21
	movel a2,sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jeq L486
	.ln	18
	moveb a3@(16),d5
	extbl d5
	.ln	28
	jeq L488
	moveq #2,d1
	cmpl d5,d1
	jeq L488
	moveq #3,d1
	cmpl d5,d1
	jne L487
L488:
	movew a3@(14),d0
	andw #48,d0
	cmpw #32,d0
	jeq L487
	pea LC22
	movel a2,sp@-
	lea _strcmp,a4
	jbsr a4@
	addqw #8,sp
	tstl d0
	jeq L487
	pea LC23
	movel a2,sp@-
	jbsr a4@
	addqw #8,sp
	tstl d0
	jeq L487
	pea LC24
	movel a2,sp@-
	jbsr a4@
	addqw #8,sp
	tstl d0
	jeq L487
	pea LC25
	movel a2,sp@-
	jbsr a4@
	addqw #8,sp
	tstl d0
	jeq L487
	.ln	30
	movel a3@(38),a5@(38)
	.ln	42
	clrl d4
	.ln	44
	moveq #2,d1
	cmpl d5,d1
	jeq L489
	moveq #3,d1
	cmpl d5,d1
	jeq L489
	.ln	46
	movel a3@(38),a2
	tstl a2
	jeq L491
L494:
	.def	.bb;	.val	.;	.scl	100;	.line	46;	.endef
	.ln	47
	moveb a2@(16),d3
	extbl d3
	.ln	60
	movel a2@(18),sp@-
	movel a3@(18),sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L492
	moveq #10,d1
	cmpl d3,d1
	jeq L492
	moveq #15,d1
	cmpl d3,d1
	jeq L492
	moveq #12,d1
	cmpl d3,d1
	jeq L492
	moveq #9,d1
	cmpl d3,d1
	jeq L492
	moveq #4,d1
	cmpl d3,d1
	jeq L492
	moveq #1,d1
	cmpl d3,d1
	jeq L492
	moveq #11,d1
	cmpl d3,d1
	jeq L492
	moveq #8,d1
	cmpl d3,d1
	jeq L492
	moveq #16,d1
	cmpl d3,d1
	jeq L492
	moveq #18,d1
	cmpl d3,d1
	jeq L492
	.ln	61
	moveq #1,d4
	.ln	62
	jra L491
	.def	.eb;.val	.;	.scl	100;	.line	62;	.endef
	.ln	46
L492:
	movel a2@(38),a2
	tstl a2
	jne L494
L491:
	.ln	68
	movel _symbol_rootP,a0
	movel a0@(38),a2
	cmpl a5@(38),a2
	jeq L489
L499:
	.def	.bb;	.val	.;	.scl	100;	.line	68;	.endef
	.ln	71
	moveb a2@(16),d3
	extbl d3
	.ln	84
	movel a2@(18),sp@-
	movel a3@(18),sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L497
	moveq #10,d1
	cmpl d3,d1
	jeq L497
	moveq #15,d1
	cmpl d3,d1
	jeq L497
	moveq #12,d1
	cmpl d3,d1
	jeq L497
	moveq #9,d1
	cmpl d3,d1
	jeq L497
	moveq #4,d1
	cmpl d3,d1
	jeq L497
	moveq #1,d1
	cmpl d3,d1
	jeq L497
	moveq #11,d1
	cmpl d3,d1
	jeq L497
	moveq #8,d1
	cmpl d3,d1
	jeq L497
	moveq #16,d1
	cmpl d3,d1
	jeq L497
	moveq #18,d1
	cmpl d3,d1
	jeq L497
	.ln	85
	moveq #1,d4
	.ln	86
	jra L489
	.def	.eb;.val	.;	.scl	100;	.line	86;	.endef
	.ln	70
L497:
	movel a2@(38),a2
	.ln	69
	cmpl a5@(38),a2
	jne L499
L489:
	.ln	97
	tstl d5
	jne L500
	tstl d4
	jne L500
	tstl d7
	jeq L500
	.ln	98
	movel d7,a2
	tstl a2
	jeq L500
L505:
	.ln	99
	movel a2@(18),sp@-
	movel a3@(18),sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L503
	.ln	100
	moveq #1,d4
	.ln	101
	jra L500
	.ln	98
L503:
	movel a2@(38),a2
	tstl a2
	jne L505
L500:
	.ln	109
	tstl d4
	jne L485
	.ln	110
	tstl d6
	jeq L507
	.ln	111
	movel d6,a1
	movel a3,a1@(38)
	jra L508
L507:
	.ln	114
	movel a3,d7
L508:
	.ln	116
	movel a3,d6
	.ln	117
	movel a5,a3
	.ln	118
	movel d6,a1
	clrl a1@(38)
	jra L485
L487:
	.ln	125
	pea LC26
	movel a3@(18),sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L510
	.ln	126
	movel a3@(34),_TEXT_index
L510:
	.ln	127
	pea LC27
	movel a3@(18),sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L511
	.ln	128
	movel a3@(34),_DATA_index
L511:
	.ln	129
	pea LC28
	movel a3@(18),sp@-
	jbsr _strcmp
	addqw #8,sp
	tstl d0
	jne L512
	.ln	130
	movel a3@(34),_BSS_index
L512:
	.ln	131
L486:
	.ln	134
	movel a3,a5
	.ln	12
L485:
	movel a3@(38),a3
	tstl a3
	jne L514
L524:
	.ln	139
	tstl d7
	jeq L515
	.ln	140
	movel a5@(34),d0
	addql #1,d0
	.ln	141
	movel d7,a3
	tstl a3
	jeq L520
L519:
	.ln	142
	movel d0,a3@(34)
	addql #1,d0
	.ln	141
	movel a3@(38),a3
	tstl a3
	jne L519
L520:
	.ln	144
	movel d7,a5@(38)
	.ln	145
	movel d6,a1
	clrl a1@(38)
L515:
	.def	.eb;.val	.;	.scl	100;	.line	145;	.endef
	.ln	147
	.def	.ef;	.val	.;	.scl	101;	.line	147;	.endef
	moveml a6@(-36),#0x3cf8
	unlk a6
	rts
	.def	fixup_coff_symbol_table;	.val	.;	.scl	-1;	.endef
	.def	_comment_siz;	.val	_comment_siz;	.scl	2;	.type	016;	.endef
.comm _comment_siz,4
	.def	_lnno_siz;	.val	_lnno_siz;	.scl	2;	.type	016;	.endef
.comm _lnno_siz,4
	.def	_dr_siz;	.val	_dr_siz;	.scl	2;	.type	016;	.endef
.comm _dr_siz,4
	.def	_tr_siz;	.val	_tr_siz;	.scl	2;	.type	016;	.endef
.comm _tr_siz,4
	.def	_syms_siz;	.val	_syms_siz;	.scl	2;	.type	016;	.endef
.comm _syms_siz,4
	.def	_data_siz;	.val	_data_siz;	.scl	2;	.type	016;	.endef
.comm _data_siz,4
	.def	_text_siz;	.val	_text_siz;	.scl	2;	.type	016;	.endef
.comm _text_siz,4
	.def	_size_of_the_object_file;	.val	_size_of_the_object_file;	.scl	3;	.type	04;	.endef
.lcomm _size_of_the_object_file,4
	.def	_next_object_file_charP;	.val	_next_object_file_charP;	.scl	3;	.type	022;	.endef
.lcomm _next_object_file_charP,4
	.def	_BSS_index;	.val	_BSS_index;	.scl	3;	.type	04;	.endef
.lcomm _BSS_index,4
	.def	_DATA_index;	.val	_DATA_index;	.scl	3;	.type	04;	.endef
.lcomm _DATA_index,4
	.def	_TEXT_index;	.val	_TEXT_index;	.scl	3;	.type	04;	.endef
.lcomm _TEXT_index,4
	.def	_the_object_file;	.val	_the_object_file;	.scl	3;	.type	022;	.endef
.lcomm _the_object_file,4
	.def	_string_byte_count;	.val	_string_byte_count;	.scl	3;	.type	04;	.endef
.lcomm _string_byte_count,4
	.def	_the_exec;	.val	_the_exec;	.scl	3;	.tag	_exec;	.size	32;	.type	010;	.endef
.lcomm _the_exec,32
	.def	_data_last_frag;	.val	_data_last_frag;	.scl	3;	.tag	_frag;	.size	40;	.type	030;	.endef
.lcomm _data_last_frag,4
	.def	_text_last_frag;	.val	_text_last_frag;	.scl	3;	.tag	_frag;	.size	40;	.type	030;	.endef
.lcomm _text_last_frag,4
	.def	_data_frag_root;	.val	_data_frag_root;	.scl	3;	.tag	_frag;	.size	40;	.type	030;	.endef
.lcomm _data_frag_root,4
	.def	_text_frag_root;	.val	_text_frag_root;	.scl	3;	.tag	_frag;	.size	40;	.type	030;	.endef
.lcomm _text_frag_root,4
	.def	_fsize_lastP;	.val	_fsize_lastP;	.scl	2;	.tag	_fsize_entry;	.size	8;	.type	030;	.endef
.comm _fsize_lastP,4
	.def	_fsize_rootP;	.val	_fsize_rootP;	.scl	2;	.tag	_fsize_entry;	.size	8;	.type	030;	.endef
.comm _fsize_rootP,4
