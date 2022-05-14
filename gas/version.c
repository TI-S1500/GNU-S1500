/* The version string, etc */
static char what[] =
"@(#) gcc-as  5-April-94  GNU Assembler v1.34 (S1500 VERSION 1.34.1)\n";
/*----+----1----+----2----^----3----+----4----+----5----+----6----+---*/
char *version_string = (what + 25);
#ifdef VMS
dummy3()
{
}
#endif
/*
	1.08:	Added support for fmovem with register lists.
		(m68k.c m68k-opcode.h)
		Should be able to detect lossage like
		movem	fp0-fp4,a4@

		Also fixed an obscure bug having to do with generating
		PCREL addressing mode for things in the middle of the
		insn instead of at the end.

	1.09:	Fixed bug that you couldn't forward reference to local
		label 0.  It thought that 0f looked like a floating point
		number.
	1.10:	Fixed floating point bugs that made it generate incorrect
		numbers for values over 10^16 or so.

	1.11:	Fixed a variety of bugs:  now allows register lists to fmovem
		Added more floating-point exponents.  Prints error message on
		exponent overflow.

	1.12	(write.c)  Fixed an obscure bug in relaxation that would
		occasionally cause the assembler to stop relaxing when it
		really had to do at least one more pass.

		(m68k.c)  Fixed a bug where I said if(issbyte(...))
		where I should have said if(isbyte(...)).  Also where
		I said if(issword(...)) instead of if(isword(...))

	1.13	(read.c, atof-generic.c)  Fixed bugs in reading in
		floating point numbers.  .double 1.23  and .double 0.123
		now both work.

		(m68k-opcode.h)  Made  fmovep a0@,fp0  work.

	1.14	(vax.c) Added a quick fix for the offset of fixed-width
		branches not fitting in the field given.  Not nearly perfect,
		but better than nothing.  (gdb-lines.c, read.c) added support
		for .gdbline and .gdblinetab pseudo-ops.

		Re-enabled code in gdb_alter() to check input for sanity.

	1.15	renamed struct-symbol.h struc-symbol.h to get around 14 char
		filename limit on SYSV machines.

	1.16	Merged hpux changes from cph@zurich.  Renamed flonum-multip.c
		to flonum-mult.c  Created m-hpux.h  Fixed the bcopy() in m68k.c

	1.17	Fixed bug that caused
		.globl foo,bar,baz,
		(Line ending in comma) to produce undefined empty symbol.

		Fixed bug that caused .long <anything> to be .long 0
		on SPARC or any other machine that fucks up << by sizeof(long)

		Fixed bug that caused large number of
		#app
		#no_app
		pairs to dump core

		Fixed calls to _doprnt() to call _vfprintf() unless NO_VARARGS
		is defined.

	1.18	re-fixed the _vfprintf() stuff.

		Modifed it so that 'movem {single register},addr' works.
		Is a bit of a kludge, but then again, so is the rest of the
		assembler. . .

		New improved #app handling.  doesn't use tmp files at all.
		Uses memory instead.  Lots of it. . .

		Fixed # {lineno} {filename}

	1.19	Fixed a bug when turning a PCREL into an Absolute Long
		in md_convert_frag()  It was putting the fixups in the
		data segment, resulting in a .o file that would blow ld's
		core.

		added #include <alloca.h> to atof-generic.c for the sparc
		(Sun 4).

	1.20	Fixed 'fmovel #<lit>,fpcr  Added fpcr, fpsr to list of
		registers.

	1.21	Installed diffs for VMS support, and patch for
		real genuine cross-assembly.  (It used to emit the
		bitfields in the wrong order.)

	1.22	Patched a VMS bug in write.c  Doesn't affect anyone else.

		(m68k.c) Removed yet another bug having to do with turning 
                Absolute into PC-relative.

		(atof-m68k.c) modified atof_m68k and gen_to_words to try to
		avoid a problem with running off the end of the LITTLENUMS.

		(vax.c) fixed so parenthasized expressions work.  (I think.)

		(atof-generic.c) Added a cast that fixes problems with
		some C compilers.

	1.23	Increased version number.  1.23 will be distributed
		with GCC 1.25.

		Re-wrote the pre-processor.  I hope it really works now.

		New versions of xmalloc.c and xrealloc.c which work with
		the new version of the C compiler without -traditional

	1.24	New version number.  1.24 will be distributed with gcc 1.27

		Gas now accepts (and ignores) the -mc68010 and -m68010
		flags.  Sooner or later, we should teach it the difference. . .

		Gas no attemps to correctly assemble long subroutine calls
		on the 68000 without using a 68020 instruction.

		When gas is invoked with no filenames, it reads stdin.

	1.25	Installed patches for VMS

		Added space before the \<nl> in SIZEOF_STRUCT_FRAG in as.h

		Fixed typeo in messages.c

		Modified app.c to correctly handle ':'

		Gas no longer uses error.c

		Fixed m68k-opcode.h to know about fnop and to correctly handle
		fmovem with symbolic register lists and non-predecriment
		addressing mode.

		Fixed m68k-opcode.h to know about long-form of FBcc instructions

		Modified write.c to give warning if a fixup ended up being
		wider than its field width.

	1.26	Added partial NS32K support.

		Added RMS's evil .word misfeature.  Invented -k (kludge)
		option to tell sucker that this misfeature was used.

		Modified some files to get rid of warnings from gcc.

		Added fix so that '/' can also be a comment character
		by itself.

	1.27	ns32k and i386 support are (I hope) merged.  They are NOT
		tested.

	1.28	.single pseudo-op created for M68K machines

		. = {mumble} now performs the same as .org {mumble}
		.set .,mumble is the same as .org mumble
		pseudo-symbol '.' has the value of the current location
		the assembler is assembling into.  This is not well tested.

	1.29	New version of the i386 code added.

		Modified so that m-sun3.h and -m68010 produce sun-2 executables
		(1<<16|OMAGIC) instead of sun3.

		New new version of the i386.c code  This one fixes a bug
		where a jump instruction would be split between two frags.
		This caused obscure hard-to-reproduce behavior.

	1.30	New new version of the i386 code.

		Modified atof-m68k.c  New module is smaller, with somewhat
		better modularity.  Also has an obscure bug fixed, where
		next_bits() would return random bits  (which were always
		zero for me, making the bug difficult to find, since I still
		don't understand the code. . .)

		Patch to m68k.c to be more careful about creating pc-rel
		addressing modes on the 68000 and 68010

		frags.c(frag_new)  bzero new frags before using them.

		Don't choke on 'foo= bar', or on formfeeds.

		Allow sun-syntax local labels if gas was compiled with
		-DSUN_ASM_SYNTAX  Put SUN_ASM_SYNTAX in m-sun3.h

	1.31	More patches to i386 code.

		Moved machine-dependent option-parsing into {vax,m68k,etc}.c

	1.32	read.c: Fixed bug (misnamed variable) in s_set()
		as.c: fixed bug that caused gas to loop if given an invalid
			option
		m68k.c:Fixed bug in creating absolute long addresses for branch
                        instructions.
		Some small ns32k patches.

		Taught the m68k gas about 0rnan 0rinf 0r-inf

		Fixed bug in app.c that caused core dump on non-terminated 
                string.

		another small ns32k patch.  I wish I understood the ns32k
		and had one to test.  Its a pain having to take other
		people's word on what's right. . .

		symbols.c: modified to give reasonable error message

		Another change to ns32k: allow -m32032 and -m32532 to control
		which machine to assemble for.

		atof-generic.c, atof-m68k.c, atof-vax.c, etc:  Added support
		for NaN, Inf and -Inf in atof_generic() and the various
		descriptions.  Machines other than the 68k just call
		make_invalid_floating_point. . .

		m68k.c (add_fix): replace occurences of width== with
		(width)== which prevents a precedence problem.

		write.c struc-symbol.h m68k-opcode.h m-hpux.h Makefile :
		new changes for HP-UX from cph@kleph.ai.mit.edu

		m68k-opcode.h : Change order of some stuff so that gdb will
		dissassemble using the reglist syntax instead of the #xxx
		syntax.

		symbols.c (colon): give more useful error msg when something
		was defined as a .comm and is now trying to be defined locally.
		Also, redefining a symbol is a fatal, not a warning.

		m68k.c: fixed a bug in using bignums as literal bit patterns
		for floating point #s.

	1.33	Created to go on beta tape with GCC 1.35

		Use __builtin_alloca if avaliable

		Modified README to contain more instructions for reporting
		bugs.

		ns32k-opcode.h:  Changed the acbb, acbw and acbd instructions.

		vax.c:  replaced instances of length["string"] with
		"string"[length]

		ns32k.c: (encode_operand) Changed maximum size of bit field
		for exts/inss instr from 31 to 32 bits.

		flonum-mult.c (flonum_multip)  Fixed typo.

		m68k.c:  Allow #32 to be the same as #0 for bit-field
		operations.

		make-gas.com version.c hex-value.c flonum-const.c:
		VMS fixes.

		ns32k.c ns32k-opcode.h:  More fixes from taylor@think.com
		Mostly typos in comments, etc.

		ns32k-opcode.h  Fixed size of immediate operands to
		andw and andd insns.

	1.34	Reorganized makefile, merged sparc port.

		Fix typo in the makefile.

		Adjusted write.c to set size of text and bss segments to a
		multiple of eight bytes.

		moved .single pseudo-op from m68k to all versions.

		Fixed typo in #ifdef __GNUC__ in atof-generic.c

		Modified sparc-opcode.h to deal with 'mov %reg,%y'

		Fixed make-gas.com to know that error.c no longer exists.

		Modified sparc.c to deal with expressions of the form
		[expr+reg] (is real kludge).  Also told it not to call
		getExpression when it is looking for an immediate and it
		gets something that starts with % and isn't %lo or %hi.

*/
