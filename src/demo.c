#include <ultra64.h>

#include <sm64/types.h>
#include <sm64/gbi_ext.h>

#include <project.h>
#include "main.h"
#include "demo.h"

#ifndef DEMO_DVD

#ifdef DEMO_OLD
#define SPOT_MASK   6
#define SPOT_SHIFT  0
#else
#define SPOT_MASK   3
#define SPOT_SHIFT  (2 - SPOT_MASK)
#endif
#define SPOT_SIZE   (1 << SPOT_MASK)

#ifndef M_SQRT2
#define M_SQRT2     1.41421356237309504880
#endif
#define SPOT_MIN    0x80
#define SPOT_MAX    \
    ((f32)((0x100-SPOT_MIN) / (M_SQRT2 * (SPOT_SIZE-1)/SPOT_SIZE)))

#define G_SPOT                  0x01000000

#define G_CC_ENVMODULATEA       0, 0, 0, ENVIRONMENT, TEXEL0, 0, SHADE, 0

#define RM_ZB_SPOT_DECAL(clk)                                   \
        Z_CMP | CVG_DST_FULL | CVG_X_ALPHA | ZMODE_DEC |        \
        GBL_c##clk(G_BL_CLR_IN, G_BL_A_IN, G_BL_CLR_MEM, G_BL_A_MEM)

#define G_RM_ZB_SPOT_DECAL      RM_ZB_SPOT_DECAL(1)
#define G_RM_ZB_SPOT_DECAL2     RM_ZB_SPOT_DECAL(2)

#define gsDPSpotRGB(sr, sg, sb, lr, lg, lb) \
    gsDPSetEnvColor(lr, lg, lb, 0),         \
    gsDPSetPrimColor(0, 0, sr, sg, sb, 0)

#define gsDPSpotColor(c)    gsDPSpotRGB(c)

#ifndef DEMO_ORG
u8 texture_spot[SPOT_SIZE][SPOT_SIZE];
#endif

#ifdef DEMO_ORG
#include "mario/gfx_org.c"

#include "build/src/cube.vtx.h"

static const Gfx gfx_cull[] =
{
    gsSPClearGeometryMode(G_LIGHTING),
#include "build/src/cube.h"
    gsSPSetGeometryMode(G_LIGHTING),
    gsSPCullDisplayList(0, 7),
    gsDPSetEnvColor(0xFF, 0xFF, 0xFF, 0x7F),
    gsDPSetRenderMode(G_RM_AA_ZB_XLU_SURF, G_RM_AA_ZB_XLU_SURF2),
    gsDPSetAlphaCompare(G_AC_DITHER),
    gsSPEndDisplayList(),
};
#else
static const Lights1 light_shade = gdSPDefLights1(
    0x7F, 0x7F, 0x7F, 0xFF, 0xFF, 0xFF, 40, 80, 80
);

static const Gfx gfx_mtl_light[] =
{
    gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_PRIMITIVE, G_CC_PRIMITIVE),
    gsDPSetRenderMode(G_RM_ZB_OPA_SURF, G_RM_ZB_OPA_SURF2),
    gsSPClearGeometryMode(G_SHADE | G_SHADING_SMOOTH | G_LIGHTING),
    gsSPEndDisplayList(),
};

static const u16 texture_mario_button[32*32];
static const Gfx gfx_mtl_shade[] =
{
    gsDPPipeSync(),
    gsDPLoadTextureBlock(
        texture_spot, G_IM_FMT_I, G_IM_SIZ_8b, SPOT_SIZE, SPOT_SIZE, 0,
        G_TX_MIRROR, G_TX_MIRROR, SPOT_MASK, SPOT_MASK, SPOT_SHIFT, SPOT_SHIFT
    ),
    gsDPSetCombineMode(G_CC_ENVMODULATEA, G_CC_ENVMODULATEA),
    gsDPSetBlendColor(0xFF, 0xFF, 0xFF, 0x7C),
    gsDPSetTexturePersp(G_TP_NONE),
    gsDPSetRenderMode(G_RM_ZB_SPOT_DECAL, G_RM_ZB_SPOT_DECAL2),
    gsDPSetAlphaCompare(G_AC_THRESHOLD),
#ifdef DEMO_OLD
    gsSPTexture(62*SPOT_SIZE, 62*SPOT_SIZE, G_TX_NOLOD, G_TX_RENDERTILE, G_ON),
    gsSPSetGeometryMode(
        G_SHADE | G_SHADING_SMOOTH | G_LIGHTING | G_TEXTURE_GEN |
        G_TEXTURE_GEN_LINEAR
    ),
#else
    gsSPTexture(14*320/VIDEO_W, 0, G_TX_NOLOD, G_TX_RENDERTILE, G_ON),
    gsSPSetGeometryMode(G_SHADE | G_SHADING_SMOOTH | G_LIGHTING | G_SPOT),
#endif
    gsSPSetLights1N(light_shade),
    gsSPEndDisplayList(),
};

