#include <errno.h>
#include <stdio.h>
#include <float.h>
#include <math.h>

/* The following definitions are highly machine and compiler dependent */

#define NORM_EXP 0x3fe
typedef struct double_rep_struct {
    unsigned neg:1;
    unsigned exp:11;
    unsigned highbits:20;
    unsigned lowbits:32;
} double_rep;

typedef union doub_union {
    double val;
    double_rep rep;
} doub_union;

static explode(double value)
{
    doub_union u;
    u.val = value;
    printf("d = %25.20e = %25.20e\n", u.val, value);
    printf("neg = %x  exp=%x  highbits=%x  lowbits=%x\n",
	   u.rep.neg, u.rep.exp, u.rep.highbits, u.rep.lowbits);
}

/* ANSI X3J11 4.5.4.3 */
double
ldexp(double value, int exp)
{
    doub_union u;
    register int newexp;
    u.val = value;
    newexp = u.rep.exp+exp;
    if (value == 0.0) return 0.0;
    if (u.rep.exp==0x7ff) return value;
    if (newexp>=0x7ff) {errno=EDOM; return u.rep.neg ? -HUGE_VAL : HUGE_VAL;}
    if (newexp>0) {
	u.rep.exp = newexp;
	return u.val;
    }

    /* newexp < 0: return denormalized number */
    if (newexp < -51) return 0.0; /* underflow */
    newexp = 1-newexp;
    u.rep.highbits = (newexp > 20) ? 0 : u.rep.highbits >> newexp;
    u.rep.lowbits = (newexp > 32) ? 0 : u.rep.lowbits>>newexp |
	(newexp <= 32) ? u.rep.highbits<<(32-newexp)
	    : u.rep.highbits>>(newexp-32);
    return u.val;
}


/* ANSI X3J11 4.5.4.2 */
double
frexp(double value, int *exp)
{
    int i;
    doub_union u;
    u.val = value;
    if (value == 0.0) {*exp = 0; return 0.0;}
    if (u.rep.exp == 0x7ff) {errno=EDOM; *exp = 0; return value;}
    if (u.rep.exp != 0) {
	*exp = u.rep.exp - NORM_EXP;
	u.rep.exp = NORM_EXP;
	return u.val;
    }
    /* denormalized real */
    for (i=0; i<60; i++) {
	u.val *= 2;
	if (u.rep.exp != 0) {
	    *exp = u.rep.exp - NORM_EXP - i;
	    u.rep.exp = NORM_EXP;
	    return u.val;
	}
    }
}

/* ANSI X3J11 4.5.6.4 */
double
fmod(double x, volatile double y)
{
    int neg = 0;
    if (x == 0.0 || y == 0.0) return 0.0;
    if (y < 0.0) y = -y;
    if (x < 0.0) {x = -x; neg = 1;}
    if (x >= y) {
	union doub_union u;
	int px, py, e2;
	u.val = y;
	frexp(x, &px);  frexp(y, &py);
	for (e2 = px-py+1; e2>=0; e2--) {
	    register int exp = py+e2;
	    if (exp <= 0) {
		double t = ldexp(y, e2);
		if (x >= t) x -= t;
	    } else {  /* a more efficient version */
		double q;
		u.rep.exp = exp;
		q = u.val;
		if (x >= u.val) x -= u.val;
	    }
	}
    }
    return neg ? -x : x;
}


main()
{
    char buf[100];
    double a,b;
    int  count,num;
    for (;;) {
	printf("x, y? ");
	fflush(stdout);
	gets(buf);
	sscanf(buf, "%lf %lf", &a, &b);
	if (b == 0.0) return 0;
	explode(a); explode(b);
	printf("x = %25.20e  y = %25.20e\n", a, b);
	printf("r:  %25.20e\n", fmod(a,b));
    }
}

