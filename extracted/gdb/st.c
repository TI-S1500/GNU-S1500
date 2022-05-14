struct cat {
   int i;
   char *name;
  } deva;

int printit(ceva)
  struct cat ceva;
 {
  printf("The name is = %s\n",ceva.name);
  printf("the age is= %i\n",ceva.i);
 }

 main()
 {
/*   struct cat deva;*/
   deva.i=2;
   deva.name="deva gal";
   printit(deva);
 }
