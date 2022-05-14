#include<stdio.h>

/* #ident "this is a test which does absolutely nothing"  */
/* #ident "this does even less"  */

int flop;

void too()
{
  printf("hello for too\n");
}
 
void goo()
{
  printf("hello from goo\n");
}

void foo()
{ 
  printf("hello from foo\n");
  goo();
}


main()
{
  goo();
  if (flop > 2001)
    printf("hello,world\n");
  else 
    printf("hello you\n");
  foo();
  too();
  goo();
}
/* this is a test */
