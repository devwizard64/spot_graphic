#define c_blue  0x00, 0x00, 0x7F, 0x00, 0x00, 0xFF
#define c_red   0x7F, 0x00, 0x00, 0xFF, 0x00, 0x00
#define c_white 0x7F, 0x7F, 0x7F, 0xFF, 0xFF, 0xFF
#define c_shoe  0x39, 0x0E, 0x07, 0x72, 0x1C, 0x0E
#define c_skin  0x7F, 0x60, 0x3C, 0xFF, 0xD9, 0x88 /* 0xFE, 0xC1, 0x79 */
#define c_hair  0x39, 0x03, 0x00, 0x73, 0x06, 0x00

static const u16 texture_mario_button[] =
{
#include "build/src/mario/button.rgba16.h"
};

static const u16 texture_mario_logo[] =
{
#include "build/src/mario/logo.rgba16.h"
};

static const u16 texture_mario_sideburn[] =
{
#include "build/src/mario/sideburn.rgba16.h"
};

static const u16 texture_mario_moustache[] =
{
#include "build/src/mario/moustache.rgba16.h"
};

static const u16 texture_mario_eye_open[] =
{
#include "build/src/mario/eye_open.rgba16.h"
};

static const u16 texture_mario_eye_half[] =
{
#include "build/src/mario/eye_half.rgba16.h"
};

static const u16 texture_mario_eye_closed[] =
{
#include "build/src/mario/eye_closed.rgba16.h"
};

#include "build/src/mario/h_waist.vtx.h"

static const Gfx gfx_mario_h_waist[] =
{
    gsDPSpotColor(c_blue),
#include "build/src/mario/h_waist.h"
    gsSPEndDisplayList(),
};

#include "build/src/mario/h_uarmL.vtx.h"

static const Gfx gfx_mario_h_uarmL[] =
{
    gsDPPipeSync(),
    gsDPSpotColor(c_red),
#include "build/src/mario/h_uarmL.h"
    gsSPEndDisplayList(),
};

#include "build/src/mario/h_larmL.vtx.h"

static const Gfx gfx_mario_h_larmL[] =
{
#include "build/src/mario/h_larmL.h"
    gsSPEndDisplayList(),
};

#include "build/src/mario/h_fistL.vtx.h"

static const Gfx gfx_mario_h_fistL[] =
{
    gsDPPipeSync(),
    gsDPSpotColor(c_white),
#include "build/src/mario/h_fistL.h"
    gsSPEndDisplayList(),
};

#include "build/src/mario/h_uarmR.vtx.h"

static const Gfx gfx_mario_h_uarmR[] =
{
    gsDPPipeSync(),
    gsDPSpotColor(c_red),
#include "build/src/mario/h_uarmR.h"
    gsSPEndDisplayList(),
};

#include "build/src/mario/h_larmR.vtx.h"

static const Gfx gfx_mario_h_larmR[] =
{
#include "build/src/mario/h_larmR.h"
    gsSPEndDisplayList(),
};

#include "build/src/mario/h_fistR.vtx.h"

static const Gfx gfx_mario_h_fistR[] =
{
    gsDPPipeSync(),
    gsDPSpotColor(c_white),
#include "build/src/mario/h_fistR.h"
    gsSPEndDisplayList(),
};

#include "build/src/mario/h_thighL.vtx.h"

static const Gfx gfx_mario_h_thighL[] =
{
    gsDPPipeSync(),
    gsDPSpotColor(c_blue),
#include "build/src/mario/h_thighL.h"
    gsSPEndDisplayList(),
};

#include "build/src/mario/h_shinL.vtx.h"

static const Gfx gfx_mario_h_shinL[] =
{
#include "build/src/mario/h_shinL.h"
    gsSPEndDisplayList(),
};

#include "build/src/mario/h_shoeL.vtx.h"

static const Gfx gfx_mario_h_shoeL[] =
{
    gsDPPipeSync(),
    gsDPSpotColor(c_shoe),
#include "build/src/mario/h_shoeL.h"
    gsSPEndDisplayList(),
};

#include "build/src/mario/h_thighR.vtx.h"

static const Gfx gfx_mario_h_thighR[] =
{
    gsDPPipeSync(),
    gsDPSpotColor(c_blue),
#include "build/src/mario/h_thighR.h"
    gsSPEndDisplayList(),
};

#include "build/src/mario/h_shinR.vtx.h"

static const Gfx gfx_mario_h_shinR[] =
{
#include "build/src/mario/h_shinR.h"
    gsSPEndDisplayList(),
};

#include "build/src/mario/h_shoeR.vtx.h"

static const Gfx gfx_mario_h_shoeR[] =
{
    gsDPPipeSync(),
    gsDPSpotColor(c_shoe),
#include "build/src/mario/h_shoeR.h"
    gsSPEndDisplayList(),
};

#include "build/src/mario/h_torso0.vtx.h"
#include "build/src/mario/h_torso2.vtx.h"
#include "build/src/mario/h_torso1.vtx.h"

static const Gfx gfx_mario_h_torso0[] =
{
#include "build/src/mario/h_torso0.h"
    gsSPEndDisplayList(),
};

