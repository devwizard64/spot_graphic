/* 0x04000000 */ static const Lights1 light_mario_blue =
    gdSPDefLight(0.5F, 0x00, 0x00, 0xFF);
/* 0x04000018 */ static const Lights1 light_mario_red =
    gdSPDefLight(0.5F, 0xFF, 0x00, 0x00);
/* 0x04000030 */ static const Lights1 light_mario_white =
    gdSPDefLight(0.5F, 0xFF, 0xFF, 0xFF);
/* 0x04000048 */ static const Lights1 light_mario_shoe =
    gdSPDefLight(0.5F, 0x72, 0x1C, 0x0E);
/* 0x04000060 */ static const Lights1 light_mario_skin =
    gdSPDefLight(0.5F, 0xFE, 0xC1, 0x79);
/* 0x04000078 */ static const Lights1 light_mario_hair =
    gdSPDefLight(0.5F, 0x73, 0x06, 0x00);

/* 0x04001090 */ static const u16 texture_mario_button[] =
{
#include "build/src/mario/button.rgba16.h"
};

/* 0x04001890 */ static const u16 texture_mario_logo[] =
{
#include "build/src/mario/logo.rgba16.h"
};

/* 0x04002090 */ static const u16 texture_mario_sideburn[] =
{
#include "build/src/mario/sideburn.rgba16.h"
};

/* 0x04002890 */ static const u16 texture_mario_moustache[] =
{
#include "build/src/mario/moustache.rgba16.h"
};

/* 0x04003090 */ static const u16 texture_mario_eye_open[] =
{
#include "build/src/mario/eye_open.rgba16.h"
};

/* 0x04003890 */ static const u16 texture_mario_eye_half[] =
{
#include "build/src/mario/eye_half.rgba16.h"
};

/* 0x04004090 */ static const u16 texture_mario_eye_closed[] =
{
#include "build/src/mario/eye_closed.rgba16.h"
};

#include "build/src/mario/h_waist.vtx.h"

/* 0x0400CA00 */ static const Gfx gfx_mario_h_waist[] =
{
#include "build/src/mario/h_waist.h"
    gsSPEndDisplayList(),
};

/* 0x0400CC98 */ const Gfx gfx_mario_h_waist_s[] =
{
    gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE_ENV, G_CC_SHADE_ENV),
    gsSPSetLights1N(light_mario_blue),
    gsSPDisplayList(gfx_mario_h_waist),
    gsSPEndDisplayList(),
};

#include "build/src/mario/h_uarmL.vtx.h"

/* 0x0400D090 */ const Gfx gfx_mario_h_uarmL[] =
{
#include "build/src/mario/h_uarmL.h"
    gsSPEndDisplayList(),
};

/* 0x0400D1D8 */ const Gfx gfx_mario_h_uarmL_s[] =
{
    gsSPSetLights1N(light_mario_red),
    gsSPDisplayList(gfx_mario_h_uarmL),
    gsSPEndDisplayList(),
};

#include "build/src/mario/h_larmL.vtx.h"

/* 0x0400D2F8 */ const Gfx gfx_mario_h_larmL[] =
{
#include "build/src/mario/h_larmL.h"
    gsSPEndDisplayList(),
};

#include "build/src/mario/h_fistL.vtx.h"

/* 0x0400D758 */ const Gfx gfx_mario_h_fistL[] =
{
#include "build/src/mario/h_fistL.h"
    gsSPEndDisplayList(),
};

/* 0x0400D8F0 */ const Gfx gfx_mario_h_fistL_s[] =
{
    gsSPSetLights1N(light_mario_white),
    gsSPDisplayList(gfx_mario_h_fistL),
    gsSPEndDisplayList(),
};

#include "build/src/mario/h_uarmR.vtx.h"

/* 0x0400DCA0 */ const Gfx gfx_mario_h_uarmR[] =
{
#include "build/src/mario/h_uarmR.h"
    gsSPEndDisplayList(),
};

/* 0x0400DDE8 */ const Gfx gfx_mario_h_uarmR_s[] =
{
    gsSPSetLights1N(light_mario_red),
    gsSPDisplayList(gfx_mario_h_uarmR),
    gsSPEndDisplayList(),
};

#include "build/src/mario/h_larmR.vtx.h"

/* 0x0400DF08 */ const Gfx gfx_mario_h_larmR[] =
{
#include "build/src/mario/h_larmR.h"
    gsSPEndDisplayList(),
};

#include "build/src/mario/h_fistR.vtx.h"

