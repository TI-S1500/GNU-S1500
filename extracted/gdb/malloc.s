#NO_APP
	.file	"malloc.c"
.text
	.def	_mhead;	.scl	10;	.type	010;	.size	12;	.endef
	.def	_mh_alloc;	.val	0;	.scl	8;	.type	02;	.endef
	.def	_mh_index;	.val	1;	.scl	8;	.type	02;	.endef
	.def	_mh_size;	.val	2;	.scl	8;	.type	015;	.endef
	.def	_mh_nbytes;	.val	4;	.scl	8;	.type	016;	.endef
	.def	_mh_magic4;	.val	8;	.scl	8;	.type	04;	.endef
	.def	.eos;	.val	12;	.scl	102;	.tag	_mhead;	.size	12;	.endef
	.def	_bfunc;	.scl	10;	.type	010;	.size	4;	.endef
	.def	_name;	.val	0;	.scl	8;	.type	0224;	.endef
	.def	.eos;	.val	4;	.scl	102;	.tag	_bfunc;	.size	4;	.endef
	.even
	.def	_malloc_init;	.val	_malloc_init;	.scl	2;	.type	044;	.endef
.globl _malloc_init
_malloc_init:
	.ln	1
	link a6,#0
	.def	.bf;	.val	.;	.scl	101;	.line	290;	.endef
	.def	_start;	.val	8;	.scl	9;	.type	022;	.endef
	.def	_warnfun;	.val	12;	.scl	9;	.type	0224;	.endef
	.def	_start;	.val	0;	.scl	4;	.type	022;	.endef
	movel a6@(8),d0
	.ln	4
	jeq L2
	.ln	5
	movel d0,_data_space_start
L2:
	.ln	6
	clrl _lim_data
	.ln	7
	clrl _warnlevel
	.ln	8
	movel a6@(12),_warnfunction
	.ln	9
	.def	.ef;	.val	.;	.scl	101;	.line	9;	.endef
	unlk a6
	rts
	.def	malloc_init;	.val	.;	.scl	-1;	.endef
	.even
	.def	_malloc_usable_size;	.val	_malloc_usable_size;	.scl	2;	.type	044;	.endef
.globl _malloc_usable_size
_malloc_usable_size:
	.ln	1
	link a6,#0
	.def	.bf;	.val	.;	.scl	101;	.line	305;	.endef
	.def	_mem;	.val	8;	.scl	9;	.type	022;	.endef
	.def	.bb;	.val	.;	.scl	100;	.line	1;	.endef
	.def	_blocksize;	.val	0;	.scl	4;	.type	04;	.endef
	.ln	3
	movel a6@(8),a0
	moveb a0@(-11),d1
	extbl d1
	moveq #8,d0
	asll d1,d0
	.ln	5
	moveq #-16,d2
	addl d2,d0
	.def	.eb;.val	.;	.scl	100;	.line	5;	.endef
	.ln	6
	.def	.ef;	.val	.;	.scl	101;	.line	6;	.endef
	unlk a6
	rts
	.def	malloc_usable_size;	.val	.;	.scl	-1;	.endef
.data
LC0:
	.ascii "Warning: past 75% of memory limit\0"
LC1:
	.ascii "Warning: past 85% of memory limit\0"
LC2:
	.ascii "Warning: past 95% of memory limit\0"
.text
	.even
	.def	_morecore;	.val	_morecore;	.scl	3;	.type	044;	.endef
_morecore:
	.ln	1
	link a6,#0
	moveml #0x1e20,sp@-
	.def	.bf;	.val	.;	.scl	101;	.line	314;	.endef
	.def	_nu;	.val	8;	.scl	9;	.type	04;	.endef
	.def	_nu;	.val	5;	.scl	4;	.type	04;	.endef
	movel a6@(8),d5
	.def	.bb;	.val	.;	.scl	100;	.line	1;	.endef
	.def	_cp;	.val	3;	.scl	4;	.type	022;	.endef
	.def	_nblks;	.val	4;	.scl	4;	.type	04;	.endef
	.def	_siz;	.val	2;	.scl	4;	.type	016;	.endef
	.ln	15
	tstl _data_space_start
	jne L5
	.ln	17
	movel #_etext,_data_space_start
L5:
	.ln	20
	tstl _lim_data
	jne L6
	.ln	21
	jbsr _get_lim_data
L6:
	.ln	24
	tstl _gotpool
	jne L7
	.ln	25
	lea _getpool,a2
	jbsr a2@
	jbsr a2@
	moveq #1,d6
	movel d6,_gotpool
