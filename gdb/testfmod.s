#NO_APP
	.file	"testfmod.c"
.text
	.def	_FILE;	.scl	10;	.type	010;	.size	14;	.endef
	.def	__cnt;	.val	0;	.scl	8;	.type	04;	.endef
	.def	__ptr;	.val	4;	.scl	8;	.type	034;	.endef
	.def	__base;	.val	8;	.scl	8;	.type	034;	.endef
	.def	__flag;	.val	12;	.scl	8;	.type	02;	.endef
	.def	__file;	.val	13;	.scl	8;	.type	02;	.endef
	.def	.eos;	.val	14;	.scl	102;	.tag	_FILE;	.size	14;	.endef
	.def	_FILE;	.scl	13;	.tag	_FILE;	.size	14;	.type	010;	.endef
	.def	_double_rep_struct;	.scl	10;	.type	010;	.size	8;	.endef
	.def	_neg;	.val	0;	.scl	18;	.type	04;	.size	1;	.endef
	.def	_exp;	.val	1;	.scl	18;	.type	04;	.size	11;	.endef
	.def	_highbits;	.val	12;	.scl	18;	.type	04;	.size	20;	.endef
	.def	_lowbits;	.val	32;	.scl	18;	.type	016;	.size	32;	.endef
	.def	.eos;	.val	8;	.scl	102;	.tag	_double_rep_struct;	.size	8;	.endef
	.def	_exception;	.scl	10;	.type	010;	.size	32;	.endef
	.def	_type;	.val	0;	.scl	8;	.type	04;	.endef
	.def	_name;	.val	4;	.scl	8;	.type	022;	.endef
	.def	_arg1;	.val	8;	.scl	8;	.type	07;	.endef
	.def	_arg2;	.val	16;	.scl	8;	.type	07;	.endef
	.def	_retval;	.val	24;	.scl	8;	.type	07;	.endef
	.def	.eos;	.val	32;	.scl	102;	.tag	_exception;	.size	32;	.endef
	.def	_double_rep;	.scl	13;	.tag	_double_rep_struct;	.size	8;	.type	010;	.endef
	.def	_doub_union;	.scl	12;	.type	011;	.size	8;	.endef
	.def	_val;	.val	0;	.scl	11;	.type	07;	.endef
	.def	_rep;	.val	0;	.scl	11;	.tag	_double_rep_struct;	.size	8;	.type	010;	.endef
	.def	.eos;	.val	8;	.scl	102;	.tag	_doub_union;	.size	8;	.endef
	.def	_doub_union;	.scl	13;	.tag	_doub_union;	.size	8;	.type	011;	.endef
.data
LC0:
	.ascii "d = %25.20e = %25.20e\12\0"
LC1:
	.ascii "neg = %x  exp=%x  highbits=%x  lowbits=%x\12\0"
.text
	.even
	.def	_explode;	.val	_explode;	.scl	3;	.type	044;	.endef
