#include <ultra64.h>

#include <sm64/types.h>
#include <sm64/gbi_ext.h>

#include <project.h>
#include "buffer.h"
#include "main.h"
#include "demo.h"

#define MQ(m) &mq_##m, msg_##m, lenof(msg_##m)

#define thread_create(t, id, pri)           \
{                                           \
    osCreateThread(                         \
        &thread_##t, id, t##_main, NULL,    \
        stack_##t+lenof(stack_##t), pri     \
    );                                      \
    osStartThread(&thread_##t);             \
}

#define gDPSetFillColorRGB(pkt, r, g, b)    \
    gDPSetFillColor(pkt, 0x00010001U*GPACK_RGBA5551(r, g, b, 1))
#define gsDPSetFillColorRGB(r, g, b)    \
    gsDPSetFillColor(0x00010001U*GPACK_RGBA5551(r, g, b, 1))

#define DPC_STATUS      (*(volatile u32 *)0xA410000C)
#define DPC_CLOCK_COUNT (*(volatile u32 *)0xA4100010)
#define DPC_CMD_COUNT   (*(volatile u32 *)0xA4100014)
#define DPC_PIPE_COUNT  (*(volatile u32 *)0xA4100018)
#define DPC_TMEM_COUNT  (*(volatile u32 *)0xA410001C)

static OSThread thread_idle;
static OSThread thread_app;
static OSMesgQueue mq_vi;
static OSMesgQueue mq_dp;
static OSMesg msg_vi[2];
static OSMesg msg_dp[1];

static OSTask *video_task;
static Gfx *video_buf;
Gfx *video_gfx;
#ifndef DEMO_DVD
static u8 *video_mem;
#endif
static u8 video_index = 0;
static u8 video_vi    = 0;
static u8 video_dp    = 0;
static u16 *const video_cimg[] =
{
    (u16 *)0x80400000 - 3*VIDEO_W*VIDEO_H,
    (u16 *)0x80400000 - 2*VIDEO_W*VIDEO_H,
    (u16 *)0x80400000 - 1*VIDEO_W*VIDEO_H,
};

#ifndef DEMO_DVD
static const Vp vp_video =
{{
    {4*VIDEO_W/2, 4*VIDEO_H/2, G_MAXZ/2, 0},
    {4*VIDEO_W/2, 4*VIDEO_H/2, G_MAXZ/2, 0},
}};

static const Gfx gfx_video_0[] =
{
    gsDPSetColorImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, VIDEO_W, video_zimg),
    gsDPSetDepthImage(video_zimg),
    gsDPSetScissorFrac(
        G_SC_NON_INTERLACE, 0 << 2, 0 << 2, VIDEO_W << 2, VIDEO_H << 2
    ),
    gsDPSetCycleType(G_CYC_FILL),
    gsDPSetFillColor(0x00010001U*GPACK_ZDZ(G_MAXFBZ, 0)),
    gsDPFillRectangle(0, 0, VIDEO_W-1, VIDEO_H-1),
    gsDPPipeSync(),
    gsDPSetFillColorRGB(0xFF, 0xFF, 0xFF),
    gsSPEndDisplayList(),
};
#endif

static const Gfx gfx_video_1[] =
{
#ifdef DEMO_DVD
    gsDPSetScissorFrac(
        G_SC_NON_INTERLACE, 0 << 2, 0 << 2, VIDEO_W << 2, VIDEO_H << 2
    ),
    gsDPSetCycleType(G_CYC_FILL),
    gsDPSetFillColorRGB(0x00, 0x00, 0x00),
#endif
    gsDPFillRectangle(0, 0, VIDEO_W-1, VIDEO_H-1),
    gsDPPipeSync(),
#ifndef DEMO_DVD
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsDPPipelineMode(G_PM_1PRIMITIVE),
#endif
    gsDPSetCycleType(G_CYC_1CYCLE),
    gsDPSetTextureFilter(G_TF_BILERP),
    gsDPSetColorDither(G_CD_MAGICSQ),
#ifndef DEMO_DVD
    gsDPSetRenderMode(G_RM_AA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2),
    gsSPNumLights(NUMLIGHTS_1),
    gsSPTexture(0x0000, 0x0000, G_TX_NOLOD, G_TX_RENDERTILE, G_OFF),
    gsSPClearGeometryMode(~0),
    gsSPSetGeometryMode(
        G_ZBUFFER | G_SHADE | G_SHADING_SMOOTH | G_CULL_BACK | G_LIGHTING
    ),
    gsSPViewport(&vp_video),
#endif
    gsSPEndDisplayList(),
};

#ifdef DEMO_DVD
static const u8 texture_dvd[] =
{
#include "build/src/dvd.i4.h"
};

