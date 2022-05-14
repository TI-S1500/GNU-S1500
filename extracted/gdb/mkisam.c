/*
 *      (C) COPYRIGHT, TEXAS INSTRUMENTS INCORPORATED, 1987,1988.  ALL
 *      RIGHTS RESERVED.  PROPERTY OF TEXAS INSTRUMENTS INCORPORATED.
 *      RESTRICTED RIGHTS - USE, DUPLICATION, OR DISCLOSURE IS SUBJECT
 *      TO RESTRICTIONS SET FORTH IN TI'S PROGRAM LICENSE AGREEMENT AND
 *      ASSOCIATED DOCUMENTATION.
 */

#ident "@(#)MKISAM	2.8.0	07 March 1991";

#include <stdio.h>
#include <tisam.h>
#include <string.h>
#include <tiprof.h>
#include <indx.h>

#ifdef TIPROF
unsigned long	prof[PSIZE][2];
#endif

void		xit();
void            read_idx();
void            read_hdr();
static void     erxit();
static void     tmap();
static int      test();
int             getline();

long            erL();

#define T_COUNT 20
static char             *idx=(char*)0,*dat=(char*)0,*t[T_COUNT],*r[T_COUNT];
static char		buf[1024],*in,s1[256],s2[256],s3[256];
char                    *aud=(char*)0,aud_enabled=0,tbuf[80];
unsigned                numkeys;
static unsigned         i,j,k,fopt=0,vopt=0,c;
unsigned long           opt;
unsigned		reclen;

struct tikeydesc        kd;
FILE			*strm;

extern int              optind,opterr;
extern char             *optarg;

static void
usage()
{
        printf("usage: mkisam [-f file] [-v] data_file [index_file]\n");
        xit(-1);
}

/*
   This utility is designed to create an ISAM file.  It will read  the file
   designated by the "-f" option or standard input for a description of this
   ISAM file.  The "-v" flag indicates verbose mode.  The description file
   consists of one header descriptor and one index descriptor for each key.

   Following is the file header descriptor format:

DATA FILE:		<Not Used>
INDEX FILE:             <Required and used only if no cmd line specification>
AUDIT FILE:		<Optional>
VERSION NUMBER:         <Not used>
DATA FILE SIZE:		<Not Used>
INDEX FILE SIZE:	<Not Used>
MAXIMUM RECORD LENGTH:  <Required>
NUMBER OF DATA RECORDS: <Not used>
FILE OPTIONS:           <Required.  Value null or "none" or any combination
                         of "compression", "no-freelist", "no-exclusive",
                         "process-integrity", "system-data-integrity",
                         "system-index-integrity", "sleep-on-lock" and
                         "rewrite-integrity"
NUMBER OF KEYS:         <Required>


   Following is the index descriptor format:

KEY IDENTIFIER:         <Not used>
NUMBER OF PARTS:        <Required>
KEY ATTRIBUTES:         <Required.  Null value or "none" or any combination of
                         "duplicates", "compression", "convert", "no-currency",
                         "validate", and "pad")
        KEY TYPE: <Required>    KEY START: <Required>   KEY LENGTH: <Required>

   The "KEY TYPE" line is repeated for each part.  The "KEY TYPE:" values
   are "ascending" or "descending", followed by "character", "integer",
   "long", "float", or "double".

   Command usage has the following form:
        mkisam data_file [index_file]
*/
#ifndef VFISAM
main(argc, argv)
int argc;
char *argv[];
{
        int             tifd;
        extern char     *util_name;

        util_name="mkisam";

	PZERO(prof)
	PSTART(prof)

        optind=1;
        opterr=0;
        while((c=getopt(argc,argv,"f:v"))!=EOF) switch (c) {
                case 'f':       if (fopt) usage();
                                fopt++;
                                in=optarg;
                                break;
                case 'v':       if (vopt) usage();
                                vopt++;
                                break;
                default:        usage();
        }

        if (argc<2 || argc>optind+2) usage();

        /*
         * If input file specified, open it.  Otherwise use standard input.
         */
        if (fopt) {
                if ((strm=fopen(in,"r"))==NULL) {
                        sprintf(s1,"mkisam: error. Cannot open %s\n",in);
                        erxit(s1);
                }
        }
        else strm=stdin;

        /*
         * Set "dat" and "idx" if specified in cmd line.
         */
	if (argc>=optind+1) dat=argv[optind];
        if (argc==optind+2) idx=argv[optind+1];

        tbuf[79]=0;

        read_hdr();     /* Read general information */

	if (!dat) erxit("Data file name must be on command line or in map");

        read_idx();     /* Get info on primary key */

        /*
         * Zero out critical globals in case user re-linked us and has
         * initial values set.
         */
        tiopt=0L;
        tiflgs=tiflgds=tiflge=tiflgde=0;
 
        /*
         * Build the file and set the global options.
         */
        tifd=er(tibuild(idx,dat,reclen,&kd,TIINOUT),"tibuild",1,0,0);
        erL(tioption(tifd,TIOPTSET|TIOPTGLOBAL,opt),"tioption",1,1,0,tifd);
	if (aud) {
		er(tiaudit(tifd,aud,TIAUDSETNAME),"tiaudit",1,1,0,tifd);
		if (aud_enabled) er(tiaudit(tifd,(char*)0,TIAUDSTART),
			"tiaudit",1,1,0,tifd);
	}

        /*
         * Set up each key.
         */
        while (--numkeys) {
                getline(0);
                read_idx();
                er(tiaddindex(tifd, &kd),"tiaddindex",1,1,0,tifd);
        }

        /*
         * Close it up.
         */
        er(ticlose(tifd),"ticlose",1,0,0);
        xit(0);        /* all okay */
}
#endif

