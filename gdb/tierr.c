/*
	(C) COPYRIGHT, TEXAS INSTRUMENTS INCORPORATED, 1988.  ALL
	RIGHTS RESERVED.  PROPERTY OF TEXAS INSTRUMENTS INCORPORATED.
	RESTRICTED RIGHTS - USE, DUPLICATION, OR DISCLOSURE IS SUBJECT
	TO RESTRICTIONS SET FORTH IN TI'S PROGRAM LICENSE AGREEMENT AND
	ASSOCIATED DOCUMENTATION.

	TISAM UTILITIES ERROR PROCESSING ROUTINES

	The er function checks the "rtn" parameter for an error condition (-1).
	If no error is detected, "rtn" is returned.  If an error is detected,
	a message is printed and the process is terminated.

	Parameter "tisam" is non-zero if a tisam function was called, and zero
	if a non-tisam function was called.  Parameters "t" and "s" indicate
	the number of tisam and non-tisam closes to perform on the file
	descriptors provided in parameters f1 thru f4.

	The error message consists of the name of the program, as obtained
	from the global variable "util_name", the name of the function
	returning the error, as obtained form parameter "msg", the error
	code, as obtained from errno or tierrno, and a description of the
	error.  "perror()" is used to print non-tisam error messages.

	The function "errL" is like "err" except that it expects a long
	integer in the "rtn" parameter and it returns a long integer.

	WARNING!!!  THE CALLING UTILITY MUST DECLARE AND EVALUATE THE
		    GLOBAL CHARACTER ARRAY: util_name.
*/

#include <errno.h>
#include <tisam.h>
#include <tiprof.h>

char		*util_name;    /* Global variable initialized by calling proc */

static void	err();		/* (forward reference) */
void		perror();
void		xit();

int
er(rtn,msg,tisam,t,s,f1,f2,f3,f4)
int	rtn,tisam,t,s,f1,f2,f3,f4;
char	*msg;
{
	if (rtn==-1) err(msg,tisam,t,s,f1,f2,f3,f4);
	else return(rtn);
}

long
erL(rtn,msg,tisam,t,s,f1,f2,f3,f4)
long	rtn;
int	tisam,t,s,f1,f2,f3,f4;
char	*msg;
{
	if (rtn==-1L) err(msg,tisam,t,s,f1,f2,f3,f4);
	else return(rtn);
}

static void
err(msg,tisam,t,s,f1,f2,f3,f4)
char	*msg;
int	tisam,t,s,f1,f2,f3,f4;
{
	printf("\n%s: %s: %s\n\n",util_name,msg,
		(tisam)?		tierrmsg:
		(errno<=sys_nerr)?	sys_errlist[errno]:
					"unknown error"
	);

	for (;t;t--) {
		ticlose(f1);
		f1=f2;
		f2=f3;
		f3=f4;
	}
	for (;s;s--) {
		close(f1);
		f1=f2;
		f2=f3;
		f3=f4;
	}
	xit((tisam&&tierrno)? tierrno: (!tisam&&errno)? errno: -1);
}
