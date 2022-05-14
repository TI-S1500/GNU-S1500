#NO_APP
	.file	"st1.c"
.text
	.def	_ii;	.val	_ii;	.scl	2;	.type	04;	.endef
.globl _ii
.data
	.even
_ii:
	.long 2
LC0:
	.ascii "ii is %i\12\0"
.text
	.even
	.def	_main;	.val	_main;	.scl	2;	.type	044;	.endef
.globl _main
_main:
	.ln	1
	link a6,#0
	.def	.bf;	.val	.;	.scl	101;	.line	4;	.endef
	.def	.bb;	.val	.;	.scl	100;	.line	1;	.endef
	.ln	2
	movel _ii,sp@-
	pea LC0
	jbsr _printf
	.def	.eb;.val	.;	.scl	100;	.line	2;	.endef
	.ln	3
L1:
	.def	.ef;	.val	.;	.scl	101;	.line	3;	.endef
	unlk a6
	rts
	.def	main;	.val	.;	.scl	-1;	.endef
