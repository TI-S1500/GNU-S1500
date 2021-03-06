/* Low level interface to ptrace, for GDB when running under Unix.
   Copyright (C) 1988 Free Software Foundation, Inc.

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
#include "frame.h"
#include "inferior.h"

#ifdef USG
#include <sys/types.h>
#endif

#ifdef ti1500
#include <sys/reg.h>
#include <sys/sysmacros.h>
#include <sys/signal.h>
#endif

#include <stdio.h>
#include <sys/param.h>
#include <sys/dir.h>
#include <signal.h>
#include <sys/user.h>
#include <sys/ioctl.h>
#include <fcntl.h>

#ifdef COFF_ENCAPSULATE
#include "a.out.encap.h" 
#else 
#include <a.out.h>
#endif
#ifndef N_SET_MAGIC
#define N_SET_MAGIC(exec, val) ((exec).a_magic = (val))
#endif
#include <sys/file.h>
#include <sys/stat.h>


extern int errno;

/* This function simply calls ptrace with the given arguments.  
   It exists so that all calls to ptrace are isolated in this 
   machine-dependent file. */
int
call_ptrace (request, pid, arg3, arg4)
     int request, pid, arg3, arg4;
{
  return ptrace (request, pid, arg3, arg4);
}

kill_inferior ()
{
  if (remote_debugging)
    return;
  if (inferior_pid == 0)
    return;
  ptrace (8, inferior_pid, 0, 0);
  wait (0);
  inferior_died ();
}

/* This is used when GDB is exiting.  It gives less chance of error.*/

kill_inferior_fast ()
{
  if (remote_debugging)
    return;
  if (inferior_pid == 0)
    return;
  ptrace (8, inferior_pid, 0, 0);
  wait (0);
}

/* Resume execution of the inferior process.
   If STEP is nonzero, single-step it.
   If SIGNAL is nonzero, give it that signal.  */

void
resume (step, signal)
     int step;
     int signal;
{

  errno = 0;
  if (remote_debugging)
    remote_resume (step, signal);
  else
    {
#ifdef ti1500
      ptrace (step ? 9 : 7, inferior_pid, 1, step ? 0 : signal);
      sync();
#else 
      ptrace (step ? 9 : 7, inferior_pid, 1, signal);
#endif 
      if (errno)
	perror_with_name ("ptrace");
    }
}

void
fetch_inferior_registers ()
{
  register int regno;
  register unsigned int regaddr;
  char buf[MAX_REGISTER_RAW_SIZE];
  register int i;

  struct user u;
  unsigned int offset = (char *) &u.u_ar0 - (char *) &u;
#ifdef ti1500
  unsigned int fp_offset = ptrace (1501, inferior_pid, 0, 0);
	if (fp_offset == -1) {
		printf("ptrace(1501,%d,?,?) failed, errno = %d\n", 
			inferior_pid, errno);
		printf("Child has probably terminated\n");
		return(-1);
	}
	/* function 3 on the ti1500 returns things from user area */
  offset = ptrace (1500, inferior_pid, 0, 0);
	if (offset == -1) {
		printf("ptrace(1500,%d,?,?) failed, errno = %d\n", 
			inferior_pid, errno);
		printf("Child has probably terminated\n");
		return(-1);
	}
#else
  offset = ptrace (3, inferior_pid, offset, 0) - KERNEL_U_ADDR;
#endif

  for (regno = 0; regno < NUM_REGS; regno++)
    {
#ifdef ti1500
      regaddr = register_addr (regno, offset, fp_offset);
#else
      regaddr = register_addr (regno, offset);
#endif
      for (i = 0; i < REGISTER_RAW_SIZE (regno); i += sizeof (int))
 	{
 	  *(int *) &buf[i] = ptrace (3, inferior_pid, regaddr, 0);
 	  regaddr += sizeof (int);
 	}
      supply_register (regno, buf);
    }
}

