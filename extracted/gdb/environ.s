#NO_APP
	.file	"environ.c"
.text
	.def	_environ;	.scl	10;	.type	010;	.size	8;	.endef
	.def	_allocated;	.val	0;	.scl	8;	.type	04;	.endef
	.def	_vector;	.val	4;	.scl	8;	.type	0122;	.endef
	.def	.eos;	.val	8;	.scl	102;	.tag	_environ;	.size	8;	.endef
	.even
	.def	_make_environ;	.val	_make_environ;	.scl	2;	.tag	_environ;	.size	8;	.type	0150;	.endef
.globl _make_environ
_make_environ:
	.ln	1
	link a6,#0
	movel a2,sp@-
	.def	.bf;	.val	.;	.scl	101;	.line	112;	.endef
	.def	.bb;	.val	.;	.scl	100;	.line	1;	.endef
	.def	_e;	.val	10;	.scl	4;	.tag	_environ;	.size	8;	.type	030;	.endef
	.ln	4
	pea 8:w
	jbsr _xmalloc
	movel d0,a2
	.ln	6
	moveq #10,d1
	movel d1,a2@
	.ln	7
	movel d1,d0
	addql #1,d0
	asll #2,d0
	movel d0,sp@-
	jbsr _xmalloc
	movel d0,d0
	movel d0,a2@(4)
	.ln	8
	movel a2@(4),a0
	clrl a0@
	.ln	9
	movel a2,d0
	jra L1
	.def	.eb;.val	.;	.scl	100;	.line	9;	.endef
	.ln	10
L1:
	.def	.ef;	.val	.;	.scl	101;	.line	10;	.endef
	movel a6@(-4),a2
	unlk a6
	rts
	.def	make_environ;	.val	.;	.scl	-1;	.endef
	.even
	.def	_free_environ;	.val	_free_environ;	.scl	2;	.type	044;	.endef
.globl _free_environ
_free_environ:
	.ln	1
	link a6,#0
	moveml #0x30,sp@-
	.def	.bf;	.val	.;	.scl	101;	.line	127;	.endef
	.def	_e;	.val	8;	.scl	9;	.tag	_environ;	.size	8;	.type	030;	.endef
	.def	_e;	.val	10;	.scl	4;	.tag	_environ;	.size	8;	.type	030;	.endef
	movel a6@(8),a2
	.def	.bb;	.val	.;	.scl	100;	.line	1;	.endef
	.def	_vector;	.val	11;	.scl	4;	.type	0122;	.endef
	.ln	3
	movel a2@(4),a3
	.ln	5
L3:
	tstl a3@
	jeq L4
	.ln	6
	movel a3@,d0
	addqw #4,a3
	movel d0,sp@-
	jbsr _free
	addqw #4,sp
	jra L3
L4:
	.ln	8
	movel a2,sp@-
	jbsr _free
	.def	.eb;.val	.;	.scl	100;	.line	8;	.endef
	.ln	9
L2:
	.def	.ef;	.val	.;	.scl	101;	.line	9;	.endef
	moveml a6@(-8),#0xc00
	unlk a6
	rts
	.def	free_environ;	.val	.;	.scl	-1;	.endef
	.even
	.def	_init_environ;	.val	_init_environ;	.scl	2;	.type	044;	.endef
.globl _init_environ
_init_environ:
	.ln	1
	link a6,#0
	moveml #0x1c20,sp@-
	.def	.bf;	.val	.;	.scl	101;	.line	143;	.endef
	.def	_e;	.val	8;	.scl	9;	.tag	_environ;	.size	8;	.type	030;	.endef
	.def	_e;	.val	10;	.scl	4;	.tag	_environ;	.size	8;	.type	030;	.endef
	movel a6@(8),a2
	.def	.bb;	.val	.;	.scl	100;	.line	1;	.endef
	.def	_i;	.val	3;	.scl	4;	.type	04;	.endef
	.ln	6
	clrl d3
