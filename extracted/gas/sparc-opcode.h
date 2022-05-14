/* sparc_opcode.h -- Table of opcodes for the sparc.
   Copyright (C) 1989 Free Software Foundation, Inc.

This file is part of GAS, the GNU Assembler.

GAS is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 1, or (at your option)
any later version.

GAS is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with GAS; see the file COPYING.  If not, write to
the Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.  */

#if !defined(__STDC__) && !defined(const)
#define const
#endif

/*
 * Structure of an opcode table entry.
 */
struct sparc_opcode
{
    const char *name;
    unsigned long mask;     /* used only for error checking */
    unsigned long match;
    const char *args;
    unsigned int last;      /* used to simplify hashing */
};

/*
   All sparc opcodes are 32 bits, except for the `set' instruction (really
   a macro), which is 64 bits.  It is handled as a special case.

   The match component is a mask saying which bits must match a
   particular opcode in order for an instruction to be an instance
   of that opcode.

   The args component is a string containing one character
   for each operand of the instruction.

Kinds of operands:
   #    Number used by optimizer.  It is ignored.
   1    rs1 register.
   2    rs2 register.
   d    rd register.
   e    frs1 floating point register.
   f    frs2 floating point register.
   g    frsd floating point register.
   b    crs1 coprocessor register
   c    crs2 coprocessor register
   D    crsd coprocessor register
   h    22 high bits.
   i    13 bit Immediate.
   l    22 bit PC relative immediate.
   L    30 bit PC relative immediate.
   a    Annul.  The annul bit is set.
   A    Alternate address space.  Stored as 8 bits.
   C    Coprocessor state register.
   F    floating point state register.
   p    Processor state register.
   q    Floating point queue.
   r    Single register that is both rs1 and rsd.
   Q    Coprocessor queue.
   S    Special case.
   t    Trap base register.
   w    Window invalid mask register.
   y    Y register.

*/

/*
 *   The assembler requires that all instances of the same mnemonic must be
 *   consecutive.  If they aren't, the assembler will bomb at runtime.
 */