void
read_hdr()
/*
 * Read INDEX FILE (optional), VERSION NUMBER (optional), MAXIMUM RECORD LENGTH,
 * NUMBER OF DATA RECORDS (optional), FILE OPTIONS, and NUMBER OF KEYS.
 * Evaluate global variables idx (index file name) if not already evaluated
 * from command line, reclen (record length), opt (file options), and numkeys
 * (number of keys).
 */

{
        getline(0);

	/* Read past DATA FILE (optional) if provided */
	if (i=test(DATA_FILE)) {
		if (!dat && r[i] && *r[i] && strcmp(r[i],NONE)) {
			strcpy(s1,r[i]);
			dat=s1;
		}
		getline(0);
	}

        /*
         * Read INDEX FILE (optional) and evaluate "idx" if not already
         * evaluated and if a value is provided here.
         */
        if (i=test(INDX_FILE)) {
                if (!idx && r[i] && *r[i] && strcmp(r[i],NONE)) {
                        strcpy(s2,r[i]);
                        idx=s2;
                }
                getline(0);
        }

	/* Read AUDIT FILE (optional) and evaluate "aud" if found. */
	if (i=test(AUDIT_FILE)) {
		if (r[i] && *r[i] && strcmp(r[i],NONE)) {
			strcpy(s3,r[i]);
			aud=s3;
			aud_enabled = r[++i] && *r[i] && !strcmp(r[i],ENABLED);
		}
		getline(0);
	}

        /*
         * Read past VERSION NUMBER (optional) if provided.
         */
        if (test(VERSION)) getline(0);

	/*
	 * Read past DATA FILE SIZE (optional) if provided.
	 */
	if (test(DAT_FILE_SIZE)) getline(0);

	/*
	 * Read past INDEX FILE SIZE (optional) if provided.
	 */
	if (test(IDX_FILE_SIZE)) getline(0);

        /*
         * Read MAXIMUM RECORD LENGTH and evaluate reclen.
         */
        if (i=test(MAX_REC_LEN)) {
                if (r[i] && sscanf(r[i],"%u",&reclen) && reclen>0) getline(0);
                else erxit("Bad \"RECORD LENGTH\" specification.");
        }
        else erxit("\"RECORD LENGTH\" specification not found.");

        /*
         * Read past NUMBER OF DATA RECORDS (optional) if provided.
         */
        if (test(DATA_RECORDS)) getline(0);

        /*
         * Read FILE OPTIONS and evaluate "opt".
         */
        if (i=test(FILE_OPT)) {
                opt=0L;
                if (r[i] && strcmp(r[i],NONE)) {
                        while (1) {
                                if (!(r[i])) {
                                        getline(0);
                                        i=0;
                                }

                                if (!strcmp(r[i],DCOMPRESS))   opt|=TICOMPRESS;
                                else if (!strcmp(r[i],NOFREE)) opt|=TINOFREE;
                                else if (!strcmp(r[i],NOEXCL))opt|=TINOEXCLLOCK;
                                else if (!strcmp(r[i],PROSAFE)) opt|=TILOG;
                                else if (!strcmp(r[i],DATSAFE)) opt|=TISWDAT;
                                else if (!strcmp(r[i],KEYSAFE)) opt|=TISWKEY;
                                else if (!strcmp(r[i],REWSAFE)) opt|=TIREWLOG;
                                else if (!strcmp(r[i],ADVLOCK)) opt|=TIADVLOCK;
                                else if (!strcmp(r[i],SLOCK))   opt|=TISLEPLOCK;
                                else if (!i) break;
                                else erxit("Bad \"FILE OPTION\".");

                                i++;
                        }
                }
                else getline(0);
        }
        else erxit("\"FILE OPTIONS\" not found.");

        /*
         * Read NUMBER OF KEYS and evaluate "numkeys".
         */
        if (i=test(NUM_OF_KEYS)) {
                if (r[i] && sscanf(r[i],"%u",&numkeys)) getline(0);
                else erxit("Bad \"NUMBER OF KEYS\" specification.");
        }
        else erxit("\"NUMBER OF KEYS\" specification not found.");
}