L6:
	movel d3,d0
	asll #2,d0
	movel _environ,a0
	tstl a0@(d0:l)
	jeq L7
L8:
	addql #1,d3
	jra L6
L7:
	.ln	8
	cmpl a2@,d3
	jle L9
	.def	.bb;	.val	.;	.scl	100;	.line	8;	.endef
	.ln	10
	moveq #10,d0
	addl a2@,d0
	cmpl d3,d0
	jge L10
	movel d3,a2@
	jra L11
L10:
	moveq #10,d1
	addl d1,a2@
L11:
	.ln	12
	movel a2@,d0
	addql #1,d0
	asll #2,d0
	movel d0,sp@-
	movel a2@(4),sp@-
	jbsr _xrealloc
	movel d0,d0
	movel d0,a2@(4)
	.def	.eb;.val	.;	.scl	100;	.line	12;	.endef
	addqw #8,sp
L9:
	.ln	15
	movel d3,d0
	addql #1,d0
	asll #2,d0
	movel d0,sp@-
	movel a2@(4),sp@-
	movel _environ,sp@-
	jbsr _bcopy
	.ln	17
	addw #12,sp
L12:
	subql #1,d3
	tstl d3
	jlt L13
	.def	.bb;	.val	.;	.scl	100;	.line	17;	.endef
	.def	_len;	.val	4;	.scl	4;	.type	04;	.endef
	.def	_new;	.val	5;	.scl	4;	.type	022;	.endef
	.ln	19
	movel d3,d0
	asll #2,d0
	movel a2@(4),a0
	movel a0@(d0:l),sp@-
	jbsr _strlen
	movel d0,d4
	.ln	20
	movel d4,d0
	addql #1,d0
	movel d0,sp@-
	jbsr _xmalloc
	movel d0,d5
	.ln	21
	movel d4,sp@-
	movel d5,sp@-
	movel d3,d0
	asll #2,d0
	movel a2@(4),a0
	movel a0@(d0:l),sp@-
	jbsr _bcopy
	.ln	22
	movel d3,d0
	asll #2,d0
	movel a2@(4),a0
	movel d5,a0@(d0:l)
	.def	.eb;.val	.;	.scl	100;	.line	22;	.endef
	addw #20,sp
	jra L12
L13:
	.def	.eb;.val	.;	.scl	100;	.line	22;	.endef
	.ln	24
L5:
	.def	.ef;	.val	.;	.scl	101;	.line	24;	.endef
	moveml a6@(-16),#0x438
	unlk a6
	rts
	.def	init_environ;	.val	.;	.scl	-1;	.endef
	.even
	.def	_environ_vector;	.val	_environ_vector;	.scl	2;	.type	0542;	.endef
.globl _environ_vector
_environ_vector:
	.ln	1
	link a6,#0
	.def	.bf;	.val	.;	.scl	101;	.line	173;	.endef
	.def	_e;	.val	8;	.scl	9;	.tag	_environ;	.size	8;	.type	030;	.endef
	.ln	3
	movel a6@(8),a0
	movel a0@(4),d0
	jra L14
	.ln	4
L14:
	.def	.ef;	.val	.;	.scl	101;	.line	4;	.endef
	unlk a6
	rts
	.def	environ_vector;	.val	.;	.scl	-1;	.endef
	.even
	.def	_get_in_environ;	.val	_get_in_environ;	.scl	2;	.type	0142;	.endef