static const struct sparc_opcode sparc_opcodes[] =
{

{ "add",	0xc1f82000, 0x80000000,	"1,2,d", 0 },
{ "add",	0xc1f82000, 0x80002000,	"i,1,d", 0 },
{ "add",	0xc1f82000, 0x80002000,	"1,i,d", 1 },
{ "addcc",	0xc1f82000, 0x80800000,	"1,2,d", 0 },
{ "addcc",	0xc1f82000, 0x80802000,	"i,1,d", 0 },
{ "addcc",	0xc1f82000, 0x80802000,	"1,i,d", 1 },
{ "addx",	0xc1f82000, 0x80400000,	"1,2,d", 0 },
{ "addx",	0xc1f82000, 0x80402000,	"i,1,d", 0 },
{ "addx",	0xc1f82000, 0x80402000,	"1,i,d", 1 },
{ "addxcc",	0xc1f82000, 0x80c00000,	"1,2,d", 0 },
{ "addxcc",	0xc1f82000, 0x80c02000,	"i,1,d", 0 },
{ "addxcc",	0xc1f82000, 0x80c02000,	"1,i,d", 1 },

{ "and",	0xc1f82000, 0x80080000,	"1,2,d", 0 },
{ "and",	0xc1f82000, 0x80082000,	"i,1,d", 0 },
{ "and",	0xc1f82000, 0x80082000,	"1,i,d", 1 },
{ "andcc",	0xc1f82000, 0x80880000,	"1,2,d", 0 },
{ "andcc",	0xc1f82000, 0x80882000,	"i,1,d", 0 },
{ "andcc",	0xc1f82000, 0x80882000,	"1,i,d", 1 },
{ "andn",	0xc1f82000, 0x80280000,	"1,2,d", 0 },
{ "andn",	0xc1f82000, 0x80282000,	"i,1,d", 0 },
{ "andn",	0xc1f82000, 0x80282000,	"1,i,d", 1 },
{ "andncc",	0xc1f82000, 0x80a80000,	"1,2,d", 0 },
{ "andncc",	0xc1f82000, 0x80a82000,	"i,1,d", 0 },
{ "andncc",	0xc1f82000, 0x80a82000,	"1,i,d", 1 },

{ "b",		0xffc00000, 0x10800000,	"l",    0 },
{ "b",		0xffc00000, 0x30800000,	",al",  1 },
{ "ba",		0xffc00000, 0x10800000,	"l",    0 },
{ "ba",		0xffc00000, 0x30800000,	",al",  1 },
{ "bcc",	0xffc00000, 0x1a800000,	"l",    0 },
{ "bcc",	0xffc00000, 0x3a800000,	",al",  1 },
{ "bcs",	0xffc00000, 0x0a800000,	"l",    0 },
{ "bcs",	0xffc00000, 0x2a800000,	",al",  1 },
{ "be",		0xffc00000, 0x02800000,	"l",    0 },
{ "be",		0xffc00000, 0x22800000,	",al",  1 },
{ "bg",		0xffc00000, 0x14800000,	"l",    0 },
{ "bg",		0xffc00000, 0x34800000,	",al",  1 },
{ "bge",	0xffc00000, 0x16800000,	"l",    0 },
{ "bge",	0xffc00000, 0x36800000,	",al",  1 },
{ "bgeu",	0xffc00000, 0x1a800000,	"l",    0 },
{ "bgeu",	0xffc00000, 0x3a800000,	",al",  1 },
{ "bgu",	0xffc00000, 0x18800000,	"l",    0 },
{ "bgu",	0xffc00000, 0x38800000,	",al",  1 },
{ "bl",		0xffc00000, 0x06800000,	"l",    0 },
{ "bl",		0xffc00000, 0x26800000,	",al",  1 },
{ "ble",	0xffc00000, 0x04800000,	"l",    0 },
{ "ble",	0xffc00000, 0x24800000,	",al",  1 },
{ "bleu",	0xffc00000, 0x08800000,	"l",    0 },
{ "bleu",	0xffc00000, 0x28800000,	",al",  1 },
{ "blu",	0xffc00000, 0x0a800000,	"l",    0 }, /* same as bcs */
{ "blu",	0xffc00000, 0x2a800000,	",al",  1 },
{ "bn",		0xffc00000, 0x00800000,	"l",    0 },
{ "bn", 	0xffc00000, 0x20800000,	",al",  1 },
{ "bne",	0xffc00000, 0x12800000,	"l",    0 },
{ "bne",	0xffc00000, 0x32800000,	",al",  1 },
{ "bneg",	0xffc00000, 0x0c800000,	"l",    0 },
{ "bneg",	0xffc00000, 0x2c800000,	",al",  1 },
{ "bpos",	0xffc00000, 0x1c800000,	"l",    0 },
{ "bpos",	0xffc00000, 0x3c800000,	",al",  1 },
{ "bvc",	0xffc00000, 0x1e800000,	"l",    0 },
{ "bvc",	0xffc00000, 0x3e800000,	",al",  1 },
{ "bvs",	0xffc00000, 0x0e800000,	"l",    0 },
{ "bvs",	0xffc00000, 0x2e800000,	",al",  1 },


{ "call",	0xc0000000, 0x40000000,	"L", 0 },
{ "call",	0xc0000000, 0x40000000,	"L,#", 0 },
{ "call",	0xfff83fff, 0x9fc00000,	"1", 0 },
{ "call",	0xfff83fff, 0x9fc00000,	"1,#", 1 },

{ "clr",        0xc1ffe000, 0x80100000, "d", 1 },      /* or %0,%0,d */

{ "cmp",	0xfff82000, 0x80a00000,	"1,2", 0 },     /* subcc rs1,rs2,%0 */
{ "cmp",	0xfff82000, 0x80a02000,	"1,i", 1 },     /* subcc rs1,i,%0 */

{ "inc",	0xc1f83fff, 0x80002001,	"r", 1 },       /* add rs1,1,rsd */

{ "jmp",        0xfff83fff, 0x81c00000, "1", 0 },
{ "jmp",        0xfff83fff, 0x81c02000, "i", 1 },


{ "jmpl",	0xc1f83fff, 0x81c02000,	"1,d", 0 },
{ "jmpl",	0xc1f82000, 0x81c00000,	"1+2,d", 0 },
{ "jmpl",	0xc1f82000, 0x81c02000,	"1+i,d", 1 },

{ "ld",		0xc1f82000, 0xc0000000,	"[1],d",  0 },  /* ld [1+%0],d */

{ "ld",		0xc1f82000, 0xc0000000,	"[1],d",    0 },
{ "ld",		0xc1f82000, 0xc0000000,	"[1+2],d",  0 },
{ "ld",		0xc1f82000, 0xc0002000,	"[1+i],d",  0 },
{ "ld",         0xc1f82000, 0xc1000000, "[1],g",    0 },
{ "ld",         0xc1f82000, 0xc1000000, "[1+2],g",  0 },
{ "ld",         0xc1f82000, 0xc1002000, "[1+i],g",  0 },
{ "ld",         0xc1f82000, 0xc1080000, "[1],F",    0 },
{ "ld",         0xc1f82000, 0xc1080000, "[1+2],F",  0 },
{ "ld",         0xc1f82000, 0xc1082000, "[1+i],F",  0 },
{ "ld",         0xc1f82000, 0xc1800000, "[1],D",    0 },
{ "ld",         0xc1f82000, 0xc1800000, "[1+2],D",  0 },
{ "ld",         0xc1f82000, 0xc1802000, "[1+i],D",  0 },
{ "ld",         0xc1f82000, 0xc1880000, "[1],C",    0 },
{ "ld",         0xc1f82000, 0xc1880000, "[1+2],C",  0 },
{ "ld",         0xc1f82000, 0xc1882000, "[1+i],C",  0 },
{ "ld",		0xc1f82000, 0xc0002000,	"[i+1],d",  0 },
{ "ld",         0xc1f82000, 0xc1002000, "[i+1],g",  0 },
{ "ld",         0xc1f82000, 0xc1082000, "[i+1],F",  0 },
{ "ld",         0xc1f82000, 0xc1802000, "[i+1],D",  0 },
{ "ld",         0xc1f82000, 0xc1882000, "[i+1],C",  1 },

{ "lda",	0xc1f82000, 0xc0800000,	"[1]A,d",   0 },
{ "lda",	0xc1f82000, 0xc0800000,	"[1+2]A,d", 1 },
{ "ldd",	0xc1f82000, 0xc0180000,	"[1],d",    0 },
{ "ldd",	0xc1f82000, 0xc0180000,	"[1+2],d",  0 },
{ "ldd",	0xc1f82000, 0xc0182000,	"[1+i],d",  0 },
{ "ldd",        0xc1f82000, 0xc1180000, "[1],g",    0 },
{ "ldd",        0xc1f82000, 0xc1180000, "[1+2],g",  0 },
{ "ldd",        0xc1f82000, 0xc1182000, "[1+i],g",  0 },
{ "ldd",        0xc1f82000, 0xc1980000, "[1],D",    0 },
{ "ldd",        0xc1f82000, 0xc1980000, "[1+2],D",  0 },
{ "ldd",        0xc1f82000, 0xc1982000, "[1+i],D",  1 },
{ "ldda",	0xc1f82000, 0xc0980000,	"[1]A,d",   0 },
{ "ldda",	0xc1f82000, 0xc0980000,	"[1+2]A,d", 1 },
{ "ldsb",	0xc1f82000, 0xc0480000,	"[1],d",    0 },
{ "ldsb",	0xc1f82000, 0xc0480000,	"[1+2],d",  0 },
{ "ldsb",	0xc1f82000, 0xc0482000,	"[1+i],d",  1 },
{ "ldsba",	0xc1f82000, 0xc0c80000,	"[1]A,d",   0 },
{ "ldsba",	0xc1f82000, 0xc0c80000,	"[1+2]A,d", 1 },
{ "ldsh",	0xc1f82000, 0xc0500000,	"[1],d",    0 },
{ "ldsh",	0xc1f82000, 0xc0500000,	"[1+2],d",  0 },
{ "ldsh",	0xc1f82000, 0xc0502000,	"[1+i],d",  1 },
{ "ldsha",	0xc1f82000, 0xc0d00000,	"[1]A,d",   0 },
{ "ldsha",	0xc1f82000, 0xc0d00000,	"[1+2]A,d", 1 },
{ "ldstub",	0xc1f82000, 0xc0680000,	"[1],d",    0 },
{ "ldstub",	0xc1f82000, 0xc0680000,	"[1+2],d",  0 },
{ "ldstub",	0xc1f82000, 0xc0682000,	"[1+i],d",  1 },
{ "ldstuba",	0xc1f82000, 0xc0d80000,	"[1]A,d",   0 },
{ "ldstuba",	0xc1f82000, 0xc0d80000,	"[1+2]A,d", 1 },
{ "ldub",	0xc1f82000, 0xc0080000,	"[1],d",    0 }, /* ldub [1+%0],d */
{ "ldub",	0xc1f82000, 0xc0080000,	"[1+2],d",  0 },
{ "ldub",	0xc1f82000, 0xc0082000,	"[1+i],d",  1 },
{ "lduba",	0xc1f82000, 0xc0880000,	"[1]A,d",   0 },
{ "lduba",	0xc1f82000, 0xc0880000,	"[1+2]A,d", 1 },
{ "lduh",	0xc1f82000, 0xc0100000,	"[1],d",    0 },
{ "lduh",	0xc1f82000, 0xc0100000,	"[1+2],d",  0 },
{ "lduh",	0xc1f82000, 0xc0102000,	"[1+i],d",  1 },
{ "lduha",	0xc1f82000, 0xc0900000,	"[1]A,d",   0 }, /* same as ldsha */
{ "lduha",	0xc1f82000, 0xc0900000,	"[1+2]A,d", 1 },

{ "mov",        0xc1ffe000, 0x80100000, "2,d", 0 },      /* or %0,2,d */
{ "mov",        0xc1ffe000, 0x80102000, "i,d", 0 },      /* or %0,i,d   */
{ "mov",        0xc1f8201F, 0x81800000, "1,y", 1 },	 /* wr %0,y */

{ "mulscc",	0xc1f82000, 0x81200000,	"1,2,d", 0 },
{ "mulscc",	0xc1f82000, 0x81202000,	"1,i,d", 1 },

{ "nop",	0xffffffff, 0x01000000,	"", 1 },	 /* sethi 0,%0 */

{ "or",		0xc1f82000, 0x80100000,	"1,2,d", 0 },
{ "or",		0xc1f82000, 0x80102000,	"i,1,d", 0 },
{ "or",		0xc1f82000, 0x80102000,	"1,i,d", 1 },
{ "orcc",	0xc1f82000, 0x80900000,	"1,2,d", 0 },
{ "orcc",	0xc1f82000, 0x80902000,	"i,1,d", 0 },
{ "orcc",	0xc1f82000, 0x80902000,	"1,i,d", 1 },
{ "orn",	0xc1f82000, 0x80300000,	"1,2,d", 0 },
{ "orn",	0xc1f82000, 0x80302000,	"i,1,d", 0 },
{ "orn",	0xc1f82000, 0x80302000,	"1,i,d", 1 },
{ "orncc",	0xc1f82000, 0x80b00000,	"1,2,d", 0 },
{ "orncc",	0xc1f82000, 0x80b02000,	"i,1,d", 0 },
{ "orncc",	0xc1f82000, 0x80b02000,	"1,i,d", 1 },

{ "rd", 	0xc1f80000, 0x81480000,	"p,d", 0 },
{ "rd", 	0xc1f80000, 0x81580000,	"t,d", 0 },
{ "rd", 	0xc1f80000, 0x81500000,	"w,d", 0 },
{ "rd",         0xc1f80000, 0x81400000, "y,d", 1 },

{ "restore",	0xc1f82000, 0x81e80000,	"1,2,d", 0 },
{ "restore",	0xc1f82000, 0x81e82000,	"1,i,d", 0 },
{ "restore",    0xffffffff, 0x81e80000, "", 1 },        /* restore %0,%0,%0 */
{ "ret",        0xffffffff, 0x81c7e008,  "", 1 },       /* jmpl %i7+8,%0 */
{ "retl",       0xffffffff, 0x81c3e008,  "", 1 },       /* jmpl ????? */
{ "rett",	0xc1f82000, 0x81c80000,	"1,2,d", 0 },
{ "rett",	0xc1f82000, 0x81c82000,	"1,i,d", 1 },
{ "save",	0xc1f82000, 0x81e00000,	"1,2,d", 0 },
{ "save",	0xc1f82000, 0x81e02000,	"1,i,d", 1 },

{ "set",        0xc1c00000, 0x01000000, "Sh,d", 1 },

{ "sethi",	0xc1c00000, 0x01000000,	"h,d", 1 },

{ "sll",	0xc1f82000, 0x81280000,	"1,2,d", 0 },
{ "sll",	0xc1f82000, 0x81282000,	"1,i,d", 1 },
{ "sra",	0xc1f82000, 0x81380000,	"1,2,d", 0 },
{ "sra",	0xc1f82000, 0x81382000,	"1,i,d", 1 },
{ "srl",	0xc1f82000, 0x81300000,	"1,2,d", 0 },
{ "srl",	0xc1f82000, 0x81302000,	"1,i,d", 1 },

{ "st",		0xc1f82000, 0xc0200000,	"d,[1]",  0 },  /* st d,[1+%0] */

{ "st",		0xc1f82000, 0xc0200000,	"d,[1]",    0 },
{ "st",		0xc1f82000, 0xc0200000,	"d,[1+2]",  0 },
{ "st",		0xc1f82000, 0xc0202000,	"d,[1+i]",  0 },
{ "st",		0xc1f82000, 0xc1200000,	"g,[1]",    0 },
{ "st",		0xc1f82000, 0xc1200000,	"g,[1+2]",  0 },
{ "st",		0xc1f82000, 0xc1202000,	"g,[1+i]",  0 },
{ "st",		0xc1f82000, 0xc1300000,	"F,[1]",    0 },
{ "st",		0xc1f82000, 0xc1300000,	"F,[1+2]",  0 },
{ "st",		0xc1f82000, 0xc1302000,	"F,[1+i]",  0 },
{ "st",		0xc1f82000, 0xc1a00000,	"D,[1]",    0 },
{ "st",		0xc1f82000, 0xc1a00000,	"D,[1+2]",  0 },
{ "st",		0xc1f82000, 0xc1a02000,	"D,[1+i]",  0 },
{ "st",		0xc1f82000, 0xc1a80000,	"C,[1]",    0 },
{ "st",		0xc1f82000, 0xc1a80000,	"C,[1+2]",  0 },
{ "st",		0xc1f82000, 0xc1a82000,	"C,[1+i]",  1 },
{ "sta",	0xc1f82000, 0xc0a00000,	"d,[1]A",   0 },
{ "sta",	0xc1f82000, 0xc0a00000,	"d,[1+2]A", 1 },

{ "stb",	0xc1f82000, 0xc0280000,	"d,[1]",    0 },
{ "stb",	0xc1f82000, 0xc0280000,	"d,[1+2]",  0 },
{ "stb",	0xc1f82000, 0xc0282000,	"d,[1+i]",  1 },
{ "stba",	0xc1f82000, 0xc0a80000,	"d,[1]A",   0 },
{ "stba",	0xc1f82000, 0xc0a80000,	"d,[1+2]A", 1 },

{ "std",	0xc1f82000, 0xc0380000,	"d,[1]",    0 },
{ "std",	0xc1f82000, 0xc0380000,	"d,[1+2]",  0 },
{ "std",	0xc1f82000, 0xc0382000,	"d,[1+i]",  0 },
{ "std",	0xc1f82000, 0xc1380000,	"g,[1]",    0 },
{ "std",	0xc1f82000, 0xc1380000,	"g,[1+2]",  0 },
{ "std",	0xc1f82000, 0xc1382000,	"g,[1+i]",  0 },

{ "std",	0xc1f82000, 0xc1300000,	"q,[1]",    0 },
{ "std",	0xc1f82000, 0xc1300000,	"q,[1+2]",  0 },
{ "std",	0xc1f82000, 0xc1300000,	"q,[1+i]",  0 },

{ "std",	0xc1f82000, 0xc1b80000,	"D,[1]",    0 },
{ "std",	0xc1f82000, 0xc1b80000,	"D,[1+2]",  0 },
{ "std",	0xc1f82000, 0xc1b80000,	"D,[1+i]",  0 },

{ "std",	0xc1f82000, 0xc1b00000,	"Q,[1]",    0 },
{ "std",	0xc1f82000, 0xc1b00000,	"Q,[1+2]",  0 },
{ "std",	0xc1f82000, 0xc1b00000,	"Q,[1+i]",  1 },

{ "stda",	0xc1f82000, 0xc0b80000,	"d,[1]A",   0 },
{ "stda",	0xc1f82000, 0xc0b80000,	"d,[1+2]A", 1 },

{ "sth",	0xc1f82000, 0xc0300000,	"d,[1]",    0 },
{ "sth",	0xc1f82000, 0xc0300000,	"d,[1+2]",  0 },
{ "sth",	0xc1f82000, 0xc0302000,	"d,[1+i]",  1 },
{ "stha",	0xc1f82000, 0xc0b00000,	"d,[1]A",   0 },
{ "stha",	0xc1f82000, 0xc0b00000,	"d,[1+2]A", 1 },

{ "sub",	0xc1f82000, 0x80200000,	"1,2,d", 0 },
{ "sub",	0xc1f82000, 0x80202000,	"1,i,d", 1 },
{ "subcc",	0xc1f82000, 0x80a00000,	"1,2,d", 0 },
{ "subcc",	0xc1f82000, 0x80a02000,	"1,i,d", 1 },
{ "subx",	0xc1f82000, 0x80600000,	"1,2,d", 0 },
{ "subx",	0xc1f82000, 0x80602000,	"1,i,d", 1 },
{ "subxcc",	0xc1f82000, 0x80e00000,	"1,2,d", 0 },
{ "subxcc",	0xc1f82000, 0x80e02000,	"1,i,d", 1 },

{ "swap",       0xc1f82000, 0xc0780000, "[1],d",    0 },
{ "swap",       0xc1f82000, 0xc0780000, "[1+2],d",  0 },
{ "swap",       0xc1f82000, 0xc0782000, "[1+i],d",  1 },
{ "swapa",      0xc1f82000, 0xc0f82000, "[1]A,d",   0 },
{ "swapa",      0xc1f82000, 0xc0f82000, "[1+2]A,d", 1 },

{ "taddcc",     0xc1f82000, 0x81000000, "1,2,d", 0 },
{ "taddcc",     0xc1f82000, 0x81002000, "1,i,d", 1 },
{ "taddcctv",   0xc1f82000, 0x81100000, "1,2,d", 0 },
{ "taddcctv",   0xc1f82000, 0x81102000, "1,i,d", 1 },

{ "ta",		0xfff82000, 0x91d00000,	"1+2", 0 },
{ "ta",		0xffffe000, 0x91d02000,	"i",   0 },       /* ta %0+i  */
{ "ta",		0xfff82000, 0x91d02000,	"1+i", 1 },
{ "tcc",	0xfff82000, 0x9bd00000,	"1+2", 0 },
{ "tcc",	0xffffe000, 0x9bd02000,	"i",   0 },
{ "tcc",	0xfff82000, 0x9bd02000,	"1+i", 1 },
{ "tcs",	0xfff82000, 0x8bd00000,	"1+2", 0 },
{ "tcs",	0xffffe000, 0x8bd02000,	"i",   0 },
{ "tcs",	0xfff82000, 0x8bd02000,	"1+i", 1 },
{ "te",		0xfff82000, 0x83d00000,	"1+2", 0 },
{ "te",		0xffffe000, 0x83d02000,	"i",   0 },
{ "te",		0xfff82000, 0x83d02000,	"1+i", 1 },
{ "tg",		0xfff82000, 0x95d00000,	"1+2", 0 },
{ "tg",		0xffffe000, 0x95d02000,	"i",   0 },
{ "tg",		0xfff82000, 0x95d02000,	"1+i", 1 },
{ "tge",	0xfff82000, 0x97d00000,	"1+2", 0 },
{ "tge",	0xffffe000, 0x97d02000,	"i",   0 },
{ "tge",	0xfff82000, 0x97d02000,	"1+i", 1 },
{ "tgu",	0xfff82000, 0x99d00000,	"1+2", 0 },
{ "tgu",	0xffffe000, 0x99d02000,	"i",   0 },
{ "tgu",	0xfff82000, 0x99d02000,	"1+i", 1 },
{ "tl",		0xfff82000, 0x87d00000,	"1+2", 0 },
{ "tl",		0xffffe000, 0x87d02000,	"i",   0 },
{ "tl",		0xfff82000, 0x87d02000,	"1+i", 1 },
{ "tle",	0xfff82000, 0x85d00000,	"1+2", 0 },
{ "tle",	0xffffe000, 0x85d02000,	"i",   0 },
{ "tle",	0xfff82000, 0x85d02000,	"1+i", 1 },
{ "tleu",	0xfff82000, 0x93d00000,	"1+2", 0 },
{ "tleu",	0xffffe000, 0x93d02000,	"i",   0 },
{ "tleu",	0xfff82000, 0x93d02000,	"1+i", 1 },
{ "tn",		0xfff82000, 0x81d00000,	"1+2", 0 },
{ "tn	",	0xffffe000, 0x81d02000,	"i",   0 },
{ "tn	",	0xfff82000, 0x81d02000,	"1+i", 1 },
{ "tne",	0xfff82000, 0x93d00000,	"1+2", 0 },
{ "tne",	0xffffe000, 0x93d02000,	"i",   0 },
{ "tne",	0xfff82000, 0x93d02000,	"1+i", 1 },
{ "tneg",	0xfff82000, 0x8dd00000,	"1+2", 0 },
{ "tneg",	0xffffe000, 0x8dd02000,	"i",   0 },
{ "tneg",	0xfff82000, 0x8dd02000,	"1+i", 1 },
{ "tpos",	0xfff82000, 0x9dd00000,	"1+2", 0 },
{ "tpos",	0xffffe000, 0x9dd02000,	"i",   0 },
{ "tpos",	0xfff82000, 0x9dd02000,	"1+i", 1 },
{ "tvc",	0xfff82000, 0x9fd00000,	"1+2", 0 },
{ "tvc",	0xffffe000, 0x9fd02000,	"i",   0 },
{ "tvc",	0xfff82000, 0x9fd02000,	"1+i", 1 },
{ "tvs",	0xfff82000, 0x8fd00000,	"1+2", 0 },
{ "tvs",	0xffffe000, 0x8fd02000,	"i",   0 },
{ "tvs",	0xfff82000, 0x8fd02000,	"1+i", 1 },

{ "tst",	0xffffe000, 0x80900000,	"2", 1 },   /* orcc %0,rs1,%0 */

{ "tsubcc",     0xc1f82000, 0x81080000, "1,2,d", 0 },
{ "tsubcc",     0xc1f82000, 0x81082000, "1,i,d", 1 },
{ "tsubcctv",   0xc1f82000, 0x80580000, "1,2,d", 0 },
{ "tsubcctv",   0xc1f82000, 0x80582000, "1,i,d", 1 },

{ "unimp",      0xc1c00000, 0x00000000, "l", 1 },

{ "wr",         0xc1f82000, 0x81880000, "1,2,p", 0 },
{ "wr",         0xc1f82000, 0x81882000, "1,i,p", 0 },
{ "wr",         0xc1f82000, 0x81980000, "1,2,t", 0 },
{ "wr",         0xc1f82000, 0x81982000, "1,i,t", 0 },
{ "wr",         0xc1f82000, 0x81900000, "1,2,w", 0 },
{ "wr",         0xc1f82000, 0x81902000, "1,i,w", 0 },
{ "wr",         0xc1f82000, 0x81800000, "1,2,y", 0 },
{ "wr",         0xc1f82000, 0x81802000, "1,i,y", 1 },

{ "xnor",	0xc1f82000, 0x80380000,	"1,2,d", 0 },
{ "xnor",	0xc1f82000, 0x80382000,	"i,1,d", 0 },
{ "xnor",	0xc1f82000, 0x80382000,	"1,i,d", 1 },
{ "xnorcc",	0xc1f82000, 0x80b80000,	"1,2,d", 0 },
{ "xnorcc",	0xc1f82000, 0x80b82000,	"i,1,d", 0 },
{ "xnorcc",	0xc1f82000, 0x80b82000,	"1,i,d", 1 },
{ "xor",	0xc1f82000, 0x80180000,	"1,2,d", 0 },
{ "xor",	0xc1f82000, 0x80182000,	"i,1,d", 0 },
{ "xor",	0xc1f82000, 0x80182000,	"1,i,d", 1 },
{ "xorcc",	0xc1f82000, 0x80980000,	"1,2,d", 0 },
{ "xorcc",	0xc1f82000, 0x80982000,	"i,1,d", 0 },
{ "xorcc",	0xc1f82000, 0x80982000,	"1,i,d", 1 },

{ "iflush",     0xfff83fe0, 0x81d80000, "1+2", 0 },
{ "iflush",     0xfff82000, 0x81d82000, "1+i", 1 },

#if 0
{ "fpop1",      0x0, 0x81a00000, "[1],d",   0 },
{ "fpop1",      0x0, 0x81a00000, "[1+2],d", 1 },
{ "fpop2",      0x0, 0x81a80000, "[1+i],d", 1 },
#endif

{ "fb",         0xffc00000, 0x11800000, "l", 0 },
{ "fb",         0xffc00000, 0x31800000, ",al", 1 },
{ "fba",        0xffc00000, 0x11800000, "l", 0 },
{ "fba",        0xffc00000, 0x31800000, ",al", 1 },
{ "fbn",        0xffc00000, 0x01800000, "l", 0 },
{ "fbn",        0xffc00000, 0x21800000, ",al", 1 },
{ "fbu",        0xffc00000, 0x0f800000, "l", 0 },
{ "fbu",        0xffc00000, 0x2f800000, ",al", 1 },
{ "fbg",        0xffc00000, 0x0d800000, "l", 0 },
{ "fbg",        0xffc00000, 0x2d800000, ",al", 1 },
{ "fbug",       0xffc00000, 0x0b800000, "l", 0 },
{ "fbug",       0xffc00000, 0x2b800000, ",al", 1 },
{ "fbl",        0xffc00000, 0x09800000, "l", 0 },
{ "fbl",        0xffc00000, 0x29800000, ",al", 1 },
{ "fbul",       0xffc00000, 0x07800000, "l", 0 },
{ "fbul",       0xffc00000, 0x27800000, ",al", 1 },
{ "fblg",       0xffc00000, 0x05800000, "l", 0 },
{ "fblg",       0xffc00000, 0x25800000, ",al", 1 },
{ "fbne",       0xffc00000, 0x03800000, "l", 0 },
{ "fbne",       0xffc00000, 0x23800000, ",al", 1 },
{ "fbe",        0xffc00000, 0x13800000, "l", 0 },
{ "fbe",        0xffc00000, 0x33800000, ",al", 1 },
{ "fbue",       0xffc00000, 0x15800000, "l", 0 },
{ "fbue",       0xffc00000, 0x35800000, ",al", 1 },
{ "fbge",       0xffc00000, 0x17800000, "l", 0 },
{ "fbge",       0xffc00000, 0x37800000, ",al", 1 },
{ "fbuge",      0xffc00000, 0x19800000, "l", 0 },
{ "fbuge",      0xffc00000, 0x39800000, ",al", 1 },
{ "fble",       0xffc00000, 0x1b800000, "l", 0 },
{ "fble",       0xffc00000, 0x3b800000, ",al", 1 },
{ "fbule",      0xffc00000, 0x1d800000, "l", 0 },
{ "fbule",      0xffc00000, 0x3d800000, ",al", 1 },
{ "fbo",        0xffc00000, 0x1f800000, "l", 0 },
{ "fbo",        0xffc00000, 0x3f800000, ",al", 1 },

{ "cba",        0xffc00000, 0x11c00000, "l", 0 },
{ "cba",        0xffc00000, 0x21c00000, ",al", 1 },
{ "cbn",        0xffc00000, 0x01c00000, "l", 0 },
{ "cbn",        0xffc00000, 0x21c00000, ",al", 1 },
{ "cb3",        0xffc00000, 0x0fc00000, "l", 0 },
{ "cb3",        0xffc00000, 0x2fc00000, ",al", 1 },
{ "cb2",        0xffc00000, 0x0dc00000, "l", 0 },
{ "cb2",        0xffc00000, 0x2dc00000, ",al", 1 },
{ "cb23",       0xffc00000, 0x0bc00000, "l", 0 },
{ "cb23",       0xffc00000, 0x2bc00000, ",al", 1 },
{ "cb1",        0xffc00000, 0x09c00000, "l", 0 },
{ "cb1",        0xffc00000, 0x29c00000, ",al", 1 },
{ "cb13",       0xffc00000, 0x07c00000, "l", 0 },
{ "cb13",       0xffc00000, 0x27c00000, ",al", 1 },
{ "cb12",       0xffc00000, 0x05c00000, "l", 0 },
{ "cb12",       0xffc00000, 0x25c00000, ",al", 1 },
{ "cb123",      0xffc00000, 0x03c00000, "l", 0 },
{ "cb123",      0xffc00000, 0x23c00000, ",al", 1 },
{ "cb0",        0xffc00000, 0x13c00000, "l", 0 },
{ "cb0",        0xffc00000, 0x33c00000, ",al", 1 },
{ "cb03",       0xffc00000, 0x15c00000, "l", 0 },
{ "cb03",       0xffc00000, 0x35c00000, ",al", 1 },
{ "cb02",       0xffc00000, 0x17c00000, "l", 0 },
{ "cb02",       0xffc00000, 0x37c00000, ",al", 1 },
{ "cb023",      0xffc00000, 0x19c00000, "l", 0 },
{ "cb023",      0xffc00000, 0x39c00000, ",al", 1 },
{ "cb013",      0xffc00000, 0x1dc00000, "l", 0 },
{ "cb013",      0xffc00000, 0x3dc00000, ",al", 1 },
{ "cb012",      0xffc00000, 0x1fc00000, "l", 0 },
{ "cb012",      0xffc00000, 0x3fc00000, ",al", 1 },

{ "fitos",      0xc1ffffe0, 0x81a01880, "f,g", 1 },
{ "fitod",      0xc1ffffe0, 0x81a01900, "f,g", 1 },
{ "fitox",      0xc1ffffe0, 0x81a01980, "f,g", 1 },

{ "fstoi",      0xc1ffffe0, 0x81a01a20, "f,g", 1 },
{ "fdtoi",      0xc1ffffe0, 0x81a01a40, "f,g", 1 },
{ "fxtoi",      0xc1ffffe0, 0x81a01a60, "f,g", 1 },

{ "fstod",      0xc1ffffe0, 0x81a01920, "f,g", 1 },
{ "fstox",      0xc1ffffe0, 0x81a019a0, "f,g", 1 },
{ "fdtos",      0xc1ffffe0, 0x81a018c0, "f,g", 1 },
{ "fdtox",      0xc1ffffe0, 0x81a019c0, "f,g", 1 },
{ "fxtos",      0xc1ffffe0, 0x81a018e0, "f,g", 1 },
{ "fxtod",      0xc1ffffe0, 0x81a01960, "f,g", 1 },

{ "fmovs",      0xc1ffffe0, 0x81a00020, "f,g", 1 },
{ "fnegs",      0xc1ffffe0, 0x81a000a0, "f,g", 1 },
{ "fabss",      0xc1ffffe0, 0x81a00120, "f,g", 1 },

{ "fsqrts",     0xc1ffffe0, 0x81a00520, "f,g", 1 },
{ "fsqrtd",     0xc1ffffe0, 0x81a00540, "f,g", 1 },
{ "fsqrtx",     0xc1ffffe0, 0x81a00560, "f,g", 1 },

{ "fadds",      0xc1f83fe0, 0x81a00820, "e,f,g", 1 },
{ "faddd",      0xc1f83fe0, 0x81a00840, "e,f,g", 1 },
{ "faddx",      0xc1f83fe0, 0x81a00860, "e,f,g", 1 },
{ "fsubs",      0xc1f83fe0, 0x81a008a0, "e,f,g", 1 },
{ "fsubd",      0xc1f83fe0, 0x81a008c0, "e,f,g", 1 },
{ "fsubx",      0xc1f83fe0, 0x81a008e0, "e,f,g", 1 },
{ "fmuls",      0xc1f83fe0, 0x81a00920, "e,f,g", 1 },
{ "fmuld",      0xc1f83fe0, 0x81a00940, "e,f,g", 1 },
{ "fmulx",      0xc1f83fe0, 0x81a00960, "e,f,g", 1 },
{ "fdivs",      0xc1f83fe0, 0x81a009a0, "e,f,g", 1 },
{ "fdivd",      0xc1f83fe0, 0x81a009c0, "e,f,g", 1 },
{ "fdivx",      0xc1f83fe0, 0x81a009e0, "e,f,g", 1 },

{ "fcmps",      0xfff83fe0, 0x81a80a20, "e,f", 1 },
{ "fcmpd",      0xfff83fe0, 0x81a80a40, "e,f", 1 },
{ "fcmpx",      0xfff83fe0, 0x81a80a60, "e,f", 1 },
{ "fcmpes",     0xfff83fe0, 0x81a80aa0, "e,f", 1 },
{ "fcmped",     0xfff83fe0, 0x81a80ac0, "e,f", 1 },
{ "fcmpex",     0xfff83fe0, 0x81a80ae0, "e,f", 1 },

#if 0
{ "cpop1",      0x0, 0x81b00000, "[1],d",   0 },
{ "cpop1",      0x0, 0x81b00000, "[1+2],d", 1 },
{ "cpop2",      0x0, 0x81b80000, "[1+i],d", 1 },
#endif

};

#define NUMOPCODES ((sizeof sparc_opcodes)/(sizeof *sparc_opcodes))