static const Gfx gfx_dvd[] =
{
    gsDPSetCombineMode(G_CC_MODULATERGBA_ENV, G_CC_MODULATERGBA_ENV),
    gsDPLoadTextureBlock_4b(
        texture_dvd, G_IM_FMT_I, 128, 64, 0,
        G_TX_CLAMP, G_TX_CLAMP, G_TX_NOMASK, G_TX_NOMASK, G_TX_NOLOD, G_TX_NOLOD
    ),
    gsDPSetTexturePersp(G_TP_NONE),
    gsDPSetRenderMode(G_RM_OPA_SURF, G_RM_OPA_SURF2),
    gsSPEndDisplayList(),
};

static const u32 palette_dvd[] =
{
    0xbe00ffff,
    0x00feffff,
    0xff8300ff,
    0x0026ffff,
    0xfffa01ff,
    0xff2600ff,
    0xff008bff,
    0x25ff01ff,
};

/* 394 x 180 */
#define boxw    176
#define boxh    80

static uint dvd_hit = 0;
static int dvd_x = 2*(640-boxw);
static int dvd_y = 2*(480-boxh);
static int dvd_h = 6;
static int dvd_v = 6;

static void dvd_update(void)
{
    int x = dvd_x + dvd_h;
    int y = dvd_y + dvd_v;
    if (x < 0 || x > 4*(VIDEO_W-boxw))
    {
        dvd_h = -dvd_h;
        dvd_hit++;
    }
    else
    {
        dvd_x = x;
    }
    if (y < 0 || y > 4*(VIDEO_H-boxh))
    {
        dvd_v = -dvd_v;
        dvd_hit++;
    }
    else
    {
        dvd_y = y;
    }
}

static void dvd_draw(void)
{
    gDPSetColor(video_gfx++, G_SETENVCOLOR, palette_dvd[dvd_hit & 7]);
    gSPDisplayList(video_gfx++, gfx_dvd);
#define dsdx (0x400*(128)/boxw)
#define dtdy (0x400*( 64)/boxh)
#define s    (32*(128)-16 - dsdx*boxw/32)
#define t    (32*( 64)-16 - dtdy*boxh/32)
    gSPTextureRectangle(
        video_gfx++, dvd_x, dvd_y, dvd_x + 4*boxw, dvd_y + 4*boxh,
        G_TX_RENDERTILE, s, t, dsdx, dtdy
    );
#undef dsdx
#undef dtdy
#undef s
#undef t
}
#endif

extern u64 gspFast3D_spot_fifoTextStart[];
extern u64 gspFast3D_spot_fifoDataStart[];

#ifndef DEMO_DVD
void *gfx_alloc(size_t size)
{
    u8 *addr = video_mem - ((size+0x07) & ~0x07);
    if (addr >= (u8 *)video_gfx)
    {
        video_mem = addr;
        return addr;
    }
    return NULL;
}
#endif

static void video_start(void)
{
    video_task = &video_task_table[video_index];
    video_buf = video_gfx = video_buf_table[video_index];
#ifndef DEMO_DVD
    video_mem = (u8 *)(video_buf + lenof(video_buf_table[0]));
    gSPDisplayList(video_gfx++, gfx_video_0);
#endif
    gDPSetColorImage(
        video_gfx++, G_IM_FMT_RGBA, G_IM_SIZ_16b, VIDEO_W, video_cimg[video_dp]
    );
    gSPDisplayList(video_gfx++, gfx_video_1);
    video_index ^= 1;
    if (++video_dp >= 3)
    {
        video_dp = 0;
    }
}

static void video_end(void)
{
#ifdef F3D_SPOT
    u64 *text = gspFast3D_spot_fifoTextStart;
    u64 *data = gspFast3D_spot_fifoDataStart;
#else
    u64 *text = gspFast3D_fifoTextStart;
    u64 *data = gspFast3D_fifoDataStart;
#endif
    gDPFullSync(video_gfx++);
    gSPEndDisplayList(video_gfx++);
    video_task->t.type             = M_GFXTASK;
    video_task->t.flags            = 0;
    video_task->t.ucode_boot       = rspbootTextStart;
    video_task->t.ucode_boot_size  =
        (u8 *)rspbootTextEnd-(u8 *)rspbootTextStart;
    video_task->t.ucode            = text;
    video_task->t.ucode_size       = SP_UCODE_SIZE;
    video_task->t.ucode_data       = data;
    video_task->t.ucode_data_size  = SP_UCODE_DATA_SIZE;
    video_task->t.dram_stack       = video_task_stack;
    video_task->t.dram_stack_size  = sizeof(video_task_stack);
    video_task->t.output_buff      = video_task_output;
    video_task->t.output_buff_size = video_task_output+lenof(video_task_output);
    video_task->t.data_ptr         = (u64 *)video_buf;
    video_task->t.data_size        = (u8 *)video_gfx-(u8 *)video_buf;
    video_task->t.yield_data_ptr   = NULL;
    video_task->t.yield_data_size  = 0;
    osWritebackDCacheAll();
}