/* Store our register values back into the inferior.
   If REGNO is -1, do this for all registers.
   Otherwise, REGNO specifies which register (so we can save time).  */

store_inferior_registers (regno)
     int regno;
{
  register unsigned int regaddr;
  char buf[80];

  struct user u;
  unsigned int offset = (char *) &u.u_ar0 - (char *) &u;
#ifdef ti1500
	/* function 3 on the ti1500 returns things from user area */
  offset = ptrace (1500, inferior_pid, 0, 0);
	if (offset == -1) {
		printf("ptrace(1500,%d,?,?) failed, errno = %d\n", 
			inferior_pid, errno);
		printf("store_inferior, Child has probably terminated\n");
		return(-1);
	}
#else
  offset = ptrace (3, inferior_pid, offset, 0) - KERNEL_U_ADDR;
#endif

  if (regno >= 0 )
    {
      errno = 0;
#ifdef ti1500
		if (regno < 16) {
#endif
      	regaddr = register_addr (regno, offset);
      	ptrace (6, inferior_pid, regaddr, read_register (regno));
#ifdef ti1500
		}
#endif
      if (errno != 0)
	{
	  sprintf (buf, "writing register number %d", regno);
	  perror_with_name (buf);
	}
    }
#ifdef ti1500
  else for (regno = 0; regno < 16; regno++)
#else
  else for (regno = 0; regno < NUM_REGS; regno++)
#endif
    {
      regaddr = register_addr (regno, offset);
      errno = 0;
      ptrace (6, inferior_pid, regaddr, read_register (regno));
      if (errno != 0)
	{
	  sprintf (buf, "writing register number %d", regno);
	  perror_with_name (buf);
	}
    }
}

/* Copy LEN bytes from inferior's memory starting at MEMADDR
   to debugger memory starting at MYADDR. 
   On failure (cannot read from inferior, usually because address is out
   of bounds) returns the value of errno. */

int
read_inferior_memory (memaddr, myaddr, len)
     CORE_ADDR memaddr;
     char *myaddr;
     int len;
{
  register int i;
  /* Round starting address down to longword boundary.  */
  register CORE_ADDR addr = memaddr & - sizeof (int);
  /* Round ending address up; get number of longwords that makes.  */
  register int count
    = (((memaddr + len) - addr) + sizeof (int) - 1) / sizeof (int);
  /* Allocate buffer of that many longwords.  */
  register int *buffer = (int *) alloca (count * sizeof (int));
  extern int errno;

  /* Read all the longwords */
  for (i = 0; i < count; i++, addr += sizeof (int))
    {
      errno = 0;
      if (remote_debugging)
	buffer[i] = remote_fetch_word (addr);
      else
	buffer[i] = ptrace (1, inferior_pid, addr, 0);
      if (errno)
	return errno;
    }

  /* Copy appropriate bytes out of the buffer.  */
  bcopy ((char *) buffer + (memaddr & (sizeof (int) - 1)), myaddr, len);
  return 0;
}

/* Copy LEN bytes of data from debugger memory at MYADDR
   to inferior's memory at MEMADDR.
   On failure (cannot write the inferior)
   returns the value of errno.  */

int
write_inferior_memory (memaddr, myaddr, len)
     CORE_ADDR memaddr;
     char *myaddr;
     int len;
{
  register int i;
  /* Round starting address down to longword boundary.  */
  register CORE_ADDR addr = memaddr & - sizeof (int);
  /* Round ending address up; get number of longwords that makes.  */
  register int count
    = (((memaddr + len) - addr) + sizeof (int) - 1) / sizeof (int);
  /* Allocate buffer of that many longwords.  */
  register int *buffer = (int *) alloca (count * sizeof (int));
  extern int errno;

  /* Fill start and end extra bytes of buffer with existing memory data.  */

  if (remote_debugging)
    buffer[0] = remote_fetch_word (addr);
  else {
    buffer[0] = ptrace (1, inferior_pid, addr, 0);
	}

  if (count > 1)
    {
      if (remote_debugging)
	buffer[count - 1]
	  = remote_fetch_word (addr + (count - 1) * sizeof (int));
      else
	buffer[count - 1]
	  = ptrace (1, inferior_pid,
		    addr + (count - 1) * sizeof (int), 0);
    }

  /* Copy data to be written over corresponding part of buffer */

  bcopy (myaddr, (char *) buffer + (memaddr & (sizeof (int) - 1)), len);

  /* Write the entire buffer.  */

  for (i = 0; i < count; i++, addr += sizeof (int))
    {
      errno = 0;
      if (remote_debugging)
	remote_store_word (addr, buffer[i]);
      else {
	ptrace (4, inferior_pid, addr, buffer[i]);
	}
      if (errno)
	return errno;
    }

  return 0;
}

