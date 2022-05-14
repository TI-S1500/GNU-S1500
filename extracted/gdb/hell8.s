#NO_APP
	.file	"hell8.c"
.text
LC0:
	.ascii "this is foop: %d\12\0"
LC1:
	.ascii "this is long foo - value %d\12\0"
	.def	_myst2;	.scl	10;	.type	010;	.size	8;	.endef
	.def	_ll;	.val	0;	.scl	8;	.type	04;	.endef
	.def	_mm;	.val	4;	.scl	8;	.type	04;	.endef
	.def	.eos;	.val	8;	.scl	102;	.tag	_myst2;	.size	8;	.endef
	.def	_my;	.scl	10;	.type	010;	.size	8;	.endef
	.def	_jj;	.val	0;	.scl	8;	.type	04;	.endef
	.def	_kk;	.val	4;	.scl	8;	.type	04;	.endef
	.def	.eos;	.val	8;	.scl	102;	.tag	_my;	.size	8;	.endef
	.even
	.def	_foop;	.val	_foop;	.scl	2;	.type	044;	.endef
.globl _foop
_foop:
	.ln	1
	link a6,#0
	.def	.bf;	.val	.;	.scl	101;	.line	18;	.endef
	.def	_x;	.val	8;	.scl	9;	.type	04;	.endef
	.def	.bb;	.val	.;	.scl	100;	.line	1;	.endef
	.ln	2
	movel a6@(8),sp@-
	pea LC0
	jbsr _printf
	.ln	3
	movel a6@(8),sp@-
	pea LC1
	jbsr _printf
	.def	.eb;.val	.;	.scl	100;	.line	3;	.endef
	.ln	4
L1:
	.def	.ef;	.val	.;	.scl	101;	.line	4;	.endef
	unlk a6
	rts
	.def	foop;	.val	.;	.scl	-1;	.endef
LC2:
	.ascii "this is kk: %d\12\0"
LC3:
	.ascii "this is mm: %d\12\0"
	.even
	.def	_myprint;	.val	_myprint;	.scl	2;	.type	044;	.endef
.globl _myprint
_myprint:
	.ln	1
	link a6,#0
	.def	.bf;	.val	.;	.scl	101;	.line	24;	.endef
	.def	_x;	.val	8;	.scl	9;	.type	04;	.endef
	.def	_y;	.val	12;	.scl	9;	.type	04;	.endef
	.def	.bb;	.val	.;	.scl	100;	.line	1;	.endef
	.ln	2
	movel a6@(8),sp@-
	pea LC2
	jbsr _printf
	.ln	3
	movel a6@(8),sp@-
	jbsr _foop
	.ln	4
	movel a6@(12),sp@-
	pea LC3
	jbsr _printf
	.def	.eb;.val	.;	.scl	100;	.line	4;	.endef
	.ln	5
L2:
	.def	.ef;	.val	.;	.scl	101;	.line	5;	.endef
	unlk a6
	rts
	.def	myprint;	.val	.;	.scl	-1;	.endef
LC4:
	.ascii "this is jj: %d\12\0"
LC5:
	.ascii "hello, world \12 \0"
LC6:
	.ascii "the value is %d\12\0"
LC7:
	.ascii "goodbye, world \12\0"
	.def	_myst3;	.scl	10;	.type	010;	.size	8;	.endef
	.def	_aa;	.val	0;	.scl	8;	.type	04;	.endef
	.def	_bb;	.val	4;	.scl	8;	.type	04;	.endef
	.def	.eos;	.val	8;	.scl	102;	.tag	_myst3;	.size	8;	.endef
	.even
	.def	_main;	.val	_main;	.scl	2;	.type	044;	.endef
.globl _main
_main:
	.ln	1
	link a6,#-20
	.def	.bf;	.val	.;	.scl	101;	.line	40;	.endef
	.def	.bb;	.val	.;	.scl	100;	.line	1;	.endef
	.def	_myst;	.val	-8;	.scl	1;	.tag	_my;	.size	8;	.type	010;	.endef
	.def	_myst2S;	.val	-16;	.scl	1;	.tag	_myst2;	.size	8;	.type	010;	.endef
	.def	_ii;	.val	-20;	.scl	1;	.type	04;	.endef
	.ln	6
	moveq #3,d1
	movel d1,a6@(-20)
	.ln	8
	movel #2001,_myst3S
	.ln	9
	movel #2002,_myst3S+4
	.ln	11
	movel d1,a6@(-8)
	.ln	12
	moveq #4,d1
	movel d1,a6@(-4)
	.ln	13
	moveq #5,d1
	movel d1,a6@(-16)
	.ln	14
	moveq #6,d1
	movel d1,a6@(-12)
	.ln	16
	movel a6@(-8),sp@-
	pea LC4
	jbsr _printf
	.ln	17
	movel a6@(-16),sp@-
	pea LC3
	jbsr _printf
	.ln	18
	pea LC5
	jbsr _printf
	.ln	19
	movel a6@(-12),sp@-
	movel a6@(-4),sp@-
	jbsr _myprint
	.ln	20
	movel a6@(-20),sp@-
	pea LC6
	jbsr _printf
	.ln	21
	addw #36,sp
	movel a6@(-20),sp@-
	jbsr _foop
	.ln	22
	pea LC7
	jbsr _printf
	.def	.eb;.val	.;	.scl	100;	.line	22;	.endef
	.ln	23
L3:
	.def	.ef;	.val	.;	.scl	101;	.line	23;	.endef
	unlk a6
	rts
	.def	main;	.val	.;	.scl	-1;	.endef
	.def	_myst3S;	.val	_myst3S;	.scl	2;	.tag	_myst3;	.size	8;	.type	010;	.endef
.comm _myst3S,8
	.def	_yoop;	.val	_yoop;	.scl	3;	.type	04;	.endef
.lcomm _yoop,4
	.def	_myl;	.val	_myl;	.scl	2;	.type	024;	.endef
.comm _myl,4
	.def	_myp;	.val	_myp;	.scl	3;	.tag	_my;	.size	8;	.type	030;	.endef
.lcomm _myp,4