void
read_idx()
/*
 * Read KEY IDENTIFIER (optional), NUMBER OF PARTS, and KEY ATTRIBUTES.
 * For each part read KEY TYPE, KEY START, and KEY LENGTH.  Evaluate "kd".
 */
{
        /*
         * Clear out kd flags.
         */
        kd.k_flags=kd.k_flage=0;
        for (i=TINFIELD;i--;) kd.k_part[i].kp_type=0;

        /*
         * Read past KEY IDENTIFIER.
         */
        if (test(KEY_ID)) getline(0);

        /*
         * Read NUMBER OF PARTS and evaluate kd.k_nparts.
         */
        if (i=test(NUM_OF_PART)) {
                if (r[i] && sscanf(r[i],"%hd",&kd.k_nparts)) getline(0);
                else erxit("Invalid \"NUMBER OF PARTS\" specification.");
        }
        else erxit("\"NUMBER OF PARTS\" specification not found.");

	/*
	 * Verify than NUMBER OF PARTS is within range.
	 */
	if (kd.k_nparts < 0 || kd.k_nparts > TINFIELD)
		erxit("\"NUMBER OF PARTS\" specification out of range.");

        /*
         * Read KEY ATTRIBUTES and evaluate kd.k_flags and kd.k_flage.
         */
        if (i=test(KEY_ATTR)) {
                if (!(r[i])) getline(0);
                else if (strcmp(r[i],NONE)) while (1) {
                        if (!(r[i])) {
                                if (!getline(1)) return;
                                i=0;
                        }

                        if (!strcmp(r[i],DUPLICATES))
                                kd.k_flags|=TIKEYDUP;
                        else if (!strcmp(r[i],COMPRESSION))
                                kd.k_flags|=TIKEYCMP;
                        else if (!strcmp(r[i],CONVERT))
                                kd.k_flage|=TIKEYSTR;
                        else if (!strcmp(r[i],NOCURRENCY))
                                kd.k_flage|=TIKEYNOA;
                        else if (!strcmp(r[i],VALIDATE))
                                kd.k_flage|=TIKEYVAL;
                        else if (!strcmp(r[i],PAD))
                                kd.k_flage|=TIKEYEVN;
                        else if (!strcmp(r[i],FDUPS))
                                kd.k_flage|=TIKEYFAS;
                        else if (!i) break;
                        else erxit("Bad \"KEY ATTRIBUTES\" specification.");

                        i++;
                }
                else if (!getline(1)) return;
        }
        else erxit("\"KEY ATTRIBUTES\" not found.");

        /*
         * Read KEY TYPE, KEY START, and KEY LENGTH for each part and
         * evaluate kd.k_part.
         */
        j=0;
        if (kd.k_nparts) while (1) {
                if (!(i=test(KEY_TYPE))) erxit("Missing key part description.");
                if (!(r[i])) erxit("Bad \"KEY TYPE\" specification.");

                if (!strcmp(r[i],DESCENDING)) {
                        kd.k_part[j].kp_type=TIFDESC;
                        i++;
                }
                else if (!strcmp(r[i],ASCENDING)) i++;
                if (!(r[i])) erxit("Bad \"KEY TYPE\" specification.");

                if (!strcmp(r[i],CHARACTER))    kd.k_part[j].kp_type|=TIFCHR;
                else if (!strcmp(r[i],INTEGER)) kd.k_part[j].kp_type|=TIFINT;
                else if (!strcmp(r[i],LONG))    kd.k_part[j].kp_type|=TIFLNG;
                else if (!strcmp(r[i],FLOAT))   kd.k_part[j].kp_type|=TIFFLT;
                else if (!strcmp(r[i],DOUBLE))  kd.k_part[j].kp_type|=TIFDBL;
                else erxit("Bad \"KEY TYPE\" specification.");
                i++;
                if (!(r[i])) erxit("Bad \"KEY TYPE\" specification.");

                tmap(KEY_START);
                for (k=0;t[k]&&r[i];i++,k++) if (strcmp(t[k],r[i])) break;
                if (t[k]) erxit("Bad \"KEY START\" specification.");
                if (!(r[i] && sscanf(r[i++],"%hd",&(kd.k_part[j].kp_start))))
                        erxit("Bad \"KEY START\" specification.");

                tmap(KEY_LENGTH);
                for (k=0;t[k]&&r[i];i++,k++) if (strcmp(t[k],r[i])) break;
                if (t[k]) erxit("Bad \"KEY LENGTH\" specification.");
                if (!(r[i] && sscanf(r[i++],"%hd",&(kd.k_part[j].kp_leng))))
                        erxit("Bad \"KEY LENGTH\" specification.");

                if (++j<kd.k_nparts) getline(0);
                else break;
        }
}
                