.globl _get_in_environ
_get_in_environ:
	.ln	1
	link a6,#0
	moveml #0x1030,sp@-
	.def	.bf;	.val	.;	.scl	101;	.line	182;	.endef
	.def	_e;	.val	8;	.scl	9;	.tag	_environ;	.size	8;	.type	030;	.endef
	.def	_var;	.val	12;	.scl	9;	.type	022;	.endef
	.def	.bb;	.val	.;	.scl	100;	.line	1;	.endef
	.def	_len;	.val	3;	.scl	4;	.type	04;	.endef
	.def	_vector;	.val	10;	.scl	4;	.type	0122;	.endef
	.def	_s;	.val	11;	.scl	4;	.type	022;	.endef
	.ln	4
	movel a6@(12),sp@-
	jbsr _strlen
	movel d0,d3
	.ln	5
	movel a6@(8),a0
	movel a0@(4),a2
	.ln	8
	addqw #4,sp
L16:
	movel a2@,a3
	tstl a3
	jeq L17
	.ln	10
	movel d3,sp@-
	movel a6@(12),sp@-
	movel a3,sp@-
	jbsr _strncmp
	movel d0,d0
	addw #12,sp
	tstl d0
	jne L19
	cmpb #61,a3@(d3:l)
	jne L19
	.ln	11
	movel d3,d0
	addql #1,d0
	addl a3,d0
	jra L15
L19:
	.ln	8
L18:
	addqw #4,a2
	jra L16
L17:
	.ln	13
	clrl d0
	jra L15
	.def	.eb;.val	.;	.scl	100;	.line	13;	.endef
	.ln	14
L15:
	.def	.ef;	.val	.;	.scl	101;	.line	14;	.endef
	moveml a6@(-12),#0xc08
	unlk a6
	rts
	.def	get_in_environ;	.val	.;	.scl	-1;	.endef
.data
LC0:
	.ascii "=\0"
.text
	.even
	.def	_set_in_environ;	.val	_set_in_environ;	.scl	2;	.type	044;	.endef
.globl _set_in_environ
_set_in_environ:
	.ln	1
	link a6,#0
	moveml #0x1830,sp@-
	.def	.bf;	.val	.;	.scl	101;	.line	201;	.endef
	.def	_e;	.val	8;	.scl	9;	.tag	_environ;	.size	8;	.type	030;	.endef
	.def	_var;	.val	12;	.scl	9;	.type	022;	.endef
	.def	_value;	.val	16;	.scl	9;	.type	022;	.endef
	.def	.bb;	.val	.;	.scl	100;	.line	1;	.endef
	.def	_i;	.val	3;	.scl	4;	.type	04;	.endef
	.def	_len;	.val	4;	.scl	4;	.type	04;	.endef
	.def	_vector;	.val	10;	.scl	4;	.type	0122;	.endef
	.def	_s;	.val	11;	.scl	4;	.type	022;	.endef
	.ln	6
	movel a6@(12),sp@-
	jbsr _strlen
	movel d0,d4
	.ln	7
	movel a6@(8),a0
	movel a0@(4),a2
	.ln	10
	clrl d3
	addqw #4,sp
L21:
	movel a2@(d3:l:4),a3
	tstl a3
	jeq L22
	.ln	12
	movel d4,sp@-
	movel a6@(12),sp@-
	movel a3,sp@-
	jbsr _strncmp
	movel d0,d0
	addw #12,sp
	tstl d0
	jne L24
	cmpb #61,a3@(d4:l)
	jne L24
	.ln	13
	jra L22
L24:
	.ln	10
L23:
	addql #1,d3
	jra L21
L22:
	.ln	15
	tstl a3
	jne L25
	.ln	17
	movel a6@(8),a0
	cmpl a0@,d3
	jne L26
	.def	.bb;	.val	.;	.scl	100;	.line	17;	.endef
	.ln	19
	movel a6@(8),d0
	movel d0,a0
	moveq #10,d1
	addl d1,a0@
	.ln	21
	movel a6@(8),a0
	movel a0@,d0
	addql #1,d0
	asll #2,d0
	movel d0,sp@-
	movel a2,sp@-
	jbsr _xrealloc
	movel d0,a2
	.ln	22
	movel a6@(8),a0
	movel a2,a0@(4)
	.def	.eb;.val	.;	.scl	100;	.line	22;	.endef
	addqw #8,sp
