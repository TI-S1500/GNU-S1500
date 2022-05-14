/* auxent.h - this is a temp file to contain code to generate
   an auxiliary entry for a coff directive.  This will be moved 
   either to read.c or read.h in the near future - clm 05/01/90 */ 
#include "as.h"
#include "hash.h"
#include "obstack.h"		/* For "symbols.h" */
#include "struc-symbol.h"
#include "symbols.h"
#include "frags.h"

typedef struct auxent auxentS;

extern int do_1500_coff;


static
struct hash_control *
sy_hash;			/* symbol-name => struct symbol pointer */

				/* Below are commented in "symbols.h". */
unsigned int local_bss_counter;
symbolS * symbol_rootP;
symbolS * symbol_lastP;
symbolS	abs_symbol;
struct obstack	notes;




/*
 *			auxent_new()
 *
 * Return a pointer to a new auxent. 
 * An auxent is needed for certain coff directives.
 * Add symbol to end of symbol chain.
 *
 *
 */
auxentS *
auxent_new (name, type, other, desc, value, frag)
     char *		name;	/* We copy this: OK to alter your copy. */
     unsigned char	type;	/* As in <a.out.h>. */
     char		other;	/* As in <a.out.h>. */
     short int		desc;	/* As in <a.out.h>. */
     valueT		value;	/* As in <a.out.h>, often an address. */
				/* Often used as offset from frag address. */
     struct frag *	frag;	/* For sy_frag. */
{
  register symbolS *		symbolP;
  register char *		preserved_copy_of_name;
  register unsigned int		name_length;
           char *		p;

#ifdef ti1500
   if (do_1500_coff) {
		/* remove leading '_' from names that come from the gnu compiler */
		if (*name == '_' && name[1] != 'L') name++;
	}
#endif
  name_length = strlen(name) + 1;
  obstack_grow(&notes,name,name_length);
  p=obstack_finish(&notes);
  /* obstack_1done( &notes, name, name_length, &p ); */
  preserved_copy_of_name = p;
  p=obstack_alloc(&notes,sizeof(struct symbol));
  /* obstack_1blank( &notes, sizeof(struct symbol), &p ); */
  symbolP			= (symbolS *) p;
#ifdef ti1500
   if (do_1500_coff) {
		/* zero out the entire structure */
		memset(symbolP, 0 , sizeof(struct symbol) );
	
		/* put all of the names 9 bytes long or longer in the string table */
		if (name_length  > SYMNMLEN + 1) {
  			symbolP -> coff_sy_nlist . _n . _n_nptr[0] = 0;	
  			symbolP -> coff_sy_nlist . _n . _n_nptr[1] = preserved_copy_of_name;
		}
		else {
			memset(&symbolP -> coff_sy_nlist. _n . _n_name[0], 0, SYMNMLEN);
			memcpy(&symbolP -> coff_sy_nlist. _n . _n_name[0], 
				preserved_copy_of_name, name_length );
		}
	}
#endif

  symbolP -> sy_name		= preserved_copy_of_name;
  symbolP -> sy_type		= type;
  symbolP -> sy_other		= other;
  symbolP -> sy_desc		= desc;
  symbolP -> sy_value		= value;
  symbolP -> sy_frag		= frag;
  symbolP -> sy_next		= NULL;	/* End of chain. */
  symbolP -> sy_forward		= NULL; /* JF */
#ifdef SUSPECT
  symbolP -> sy_name_offset	= ~ 0; /* Impossible offset catches errors. */
  symbolP -> sy_number		= ~ 0; /* Ditto. */
#endif
  /*
   * Link to end of symbol chain.
   */
  if (symbol_lastP)
    {
      symbol_lastP -> sy_next = symbolP;
    }
  else
    {
      symbol_rootP = symbolP;
    }
  symbol_lastP = symbolP;

  return (symbolP);
}