static int
rmap()
/*
 * Parse "buf" using "strtok" until all tokens have been processed.
 * Pointers to the tokens are put in "r".  Returns number of tokens.
 */
{
        int     i=0;

        if ((r[i]=strtok(buf," \t\n")) != NULL) {
                for (i=1;i<T_COUNT;i++)
                        if ((r[i]=strtok(NULL," \t\n"))==NULL) break;
                if (i==T_COUNT)
                        erxit("Syntax error.");
        }
        return(i);
} 
                
static void
tmap(q)
char    *q;
/*
 * Copy string q into tbuf, then parse it using "strtok" until all tokens have
 * been processed.  Pointers to the tokens are put in "t".
 */
{
        int     i;

        strncpy(tbuf,q,78);
        if ((t[0]=strtok(tbuf," \t\n")) != NULL) {
                for (i=1;i<T_COUNT;i++)
                        if ((t[i]=strtok(NULL," \t\n"))==NULL) break;
                if (i==T_COUNT)
                        erxit("Internal error.");
        }
} 


getline(eof_OK)
int     eof_OK;
/*
 * Read a line into global variable "buf".  Parse using "rmap" into global
 * array "r".  If eof_OK is true, return 0 for eof, 1 for non-eof.  If not
 * eof_OK, error exit on eof.
 */
{
        char    *f;

        while (1) {
            f=fgets(buf,1024,strm);
            if (vopt) printf(f);
            if (f==NULL) {
                if (eof_OK) return(0);
                else erxit("Bad file specification format.  Unexpected EOF.");
            }
            if (rmap() && *r[0]!='#') break;
        }
        return(1);
}

static int
test(str)
char    *str;
/*
 * Test to see that tokens mapped by "t" are equal to tokens mapped by "r".
 * If equal, return index to next token in "r"; otherwise return 0;
 */
{
        int     match;
        int     i;

        tmap(str);
        for (i=0;i<T_COUNT;i++) {
                if (t[i]) {
                        if (!(r[i]) || strcmp(t[i],r[i])) {
                                match=0;
                                break;
                        }
                }
                else {
                        match=1;
                        break;
                }
        }
        if (i==T_COUNT) erxit("Syntax error.");
        return(match?i:0);
}

static void
erxit(str)
char    *str;
/*
 * Print error message and terminate process.
 */
{
	if (vopt) printf("\n");
        printf("mkisam: error. %s\n",str);
        xit(-1);
}

#ifndef VFISAM
void xit(code)
int code;
{
	PSTOP
	PPRINT(prof)

	exit(code);
}
#endif
