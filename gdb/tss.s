#NO_APP
	.file	"tss.c"
.text
	.def	_FILE;	.scl	10;	.type	010;	.size	14;	.endef
	.def	__cnt;	.val	0;	.scl	8;	.type	04;	.endef
	.def	__ptr;	.val	4;	.scl	8;	.type	034;	.endef
	.def	__base;	.val	8;	.scl	8;	.type	034;	.endef
	.def	__flag;	.val	12;	.scl	8;	.type	02;	.endef
	.def	__file;	.val	13;	.scl	8;	.type	02;	.endef
	.def	.eos;	.val	14;	.scl	102;	.tag	_FILE;	.size	14;	.endef
	.def	_FILE;	.scl	13;	.tag	_FILE;	.size	14;	.type	010;	.endef
.data
LC0:
	.ascii "hello\0"
	.align 2
_hello.0:
	.long LC0
_goodbye.1:
	.ascii "goodbye\0"
.lcomm _static_integer.2,4
LC1:
	.ascii "xyz\0"
LC2:
	.ascii "the static char is %s\12\0"
LC3:
	.ascii "the static char is %s\12\0"
LC4:
	.ascii "the static char is %i\12\0"
LC5:
	.ascii "the static char is %s\12\0"
.text
	.even
	.def	_main;	.val	_main;	.scl	2;	.type	044;	.endef
.globl _main
_main:
	.ln	1
	link a6,#-4
	.def	.bf;	.val	.;	.scl	101;	.line	5;	.endef
	.def	.bb;	.val	.;	.scl	100;	.line	1;	.endef
	.def	_hello;	.val	_hello.0;	.scl	3;	.type	022;	.endef
	.def	_goodbye;	.val	_goodbye.1;	.scl	3;	.dim	8;	.size	8;	.type	062;	.endef
	.def	_static_integer;	.val	_static_integer.2;	.scl	3;	.type	04;	.endef
	.def	_xyz;	.val	-4;	.scl	1;	.dim	4;	.size	4;	.type	062;	.endef
	movel a6,d0
	subql #4,d0
	movel d0,d0
	.ln	5
	lea LC1,a0
	lea a6@(-4),a1
	moveb a0@,a1@
	addqw #1,a1
	addqw #1,a0
	moveb a0@,a1@
	addqw #1,a1
	addqw #1,a0
	moveb a0@,a1@
	addqw #1,a1
	addqw #1,a0
	moveb a0@,a1@
	addqw #1,a1
	addqw #1,a0
	.ln	7
	moveq #10,d1
	movel d1,_static_integer.2
	.ln	8
	movel _hello.0,sp@-
	pea LC2
	jbsr _printf
	.ln	9
	pea _goodbye.1
	pea LC3
	jbsr _printf
	.ln	10
	movel _static_integer.2,sp@-
	pea LC4
	jbsr _printf
	.ln	11
	movel a6,d0
	subql #4,d0
	movel d0,sp@-
	pea LC5
	jbsr _printf
	.def	.eb;.val	.;	.scl	100;	.line	11;	.endef
	.ln	12
L1:
	.def	.ef;	.val	.;	.scl	101;	.line	12;	.endef
	unlk a6
	rts
	.def	main;	.val	.;	.scl	-1;	.endef