L7:
	.ln	35
	clrl sp@-
	jbsr _sbrk
	movel d0,d3
	.ln	36
	movel d3,d2
	subl _data_space_start,d2
	.ln	37
	movel d2,_malloc_sbrk_used
	.ln	38
	movel _lim_data,d6
	subl d2,d6
	movel d6,_malloc_sbrk_unused
	.ln	40
	addqw #4,sp
	tstl _warnfunction
	jeq L8
	.ln	41
	movel _warnlevel,d0
	moveq #1,d6
	cmpl d0,d6
	jeq L12
	jlt L18
	tstl d0
	jeq L10
	jra L8
L18:
	moveq #2,d6
	cmpl d0,d6
	jeq L14
	jra L8
L10:
	.ln	44
	movel _lim_data,d0
	lsrl #2,d0
	movel d0,a1
	lea a1@(d0:l:2),a0
	cmpl d2,a0
	jcc L8
	.ln	46
	addql #1,_warnlevel
	.ln	47
	pea LC0
	.ln	49
	jra L26
L12:
	.ln	51
	movel _lim_data,d1
	moveq #20,d6
	divul d6,d1
	movel d1,d0
	asll #4,d0
	addl d1,d0
	cmpl d2,d0
	jcc L8
	.ln	53
	addql #1,_warnlevel
	.ln	54
	pea LC1
	.ln	56
	jra L26
L14:
	.ln	58
	movel _lim_data,d0
	moveq #20,d6
	divul d6,d0
	moveq #19,d6
	mulsl d6,d0
	cmpl d2,d0
	jcc L8
	.ln	60
	addql #1,_warnlevel
	.ln	61
	pea LC2
L26:
	movel _warnfunction,a0
	jbsr a0@
	addqw #4,sp
	.ln	63
L8:
	.ln	66
	movel d3,d0
	andl #1023,d0
	jeq L19
	.ln	67
	movel #1024,d6
	subl d0,d6
	movel d6,sp@-
	jbsr _sbrk
	addqw #4,sp
L19:
	.ln	72
	moveq #1,d4
	.ln	73
	movel d5,d2
	moveq #7,d6
	cmpl d2,d6
	jcs L20
	.ln	74
	moveq #8,d2
	moveq #8,d0
	subl d5,d0
	moveq #1,d4
	asll d0,d4
L20:
	.ln	76
	movel d2,d0
	addql #3,d0
	moveq #1,d6
	asll d0,d6
	movel d6,sp@-
	jbsr _sbrk
	movel d0,d3
	moveq #-1,d6
	cmpl d3,d6
	jeq L4
	.ln	77
	.ln	79
	moveq #7,d0
	andl d3,d0
	jeq L22
	.ln	81
	addql #8,d3
	moveq #-8,d6
	andl d6,d3
	.ln	82
	subql #1,d4
L22:
	.ln	87
	lea _nextf,a0
	movel d3,a0@(d5:l:4)
	.ln	88
	movel d5,d0
	addql #3,d0
	moveq #1,d2
	asll d0,d2
	.ln	89
	moveb d5,d1
L23:
	.ln	91
	movel d3,a1
	moveb #84,a1@
	.ln	92
	moveb d1,a1@(1)
	.ln	93
	subql #1,d4
	tstl d4
	jle L24
	.ln	94
	movel d3,d0
	addl d2,d0
	movel d0,a1@(4)
	.ln	95
	movel d0,d3
	jra L23
L24:
	.ln	97
	movel d3,a1
	clrl a1@(4)
	.def	.eb;.val	.;	.scl	100;	.line	97;	.endef
	.ln	104
L4:
	.def	.ef;	.val	.;	.scl	101;	.line	104;	.endef
	moveml a6@(-20),#0x478
	unlk a6
	rts
	.def	morecore;	.val	.;	.scl	-1;	.endef
	.even
	.def	_getpool;	.val	_getpool;	.scl	3;	.type	044;	.endef
_getpool:
	.ln	1
	link a6,#0
	moveml #0x30,sp@-
	.def	.bf;	.val	.;	.scl	101;	.line	421;	.endef
	.def	.bb;	.val	.;	.scl	100;	.line	1;	.endef
	.def	_nu;	.val	1;	.scl	4;	.type	04;	.endef
	.def	_cp;	.val	10;	.scl	4;	.type	022;	.endef
	.ln	4
	clrl sp@-
	lea _sbrk,a3
	jbsr a3@
	movel d0,a2
	.ln	6
	andl #1023,d0
	addqw #4,sp
	jeq L28
	.ln	7
	movel #1024,d2
	subl d0,d2
	movel d2,sp@-
	jbsr a3@
	addqw #4,sp