/* Work with core dump and executable files, for GDB. 
   This code would be in core.c if it weren't machine-dependent. */

/* Recognize COFF format systems because a.out.h defines AOUTHDR.  */

#ifdef AOUTHDR
#define COFF_FORMAT
#endif

#ifndef N_TXTADDR
#define N_TXTADDR(hdr) 0
#endif /* no N_TXTADDR */

#ifndef N_DATADDR
#define N_DATADDR(hdr) hdr.a_text
#endif /* no N_DATADDR */

/* Make COFF and non-COFF names for things a little more compatible
   to reduce conditionals later.  */

#ifdef COFF_FORMAT
#define a_magic magic
#endif

#ifndef COFF_FORMAT
#define AOUTHDR struct exec
#endif

extern char *sys_siglist[];


/* Hook for `exec_file_command' command to call.  */

extern void (*exec_file_display_hook) ();
   
/* File names of core file and executable file.  */

extern char *corefile;
extern char *execfile;

/* Descriptors on which core file and executable file are open.
   Note that the execchan is closed when an inferior is created
   and reopened if the inferior dies or is killed.  */

extern int corechan;
extern int execchan;

/* Last modification time of executable file.
   Also used in source.c to compare against mtime of a source file.  */

extern int exec_mtime;

/* Virtual addresses of bounds of the two areas of memory in the core file.  */

extern CORE_ADDR data_start;
extern CORE_ADDR data_end;
extern CORE_ADDR stack_start;
extern CORE_ADDR stack_end;

/* Virtual addresses of bounds of two areas of memory in the exec file.
   Note that the data area in the exec file is used only when there is no core file.  */

extern CORE_ADDR text_start;
extern CORE_ADDR text_end;

extern CORE_ADDR exec_data_start;
extern CORE_ADDR exec_data_end;

/* Address in executable file of start of text area data.  */

extern int text_offset;

/* Address in executable file of start of data area data.  */

extern int exec_data_offset;

/* Address in core file of start of data area data.  */

extern int data_offset;

/* Address in core file of start of stack area data.  */

extern int stack_offset;

#ifdef COFF_FORMAT
/* various coff data structures */

extern FILHDR file_hdr;
extern SCNHDR text_hdr;
extern SCNHDR data_hdr;

#endif /* not COFF_FORMAT */

/* a.out header saved in core file.  */
  
extern AOUTHDR core_aouthdr;

/* a.out header of exec file.  */

extern AOUTHDR exec_aouthdr;

extern void validate_files ();
spwait(pid,sigint)
int pid;
unsigned long sigint;
{
 register unsigned long w;
 int stat;
 int signo;

 signal(SIGINT, 1);

 while ((w = wait(&stat)) != pid && w != -1)
              ;   
  signal(SIGINT,sigint);

  if (w == -1)
    {
     pid = 0;
     printf("Error in waiting to trace child core process \n");
    }
  else if ((stat & 0177) != 0177)
    {
          if (signo = stat&0177)
            printf("Signal is: %d\n",signo);

          if (stat&0200)
             printf("Core dumped\n");

       pid = 0;
    }
} 

