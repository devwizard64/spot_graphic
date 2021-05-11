static const Gfx gfx_print_copy_start[] =
{
    gsDPPipeSync(),
    gsDPSetBlendColor(0xFF, 0xFF, 0xFF, 0xFF),
    gsDPSetTile(
        G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0,
        G_TX_WRAP, G_TX_NOMASK, G_TX_NOLOD,
        G_TX_WRAP, G_TX_NOMASK, G_TX_NOLOD
    ),
    gsDPSetTextureBlock(
        G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 16, 0,
        G_TX_CLAMP, G_TX_CLAMP, 4, 4, G_TX_NOLOD, G_TX_NOLOD
    ),
    gsDPSetCycleType(G_CYC_COPY),
    gsDPSetTexturePersp(G_TP_NONE),
    gsDPSetRenderMode(G_RM_NOOP, G_RM_NOOP2),
    gsDPSetAlphaCompare(G_AC_THRESHOLD),
    gsSPEndDisplayList(),
};

static const Gfx gfx_print_copy_char[] =
{
    gsDPLoadSync(),
    gsDPLoadBlock(
        G_TX_LOADTILE, 0, 0,
        (((16)*(16) + G_IM_SIZ_16b_INCR) >> G_IM_SIZ_16b_SHIFT)-1,
        CALC_DXT(16, G_IM_SIZ_16b_BYTES)
    ),
    gsSPEndDisplayList(),
};

static const Gfx gfx_print_copy_end[] =
{
    gsDPSetCycleType(G_CYC_1CYCLE),
    gsDPSetTexturePersp(G_TP_PERSP),
    gsDPSetRenderMode(G_RM_AA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2),
    gsDPSetAlphaCompare(G_AC_NONE),
    gsSPEndDisplayList(),
};
