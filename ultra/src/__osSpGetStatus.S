#include <ultra64.h>

.set noreorder
.set noat

/* 0x80328040 */
.globl __osSpGetStatus
__osSpGetStatus:
/*0x80328040*/  lui     $t6, %hi(0xA4040010)
/*0x80328044*/  jr      $ra
/*0x80328048*/  lw      $v0, %lo(0xA4040010)($t6)