static void video_update(void)
{
    u16 *cimg = video_cimg[video_vi];
    if (++video_vi >= 3)
    {
        video_vi = 0;
    }
    osViSwapBuffer(cimg);
    osViBlack(false);
}

#ifdef DEMO_TIME
static u32 dpc_time[16][4];
#endif

#ifdef PRINT
#include "print/texture.c"
#include "print/table.c"
#include "print/gfx.c"

static void print(int x, int y, const char *str)
{
    int start = x;
    gSPDisplayList(video_gfx++, gfx_print_copy_start);
    while (*str != 0)
    {
        char c = *str++;
        if (c == '\n')
        {
            x = start;
            y += 18;
        }
        else
        {
            if (c != ' ')
            {
                const u16 *timg;
                if      (c >= '0' && c <= '9') timg = texture_print[ 0 + c-'0'];
                else if (c >= 'A' && c <= 'Z') timg = texture_print[10 + c-'A'];
                else if (c >= 'a' && c <= 'z') timg = texture_print[10 + c-'a'];
                else timg = NULL;
                gDPSetTextureImage(
                    video_gfx++, G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, timg
                );
                gSPDisplayList(video_gfx++, gfx_print_copy_char);
                gSPTextureRectangle(
                    video_gfx++, x << 2, y << 2, (x+16-1) << 2, (y+16-1) << 2,
                    G_TX_RENDERTILE, 0, 0, 0x1000, 0x400
                );
                gDPPipeSync(video_gfx++);
            }
            x += 12;
        }
    }
    gSPDisplayList(video_gfx++, gfx_print_copy_end);
}
#endif

void app_main(unused void *arg)
{
#ifdef DEMO_TIME
    uint frame = 0;
#endif
    osCreateMesgQueue(MQ(vi));
    osCreateMesgQueue(MQ(dp));
    osViSetEvent(&mq_vi, (OSMesg)0, 1);
    osSetEventMesg(OS_EVENT_DP, &mq_dp, (OSMesg)0);
    video_start();
    video_end();
    osSpTaskStart(video_task);
#ifndef DEMO_DVD
    demo_init();
#endif
    while (true)
    {
    #ifdef DEMO_DVD
        dvd_update();
    #endif
        video_start();
    #ifdef DEMO_DVD
        dvd_draw();
    #else
        demo_draw();
    #ifdef DEMO_TIME
        if (frame >= 30+lenof(dpc_time)+3)
        {
            u64 time[4] = {0};
            char buf[64];
            uint i;
            uint t;
            for (t = 0; t < lenof(time); t++)
            {
                for (i = 0; i < lenof(dpc_time); i++)
                {
                    time[t] += dpc_time[i][t];
                }
                time[t] /= lenof(dpc_time);
            }
            sprintf(
                buf,
                "CLOCK %llu\n"
                "CMD   %llu\n"
                "PIPE  %llu\n"
                "TMEM  %llu\n",
                time[0], time[1], time[2], time[3]
            );
            print(20, 20, buf);
        }
    #endif
    #endif
        video_end();
        osRecvMesg(&mq_vi, NULL, OS_MESG_BLOCK);
        osRecvMesg(&mq_dp, NULL, OS_MESG_BLOCK);
    #ifdef DEMO_TIME
        if (frame >= 30 && frame < 30+lenof(dpc_time))
        {
            uint i = frame-30;
            dpc_time[i][0] = DPC_CLOCK_COUNT;
            dpc_time[i][1] = DPC_CMD_COUNT;
            dpc_time[i][2] = DPC_PIPE_COUNT;
            dpc_time[i][3] = DPC_TMEM_COUNT;
        }
        DPC_STATUS = 0x0200 | 0x0100 | 0x0080 | 0x0040;
        frame++;
    #endif
        osSpTaskStart(video_task);
        video_update();
    #ifndef DEMO_DVD
        osRecvMesg(&mq_vi, NULL, OS_MESG_BLOCK);
    #endif
    }
}

static void vi_init(uint mode)
{
    if (osTvType != OS_TV_NTSC)
    {
        mode += OS_VI_PAL_LPN1 - OS_VI_NTSC_LPN1;
    }
    osViSetMode(&osViModeTable[mode]);
    osViBlack(true);
    osViSetSpecialFeatures(
        OS_VI_GAMMA_OFF | OS_VI_GAMMA_DITHER_OFF |
        OS_VI_DIVOT_ON | OS_VI_DITHER_FILTER_ON
    );
}

static void idle_main(unused void *arg)
{
    osCreateViManager(OS_PRIORITY_VIMGR);
    vi_init(VIDEO_MODE);
    thread_create(app, 2, 10);
    while (true);
}

void main(void)
{
    osInitialize();
    thread_create(idle, 1, OS_PRIORITY_IDLE);
}