/* 0x0400E2C8 */ static const Gfx gfx_mario_h_fistR[] =
{
#include "build/src/mario/h_fistR.h"
    gsSPEndDisplayList(),
};

/* 0x0400E458 */ const Gfx gfx_mario_h_fistR_s[] =
{
    gsSPSetLights1N(light_mario_white),
    gsSPDisplayList(gfx_mario_h_fistR),
    gsSPEndDisplayList(),
};

#include "build/src/mario/h_thighL.vtx.h"

/* 0x0400E6A8 */ static const Gfx gfx_mario_h_thighL[] =
{
#include "build/src/mario/h_thighL.h"
    gsSPEndDisplayList(),
};

/* 0x0400E7B0 */ const Gfx gfx_mario_h_thighL_s[] =
{
    gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE_ENV, G_CC_SHADE_ENV),
    gsSPSetLights1N(light_mario_blue),
    gsSPDisplayList(gfx_mario_h_thighL),
    gsSPEndDisplayList(),
};

#include "build/src/mario/h_shinL.vtx.h"

/* 0x0400E918 */ const Gfx gfx_mario_h_shinL[] =
{
#include "build/src/mario/h_shinL.h"
    gsSPEndDisplayList(),
};

#include "build/src/mario/h_shoeL.vtx.h"

/* 0x0400EBB8 */ const Gfx gfx_mario_h_shoeL[] =
{
#include "build/src/mario/h_shoeL.h"
    gsSPEndDisplayList(),
};

/* 0x0400ECA0 */ const Gfx gfx_mario_h_shoeL_s[] =
{
    gsSPSetLights1N(light_mario_shoe),
    gsSPDisplayList(gfx_mario_h_shoeL),
    gsSPEndDisplayList(),
};

#include "build/src/mario/h_thighR.vtx.h"

/* 0x0400EEB0 */ const Gfx gfx_mario_h_thighR[] =
{
#include "build/src/mario/h_thighR.h"
    gsSPEndDisplayList(),
};

/* 0x0400EFB8 */ const Gfx gfx_mario_h_thighR_s[] =
{
    gsSPSetLights1N(light_mario_blue),
    gsSPDisplayList(gfx_mario_h_thighR),
    gsSPEndDisplayList(),
};

#include "build/src/mario/h_shinR.vtx.h"

/* 0x0400F1D8 */ const Gfx gfx_mario_h_shinR[] =
{
#include "build/src/mario/h_shinR.h"
    gsSPEndDisplayList(),
};

#include "build/src/mario/h_shoeR.vtx.h"

/* 0x0400F400 */ static const Gfx gfx_mario_h_shoeR[] =
{
#include "build/src/mario/h_shoeR.h"
    gsSPEndDisplayList(),
};

/* 0x0400F4E8 */ const Gfx gfx_mario_h_shoeR_s[] =
{
    gsSPSetLights1N(light_mario_shoe),
    gsSPDisplayList(gfx_mario_h_shoeR),
    gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsDPSetEnvColor(0xFF, 0xFF, 0xFF, 0xFF),
    gsDPSetAlphaCompare(G_AC_NONE),
    gsSPEndDisplayList(),
};

#include "build/src/mario/h_torso0.vtx.h"
#include "build/src/mario/h_torso2.vtx.h"
#include "build/src/mario/h_torso1.vtx.h"

/* 0x0400FF28 */ static const Gfx gfx_mario_h_torso0[] =
{
#include "build/src/mario/h_torso0.h"
    gsSPEndDisplayList(),
};

/* 0x0400FF88 */ static const Gfx gfx_mario_h_torso1[] =
{
#include "build/src/mario/h_torso1.h"
    gsSPEndDisplayList(),
};

/* 0x04010260 */ static const Gfx gfx_mario_h_torso2[] =
{
#include "build/src/mario/h_torso2.h"
    gsSPEndDisplayList(),
};

/* 0x04010348 */ static const Gfx gfx_mario_h_torso12_s[] =
{
    gsSPDisplayList(gfx_mario_h_torso1),
    gsSPSetLights1N(light_mario_red),
    gsSPDisplayList(gfx_mario_h_torso2),
    gsSPEndDisplayList(),
};

/* 0x04010370 */ const Gfx gfx_mario_h_torso_s[] =
{
    gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_BLENDRGB_ENVA, G_CC_BLENDRGB_ENVA),
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
    gsSPDisplayList(gfx_mario_h_torso0),
    gsSPTexture(0xFFFF, 0xFFFF, G_TX_NOLOD, G_TX_RENDERTILE, G_OFF),
    gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE_ENV, G_CC_SHADE_ENV),
    gsSPDisplayList(gfx_mario_h_torso12_s),
    gsSPEndDisplayList(),
};

