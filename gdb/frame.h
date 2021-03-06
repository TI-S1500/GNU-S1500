/* Definitions for dealing with stack frames, for GDB, the GNU debugger.
   Copyright (C) 1986 Free Software Foundation, Inc.

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

/* Note that frame.h requires param.h! */

/*
 * FRAME is the type of the identifier of a specific stack frame.  It
 * is a pointer to the frame cache item corresponding to this frame.
 * Please note that frame id's are *not* constant over calls to the
 * inferior.  Use frame addresses, which are.
 *
 * FRAME_ADDR is the type of the address of a specific frame.  I
 * cannot imagine a case in which this would not be CORE_ADDR, so
 * maybe it's silly to give it it's own type.  Life's rough.
 *
 * FRAME_FP is a macro which converts from a frame identifier into a
 * frame_address.
 *
 * FRAME_INFO_ID is a macro which "converts" from a frame info pointer
 * to a frame id.  This is here in case I or someone else decides to
 * change the FRAME type again.
 *
 * This file and blockframe.c are the only places which are allowed to
 * use the equivalence between FRAME and struct frame_info *.  EXCEPTION:
 * value.h uses CORE_ADDR instead of FRAME_ADDR because the compiler
 * will accept that in the absense of this file.
 */
typedef struct frame_info *FRAME;
typedef CORE_ADDR	FRAME_ADDR;
#define FRAME_FP(fr)	((fr)->frame)
#define FRAME_INFO_ID(f)	(f)

/*
 * Caching structure for stack frames.  This is also the structure
 * used for extended info about stack frames.  May add more to this
 * structure as it becomes necessary.
 *
 * Note that the first entry in the cache will always refer to the
 * innermost executing frame.  This value should be set (is it?
 * Check) in something like normal_stop.
 */
struct frame_info
  {
    /* Nominal address of the frame described.  */
    FRAME_ADDR frame;
    /* Address at which execution is occurring in this frame.
       For the innermost frame, it's the current pc.
       For other frames, it is a pc saved in the next frame.  */
    CORE_ADDR pc;
    /* The frame called by the frame we are describing, or 0.
       This may be set even if there isn't a frame called by the one
       we are describing (.->next == 0); in that case it is simply the
       bottom of this frame */
    FRAME_ADDR next_frame;
    /* Anything extra for this structure that may have been defined
       in the machine depedent files. */
#ifdef EXTRA_FRAME_INFO
    EXTRA_FRAME_INFO
#endif
    /* Pointers to the next and previous frame_info's in this stack.  */
    FRAME next, prev;
  };

/* Describe the saved registers of a frame.  */

struct frame_saved_regs
  {
    /* For each register, address of where it was saved on entry to the frame,
       or zero if it was not saved on entry to this frame.  */
    CORE_ADDR regs[NUM_REGS];
  };

/* The stack frame that the user has specified for commands to act on.
   Note that one cannot assume this is the address of valid data.  */

extern FRAME selected_frame;

extern struct frame_info *get_frame_info ();
extern struct frame_info *get_prev_frame_info ();

extern FRAME create_new_frame ();

extern void get_frame_saved_regs ();

extern FRAME get_prev_frame ();
extern FRAME get_current_frame ();

extern struct block *get_frame_block ();
extern struct block *get_current_block ();
extern struct block *get_selected_block ();
extern struct symbol *get_frame_function ();
extern struct symbol *get_pc_function ();

/* In stack.c */
extern FRAME find_relative_frame ();