core_file_command (filename, from_tty)
     char *filename;
     int from_tty;
{
  int val;
  extern char registers[];

  /* Discard all vestiges of any previous core file
     and mark data and stack spaces as empty.  */

  if (corefile)
    free (corefile);
  corefile = 0;

  if (corechan >= 0)
    close (corechan);
  corechan = -1;

  data_start = 0;
  data_end = 0;
  stack_start = STACK_END_ADDR;
  stack_end = STACK_END_ADDR;

  /* Now, if a new core file was specified, open it and digest it.  */

  if (filename)
    {
      if (have_inferior_p ())
	error ("To look at a core file, you must kill the inferior with \"kill\".");
      corechan = open (filename, O_RDONLY, 0);
      if (corechan < 0)
	perror_with_name (filename);
      /* 4.2-style (and perhaps also sysV-style) core dump file.  */
      {
	struct user u;
	int reg_offset;

	val = myread (corechan, &u, sizeof u);
#ifdef ti1500
	if (val < 0)
	  perror_with_name ("Not a core file: reading upage");
	if (val != sizeof u)
	  error ("Not a core file: could only read %d bytes", val);
#else
	if (val < 0)
	  perror_with_name (filename);
#endif

	data_start = exec_data_start;

	data_end = data_start + NBPG * u.u_dsize;
	stack_start = stack_end - NBPG * u.u_ssize;
	data_offset = NBPG * UPAGES;
	stack_offset = NBPG * (UPAGES + u.u_dsize);
#ifdef ti1500
	reg_offset = (int) u.u_ar0 - (0xfff000);
#else
	reg_offset = (int) u.u_ar0 - KERNEL_U_ADDR;
#endif

#ifdef ti1500
     /* ti1500 core file has a magic number of O413 or D267 */
/*
       if (u.u_exdata.ux_mag != 267)
        {
          printf("Reading file : %s",filename);
	  perror_with_name ("Not a ti1500 core file: reading upage");
        }
*/
#endif

	/* I don't know where to find this info.
	   So, for now, mark it as not available.  */
#ifndef ti1500
	/* the ti1500 does not have headers on the core file */
	N_SET_MAGIC (core_aouthdr, 0);
#endif

	/* Read the register values out of the core file and store
	   them where `read_register' will find them.  */

	{
	  register int regno;
#ifdef ti1500

 /* fork a new process and get the address of the floating
    point registers                                      */

          int core_pid;
	  volatile unsigned int fp_offset,save_offset;
          unsigned long sigint,sigquit;


            save_offset = (unsigned)&u.u_fprsav[0] - (unsigned)&u;

      if (save_offset < 0)
        {
          if ((core_pid = fork()) == 0)
             {
               ptrace(0,0,0,0);
               signal(SIGINT,sigint); signal(SIGQUIT,sigquit);
	       kill(getpid(),SIGINT);
               exit(0);
              }

         else if (core_pid == -1)
             {
               printf("Cannot trace the registers\n");
             }
         else
             {
               while( (fp_offset = ptrace(1501,core_pid,0,0)) < 0 )
			sleep(1);
              if (core_pid)
                {
         	     ptrace(8,core_pid,0,0);
                     core_pid = 0;
                }
             }
         }
#endif
            
#ifdef ti1500
              if (fp_offset <= 0)
                  fp_offset = save_offset;
#endif
     
	  for (regno = 0; regno < NUM_REGS; regno++)
	    {
	      char buf[MAX_REGISTER_RAW_SIZE];

#ifdef ti1500
	      val = lseek (corechan, register_addr (regno, reg_offset,fp_offset), 0);

	      if (val < 0
		  || (val = myread (corechan, buf, sizeof buf)) < 0)
		{
		  char * buffer = (char *) alloca (strlen (reg_names[regno])
						   + 30);
		  strcpy (buffer, "Reading register ");
		  strcat (buffer, reg_names[regno]);
						   
		  perror_with_name (buffer);
		}

#else
	      val = lseek (corechan, register_addr (regno, reg_offset), 0);
	      if (val < 0)
		perror_with_name (filename);

 	      val = myread (corechan, buf, sizeof buf);

	      if (val < 0)
		perror_with_name (filename);
#endif
	      supply_register (regno, buf);
	    }
	}
      }
      if (filename[0] == '/')
	corefile = savestring (filename, strlen (filename));
      else
	{
	  corefile = concat (current_directory, "/", filename);
	}

      set_current_frame ( create_new_frame (read_register (FP_REGNUM),
					    read_pc ()));
      select_frame (get_current_frame (), 0);
      validate_files ();
    }
  else if (from_tty)
    printf ("No core file now.\n");
}

