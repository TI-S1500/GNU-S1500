#NO_APP
	.file	"init.c"
.text
	.even
	.def	_initialize_all_files;	.val	_initialize_all_files;	.scl	2;	.type	044;	.endef
.globl _initialize_all_files
_initialize_all_files:
	.ln	1
	link a6,#0
	.def	.bf;	.val	.;	.scl	101;	.line	2;	.endef
	.def	.bb;	.val	.;	.scl	100;	.line	1;	.endef
	.ln	2
	jbsr __initialize_blockframe
	.ln	3
	jbsr __initialize_breakpoint
	.ln	4
	jbsr __initialize_stack
	.ln	5
	jbsr __initialize_source
	.ln	6
	jbsr __initialize_values
	.ln	7
	jbsr __initialize_valprint
	.ln	8
	jbsr __initialize_printcmd
	.ln	9
	jbsr __initialize_symtab
	.ln	10
	jbsr __initialize_symmisc
	.ln	11
	jbsr __initialize_coff
	.ln	12
	jbsr __initialize_infcmd
	.ln	13
	jbsr __initialize_infrun
	.ln	14
	jbsr __initialize_command
	.ln	15
	jbsr __initialize_core
	.ln	16
	jbsr __initialize_inflow
	.def	.eb;.val	.;	.scl	100;	.line	16;	.endef
	.ln	17
L1:
	.def	.ef;	.val	.;	.scl	101;	.line	17;	.endef
	unlk a6
	rts
	.def	initialize_all_files;	.val	.;	.scl	-1;	.endef
