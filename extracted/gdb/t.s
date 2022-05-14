#NO_APP
.text
	.even
.globl _main
_main:
	link a6,#-4
	clrl a6@(-4)
L2:
	moveq #29,d1
	cmpl a6@(-4),d1
	jlt L3
	jbsr _f1
L4:
	addql #1,a6@(-4)
	jra L2
L3:
L1:
	unlk a6
	rts
	.even
.globl _f1
_f1:
	link a6,#0
	addql #1,_i2
L5:
	unlk a6
	rts
.comm _i2,4
