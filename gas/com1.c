extern char mychar;
extern double myfloat;
extern long mylong;
extern char c11[11];
extern int myint;
char bigggname[2];
static int stat1;
static char stat2;  
int biggernint[3];
main()
{
	printf("location of mychar is 0x%x\n", &mychar);
	printf("location of myfloat is 0x%x\n", &myfloat);
	printf("location of mylong is 0x%x\n", &mylong);
	printf("location of c11 is 0x%x\n", &c11);
	printf("location of myint is 0x%x\n", &myint);
	printf("location of stat1 is 0x%x\n", &stat1);
	printf("location of stat2 is 0x%x\n", &stat2);
	printf("location of bigggname is 0x%x\n", &bigggname);
	printf("location of biggernint is 0x%x\n", &biggernint);
}