L28:
	.ln	10
	tstl __malloc_base
	jne L29
	.ln	11
	movel a2,__malloc_base
L29:
	.ln	15
	pea 2048:w
	jbsr _sbrk
	movel d0,a2
	.ln	16
	moveq #-1,d2
	cmpl a2,d2
	jeq L27
	.ln	17
	.ln	22
	lea _nextf,a0
	movel a0@,a2@(4)
	.ln	23
	movel a2,a0@
	.ln	24
	moveb #84,a2@
	.ln	25
	clrb a2@(1)
	.ln	26
	addqw #8,a2
	.ln	28
	clrl d1
	lea _nextf,a0
L34:
	.ln	30
	movel a0@(d1:l:4),a2@(4)
	.ln	31
	movel a2,a0@(d1:l:4)
	.ln	32
	moveb #84,a2@
	.ln	33
	moveb d1,a2@(1)
	.ln	34
	moveq #8,d0
	asll d1,d0
	addl d0,a2
	.ln	28
	addql #1,d1
	moveq #6,d2
	cmpl d1,d2
	jge L34
	.def	.eb;.val	.;	.scl	100;	.line	28;	.endef
	.ln	36
L27:
	.def	.ef;	.val	.;	.scl	101;	.line	36;	.endef
	moveml a6@(-8),#0xc00
	unlk a6
	rts
	.def	getpool;	.val	.;	.scl	-1;	.endef
.data
LC3:
	.ascii "block on free list clobbered\0"
LC4:
	.ascii "MALLOC someone requested 0x%x\12\0"
.text
	.even
	.def	_malloc;	.val	_malloc;	.scl	2;	.type	0142;	.endef
.globl _malloc
_malloc:
	.ln	1
	link a6,#0
	moveml #0x1c20,sp@-
	.def	.bf;	.val	.;	.scl	101;	.line	460;	.endef
	.def	_n;	.val	8;	.scl	9;	.type	016;	.endef
	.def	_n;	.val	5;	.scl	4;	.type	016;	.endef
	movel a6@(8),d5
	.def	.bb;	.val	.;	.scl	100;	.line	1;	.endef
	.def	_p;	.val	10;	.scl	4;	.tag	_mhead;	.size	12;	.type	030;	.endef
	.def	_nbytes;	.val	4;	.scl	4;	.type	016;	.endef
	.def	_nunits;	.val	3;	.scl	4;	.type	04;	.endef
	.ln	5
	clrl d3
	.ln	9
	moveq #19,d4
	addl d5,d4
	moveq #-4,d1
	andl d1,d4
	.def	.bb;	.val	.;	.scl	100;	.line	9;	.endef
	.def	_shiftr;	.val	0;	.scl	4;	.type	016;	.endef
	.ln	11
	movel d4,d0
	subql #1,d0
	.ln	13
	lsrl #3,d0
	jeq L49
L38:
	.ln	14
	addql #1,d3
	lsrl #1,d0
	jne L38
L49:
	.def	.eb;.val	.;	.scl	100;	.line	14;	.endef
	.ln	21
	lea _busy,a0
	tstb a0@(d3:l)
	jeq L48
	lea _busy,a0
L41:
	addql #1,d3
	tstb a0@(d3:l)
	jne L41
L48:
	.ln	22
	lea _busy,a0
	moveb #1,a0@(d3:l)
	.ln	26
	lea _nextf,a0
	tstl a0@(d3:l:4)
	jne L42
	.ln	27
	movel d3,sp@-
	jbsr _morecore
	addqw #4,sp
L42:
	.ln	30
	lea _nextf,a0
	movel a0@(d3:l:4),a2
	tstl a2
	jne L43
	.ln	32
	lea _busy,a0
	clrb a0@(d3:l)
	.ln	33
	clrl d0
	jra L35
L43:
	.ln	35
	lea _nextf,a0
	movel a2@(4),a0@(d3:l:4)
	.ln	36
	lea _busy,a0
	clrb a0@(d3:l)
	.ln	41
	cmpb #84,a2@
	jne L45
	moveb a2@(1),d0
	extbl d0
	cmpl d0,d3
	jeq L44
