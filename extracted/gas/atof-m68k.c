/* atof_m68k.c - turn a Flonum into a 68020 floating point number
   Copyright (C) 1987 Free Software Foundation, Inc.

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

#include "flonum.h"
#ifdef USG
#define bzero(s,n) memset(s,0,n)
#endif

extern FLONUM_TYPE generic_floating_point_number; /* Flonums returned here. */
#define NULL (0)

extern char EXP_CHARS[];
				/* Precision in LittleNums. */
#define MAX_PRECISION (6)
#define F_PRECISION (2)
#define D_PRECISION (4)
#define X_PRECISION (6)
#define P_PRECISION (6)

				/* Length in LittleNums of guard bits. */
#define GUARD (2)

static unsigned long int mask [] = {
  0x00000000,
  0x00000001,
  0x00000003,
  0x00000007,
  0x0000000f,
  0x0000001f,
  0x0000003f,
  0x0000007f,
  0x000000ff,
  0x000001ff,
  0x000003ff,
  0x000007ff,
  0x00000fff,
  0x00001fff,
  0x00003fff,
  0x00007fff,
  0x0000ffff,
  0x0001ffff,
  0x0003ffff,
  0x0007ffff,
  0x000fffff,
  0x001fffff,
  0x003fffff,
  0x007fffff,
  0x00ffffff,
  0x01ffffff,
  0x03ffffff,
  0x07ffffff,
  0x0fffffff,
  0x1fffffff,
  0x3fffffff,
  0x7fffffff,
  0xffffffff
  };

static int bits_left_in_littlenum;
static int littlenums_left;
static LITTLENUM_TYPE *	littlenum_pointer;

static int
next_bits (number_of_bits)
     int		number_of_bits;
{
  int			return_value;

  if(!littlenums_left)
  	return 0;
  if (number_of_bits >= bits_left_in_littlenum)
    {
      return_value  = mask [bits_left_in_littlenum] & *littlenum_pointer;
      number_of_bits -= bits_left_in_littlenum;
      return_value <<= number_of_bits;
      if(--littlenums_left) {
	      bits_left_in_littlenum = LITTLENUM_NUMBER_OF_BITS - number_of_bits;
	      littlenum_pointer --;
	      return_value |= (*littlenum_pointer>>bits_left_in_littlenum) & mask[number_of_bits];
      }
    }
  else
    {
      bits_left_in_littlenum -= number_of_bits;
      return_value = mask [number_of_bits] & (*littlenum_pointer>>bits_left_in_littlenum);
    }
  return (return_value);
}

static void
make_invalid_floating_point_number (words)
     LITTLENUM_TYPE *	words;
{
	as_warn("cannot create floating-point number");
	words[0]= ((unsigned)-1)>>1;	/* Zero the leftmost bit */
	words[1]= -1;
	words[2]= -1;
	words[3]= -1;
	words[4]= -1;
	words[5]= -1;
}

/***********************************************************************\
*	Warning: this returns 16-bit LITTLENUMs. It is up to the caller	*
*	to figure out any alignment problems and to conspire for the	*
*	bytes/word to be emitted in the right order. Bigendians beware!	*
*									*
\***********************************************************************/

char *				/* Return pointer past text consumed. */
atof_m68k (str, what_kind, words)
     char *		str;	/* Text to convert to binary. */
     char		what_kind; /* 'd', 'f', 'g', 'h' */
     LITTLENUM_TYPE *	words;	/* Build the binary here. */
{
	LITTLENUM_TYPE	bits [MAX_PRECISION + MAX_PRECISION + GUARD];
				/* Extra bits for zeroed low-order bits. */
				/* The 1st MAX_PRECISION are zeroed, */
				/* the last contain flonum bits. */
	char *		return_value;
	int		precision; /* Number of 16-bit words in the format. */
	long int	exponent_bits;

	return_value = str;
	generic_floating_point_number.low	= bits + MAX_PRECISION;
	generic_floating_point_number.high	= NULL;
	generic_floating_point_number.leader	= NULL;
	generic_floating_point_number.exponent	= NULL;
	generic_floating_point_number.sign	= '\0';

				/* Use more LittleNums than seems */
				/* necessary: the highest flonum may have */
				/* 15 leading 0 bits, so could be useless. */

	bzero (bits, sizeof(LITTLENUM_TYPE) * MAX_PRECISION);

	switch(what_kind) {
	case 'f':
	case 'F':
	case 's':
	case 'S':
		precision = F_PRECISION;
		exponent_bits = 8;
		break;

	case 'd':
	case 'D':
	case 'r':
	case 'R':
		precision = D_PRECISION;
		exponent_bits = 11;
		break;

	case 'x':
	case 'X':
	case 'e':
	case 'E':
		precision = X_PRECISION;
		exponent_bits = 15;
		break;

	case 'p':
	case 'P':
		
		precision = P_PRECISION;
		exponent_bits= -1;
		break;

	default:
		make_invalid_floating_point_number (words);
		return NULL;
	}

	generic_floating_point_number.high = generic_floating_point_number.low + precision - 1 + GUARD;

	if (atof_generic (& return_value, ".", EXP_CHARS, & generic_floating_point_number)) {
		/* as_warn("Error converting floating point number (Exponent overflow?)"); */
		make_invalid_floating_point_number (words);
		return NULL;
	}
	gen_to_words(words, precision, exponent_bits);
	return return_value;
}

/* This is really identical to atof_m68k except for some details */

