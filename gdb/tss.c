
#include <stdio.h>

main()
{
static char *hello = "hello";
static char goodbye[] = "goodbye";
static int static_integer;
char xyz[] = "xyz";

 static_integer = 10;
 printf("the static char is %s\n",hello);
 printf("the static char is %s\n",goodbye);
 printf("the static char is %i\n",static_integer);
 printf("the static char is %s\n",xyz);
}