L45:
	.ln	43
	pea LC3
	jbsr _fatal
	addqw #4,sp
L44:
	.ln	49
	moveb #-9,a2@
	.ln	51
	movel d5,a2@(4)
	.ln	52
	movel #1431655765,a2@(8)
	.def	.bb;	.val	.;	.scl	100;	.line	52;	.endef
	.def	_m;	.val	8;	.scl	4;	.type	022;	.endef
	.ln	54
	lea a2@(12,d5:l),a0
	.ln	56
	moveb #85,a0@+
	moveb #85,a0@+
	moveb #85,a0@+
	moveb #85,a0@
	.def	.eb;.val	.;	.scl	100;	.line	56;	.endef
	.ln	62
	movel d3,d0
	asll #2,d0
	lea _nmalloc,a0
	addl d0,a0
	addql #1,a0@
	.ln	63
	addql #1,_nmal
	.ln	66
	tstl a2
	jeq L47
	moveq #12,d0
	addl a2,d0
	jne L46
L47:
	.def	.bb;	.val	.;	.scl	100;	.line	66;	.endef
	.ln	67
	movel d4,sp@-
	pea LC4
	jbsr _printf
	.ln	68
	jbsr _abort
	.def	.eb;.val	.;	.scl	100;	.line	68;	.endef
L46:
	.ln	71
	moveq #12,d0
	addl a2,d0
	.def	.eb;.val	.;	.scl	100;	.line	71;	.endef
	.ln	72
L35:
	.def	.ef;	.val	.;	.scl	101;	.line	72;	.endef
	moveml a6@(-16),#0x438
	unlk a6
	rts
	.def	malloc;	.val	.;	.scl	-1;	.endef
.data
LC5:
	.ascii "free: Called with already freed block argument\12\0"
LC6:
	.ascii "free: Called with bad argument\12\0"
LC7:
	.ascii "p\0"
LC8:
	.ascii "p\0"
LC9:
	.ascii "p\0"
LC10:
	.ascii "p\0"
LC11:
	.ascii "p\0"
LC12:
	.ascii "p\0"
.text
	.even
	.def	_free;	.val	_free;	.scl	2;	.type	044;	.endef
.globl _free
_free:
	.ln	1
	link a6,#0
	moveml #0x1030,sp@-
	.def	.bf;	.val	.;	.scl	101;	.line	534;	.endef
	.def	_mem;	.val	8;	.scl	9;	.type	022;	.endef
	movel a6@(8),a2
	.def	.bb;	.val	.;	.scl	100;	.line	1;	.endef
	.def	_p;	.val	11;	.scl	4;	.tag	_mhead;	.size	12;	.type	030;	.endef
	.def	.bb;	.val	.;	.scl	100;	.line	1;	.endef
	.def	_ap;	.val	10;	.scl	4;	.type	022;	.endef
	.ln	5
	.ln	7
	tstl a2
	jeq L50
	.ln	8
	.ln	10
	lea a2@(-12),a3
	.ln	11
	cmpb #-42,a3@
	jne L52
	.ln	13
	clrl d0
	movew a3@(2),d0
	subl d0,a2
	.ln	14
	lea a2@(-12),a3
L52:
	.ln	22
	cmpb #-9,a3@
	jeq L53
	.def	.bb;	.val	.;	.scl	100;	.line	22;	.endef
	.ln	24
	cmpb #84,a3@
	jne L54
	.ln	25
	pea LC5
	jra L68
L54:
	.ln	27
	pea LC6
L68:
	jbsr _fatal
	addqw #4,sp
	.def	.eb;.val	.;	.scl	100;	.line	27;	.endef
L53:
	.ln	30
	cmpl #1431655765,a3@(8)
	jeq L57
	pea LC7
	jbsr _fatal
	addqw #4,sp
L57:
	.ln	31
	addl a3@(4),a2
	.ln	32
	cmpb #85,a2@+
	jeq L59
	pea LC8
	jbsr _fatal
	addqw #4,sp
L59:
	cmpb #85,a2@+
	jeq L61
	pea LC9
	jbsr _fatal
	addqw #4,sp
L61:
	.ln	33
	cmpb #85,a2@+
	jeq L63
	pea LC10
	jbsr _fatal
	addqw #4,sp
L63:
	cmpb #85,a2@
	jeq L65
	pea LC11
	jbsr _fatal
	addqw #4,sp
