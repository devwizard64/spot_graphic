#ifndef _MAIN_H_
#define _MAIN_H_

#include <ultra64.h>

#include <sm64/types.h>
#include <project.h>

#ifdef DEMO_DVD
#define VIDEO_W     640
#define VIDEO_H     480
#define VIDEO_MODE  OS_VI_NTSC_HPF1
#else
#ifdef DEMO_HI
#define VIDEO_W     640
#define VIDEO_H     480
#define VIDEO_MODE  OS_VI_NTSC_HAF1
#else
#define VIDEO_W     320
#define VIDEO_H     240
#define VIDEO_MODE  OS_VI_NTSC_LAN1
#endif
#endif

#ifndef __ASSEMBLER__

extern Gfx *video_gfx;

extern void *gfx_alloc(size_t size);

#endif /* __ASSEMBLER__ */

#endif /* _MAIN_H_ */
