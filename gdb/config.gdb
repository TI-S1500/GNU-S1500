#!/bin/sh

#
# Shell script to create proper links to machine-dependent files in
# preparation for compiling gdb.
#
# Usage: config.gdb machine [operating-system]
#
# If config.gdb succeeds, it leaves its status in config.status.
# If config.gdb fails after disturbing the status quo, 
# 	config.status is removed.
#

progname=$0

case $# in 
1)
	machine=$1
	os="none"
	;;
2)
	machine=$1
	os=$2
	;;
*)
	echo "Usage: $progname machine [operating-system]"
	echo "Available machine types:"
	echo m-*.h | sed 's/m-//g' | sed 's/\.h//g'
	if [ -r config.status ]
	then
		cat config.status
	fi
	exit 1
	;;
esac

paramfile=m-${machine}.h
pinsnfile=${machine}-pinsn.c
opcodefile=${machine}-opcode.h
if [ -r ${machine}-dep.c ]
then
	depfile=${machine}-dep.c
else
	depfile=default-dep.c
fi

#
# Special cases.
# If a file is not needed, set the filename to 'skip' and it will be
# ignored.
#
case $machine in
vax)
	pinsnfile=vax-pinsn.c
	opcodefile=vax-opcode.h
	;;
hp9k320)
	pinsnfile=m68k-pinsn.c
	opcodefile=m68k-opcode.h
	;;
isi)
	pinsnfile=m68k-pinsn.c
	opcodefile=m68k-opcode.h
	;;
i386)
	echo "Note: i386 users need to modify \`CLIBS' & \`REGEX*' in the Makefile"
	opcodefile=skip
	;;
i386gas)
	echo "Note: i386 users need to modify \`CLIBS' & \`REGEX*' in the Makefile"
	echo "Use of the coff encapsulation features also requires the GNU binutils utilities"
	echo "to be ahead of their System V counterparts in your path."
	pinsnfile=i386-pinsn.c
	depfile=i386-dep.c
	opcodefile=skip
	;;
merlin)
	pinsnfile=ns32k-pinsn.c
	opcodefile=ns32k-opcode.h
	;;
news)
	pinsnfile=m68k-pinsn.c
	opcodefile=m68k-opcode.h
	;;
npl)
	pinsnfile=gld-pinsn.c
	;;
pn)
	pinsnfile=gld-pinsn.c
	;;
sun2)
	case $os in
	os4|sunos4)
		paramfile=m-sun2os4.h
		;;
	os2|sunos2)
		paramfile=m-sun2os2.h
	esac
	pinsnfile=m68k-pinsn.c
	opcodefile=m68k-opcode.h
	;;
sun2os2)
	pinsnfile=m68k-pinsn.c
	opcodefile=m68k-opcode.h
	;;	
sun2os4)
	pinsnfile=m68k-pinsn.c
	opcodefile=m68k-opcode.h
	;;	
sun3)
	case $os in
	os4|sunos4)
		paramfile=m-sun3os4.h
	esac
	pinsnfile=m68k-pinsn.c
	opcodefile=m68k-opcode.h
	;;
sun3os4)
	pinsnfile=m68k-pinsn.c
	opcodefile=m68k-opcode.h
	depfile=sun3-dep.c
	;;	
sun4os4)
	pinsnfile=sparc-pinsn.c
	opcodefile=sparc-opcode.h
	depfile=sparc-dep.c
	;;	
ti1500)
	pinsnfile=m68k-pinsn.c
	opcodefile=m68k-opcode.h
	;;
umax)
	pinsnfile=ns32k-pinsn.c
	opcodefile=ns32k-opcode.h
	;;
sparc|sun4)
	case $os in
	os4|sunos4)
		paramfile=m-sun4os4.h
	esac
	pinsnfile=sparc-pinsn.c
	opcodefile=sparc-opcode.h
	depfile=sparc-dep.c
	paramfile=m-sparc.h
	;;
test)
	paramfile=one
	pinsnfile=three
	opcodefile=four
	;;
*)
	echo "Unknown machine type: \`$machine'"
	echo "Available types:"
	echo m-*.h | sed 's/m-//g' | sed 's/\.h//g'
	exit 1
esac

files="$paramfile $pinsnfile $opcodefile $depfile"
links="param.h pinsn.c opcode.h dep.c"	

while [ -n "$files" ]
do
	# set file to car of files, files to cdr of files
	set $files; file=$1; shift; files=$*
	set $links; link=$1; shift; links=$*

	if [ "$file" != skip ]
	then
		if [ ! -r $file ]
		then
			echo "$progname: cannot create a link \`$link',"
			echo "since the file \`$file' does not exist."
			exit 1
		fi

		rm -f $link config.status
		# Make a symlink if possible, otherwise try a hard link
		ln -s $file $link 2>/dev/null || ln $file $link

		if [ ! -r $link ]
		then
			echo "$progname: unable to link \`$link' to \`$file'."
			exit 1
		fi
		echo "Linked \`$link' to \`$file'."
	fi
done

echo "Links are now set up for use with a $machine." \
	| tee config.status
exit 0