L65:
	.def	.eb;.val	.;	.scl	100;	.line	33;	.endef
	.def	.bb;	.val	.;	.scl	100;	.line	33;	.endef
	.def	_nunits;	.val	3;	.scl	4;	.type	04;	.endef
	.ln	37
	moveb a3@(1),d3
	extbl d3
	.ln	39
	moveq #29,d1
	cmpl d3,d1
	jge L67
	pea LC12
	jbsr _fatal
L67:
	.ln	40
	moveb #84,a3@
	.ln	43
	lea _busy,a0
	moveb #1,a0@(d3:l)
	.ln	45
	lea _nextf,a1
	movel a1@(d3:l:4),a3@(4)
	.ln	46
	movel a3,a1@(d3:l:4)
	.ln	47
	clrb a0@(d3:l)
	.ln	50
	movel d3,d0
	asll #2,d0
	lea _nmalloc,a0
	addl d0,a0
	subql #1,a0@
	.ln	51
	addql #1,_nfre
	.def	.eb;.val	.;	.scl	100;	.line	51;	.endef
	.def	.eb;.val	.;	.scl	100;	.line	51;	.endef
	.ln	54
L50:
	.def	.ef;	.val	.;	.scl	101;	.line	54;	.endef
	moveml a6@(-12),#0xc08
	unlk a6
	rts
	.def	free;	.val	.;	.scl	-1;	.endef
.data
LC13:
	.ascii "p\0"
LC14:
	.ascii "p\0"
LC15:
	.ascii "p\0"
LC16:
	.ascii "p\0"
LC17:
	.ascii "p\0"
LC18:
	.ascii "p\0"
.text
	.even
	.def	_realloc;	.val	_realloc;	.scl	2;	.type	0142;	.endef
.globl _realloc
_realloc:
	.ln	1
	link a6,#0
	moveml #0x1e30,sp@-
	.def	.bf;	.val	.;	.scl	101;	.line	591;	.endef
	.def	_mem;	.val	8;	.scl	9;	.type	022;	.endef
	.def	_n;	.val	12;	.scl	9;	.type	016;	.endef
	.def	_mem;	.val	5;	.scl	4;	.type	022;	.endef
	.def	_n;	.val	3;	.scl	4;	.type	016;	.endef
	movel a6@(8),d5
	movel a6@(12),d3
	.def	.bb;	.val	.;	.scl	100;	.line	1;	.endef
	.def	_p;	.val	11;	.scl	4;	.tag	_mhead;	.size	12;	.type	030;	.endef
	.def	_tocopy;	.val	4;	.scl	4;	.type	016;	.endef
	.def	_nbytes;	.val	1;	.scl	4;	.type	016;	.endef
	.def	_nunits;	.val	6;	.scl	4;	.type	04;	.endef
	.ln	9
	movel d5,a3
	tstl d5
	jne L70
	.ln	10
	movel d3,sp@-
	jbsr _malloc
	jra L69
L70:
	.ln	11
	addw #-12,a3
	.ln	12
	moveb a3@(1),d6
	extbl d6
	.ln	13
	cmpb #-9,a3@
	jeq L72
	pea LC13
	jbsr _fatal
	addqw #4,sp
L72:
	.ln	15
	cmpl #1431655765,a3@(8)
	jeq L74
	pea LC14
	jbsr _fatal
	addqw #4,sp
L74:
	.def	.bb;	.val	.;	.scl	100;	.line	15;	.endef
	.def	_m;	.val	10;	.scl	4;	.type	022;	.endef
	.ln	17
	movel a3@(4),d4
	movel d5,a2
	addl d4,a2
	.ln	18
	cmpb #85,a2@+
	jeq L76
	pea LC15
	jbsr _fatal
	addqw #4,sp
L76:
	cmpb #85,a2@+
	jeq L78
	pea LC16
	jbsr _fatal
	addqw #4,sp
L78:
	.ln	19
	cmpb #85,a2@+
	jeq L80
	pea LC17
	jbsr _fatal
	addqw #4,sp
L80:
	cmpb #85,a2@
	jeq L82
	pea LC18
	jbsr _fatal
	addqw #4,sp