_explode:
	.ln	1
	link a6,#-8
	.def	.bf;	.val	.;	.scl	101;	.line	22;	.endef
	.def	_value;	.val	8;	.scl	9;	.type	07;	.endef
	.def	.bb;	.val	.;	.scl	100;	.line	1;	.endef
	.def	_u;	.val	-8;	.scl	1;	.tag	_doub_union;	.size	8;	.type	011;	.endef
	.ln	3
	movel a6@(8),a6@(-8)
	movel a6@(12),a6@(-4)
	.ln	4
	movel a6@(12),sp@-
	movel a6@(8),sp@-
	movel a6@(-4),sp@-
	movel a6@(-8),sp@-
	pea LC0
	jbsr _printf
	.ln	6
	bfextu a6@(-4){#0:#32},d0
	movel d0,sp@-
	bfextu a6@(-7){#4:#20},d0
	movel d0,sp@-
	bfextu a6@(-8){#1:#11},d0
	movel d0,sp@-
	bfextu a6@(-8){#0:#1},d0
	movel d0,sp@-
	pea LC1
	jbsr _printf
	.def	.eb;.val	.;	.scl	100;	.line	6;	.endef
	.ln	7
L1:
	.def	.ef;	.val	.;	.scl	101;	.line	7;	.endef
	unlk a6
	rts
	.def	explode;	.val	.;	.scl	-1;	.endef
	.even
LC2:
	.double 0r0
	.even
	.def	_ldexp;	.val	_ldexp;	.scl	2;	.type	047;	.endef
.globl _ldexp
_ldexp:
	.ln	1
	link a6,#-8
	moveml #0x1800,sp@-
	.def	.bf;	.val	.;	.scl	101;	.line	33;	.endef
	.def	_value;	.val	8;	.scl	9;	.type	07;	.endef
	.def	_exp;	.val	16;	.scl	9;	.type	04;	.endef
	.def	.bb;	.val	.;	.scl	100;	.line	1;	.endef
	.def	_u;	.val	-8;	.scl	1;	.tag	_doub_union;	.size	8;	.type	011;	.endef
	.def	_newexp;	.val	0;	.scl	4;	.type	04;	.endef
	.ln	4
	movel a6@(8),a6@(-8)
	movel a6@(12),a6@(-4)
	.ln	5
	bfextu a6@(-8){#1:#11},d1
	movel d1,d0
	addl a6@(16),d0
	.ln	6
	fmoved a6@(8),fp1
	fcmpd LC2,fp1
	fjne L3
	fmoved LC2,fp0
	jra L2
L3:
	.ln	7
	bfextu a6@(-8){#1:#11},d1
	cmpl #2047,d1
	jne L4
	fmoved a6@(8),fp0
	jra L2
L4:
	.ln	8
	cmpl #2046,d0
	jle L5
	moveq #33,d4
	movel d4,_errno
	jra L2
L5:
	.ln	9
	tstl d0
	jle L6
	.ln	10
	bfins d0,a6@(-8){#1:#11}
	.ln	11
	fmoved a6@(-8),fp0
	jra L2
L6:
	.ln	15
	moveq #-51,d4
	cmpl d0,d4
	jle L7
	fmoved LC2,fp0
	jra L2
L7:
	.ln	16
	subql #1,d0
	negl d0
	.ln	17
	moveq #20,d4
	cmpl d0,d4
	jge L8
	clrl d1
	jra L9
L8:
	bfextu a6@(-7){#4:#20},d1
	asrl d0,d1
L9:
	bfins d1,a6@(-7){#4:#20}
	.ln	20
	moveq #32,d4
	cmpl d0,d4
	jge L10
	clrl d1
	jra L11
L10:
	bfextu a6@(-4){#0:#32},d2
	lsrl d0,d2
	moveq #32,d4
	cmpl d0,d4
	sge d3
	moveq #1,d4
	andl d4,d3
	orl d3,d2
	tstl d2
	jeq L12
	bfextu a6@(-7){#4:#20},d2
	moveq #32,d3
	subl d0,d3
	movel d2,d1
	asll d3,d1
	jra L13
L12:
	bfextu a6@(-7){#4:#20},d2
	moveq #-32,d3
	addl d0,d3
	movel d2,d1
	asrl d3,d1
L13:
L11:
	bfins d1,a6@(-4){#0:#32}
	.ln	21
	fmoved a6@(-8),fp0
	jra L2
	.def	.eb;.val	.;	.scl	100;	.line	21;	.endef
	.ln	22
L2:
	.def	.ef;	.val	.;	.scl	101;	.line	22;	.endef
	moveml a6@(-16),#0x18
	unlk a6
	rts
	.def	ldexp;	.val	.;	.scl	-1;	.endef
	.even
LC3:
	.double 0r2
	.even
	.def	_frexp;	.val	_frexp;	.scl	2;	.type	047;	.endef
.globl _frexp
_frexp:
	.ln	1
	link a6,#-12
	.def	.bf;	.val	.;	.scl	101;	.line	60;	.endef
	.def	_value;	.val	8;	.scl	9;	.type	07;	.endef
	.def	_exp;	.val	16;	.scl	9;	.type	024;	.endef
	.def	.bb;	.val	.;	.scl	100;	.line	1;	.endef
	.def	_i;	.val	-4;	.scl	1;	.type	04;	.endef
	.def	_u;	.val	-12;	.scl	1;	.tag	_doub_union;	.size	8;	.type	011;	.endef
	.ln	4
	movel a6@(8),a6@(-12)
	movel a6@(12),a6@(-8)
	.ln	5
	fmoved a6@(8),fp1
	fcmpd LC2,fp1
	fjne L15
	movel a6@(16),a0
	clrl a0@
	fmoved LC2,fp0
	jra L14
L15:
	.ln	6
	bfextu a6@(-12){#1:#11},d0
	cmpl #2047,d0
	jne L16
	moveq #33,d2
	movel d2,_errno
	movel a6@(16),a0
	clrl a0@
	fmoved a6@(8),fp0
	jra L14
L16:
	.ln	7
	bfextu a6@(-12){#1:#11},d0
	tstl d0
	jeq L17
	.ln	8
	movel a6@(16),a0
	bfextu a6@(-12){#1:#11},d0
	movel d0,d2
	addl #-1022,d2
	movel d2,a0@
	.ln	9
	movel #1022,d2
	bfins d2,a6@(-12){#1:#11}
	.ln	10
	fmoved a6@(-12),fp0
	jra L14
L17:
	nop
	.ln	13
	clrl a6@(-4)
L18:
	moveq #59,d2
	cmpl a6@(-4),d2
	jlt L19
	.ln	14
	fmoved a6@(-12),fp1
	fmuld LC3,fp1
	fmoved fp1,a6@(-12)
	.ln	15
	bfextu a6@(-12){#1:#11},d0
	tstl d0
	jeq L21
	.ln	16
	movel a6@(16),a0
	bfextu a6@(-12){#1:#11},d0
	movel a6@(-4),d1
	addl #1022,d1
	movel d0,d2
	subl d1,d2
	movel d2,a0@
	.ln	17
	movel #1022,d2
	bfins d2,a6@(-12){#1:#11}
	.ln	18
	fmoved a6@(-12),fp0
	jra L14
L21:
	.ln	13
L20:
	addql #1,a6@(-4)
	jra L18
L19:
	.def	.eb;.val	.;	.scl	100;	.line	13;	.endef
	.ln	21
L14:
	.def	.ef;	.val	.;	.scl	101;	.line	21;	.endef
	unlk a6
	rts
	.def	frexp;	.val	.;	.scl	-1;	.endef
	.even
	.def	_fmod;	.val	_fmod;	.scl	2;	.type	047;	.endef
.globl _fmod
_fmod:
	.ln	1
	link a6,#-40
	movel d3,sp@-
	.def	.bf;	.val	.;	.scl	101;	.line	85;	.endef
	.def	_x;	.val	8;	.scl	9;	.type	07;	.endef
	.def	_y;	.val	16;	.scl	9;	.type	07;	.endef
	.def	.bb;	.val	.;	.scl	100;	.line	1;	.endef
	.def	_neg;	.val	-4;	.scl	1;	.type	04;	.endef
	.ln	2
	clrl a6@(-4)
	.ln	3
	fmoved a6@(8),fp1
	fcmpd LC2,fp1
	fjeq L24
	fmoved a6@(16),fp0
	fcmpd LC2,fp0
	fjeq L24
	jra L23
L24:
	fmoved LC2,fp0
	jra L22
L23:
	.ln	4
	fmoved a6@(16),fp0
	fcmpd LC2,fp0
	fjnlt L25
	fmoved a6@(16),fp0
	fnegx fp0,fp0
	fmoved fp0,a6@(16)
L25:
	.ln	5
	fmoved a6@(8),fp1
	fcmpd LC2,fp1
	fjnlt L26
	fnegd a6@(8),fp1
	fmoved fp1,a6@(8)
	moveq #1,d1
	movel d1,a6@(-4)
L26:
	.ln	6
	fmoved a6@(16),fp0
	fcmpd a6@(8),fp0
	fjnle L27
	.def	.bb;	.val	.;	.scl	100;	.line	6;	.endef
	.def	_u;	.val	-12;	.scl	1;	.tag	_doub_union;	.size	8;	.type	011;	.endef
	.def	_px;	.val	-16;	.scl	1;	.type	04;	.endef
	.def	_py;	.val	-20;	.scl	1;	.type	04;	.endef
	.def	_e2;	.val	-24;	.scl	1;	.type	04;	.endef
	.ln	9
	movel a6@(16),a6@(-12)
	movel a6@(20),a6@(-8)
	.ln	10
	moveq #-16,d0
	addl a6,d0
	movel d0,sp@-
	movel a6@(12),sp@-
	movel a6@(8),sp@-
	jbsr _frexp
	moveq #-20,d0
	addl a6,d0
	movel d0,sp@-
	movel a6@(20),sp@-
	movel a6@(16),sp@-
	jbsr _frexp
	.ln	11
	movel a6@(-16),d0
	subl a6@(-20),d0
	movel d0,d1
	addql #1,d1
	movel d1,a6@(-24)
	addw #24,sp
L28:
	tstl a6@(-24)
	jlt L29
	.def	.bb;	.val	.;	.scl	100;	.line	11;	.endef
	.def	_exp;	.val	3;	.scl	4;	.type	04;	.endef
	.ln	12
	movel a6@(-20),d3
	addl a6@(-24),d3
	.ln	13
	tstl d3
	jgt L31
	.def	.bb;	.val	.;	.scl	100;	.line	13;	.endef
	.def	_t;	.val	-32;	.scl	1;	.type	07;	.endef
	.ln	14
	movel a6@(-24),sp@-
	movel a6@(20),sp@-
	movel a6@(16),sp@-
	jbsr _ldexp
	fmoved fp0,a6@(-32)
	.ln	15
	addw #12,sp
	fmoved a6@(8),fp1
	fcmpd a6@(-32),fp1
	fjnge L32
	fmoved a6@(8),fp1
	fsubd a6@(-32),fp1
	fmoved fp1,a6@(8)
L32:
	.def	.eb;.val	.;	.scl	100;	.line	15;	.endef
	jra L33
L31:
	.def	.bb;	.val	.;	.scl	100;	.line	15;	.endef
	.def	_q;	.val	-40;	.scl	1;	.type	07;	.endef
	.ln	18
	bfins d3,a6@(-12){#1:#11}
	.ln	19
	movel a6@(-12),a6@(-40)
	movel a6@(-8),a6@(-36)
	.ln	20
	fmoved a6@(8),fp1
	fcmpd a6@(-12),fp1
	fjnge L34
	fmoved a6@(8),fp1
	fsubd a6@(-12),fp1
	fmoved fp1,a6@(8)
L34:
	.def	.eb;.val	.;	.scl	100;	.line	20;	.endef
L33:
	.def	.eb;.val	.;	.scl	100;	.line	20;	.endef
	.ln	11
L30:
	subql #1,a6@(-24)
	jra L28
L29:
	.def	.eb;.val	.;	.scl	100;	.line	11;	.endef
L27:
	.ln	24
	tstl a6@(-4)
	jeq L35
	fnegd a6@(8),fp0
	jra L36
L35:
	fmoved a6@(8),fp0
L36:
	jra L22
	.def	.eb;.val	.;	.scl	100;	.line	24;	.endef
	.ln	25
L22:
	.def	.ef;	.val	.;	.scl	101;	.line	25;	.endef
	movel a6@(-44),d3
	unlk a6
	rts
	.def	fmod;	.val	.;	.scl	-1;	.endef
.data
LC4:
	.ascii "x, y? \0"
LC5:
	.ascii "%lf %lf\0"
LC6:
	.ascii "x = %25.20e  y = %25.20e\12\0"
LC7:
	.ascii "r:  %25.20e\12\0"
.text
	.even
	.def	_main;	.val	_main;	.scl	2;	.type	044;	.endef
.globl _main
_main:
	.ln	1
	link a6,#-124
	.def	.bf;	.val	.;	.scl	101;	.line	113;	.endef
	.def	.bb;	.val	.;	.scl	100;	.line	1;	.endef
	.def	_buf;	.val	-100;	.scl	1;	.dim	100;	.size	100;	.type	062;	.endef
	.def	_a;	.val	-108;	.scl	1;	.type	07;	.endef
	.def	_b;	.val	-116;	.scl	1;	.type	07;	.endef
	.def	_count;	.val	-120;	.scl	1;	.type	04;	.endef
	.def	_num;	.val	-124;	.scl	1;	.type	04;	.endef
	nop
	.ln	5
L38:
	.def	.bb;	.val	.;	.scl	100;	.line	5;	.endef
	.ln	6
	pea LC4
	jbsr _printf
	.ln	7
	moveq #14,d0
	addl #__iob,d0
	movel d0,sp@-
	jbsr _fflush
	.ln	8
	moveq #-100,d0
	addl a6,d0
	movel d0,sp@-
	jbsr _gets
	.ln	9
	moveq #-116,d0
	addl a6,d0
	movel d0,sp@-
	moveq #-108,d0
	addl a6,d0
	movel d0,sp@-
	pea LC5
	moveq #-100,d0
	addl a6,d0
	movel d0,sp@-
	jbsr _sscanf
	.ln	10
	addw #28,sp
	fmoved a6@(-116),fp1
	fcmpd LC2,fp1
	fjne L41
	clrl d0
	jra L37
L41:
	.ln	11
	movel a6@(-104),sp@-
	movel a6@(-108),sp@-
	jbsr _explode
	movel a6@(-112),sp@-
	movel a6@(-116),sp@-
	jbsr _explode
	.ln	12
	movel a6@(-112),sp@-
	movel a6@(-116),sp@-
	movel a6@(-104),sp@-
	movel a6@(-108),sp@-
	pea LC6
	jbsr _printf
	.ln	13
	addw #36,sp
	movel a6@(-112),sp@-
	movel a6@(-116),sp@-
	movel a6@(-104),sp@-
	movel a6@(-108),sp@-
	jbsr _fmod
	fmoved fp0,sp@-
	movel sp@+,d0
	movel sp@+,d1
	movel d1,sp@-
	movel d0,sp@-
	pea LC7
	jbsr _printf
	.def	.eb;.val	.;	.scl	100;	.line	13;	.endef
	.ln	5
	addw #28,sp
L40:
	jra L38
L39:
	.def	.eb;.val	.;	.scl	100;	.line	5;	.endef
	.ln	15
L37:
	.def	.ef;	.val	.;	.scl	101;	.line	15;	.endef
	unlk a6
	rts
	.def	main;	.val	.;	.scl	-1;	.endef
