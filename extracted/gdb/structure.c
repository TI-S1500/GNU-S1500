/* The purpose of this module is to see how structures are allocated by
   compilers.  i.e.

       when are bytes forced to word or long word boundaries.
       when are shorts forced to word or long word boundaries.
*/
#include <stdio.h>

char char1;
short short1;
long long1;

FILE myfiles[4];

struct{
    char char1;
    short short1;
    char  char2;
    long long1;
    } struct1[3];

union {
	struct {
   unsigned long bit0	:1;
   unsigned long bit1_4 :4;
   unsigned long bit5	:1;
   unsigned long bit6_7: 2;
	}  mybits;
	unsigned long mylong;
} myunion;

unsigned long mylong;


struct { char     markstart;
         unsigned int a:1, b:1, c:1, d:1, e:1, f:1, g:1, h:1;
         unsigned int i:1, j:1, k:1, l:1, m:1, n:1, o:1, p:1;
         char     markend;
       }bits;

struct { 
	 char x;
	 long y;
	 char z;
	 char zz;}odd_struct;


main(argc, argv, envp)
int argc;
char **argv, **envp;
{
	printf("myfiles[0] = 0x%x\n", &myfiles[0] );
	printf("myfiles[1] = 0x%x\n", &myfiles[1] );
	printf("myfiles delta  = %d\n", 
		(char *)&myfiles[1]._cnt - (char *)&myfiles[0]._cnt);
   printf(" structure               address \n");
   printf("char char1               0x%x \n", &char1);
   printf("char short1              0x%x \n", &short1);
   printf("char long1               0x%x \n", &long1);
   printf("struct1[0].char1            0x%x \n", &struct1[0].char1);
   printf("struct1[0].short1           0x%x \n", &struct1[0].short1);
   printf("struct1[0].char2            0x%x \n", &struct1[0].char2);
   printf("struct1[0].long1            0x%x \n", &struct1[0].long1);

   myunion.mybits.bit0 = 1;
   myunion.mybits.bit5 = 1;
   printf("mybits = 0x%x \n", myunion.mylong);
   printf("bits.markstart           0x%x \n", &bits.markstart);
   printf("bits.markend	   	    0x%x \n", &bits.markend);
   printf("odd_struct.x             0x%x \n", &odd_struct.x);
   printf("odd_struct.y             0x%x \n", &odd_struct.y);
   printf("odd_struct.z             0x%x \n", &odd_struct.z);
   printf("odd_struct.zz	    0x%x \n", &odd_struct.zz);	
	char_stack(0x00abcdef,'a',0xabcdef00);
}

char_stack(long1, chr1, long2)
long long1;
char chr1;
long long2;
{
	printf("long1 location = 0x%x\n", &long1);
	printf("chr1 location = 0x%x\n", &chr1);
	printf("long2 location = 0x%x\n", &long2);
	printf(
		"&chr1 - &long1 = %d\n", (char *)&chr1 - (char *)&long1); 
}