static const Gfx gfx_mtl_end[] =
{
    gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsDPSetBlendColor(0xFF, 0xFF, 0xFF, 0xFF),
    gsDPSetTexturePersp(G_TP_PERSP),
    gsDPSetRenderMode(G_RM_AA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2),
    gsDPSetAlphaCompare(G_AC_NONE),
    gsSPTexture(0x0000, 0x0000, G_TX_NOLOD, G_TX_RENDERTILE, G_OFF),
#ifdef DEMO_OLD
    gsSPClearGeometryMode(G_TEXTURE_GEN | G_TEXTURE_GEN_LINEAR),
#else
    gsSPClearGeometryMode(G_SPOT),
#endif
    gsSPEndDisplayList(),
};

#include "mario/gfx.c"
#endif
#include "mario/motion.c"

static const s16 *demo_val;
static const u16 *demo_tbl;
static s16 demo_frame = 0;
static u16 demo_timer = 0;

void demo_init(void)
{
#ifndef DEMO_ORG
    uint y;
    for (y = 0; y < SPOT_SIZE; y++)
    {
        f32 ty = y * SPOT_MAX/SPOT_SIZE;
        uint x;
        for (x = 0; x < SPOT_SIZE; x++)
        {
            f32 tx = x * SPOT_MAX/SPOT_SIZE;
            texture_spot[y][x] = SPOT_MIN + (int)sqrtf(tx*tx + ty*ty);
        }
    }
    osWritebackDCache(texture_spot, sizeof(texture_spot));
#endif
}

static f32 sin(int x)
{
    return sinf((f32)(M_PI/0x8000) * x);
}

static f32 cos(int x)
{
    return cosf((f32)(M_PI/0x8000) * x);
}

static void mf_cat(f32 mf[4][4], f32 a[4][4], f32 b[4][4])
{
    f32 dst[4][4];
    u32 y;
    for (y = 0; y < 4; y++)
    {
        u32 x;
        for (x = 0; x < 4; x++)
        {
            dst[y][x] =
                a[y][0]*b[0][x] + a[y][1]*b[1][x] +
                a[y][2]*b[2][x] + a[y][3]*b[3][x];
        }
    }
    memcpy(mf, dst, sizeof(dst));
}

static void mf_tr_zyx(
    f32 mf[4][4], f32 tx, f32 ty, f32 tz, int rx, int ry, int rz
)
{
    register f32 sx = sin(rx);
    register f32 cx = cos(rx);
    register f32 sy = sin(ry);
    register f32 cy = cos(ry);
    register f32 sz = sin(rz);
    register f32 cz = cos(rz);
    mf[0][0] =  cy*cz;
    mf[0][1] =  cy*sz;
    mf[0][2] = -sy;
    mf[0][3] = 0.0F;
    mf[1][0] =  sx*sy*cz - cx*sz;
    mf[1][1] =  sx*sy*sz + cx*cz;
    mf[1][2] =  sx*cy;
    mf[1][3] = 0.0F;
    mf[2][0] =  cx*sy*cz + sx*sz;
    mf[2][1] =  cx*sy*sz - sx*cz;
    mf[2][2] =  cx*cy;
    mf[2][3] = 0.0F;
    mf[3][0] = tx;
    mf[3][1] = ty;
    mf[3][2] = tz;
    mf[3][3] = 1.0F;
}

static int demo_joint(void)
{
    int f = demo_frame;
    int m = demo_tbl[0];
    int i = demo_tbl[1];
    demo_tbl += 2;
    return demo_val[(m-1 < f ? m-1 : f) + i];
}