static const Gfx gfx_mario_h_torso[] =
{
    gsSPDisplayList(gfx_mario_h_torso0),
#include "build/src/mario/h_torso1.h"
    gsDPPipeSync(),
    gsDPSpotColor(c_red),
#include "build/src/mario/h_torso2.h"
    gsSPEndDisplayList(),
};

static const Gfx gfx_mario_h_torso_t[] =
{
    gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_DECALRGBA, G_CC_DECALRGBA),
    gsDPSetRenderMode(G_RM_ZB_XLU_DECAL, G_RM_ZB_XLU_DECAL2),
    gsDPSetTile(
        G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0,
        G_TX_WRAP, G_TX_NOMASK, G_TX_NOLOD,
        G_TX_WRAP, G_TX_NOMASK, G_TX_NOLOD
    ),
    gsSPTexture(0xFFFF, 0xFFFF, G_TX_NOLOD, G_TX_RENDERTILE, G_ON),
    gsDPSetTextureBlock(
        G_IM_FMT_RGBA, G_IM_SIZ_16b, 32, 32, 0,
        G_TX_CLAMP, G_TX_CLAMP, 5, 5, G_TX_NOLOD, G_TX_NOLOD
    ),
    gsDPLoadImageBlock(
        texture_mario_button, G_IM_FMT_RGBA, G_IM_SIZ_16b, 32, 32
    ),
    gsSPBranchList(gfx_mario_h_torso0),
};

#include "build/src/mario/h_cap0.vtx.h"
#include "build/src/mario/h_cap1.vtx.h"
#include "build/src/mario/h_cap2.vtx.h"
#include "build/src/mario/h_cap3.vtx.h"
#include "build/src/mario/h_cap5.vtx.h"
#include "build/src/mario/h_cap4.vtx.h"
#include "build/src/mario/h_cap6.vtx.h"

static const Gfx gfx_mario_h_cap0[] =
{
#include "build/src/mario/h_cap0.h"
    gsSPEndDisplayList(),
};

static const Gfx gfx_mario_h_cap1[] =
{
#include "build/src/mario/h_cap1.h"
    gsSPEndDisplayList(),
};

static const Gfx gfx_mario_h_cap2[] =
{
#include "build/src/mario/h_cap2.h"
    gsSPEndDisplayList(),
};

static const Gfx gfx_mario_h_cap3[] =
{
#include "build/src/mario/h_cap3.h"
    gsSPEndDisplayList(),
};

static const Gfx gfx_mario_h_cap[] =
{
    gsSPDisplayList(gfx_mario_h_cap0),
#include "build/src/mario/h_cap5.h"
    gsDPPipeSync(),
    gsDPSpotColor(c_skin),
    gsSPDisplayList(gfx_mario_h_cap1),
    gsSPDisplayList(gfx_mario_h_cap2),
    gsSPDisplayList(gfx_mario_h_cap3),
#include "build/src/mario/h_cap4.h"
    gsDPPipeSync(),
    gsDPSpotColor(c_hair),
#include "build/src/mario/h_cap6.h"
    gsSPEndDisplayList(),
};

static const Gfx gfx_mario_h_cap_t[] =
{
    gsDPLoadSync(),
    gsDPLoadBlock(
        G_TX_LOADTILE, 0, 0,
        (((32)*(32) + G_IM_SIZ_16b_INCR) >> G_IM_SIZ_16b_SHIFT)-1,
        CALC_DXT(32, G_IM_SIZ_16b_BYTES)
    ),
    gsSPDisplayList(gfx_mario_h_cap1),
    gsDPLoadImageBlock(
        texture_mario_logo, G_IM_FMT_RGBA, G_IM_SIZ_16b, 32, 32
    ),
    gsSPDisplayList(gfx_mario_h_cap0),
    gsDPLoadImageBlock(
        texture_mario_sideburn, G_IM_FMT_RGBA, G_IM_SIZ_16b, 32, 32
    ),
    gsSPDisplayList(gfx_mario_h_cap2),
    gsDPLoadImageBlock(
        texture_mario_moustache, G_IM_FMT_RGBA, G_IM_SIZ_16b, 32, 32
    ),
    gsSPBranchList(gfx_mario_h_cap3),
};

static const Gfx *const gfx_mario[20][2] =
{
    {NULL,                  NULL},
    {gfx_mario_h_waist,     NULL},
    {gfx_mario_h_torso,     gfx_mario_h_torso_t},
    {gfx_mario_h_cap,       gfx_mario_h_cap_t},
    {NULL,                  NULL},
    {gfx_mario_h_uarmL,     NULL},
    {gfx_mario_h_larmL,     NULL},
    {gfx_mario_h_fistL,     NULL},
    {NULL,                  NULL},
    {gfx_mario_h_uarmR,     NULL},
    {gfx_mario_h_larmR,     NULL},
    {gfx_mario_h_fistR,     NULL},
    {NULL,                  NULL},
    {gfx_mario_h_thighL,    NULL},
    {gfx_mario_h_shinL,     NULL},
    {gfx_mario_h_shoeL,     NULL},
    {NULL,                  NULL},
    {gfx_mario_h_thighR,    NULL},
    {gfx_mario_h_shinR,     NULL},
    {gfx_mario_h_shoeR,     NULL},
};