L82:
	.def	.eb;.val	.;	.scl	100;	.line	19;	.endef
	.ln	29
	moveq #23,d1
	addl d3,d1
	moveq #-8,d2
	andl d2,d1
	.ln	32
	moveq #4,d0
	asll d6,d0
	cmpl d1,d0
	jcc L83
	moveq #8,d0
	asll d6,d0
	cmpl d1,d0
	jcs L83
	.def	.bb;	.val	.;	.scl	100;	.line	32;	.endef
	.def	_m;	.val	8;	.scl	4;	.type	022;	.endef
	.ln	35
	movel d5,a0
	addl d4,a0
	.ln	36
	clrb a0@+
	clrb a0@+
	clrb a0@+
	clrb a0@
	.ln	37
	movel d3,a3@(4)
	.ln	38
	movel d5,a0
	addl d3,a0
	.ln	39
	moveb #85,a0@+
	moveb #85,a0@+
	moveb #85,a0@+
	moveb #85,a0@
	.ln	43
	movel d5,d0
	jra L69
	.def	.eb;.val	.;	.scl	100;	.line	43;	.endef
L83:
	.ln	46
	cmpl d3,d4
	jls L84
	.ln	47
	movel d3,d4
L84:
	.def	.bb;	.val	.;	.scl	100;	.line	47;	.endef
	.def	_new;	.val	3;	.scl	4;	.type	022;	.endef
	.ln	51
	movel d3,sp@-
	jbsr _malloc
	movel d0,d3
	addqw #4,sp
	jne L85
	.ln	52
	clrl d0
	jra L69
L85:
	.ln	53
	movel d4,sp@-
	movel d5,sp@-
	movel d3,sp@-
	jbsr _memcpy
	.ln	54
	movel d5,sp@-
	jbsr _free
	.ln	55
	movel d3,d0
	.def	.eb;.val	.;	.scl	100;	.line	55;	.endef
	.def	.eb;.val	.;	.scl	100;	.line	55;	.endef
	.ln	57
L69:
	.def	.ef;	.val	.;	.scl	101;	.line	57;	.endef
	moveml a6@(-24),#0xc78
	unlk a6
	rts
	.def	realloc;	.val	.;	.scl	-1;	.endef
	.even
	.def	_memalign;	.val	_memalign;	.scl	2;	.type	0142;	.endef
.globl _memalign
_memalign:
	.ln	1
	link a6,#0
	moveml #0x1800,sp@-
	.def	.bf;	.val	.;	.scl	101;	.line	653;	.endef
	.def	_alignment;	.val	8;	.scl	9;	.type	016;	.endef
	.def	_size;	.val	12;	.scl	9;	.type	016;	.endef
	.def	_alignment;	.val	3;	.scl	4;	.type	016;	.endef
	movel a6@(8),d3
	.def	.bb;	.val	.;	.scl	100;	.line	1;	.endef
	.def	_ptr;	.val	2;	.scl	4;	.type	022;	.endef
	.def	_aligned;	.val	0;	.scl	4;	.type	022;	.endef
	.def	_p;	.val	8;	.scl	4;	.tag	_mhead;	.size	12;	.type	030;	.endef
	.ln	3
	movel a6@(12),d4
	addl d3,d4
	movel d4,sp@-
	jbsr _malloc
	movel d0,d2
	.ln	7
	jne L87
	.ln	8
	clrl d0
	jra L86
L87:
	.ln	10
	movel d3,d0
	subql #1,d0
	andl d2,d0
	jne L88
	.ln	11
	movel d2,d0
	jra L86
L88:
	.ln	13
	movel d2,a1
	lea a1@(-1,d3:l),a1
	movel a1,d0
	movel d3,d1
	negl d1
	andl d1,d0
	.ln	17
	moveq #-12,d4
	addl d0,d4
	movel d4,a0
	.ln	18
	movew d0,d4
	subw d2,d4
	movew d4,a0@(2)
	.ln	19
	moveb #-42,a0@
	.ln	20
	.def	.eb;.val	.;	.scl	100;	.line	20;	.endef
	.ln	21
L86:
	.def	.ef;	.val	.;	.scl	101;	.line	21;	.endef
	moveml a6@(-8),#0x18
	unlk a6
	rts
	.def	memalign;	.val	.;	.scl	-1;	.endef
	.even
	.def	_valloc;	.val	_valloc;	.scl	2;	.type	0142;	.endef
