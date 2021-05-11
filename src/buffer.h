#ifndef _BUFFER_H_
#define _BUFFER_H_

#include <ultra64.h>

#include <sm64/types.h>

#include <project.h>
#include "main.h"

#ifdef DEMO_DVD
#define VIDEO_OUTPUT_SIZE   0x100
#define VIDEO_GFX_LEN       0x10
#else
#define VIDEO_OUTPUT_SIZE   0x4000
#define VIDEO_GFX_LEN       0x800
#endif

#ifndef __ASSEMBLER__

#ifndef DEMO_DVD
extern u16 video_zimg[VIDEO_H][VIDEO_W];
#endif

extern u64 video_task_stack[SP_DRAM_STACK_SIZE8/sizeof(u64)];
extern u64 video_task_output[VIDEO_OUTPUT_SIZE/sizeof(u64)];
extern Gfx video_buf_table[2][VIDEO_GFX_LEN];
extern OSTask video_task_table[2];

extern u64 stack_idle[0x800/sizeof(u64)];
extern u64 stack_app[0x800/sizeof(u64)];

#endif /* __ASSEMBLER__ */

#endif /* _BUFFER_H_ */
