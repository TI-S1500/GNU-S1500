#include <stdio.h>

#define COMMON

void moo();
void error();

#define bzero(s,n) memset((s),0,(n))

COMMON char
flagseen[128];			/* ['x'] TRUE if "-x" seen. */

COMMON char *  arg;


main()
{
  int i;
  char aa;
  arg  = "coff";

/*  bzero (flagseen, sizeof(flagseen));  */
  for (i=0;i<128;i++)
    flagseen[i] = 0;
  while ( aa = * arg) {
    arg++;
    aa &= 0x7F;	/* ascii only please */
    if (flagseen[aa]) {
      error("virtual memory exceeded\n\n");
    }
    else moo();
  }
}

void
moo()
{
  printf("got a new char\n");
}

void
error(char * error_string)
{
  printf("%s",error_string);
}
