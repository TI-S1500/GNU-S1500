int i2;
main(argc,argv,envp)
int argc;
char **argv, **envp;
{
	int i;
	for(i=0; i < 30; i++) {
		f1();
	}
}

f1()
{ i2++;}
