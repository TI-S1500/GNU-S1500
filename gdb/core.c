/* Work with core dump and executable files, for GDB.
   Copyright (C) 1986, 1987 Free Software Foundation, Inc.

GDB is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY.  No author or distributor accepts responsibility to anyone
for the consequences of using it or for whether it serves any
particular purpose or works at all, unless he says so in writing.
Refer to the GDB General Public License for full details.

Everyone is granted permission to copy, modify and redistribute GDB,
but only under the conditions described in the GDB General Public
License.  A copy of this license is supposed to have been given to you
along with GDB so you can know your rights and responsibilities.  It
should be in a file named COPYING.  Among other things, the copyright
notice and this notice must be preserved on all copies.

In other words, go ahead and share GDB, but don't try to stop
anyone else from sharing it farther.  Help stamp out software hoarding!
*/

#include "defs.h"
#include "param.h"

#ifdef USG
#include <sys/types.h>
#include <sys/fcntl.h>
#endif

#ifdef COFF_ENCAPSULATE
#include "a.out.encap.h" 
#else 
#include <a.out.h>
#endif
#ifndef N_MAGIC
#ifdef COFF_FORMAT
#define N_MAGIC(exec) ((exec).magic)
#else
#define N_MAGIC(exec) ((exec).a_magic)
#endif
#endif
#include <stdio.h>
#include <signal.h>
#include <sys/param.h>
#include <sys/dir.h>
#include <sys/file.h>
#include <sys/stat.h>

#ifdef UMAX_CORE
#include <sys/ptrace.h>
#else
#include <sys/user.h>
#endif

#ifndef N_TXTADDR
#define N_TXTADDR(hdr) 0
#endif /* no N_TXTADDR */

#ifndef N_DATADDR
#define N_DATADDR(hdr) hdr.a_text
#endif /* no N_DATADDR */

#ifndef COFF_FORMAT
#define AOUTHDR		struct exec
#endif

extern char *sys_siglist[];

extern core_file_command (), exec_file_command ();

/* Hook for `exec_file_command' command to call.  */

void (*exec_file_display_hook) ();
   
/* File names of core file and executable file.  */

char *corefile;
char *execfile;

/* Descriptors on which core file and executable file are open.
   Note that the execchan is closed when an inferior is created
   and reopened if the inferior dies or is killed.  */

int corechan;
int execchan;

/* Last modification time of executable file.
   Also used in source.c to compare against mtime of a source file.  */

int exec_mtime;

/* Virtual addresses of bounds of the two areas of memory in the core file.  */

CORE_ADDR data_start;
CORE_ADDR data_end;
CORE_ADDR stack_start;
CORE_ADDR stack_end;

/* Virtual addresses of bounds of two areas of memory in the exec file.
   Note that the data area in the exec file is used only when there is no core file.  */

CORE_ADDR text_start;
CORE_ADDR text_end;

CORE_ADDR exec_data_start;
CORE_ADDR exec_data_end;

/* Address in executable file of start of text area data.  */

int text_offset;

/* Address in executable file of start of data area data.  */

int exec_data_offset;

/* Address in core file of start of data area data.  */

int data_offset;

/* Address in core file of start of stack area data.  */

int stack_offset;
  
#ifdef COFF_FORMAT
/* various coff data structures */

FILHDR file_hdr;
SCNHDR text_hdr;
SCNHDR data_hdr;


#endif /* not COFF_FORMAT */
/* a.out header saved in core file.  */
  
AOUTHDR core_aouthdr;

/* a.out header of exec file.  */

AOUTHDR exec_aouthdr;

void validate_files ();
unsigned int register_addr ();

/* Call this to specify the hook for exec_file_command to call back.
   This is called from the x-window display code.  */

void
specify_exec_file_hook (hook)
     void (*hook) ();
{
  exec_file_display_hook = hook;
}

/* The exec file must be closed before running an inferior.
   If it is needed again after the inferior dies, it must
   be reopened.  */

void
close_exec_file ()
{
  if (execchan >= 0)
    close (execchan);
  execchan = -1;
}

void
reopen_exec_file ()
{
  if (execchan < 0 && execfile != 0)
    {
      char *filename = concat (execfile, "", "");
      exec_file_command (filename, 0);
      free (filename);
    }
}

