
#include <stdio.h>

#define MAXSIZE 5000
static char *class_A[MAXSIZE] = {"\0"};
char *class_B[MAXSIZE] = {"\0"};
char *class_C[MAXSIZE] = {"\0"};
int acount = 0;
int bcount = 0;
int ccount = 0;
FILE *in, *out;



/* this is a test debug routine */
void
print_classA()
{

int i;

  printf("printing CLASS A:\n");
  printf("acount is: %i\n",acount);
  for (i = 0; i<acount; i++)
       printf(" : %i the word is:%s\n",i,class_A[i]);


}

void
read_file(filename)
char *filename;
{

int letter;
char *word;

  if ((in = fopen(filename,"r")) == NULL)
     printf("Can't open %s for reading.\n", filename);
  else
    {
     letter = getc(in);
     while(letter != EOF)
      {
       char tmp[100] = {'\0'};

       word = &tmp[0];
       while((letter != ' ') && (letter != EOF))
        {

           if ((letter >= 'a' && letter <= 'z') || (letter >= 'A' && letter
                <= 'Z') || (letter >= '0' && letter <= '9'))
               {
                     letter = tolower(letter);
                     *word++ =  letter;
               }
           else
             break;
          letter = getc(in);      
        }	
       *word++ = '\0';
       printf("the word is:%s\n",tmp);
       if (strcmp("henry",tmp) > 1)
         {
           class_A[acount] = tmp;
           printf("a: %i class_a is: %s and tmp is: %s\n",acount,class_A[acount],tmp);
printf("the class a:%s\n",class_A[0]);
printf("the class a:%s\n",class_A[1]);
printf("the class a:%s\n",class_A[2]);
           acount++;
         }
           
       while (!((letter >= 'a' && letter <= 'z') || (letter >= 'A' && letter
                <= 'Z') || (letter >= '0' && letter <= '9')) && (letter != EOF))
           letter = getc(in);
       if (letter == EOF)
          break;
       }
     }
}

main()
{
 char more_file;
 int c;
 char filename[80] = {'\0'};



 do
  {
    printf("Do you want to specify a File (y/n)?");
    scanf("%c",&more_file);
    if (more_file == '\n')
        more_file = getchar();

    if (more_file == 'y')
      {
       printf("Enter the File name?");
       scanf("%s",&filename);
       read_file(filename);
       print_classA();
      }

  }  while (more_file == 'y');


}
