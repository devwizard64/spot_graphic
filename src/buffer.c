#include <ultra64.h>

#include <sm64/types.h>

#include <project.h>
#include "buffer.h"
#include "main.h"

#ifndef DEMO_DVD
u16 video_zimg[VIDEO_H][VIDEO_W];
#endif

u64 video_task_stack[SP_DRAM_STACK_SIZE8/sizeof(u64)];
u64 video_task_output[VIDEO_OUTPUT_SIZE/sizeof(u64)];
Gfx video_buf_table[2][VIDEO_GFX_LEN];
OSTask video_task_table[2];

u64 stack_main[0x400/sizeof(u64)];
u64 stack_idle[0x800/sizeof(u64)];
u64 stack_app[0x800/sizeof(u64)];
