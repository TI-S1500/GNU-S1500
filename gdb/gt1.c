extern int addthis();

int addit(i,j)
    int i,j;
{
int k;
      k=i+j;
      printf("k= %i\n",k);
      return k;
}

int subit(i,j)
  int i,j;

{
 int p;
       p=j-i;
       printf("p=%i\n",p);
       return p;
}

main()
{
  int m=5,n=6;
  int l;

   printf("this is fun\n");
   l=addit(m,n);
   printf("l= %i\n",l);
   l=subit(m,n);
   printf("l= %i\n",l);
   l=addthis(m,n);
   printf("l= %i\n",l);
}