/* If we have both a core file and an exec file,
   print a warning if they don't go together.
   This should really check that the core file came
   from that exec file, but I don't know how to do it.  */

void
validate_files ()
{
  if (execfile != 0 && corefile != 0)
    {
      struct stat st_core;

      fstat (corechan, &st_core);
#ifdef ti1500
		/* the ti1500 does not have headers in the core file */
      if (exec_mtime > st_core.st_mtime)
	printf ("Warning: exec file is newer than core file.\n");
	}
#else
      if (N_MAGIC (core_aouthdr) != 0
	  && bcmp (&core_aouthdr, &exec_aouthdr, sizeof core_aouthdr))
	printf ("Warning: core file does not match specified executable file.\n");
      else if (exec_mtime > st_core.st_mtime)
	printf ("Warning: exec file is newer than core file.\n");
    }
#endif 
}

/* Return the name of the executable file as a string.
   ERR nonzero means get error if there is none specified;
   otherwise return 0 in that case.  */

char *
get_exec_file (err)
     int err;
{
  if (err && execfile == 0)
    error ("No executable file specified.\n\
Use the \"exec-file\" and \"symbol-file\" commands.");
  return execfile;
}

int
have_core_file_p ()
{
  return corefile != 0;
}

static void
files_info ()
{
  char *symfile;
  extern char *get_sym_file ();

  if (execfile)
    printf ("Executable file \"%s\".\n", execfile);
  else
    printf ("No executable file\n");
  if (corefile == 0)
    printf ("No core dump file\n");
  else
    printf ("Core dump file \"%s\".\n", corefile);

  if (have_inferior_p ())
    printf ("Using the running image of the program, rather than these files.\n");

  symfile = get_sym_file ();
  if (symfile != 0)
    printf ("Symbols loaded from \"%s\".\n", symfile);

  if (! have_inferior_p ())
    {
      if (execfile)
	{
	  printf ("Text segment from 0x%x to 0x%x.\n",
		  text_start, text_end);
	}
      if (corefile)
	{
	  printf ("Data segment from 0x%x to 0x%x.\nStack segment from 0x%x to 0x%x.\n",
		  data_start, data_end, stack_start, stack_end);
	}
      else
	{
	  printf ("Data segment in executable from 0x%x to 0x%x.\n",
		  exec_data_start, exec_data_end);
	}
    }
}

/* Read "memory data" from core file and/or executable file.
   Returns zero if successful, 1 if xfer_core_file failed, errno value if
   ptrace failed. */

int
read_memory (memaddr, myaddr, len)
     CORE_ADDR memaddr;
     char *myaddr;
     int len;
{
  if (have_inferior_p ())
      return read_inferior_memory (memaddr, myaddr, len);
  else
      return xfer_core_file (memaddr, myaddr, len);
}

/* Write LEN bytes of data starting at address MYADDR
   into debugged program memory at address MEMADDR.
   Returns zero if successful, or an errno value if ptrace failed.  */

int
write_memory (memaddr, myaddr, len)
     CORE_ADDR memaddr;
     char *myaddr;
     int len;
{
  if (have_inferior_p ())
    return write_inferior_memory (memaddr, myaddr, len);
  else
    error ("Can write memory only when program being debugged is running.");
}

/* Return 0 if address could be read, 1 if not. */