L26:
	.ln	24
	clrl a2@(4,d3:l:4)
	jra L27
L25:
	.ln	27
	movel a3,sp@-
	jbsr _free
	addqw #4,sp
L27:
	.ln	29
	movel a6@(16),sp@-
	jbsr _strlen
	movel d0,d0
	addl d4,d0
	addql #2,d0
	movel d0,sp@-
	jbsr _xmalloc
	movel d0,a3
	.ln	30
	movel a6@(12),sp@-
	movel a3,sp@-
	jbsr _strcpy
	.ln	31
	pea LC0
	movel a3,sp@-
	jbsr _strcat
	.ln	32
	movel a6@(16),sp@-
	movel a3,sp@-
	jbsr _strcat
	.ln	33
	movel a3,a2@(d3:l:4)
	.ln	34
	jra L20
	.def	.eb;.val	.;	.scl	100;	.line	34;	.endef
	.ln	35
L20:
	.def	.ef;	.val	.;	.scl	101;	.line	35;	.endef
	moveml a6@(-16),#0xc18
	unlk a6
	rts
	.def	set_in_environ;	.val	.;	.scl	-1;	.endef
	.even
	.def	_unset_in_environ;	.val	_unset_in_environ;	.scl	2;	.type	044;	.endef
.globl _unset_in_environ
_unset_in_environ:
	.ln	1
	link a6,#0
	moveml #0x1030,sp@-
	.def	.bf;	.val	.;	.scl	101;	.line	241;	.endef
	.def	_e;	.val	8;	.scl	9;	.tag	_environ;	.size	8;	.type	030;	.endef
	.def	_var;	.val	12;	.scl	9;	.type	022;	.endef
	.def	.bb;	.val	.;	.scl	100;	.line	1;	.endef
	.def	_len;	.val	3;	.scl	4;	.type	04;	.endef
	.def	_vector;	.val	10;	.scl	4;	.type	0122;	.endef
	.def	_s;	.val	11;	.scl	4;	.type	022;	.endef
	.ln	4
	movel a6@(12),sp@-
	jbsr _strlen
	movel d0,d3
	.ln	5
	movel a6@(8),a0
	movel a0@(4),a2
	.ln	8
	addqw #4,sp
L29:
	movel a2@,a3
	tstl a3
	jeq L30
	.ln	10
	movel d3,sp@-
	movel a6@(12),sp@-
	movel a3,sp@-
	jbsr _strncmp
	movel d0,d0
	addw #12,sp
	tstl d0
	jne L32
	cmpb #61,a3@(d3:l)
	jne L32
	.def	.bb;	.val	.;	.scl	100;	.line	10;	.endef
	.ln	12
	movel a3,sp@-
	jbsr _free
	.ln	14
	movel a6@(8),a0
	movel a6@(8),a1
	movel a2,d0
	subl a1@(4),d0
	asrl #2,d0
	subl a0@,d0
	negl d0
	asll #2,d0
	movel d0,sp@-
	movel a2,sp@-
	movel a2,d0
	addql #4,d0
	movel d0,sp@-
	jbsr _bcopy
	.ln	15
	movel a6@(8),a0
	movel a6@(8),a1
	movel a1@,d0
	asll #2,d0
	addl a0@(4),d0
	movel d0,a0
	subqw #4,a0
	clrl a0@
	.ln	16
	jra L28
	.def	.eb;.val	.;	.scl	100;	.line	16;	.endef
L32:
	.ln	8
L31:
	addqw #4,a2
	jra L29
L30:
	.def	.eb;.val	.;	.scl	100;	.line	8;	.endef
	.ln	18
L28:
	.def	.ef;	.val	.;	.scl	101;	.line	18;	.endef
	moveml a6@(-12),#0xc08
	unlk a6
	rts
	.def	unset_in_environ;	.val	.;	.scl	-1;	.endef
