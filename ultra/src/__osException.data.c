#include <ultra64.h>

/* 0x80335A30 */ void (*__osHwIntTable[5])(void) = {0};
/* 0x80335A44 */ u32 ultra_data_80335A44 = 0;
/* 0x80335A48 */ u32 ultra_data_80335A48 = 0;

/* 0x80339980 */ const u8 ultra_rodata_80339980[] =
{
    0, 20, 24, 24, 28, 28, 28, 28, 32, 32, 32, 32, 32, 32, 32, 32,
    0, 4, 8, 8, 12, 12, 12, 12, 16, 16, 16, 16, 16, 16, 16, 16,
};

/* 0x803278E4 */ extern void L803278E4(void);
/* 0x80327904 */ extern void L80327904(void);
/* 0x80327938 */ extern void L80327938(void);
/* 0x80327A68 */ extern void L80327A68(void);
/* 0x80327AC4 */ extern void L80327AC4(void);
/* 0x80327AE4 */ extern void L80327AE4(void);
/* 0x80327B1C */ extern void L80327B1C(void);
/* 0x80327B68 */ extern void L80327B68(void);

/* 0x803399A0 */ void (*const ultra_rodata_803399A0[])(void) =
{
    L80327B1C,
    L80327AE4,
    L80327AC4,
    L80327938,
    L80327904,
    L80327A68,
    L80327B68,
    L80327B68,
    L803278E4,
};