.globl _valloc
_valloc:
	.ln	1
	link a6,#0
	.def	.bf;	.val	.;	.scl	101;	.line	680;	.endef
	.def	_size;	.val	8;	.scl	9;	.type	04;	.endef
	.ln	2
	movel a6@(8),sp@-
	pea 1024:w
	jbsr _memalign
	.ln	3
	.def	.ef;	.val	.;	.scl	101;	.line	3;	.endef
	unlk a6
	rts
	.def	valloc;	.val	.;	.scl	-1;	.endef
	.def	_mstats_value;	.scl	10;	.type	010;	.size	12;	.endef
	.def	_blocksize;	.val	0;	.scl	8;	.type	04;	.endef
	.def	_nfree;	.val	4;	.scl	8;	.type	04;	.endef
	.def	_nused;	.val	8;	.scl	8;	.type	04;	.endef
	.def	.eos;	.val	12;	.scl	102;	.tag	_mstats_value;	.size	12;	.endef
	.even
	.def	_malloc_stats;	.val	_malloc_stats;	.scl	2;	.tag	_mstats_value;	.size	12;	.type	050;	.endef
.globl _malloc_stats
_malloc_stats:
	.ln	1
	link a6,#-12
	movel a2,sp@-
	.def	.bf;	.val	.;	.scl	101;	.line	698;	.endef
	.def	_size;	.val	8;	.scl	9;	.type	04;	.endef
	.def	_size;	.val	1;	.scl	4;	.type	04;	.endef
	movel a1,a2
	movel a6@(8),d1
	.def	.bb;	.val	.;	.scl	100;	.line	1;	.endef
	.def	_v;	.val	-12;	.scl	1;	.tag	_mstats_value;	.size	12;	.type	010;	.endef
	.def	_p;	.val	8;	.scl	4;	.tag	_mhead;	.size	12;	.type	030;	.endef
	.ln	7
	clrl a6@(-8)
	.ln	9
	tstl d1
	jlt L92
	moveq #29,d2
	cmpl d1,d2
	jge L91
L92:
	.ln	11
	clrl a6@(-12)
	.ln	12
	clrl a6@(-4)
	.ln	13
	jra L97
L91:
	.ln	16
	movel d1,d0
	addql #3,d0
	moveq #1,d2
	asll d0,d2
	movel d2,a6@(-12)
	.ln	17
	lea _nmalloc,a0
	movel a0@(d1:l:4),a6@(-4)
	.ln	19
	lea _nextf,a0
	movel a0@(d1:l:4),a0
	tstl a0
	jeq L97
L96:
	.ln	20
	addql #1,a6@(-8)
	.ln	19
	movel a0@(4),a0
	tstl a0
	jne L96
L97:
	.ln	22
	lea a6@(-12),a0
	movel a0@+,a2@
	lea a2@(4),a1
	movel a0@+,a1@+
	movel a0@,a1@
	.def	.eb;.val	.;	.scl	100;	.line	22;	.endef
	.ln	23
	movel a2,d0
	.def	.ef;	.val	.;	.scl	101;	.line	23;	.endef
	movel a6@(-16),a2
	unlk a6
	rts
	.def	malloc_stats;	.val	.;	.scl	-1;	.endef
	.even
	.def	_malloc_mem_used;	.val	_malloc_mem_used;	.scl	2;	.type	044;	.endef
.globl _malloc_mem_used
_malloc_mem_used:
	.ln	1
	link a6,#0
	moveml #0x1800,sp@-
	.def	.bf;	.val	.;	.scl	101;	.line	723;	.endef
	.def	.bb;	.val	.;	.scl	100;	.line	1;	.endef
	.def	_i;	.val	2;	.scl	4;	.type	04;	.endef
	.def	_size_used;	.val	3;	.scl	4;	.type	04;	.endef
	.ln	5
	clrl d3
	.ln	7
	clrl d2
	lea _nmalloc,a0
L102:
	.def	.bb;	.val	.;	.scl	100;	.line	7;	.endef
	.ln	9
	movel d2,d1
	addql #3,d1
	moveq #1,d0
	asll d1,d0
	.ln	12
	mulsl a0@(d2:l:4),d0
	addl d0,d3
	.def	.eb;.val	.;	.scl	100;	.line	12;	.endef
	.ln	7
	addql #1,d2
	moveq #29,d4
	cmpl d2,d4
	jge L102
	.ln	15
	movel d3,d0
	.def	.eb;.val	.;	.scl	100;	.line	15;	.endef
	.ln	16
	.def	.ef;	.val	.;	.scl	101;	.line	16;	.endef
	moveml a6@(-8),#0x18
	unlk a6
	rts
	.def	malloc_mem_used;	.val	.;	.scl	-1;	.endef
	.even
	.def	_malloc_mem_free;	.val	_malloc_mem_free;	.scl	2;	.type	044;	.endef