exec_file_command (filename, from_tty)
     char *filename;
     int from_tty;
{
  int val;

  /* Eliminate all traces of old exec file.
     Mark text segment as empty.  */

  if (execfile)
    free (execfile);
  execfile = 0;
  data_start = 0;
  data_end -= exec_data_start;
  text_start = 0;
  text_end = 0;
  exec_data_start = 0;
  exec_data_end = 0;
  if (execchan >= 0)
    close (execchan);
  execchan = -1;

  /* Now open and digest the file the user requested, if any.  */

  if (filename)
    {
      execchan = openp (getenv ("PATH"), 1, filename, O_RDONLY, 0,
			&execfile);
      if (execchan < 0)
	perror_with_name (filename);

#ifdef COFF_FORMAT
      {
	int aout_hdrsize;
	int num_sections;

	if (read_file_hdr (execchan, &file_hdr) < 0)
#ifdef ti1500
	  error ("\"%s\": not executable in dep.c.", execfile);
#else
	  error ("\"%s\": not in executable format.", execfile);
#endif

	aout_hdrsize = file_hdr.f_opthdr;
	num_sections = file_hdr.f_nscns;

	if (read_aout_hdr (execchan, &exec_aouthdr, aout_hdrsize) < 0)
	  error ("\"%s\": can't read optional aouthdr", execfile);

	if (read_section_hdr (execchan, _TEXT, &text_hdr, num_sections) < 0)
	  error ("\"%s\": can't read text section header", execfile);

	if (read_section_hdr (execchan, _DATA, &data_hdr, num_sections) < 0)
	  error ("\"%s\": can't read data section header", execfile);

	text_start = exec_aouthdr.text_start;
	text_end = text_start + exec_aouthdr.tsize;
	text_offset = text_hdr.s_scnptr;
	exec_data_start = exec_aouthdr.data_start;
	exec_data_end = exec_data_start + exec_aouthdr.dsize;
	exec_data_offset = data_hdr.s_scnptr;
	data_start = exec_data_start;
	data_end += exec_data_start;
	exec_mtime = file_hdr.f_timdat;
      }
#else /* not COFF_FORMAT */
      {
	struct stat st_exec;

#ifdef HEADER_SEEK_FD
	HEADER_SEEK_FD (execchan);
#endif
	
	val = myread (execchan, &exec_aouthdr, sizeof (AOUTHDR));

	if (val < 0)
	  perror_with_name (filename);

        text_start = N_TXTADDR (exec_aouthdr);
        exec_data_start = N_DATADDR (exec_aouthdr);

	text_offset = N_TXTOFF (exec_aouthdr);
	exec_data_offset = N_TXTOFF (exec_aouthdr) + exec_aouthdr.a_text;

	text_end = text_start + exec_aouthdr.a_text;
        exec_data_end = exec_data_start + exec_aouthdr.a_data;
	data_start = exec_data_start;
	data_end += exec_data_start;

	fstat (execchan, &st_exec);
	exec_mtime = st_exec.st_mtime;
      }
#endif /* not COFF_FORMAT */

      validate_files ();
    }
  else if (from_tty)
    printf ("No exec file now.\n");

  /* Tell display code (if any) about the changed file name.  */
  if (exec_file_display_hook)
    (*exec_file_display_hook) (filename);
}