#include "build/src/mario/h_cap0.vtx.h"
#include "build/src/mario/h_cap1.vtx.h"
#include "build/src/mario/h_cap2.vtx.h"
#include "build/src/mario/h_cap3.vtx.h"
#include "build/src/mario/h_cap5.vtx.h"
#include "build/src/mario/h_cap4.vtx.h"
#include "build/src/mario/h_cap6.vtx.h"

/* 0x040112B0 */ static const Gfx gfx_mario_h_cap0[] =
{
#include "build/src/mario/h_cap0.h"
    gsSPEndDisplayList(),
};

/* 0x040112E8 */ static const Gfx gfx_mario_h_cap1[] =
{
#include "build/src/mario/h_cap1.h"
    gsSPEndDisplayList(),
};

/* 0x04011350 */ static const Gfx gfx_mario_h_cap2[] =
{
#include "build/src/mario/h_cap2.h"
    gsSPEndDisplayList(),
};

/* 0x040113A0 */ static const Gfx gfx_mario_h_cap3[] =
{
#include "build/src/mario/h_cap3.h"
    gsSPEndDisplayList(),
};

/* 0x04011438 */ static const Gfx gfx_mario_h_cap4[] =
{
#include "build/src/mario/h_cap4.h"
    gsSPEndDisplayList(),
};

/* 0x040116F8 */ static const Gfx gfx_mario_h_cap5[] =
{
#include "build/src/mario/h_cap5.h"
    gsSPEndDisplayList(),
};

/* 0x04011870 */ static const Gfx gfx_mario_h_cap6[] =
{
#include "build/src/mario/h_cap6.h"
    gsSPEndDisplayList(),
};

/* 0x04011960 */ static const Gfx gfx_mario_h_cap456_s[] =
{
    gsSPDisplayList(gfx_mario_h_cap4),
    gsSPSetLights1N(light_mario_red),
    gsSPDisplayList(gfx_mario_h_cap5),
    gsSPSetLights1N(light_mario_hair),
    gsSPDisplayList(gfx_mario_h_cap6),
    gsSPEndDisplayList(),
};

/* 0x040119A0 */ const Gfx gfx_mario_h_cap_open[] =
{
    gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_BLENDRGB_ENVA, G_CC_BLENDRGB_ENVA),
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
    gsDPLoadImageBlock(texture_mario_logo, G_IM_FMT_RGBA, G_IM_SIZ_16b, 32, 32),
    gsSPDisplayList(gfx_mario_h_cap0),
    gsDPLoadImageBlock(
        texture_mario_eye_open, G_IM_FMT_RGBA, G_IM_SIZ_16b, 32, 32
    ),
    gsSPSetLights1N(light_mario_skin),
    gsSPDisplayList(gfx_mario_h_cap1),
    gsDPLoadImageBlock(
        texture_mario_sideburn, G_IM_FMT_RGBA, G_IM_SIZ_16b, 32, 32
    ),
    gsSPDisplayList(gfx_mario_h_cap2),
    gsDPLoadImageBlock(
        texture_mario_moustache, G_IM_FMT_RGBA, G_IM_SIZ_16b, 32, 32
    ),
    gsSPDisplayList(gfx_mario_h_cap3),
    gsSPTexture(0xFFFF, 0xFFFF, G_TX_NOLOD, G_TX_RENDERTILE, G_OFF),
    gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE_ENV, G_CC_SHADE_ENV),
    gsSPDisplayList(gfx_mario_h_cap456_s),
    gsSPEndDisplayList(),
};

static const Gfx *const gfx_mario[20][1] =
{
    {NULL},
    {gfx_mario_h_waist_s},
    {gfx_mario_h_torso_s},
    {gfx_mario_h_cap_open},
    {NULL},
    {gfx_mario_h_uarmL_s},
    {gfx_mario_h_larmL},
    {gfx_mario_h_fistL_s},
    {NULL},
    {gfx_mario_h_uarmR_s},
    {gfx_mario_h_larmR},
    {gfx_mario_h_fistR_s},
    {NULL},
    {gfx_mario_h_thighL_s},
    {gfx_mario_h_shinL},
    {gfx_mario_h_shoeL_s},
    {NULL},
    {gfx_mario_h_thighR_s},
    {gfx_mario_h_shinR},
    {gfx_mario_h_shoeR_s},
};