.globl _malloc_mem_free
_malloc_mem_free:
	.ln	1
	link a6,#0
	moveml #0x1800,sp@-
	.def	.bf;	.val	.;	.scl	101;	.line	742;	.endef
	.def	.bb;	.val	.;	.scl	100;	.line	1;	.endef
	.def	_i;	.val	1;	.scl	4;	.type	04;	.endef
	.def	_size_unused;	.val	2;	.scl	4;	.type	04;	.endef
	.ln	5
	clrl d2
	.ln	7
	clrl d1
	lea _nextf,a1
L111:
	.def	.bb;	.val	.;	.scl	100;	.line	7;	.endef
	.def	_allocation_size;	.val	3;	.scl	4;	.type	04;	.endef
	.def	_p;	.val	8;	.scl	4;	.tag	_mhead;	.size	12;	.type	030;	.endef
	.ln	9
	movel d1,d0
	addql #3,d0
	moveq #1,d3
	asll d0,d3
	.ln	12
	movel a1@(d1:l:4),a0
	tstl a0
	jeq L112
L110:
	.ln	13
	addl d3,d2
	.ln	12
	movel a0@(4),a0
	tstl a0
	jne L110
L112:
	.def	.eb;.val	.;	.scl	100;	.line	12;	.endef
	.ln	7
	addql #1,d1
	moveq #29,d4
	cmpl d1,d4
	jge L111
	.ln	16
	movel d2,d0
	.def	.eb;.val	.;	.scl	100;	.line	16;	.endef
	.ln	17
	.def	.ef;	.val	.;	.scl	101;	.line	17;	.endef
	moveml a6@(-8),#0x18
	unlk a6
	rts
	.def	malloc_mem_free;	.val	.;	.scl	-1;	.endef
	.even
	.def	_get_lim_data;	.val	_get_lim_data;	.scl	2;	.type	044;	.endef
.globl _get_lim_data
_get_lim_data:
	.ln	1
	link a6,#0
	.def	.bf;	.val	.;	.scl	101;	.line	771;	.endef
	.def	.bb;	.val	.;	.scl	100;	.line	1;	.endef
	.ln	7
	clrl sp@-
	pea 3:w
	jbsr _ulimit
	movel d0,_lim_data
	.ln	10
	movel _data_space_start,d1
	subl d1,_lim_data
	.def	.eb;.val	.;	.scl	100;	.line	10;	.endef
	.ln	11
	.def	.ef;	.val	.;	.scl	101;	.line	11;	.endef
	unlk a6
	rts
	.def	get_lim_data;	.val	.;	.scl	-1;	.endef
	.def	__malloc_base;	.val	__malloc_base;	.scl	2;	.type	022;	.endef
.comm __malloc_base,4
	.def	_gotpool;	.val	_gotpool;	.scl	3;	.type	04;	.endef
.lcomm _gotpool,4
	.def	_warnfunction;	.val	_warnfunction;	.scl	3;	.type	0224;	.endef
.lcomm _warnfunction,4
	.def	_warnlevel;	.val	_warnlevel;	.scl	3;	.type	04;	.endef
.lcomm _warnlevel,4
	.def	_lim_data;	.val	_lim_data;	.scl	3;	.type	016;	.endef
.lcomm _lim_data,4
	.def	_busy;	.val	_busy;	.scl	3;	.dim	30;	.size	30;	.type	062;	.endef
.lcomm _busy,30
	.def	_nextf;	.val	_nextf;	.scl	3;	.tag	_mhead;	.size	12;	.dim	30;	.size	120;	.type	0170;	.endef
.lcomm _nextf,120
	.def	_nfre;	.val	_nfre;	.scl	3;	.type	04;	.endef
.lcomm _nfre,4
	.def	_nmal;	.val	_nmal;	.scl	3;	.type	04;	.endef
.lcomm _nmal,4
	.def	_nmalloc;	.val	_nmalloc;	.scl	3;	.dim	30;	.size	120;	.type	064;	.endef
.lcomm _nmalloc,120
	.def	_data_space_start;	.val	_data_space_start;	.scl	3;	.type	022;	.endef
.lcomm _data_space_start,4
	.def	_malloc_sbrk_unused;	.val	_malloc_sbrk_unused;	.scl	2;	.type	016;	.endef
.comm _malloc_sbrk_unused,4
	.def	_malloc_sbrk_used;	.val	_malloc_sbrk_used;	.scl	2;	.type	016;	.endef
.comm _malloc_sbrk_used,4