int
xfer_core_file (memaddr, myaddr, len)
     CORE_ADDR memaddr;
     char *myaddr;
     int len;
{
  register int i;
  register int val;
  int xferchan;
  char **xferfile;
  volatile int fileptr;
  int returnval = 0;

  while (len > 0)
    {
      xferfile = 0;
      xferchan = 0;

      /* Determine which file the next bunch of addresses reside in,
	 and where in the file.  Set the file's read/write pointer
	 to point at the proper place for the desired address
	 and set xferfile and xferchan for the correct file.
	 If desired address is nonexistent, leave them zero.
	 i is set to the number of bytes that can be handled
	 along with the next address.  */

      if (memaddr < text_start)
	{
	  i = min (len, text_start - memaddr);
	}
      else if (memaddr >= text_end && memaddr < data_start)
	{
	  i = min (len, data_start - memaddr);
	}
      else if (memaddr >= (corechan >= 0 ? data_end : exec_data_end)
	       && memaddr < stack_start)
	{
	  i = min (len, stack_start - memaddr);
	}
      else if (memaddr >= stack_end && stack_end != 0)
	{
	  i = min (len, - memaddr);
	}
      /* Note that if there is no core file
	 data_start and data_end are equal.  */
      else if (memaddr >= data_start && memaddr < data_end)
	{
	  i = min (len, data_end - memaddr);
	  fileptr = memaddr - data_start + data_offset;
	  xferfile = &corefile;
	  xferchan = corechan;
	}
      /* Note that if there is no core file
	 stack_start and stack_end are equal.  */
      else if (memaddr >= stack_start && memaddr < stack_end)
	{
	  i = min (len, stack_end - memaddr);
	  fileptr = memaddr - stack_start + stack_offset;
	  xferfile = &corefile;
	  xferchan = corechan;
	}
      else if (corechan < 0
	       && memaddr >= exec_data_start && memaddr < exec_data_end)
	{
	  i = min (len, exec_data_end - memaddr);
	  fileptr = memaddr - exec_data_start + exec_data_offset;
	  xferfile = &execfile;
	  xferchan = execchan;
	}
      else if (memaddr >= text_start && memaddr < text_end)
	{
	  i = min (len, text_end - memaddr);
	  fileptr = memaddr - text_start + text_offset;
	  xferfile = &execfile;
	  xferchan = execchan;
	}

      /* Now we know which file to use.
	 Set up its pointer and transfer the data.  */
      if (xferfile)
	{
	  if (*xferfile == 0)
	    if (xferfile == &execfile)
	      error ("No program file to examine.");
	    else
	      error ("No core dump file or running program to examine.");
	  val = lseek (xferchan, fileptr, 0);
	  if (val < 0)
	    perror_with_name (*xferfile);
	  val = myread (xferchan, myaddr, i);
	  if (val < 0)
	    perror_with_name (*xferfile);
	}
      /* If this address is for nonexistent memory,
	 read zeros if reading, or do nothing if writing.  */
      else
	{
	  bzero (myaddr, i);
	  returnval = 1;
	}

      memaddr += i;
      myaddr += i;
      len -= i;
    }
  return returnval;
}

/* My replacement for the read system call.
   Used like `read' but keeps going if `read' returns too soon.  */

int
myread (desc, addr, len)
     int desc;
     char *addr;
     int len;
{
  register int val;
  int orglen = len;

  while (len > 0)
    {
      val = read (desc, addr, len);
      if (val < 0)
	return val;
      if (val == 0)
	return orglen - len;
      len -= val;
      addr += val;
    }
  return orglen;
}

#ifdef REGISTER_U_ADDR

/* Return the address in the core dump or inferior of register REGNO.
   BLOCKEND is the address of the end of the user structure.  */

unsigned int
#ifdef ti1500
register_addr (regno, blockend,fp_end)
     int regno;
     int blockend;
     int fp_end;
#else
register_addr (regno, blockend)
     int regno;
     int blockend;
#endif
{
  volatile int addr;

  if (regno < 0 || regno >= NUM_REGS)
    error ("Invalid register number %d.", regno);

  REGISTER_U_ADDR (addr, blockend, regno, fp_end);

  return addr;
}

#endif /* REGISTER_U_ADDR */

void
_initialize_core()
{
  corechan = -1;
  execchan = -1;
  corefile = 0;
  execfile = 0;
  exec_file_display_hook = 0;

  text_start = 0;
  text_end = 0;
  data_start = 0;
  data_end = 0;
  exec_data_start = 0;
  exec_data_end = 0;
  stack_start = STACK_END_ADDR;
  stack_end = STACK_END_ADDR;

  add_com ("core-file", class_files, core_file_command,
	   "Use FILE as core dump for examining memory and registers.\n\
No arg means have no core file.");
  add_com ("exec-file", class_files, exec_file_command,
	   "Use FILE as program for getting contents of pure memory.\n\
If FILE cannot be found as specified, your execution directory path\n\
is searched for a command of that name.\n\
No arg means have no executable file.");
  add_info ("files", files_info, "Names of files being debugged.");
}