gen_to_words(words,precision,exponent_bits)
LITTLENUM_TYPE *words;
long int	exponent_bits;
int precision;
{
	int return_value=0;

	long int	exponent_1;
	long int	exponent_2;
	long int	exponent_3;
	long int	exponent_4;
	int		exponent_skippage;
	LITTLENUM_TYPE	word1;
	LITTLENUM_TYPE *	lp;

	if (generic_floating_point_number.low > generic_floating_point_number.leader) {
		/* 0.0e0 seen. */
		bzero (words, sizeof(LITTLENUM_TYPE) * precision);
		return return_value;
	}

	/* NaN:  Do the right thing */
	if(generic_floating_point_number.sign==0) {
		if(precision==F_PRECISION) {
			words[0]=0xffc0;
			words[1]=0x0007;
		} else {
			words[0]=0x7ff0;
			words[1]=0;
			words[2]=0xffff;
			words[3]=0xffff;
		}
		return return_value;
	} else if(generic_floating_point_number.sign=='P') {
		/* +INF:  Do the right thing */
		if(precision==F_PRECISION) {
			words[0]=0x7f80;
			words[1]=0;
		} else {
			words[0]=0x7ff0;
			words[1]=0;
			words[2]=0;
			words[3]=0;
		}
		return return_value;
	} else if(generic_floating_point_number.sign=='N') {
		/* Negative INF */
		if(precision==F_PRECISION) {
			words[0]=0xff80;
			words[1]=0x0;
		} else {
			words[0]=0xfff0;
			words[1]=0x0;
			words[2]=0x0;
			words[3]=0x0;
		}
		return return_value;
	}
		/*
		 * The floating point formats we support have:
		 * Bit 15 is sign bit.
		 * Bits 14:n are excess-whatever exponent.
		 * Bits n-1:0 (if any) are most significant bits of fraction.
		 * Bits 15:0 of the next word are the next most significant bits.
		 * And so on for each other word.
		 *
		 * So we need: number of bits of exponent, number of bits of
		 * mantissa.
		 */
	bits_left_in_littlenum = LITTLENUM_NUMBER_OF_BITS;
	littlenum_pointer = generic_floating_point_number.leader;
	littlenums_left = 1+generic_floating_point_number.leader - generic_floating_point_number.low;
	/* Seek (and forget) 1st significant bit */
	for (exponent_skippage = 0;! next_bits(1); exponent_skippage ++)
		;
	exponent_1 = generic_floating_point_number.exponent + generic_floating_point_number.leader + 1 -
 generic_floating_point_number.low;
	/* Radix LITTLENUM_RADIX, point just higher than generic_floating_point_number.leader. */
	exponent_2 = exponent_1 * LITTLENUM_NUMBER_OF_BITS;
	/* Radix 2. */
	exponent_3 = exponent_2 - exponent_skippage;
	/* Forget leading zeros, forget 1st bit. */
	exponent_4 = exponent_3 + ((1 << (exponent_bits - 1)) - 2);
	/* Offset exponent. */

	if (exponent_4 & ~ mask [exponent_bits]) {
			/*
			 * Exponent overflow. Lose immediately.
			 */

			/*
			 * We leave return_value alone: admit we read the
			 * number, but return a floating exception
			 * because we can't encode the number.
			 */
		make_invalid_floating_point_number (words);
		return return_value;
	}
	lp = words;

	/* Word 1. Sign, exponent and perhaps high bits. */
	/* Assume 2's complement integers. */
	word1 = ((exponent_4 & mask [exponent_bits]) << (15 - exponent_bits)) |
 ((generic_floating_point_number.sign == '+') ? 0 : 0x8000) | next_bits (15 - exponent_bits);
	* lp ++ = word1;

	/* X_PRECISION is special: it has 16 bits of zero in the middle,
	   followed by a 1 bit. */
	if(exponent_bits==15 && precision==X_PRECISION) {
		*lp++=0;
		*lp++= 1<<(LITTLENUM_NUMBER_OF_BITS)|next_bits(LITTLENUM_NUMBER_OF_BITS-1);
	}

	/* The rest of the words are just mantissa bits. */
	for (; lp < words + precision; lp++)
		* lp = next_bits (LITTLENUM_NUMBER_OF_BITS);

	if (next_bits (1)) {
		unsigned long int	carry;
			/*
			 * Since the NEXT bit is a 1, round UP the mantissa.
			 * The cunning design of these hidden-1 floats permits
			 * us to let the mantissa overflow into the exponent, and
			 * it 'does the right thing'. However, we lose if the
			 * highest-order bit of the lowest-order word flips.
			 * Is that clear?
			 */


/* #if (sizeof(carry)) < ((sizeof(bits[0]) * BITS_PER_CHAR) + 2)
	Please allow at least 1 more bit in carry than is in a LITTLENUM.
	We need that extra bit to hold a carry during a LITTLENUM carry
	propagation. Another extra bit (kept 0) will assure us that we
	don't get a sticky sign bit after shifting right, and that
	permits us to propagate the carry without any masking of bits.
#endif */
		for (carry = 1, lp --; carry && (lp >= words); lp --) {
			carry = * lp + carry;
			* lp = carry;
			carry >>= LITTLENUM_NUMBER_OF_BITS;
		}
		if ( (word1 ^ *words) & (1 << (LITTLENUM_NUMBER_OF_BITS - 1)) ) {
			/* We leave return_value alone: admit we read the
			 * number, but return a floating exception
			 * because we can't encode the number.
			 */
			make_invalid_floating_point_number (words);
			return return_value;
		}
	}
	return (return_value);
}

/* This routine is a real kludge.  Someone really should do it better, but
   I'm too lazy, and I don't understand this stuff all too well anyway
   (JF)
 */
void
int_to_gen(x)
long x;
{
	char buf[20];
	char *bufp;

	sprintf(buf,"%ld",x);
	bufp= &buf[0];
	if(atof_generic(&bufp,".", EXP_CHARS, &generic_floating_point_number))
		as_warn("Error converting number to floating point (Exponent overflow?)");
}