static void demo_gfx(Mtx **mtbl, uint m)
{
    uint i;
    for (i = 0; i < lenof(gfx_mario); i++)
    {
        const Gfx *gfx = gfx_mario[i][m];
        if (gfx != NULL)
        {
            gSPMatrix(
                video_gfx++, mtbl[i],
                G_MTX_MODELVIEW | G_MTX_LOAD | G_MTX_NOPUSH
            );
            if (m == 1 && i == 3)
            {
                uint n = demo_timer >> 1 & 0x1F;
                if (n > lenof(texture_mario_eye)-1)
                {
                    n = lenof(texture_mario_eye)-1;
                }
                gDPSetTextureImage(
                    video_gfx++, G_IM_FMT_RGBA, G_IM_SIZ_16b, 1,
                    texture_mario_eye[n]
                );
            }
            gSPDisplayList(video_gfx++, gfx);
        }
    }
}

void demo_draw(void)
{
    f32 mf_stack[8][4][4];
    f32 mf[4][4];
    Mtx *mtbl[lenof(joint_mario)];
    Mtx *mtx;
    u16 persp_norm;
    uint m;
    uint i;
    mtx = gfx_alloc(sizeof(Mtx));
    guPerspective(mtx, &persp_norm, 35, (f32)VIDEO_W/VIDEO_H, 64, 16384, 1);
    gSPPerspNormalize(video_gfx++, persp_norm);
    gSPMatrix(video_gfx++, mtx, G_MTX_PROJECTION | G_MTX_LOAD | G_MTX_NOPUSH);
    guTranslateF(mf_stack[0], 0, 0, -1024);
    guRotateF(mf, 45 * sinf((f32)(M_PI/360) * demo_timer), 1, 0, 0);
    mf_cat(mf_stack[0], mf, mf_stack[0]);
    guTranslateF(mf, 0, -320, 0);
    mf_cat(mf_stack[0], mf, mf_stack[0]);
    guRotateF(mf, demo_timer, 0, 1, 0);
    mf_cat(mf_stack[0], mf, mf_stack[0]);
    demo_val = val_mario;
    demo_tbl = tbl_mario;
    m = 0;
    i = 0;
    while (true)
    {
        const s8 *joint = joint_mario[i];
        int flag;
        int tx;
        int ty;
        int tz;
        int rx;
        int ry;
        int rz;
        f32 (*src)[4][4];
        flag = joint[0];
        tx   = joint[1];
        ty   = joint[2];
        tz   = joint[3];
        if (flag & 4)
        {
            tx += demo_joint();
            ty += demo_joint();
            tz += demo_joint();
        }
        rx = demo_joint();
        ry = demo_joint();
        rz = demo_joint();
        mf_tr_zyx(mf, tx, ty, tz, rx, ry, rz);
        if (flag & 2)
        {
            m--;
        }
        src = &mf_stack[m];
        if (flag & 1)
        {
            m++;
        }
        mf_cat(mf_stack[m], mf, *src);
        if (gfx_mario[i][0] != NULL)
        {
            mtbl[i] = mtx = gfx_alloc(sizeof(*mtx));
            guMtxF2L(mf_stack[m], mtx);
        }
        if (flag & 8)
        {
            break;
        }
        i++;
    }
#ifdef DEMO_ORG
    guTranslateF(mf, 1024 * sinf(((f32)M_PI/60) * demo_timer), 320, 0);
    mf_cat(mf, mf, mf_stack[0]);
    mtx = gfx_alloc(sizeof(Mtx));
    guMtxF2L(mf, mtx);
    gSPMatrix(video_gfx++, mtx, G_MTX_MODELVIEW | G_MTX_LOAD | G_MTX_NOPUSH);
    gSPDisplayList(video_gfx++, gfx_cull);
    demo_gfx(mtbl, 0);
#else
    gSPDisplayList(video_gfx++, gfx_mtl_light);
    demo_gfx(mtbl, 0);
    gSPDisplayList(video_gfx++, gfx_mtl_shade);
    demo_gfx(mtbl, 0);
    gSPDisplayList(video_gfx++, gfx_mtl_end);
    demo_gfx(mtbl, 1);
#endif
#ifdef DEMO_TIME
    demo_timer = 720;
#else
    if (++demo_frame > 90-1)
    {
        demo_frame = 0;
    }
    demo_timer++;
#endif
}

#endif
