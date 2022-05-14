#include<string.h> 
#include "linenum.h"

/* globals for line number entry information */
/* we follow the basic style of GNU */
struct lineno_entry
{
  struct lineno coff_lineno;
  long int      ln_number;     /* this entry's index within the */
                               /* list of lineno's.  Need this index */
			       /* for a function's auxent */
  struct symbol * ln_sym;     /* needed for physical address */
  struct lineno_entry * ln_next;
};

typedef struct lineno_entry linenoS;

extern linenoS * lineno_rootP;  /* all the line number entries */
extern linenoS * lineno_lastP;  /* last lineno entry made, or NULL */

extern long lineno_index;  /* counter for lineno entries */

/* globals needed to implement the linked list structure for 
   functions and structures for COFF debugging. */ 
extern symbolS * current_function;
extern symbolS * current_bf;
extern symbolS * current_ef;
extern symbolS * current_bb;
extern symbolS * current_struct;  
extern short inside_current_struct;
extern long int static_symbol_start_index;
 
typedef struct fieldn {
     char *  fname;
     int     ndx;
} field_name;

typedef enum  {bf, bb, ef, eb, eos, dim} coff_dirs;

int coff_tab_memq ();

/* Need to work on the layout of the changes */
/* auxentS is defined in struc-symbol.h */
auxentS * auxent_new();


/* structure needed for linked list of function sizes */
struct fsize_entry
{
  long   fcn_size; 
  struct fsize_entry * fsize_next;
};

typedef struct fsize_entry fsizeS;

extern fsizeS * fsize_rootP;  /* begining of fsize list */
extern fsizeS * fsize_lastP;  /* note: the last	lastP fsize is really
				 the size of the data section */
 
