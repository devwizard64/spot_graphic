#include <ultra64.h>

.set noreorder
.set noat

/* 0x80325DA0   u32 osAiGetLength(void) */
.globl osAiGetLength
osAiGetLength:
/*0x80325DA0*/  lui     $t6, %hi(0xA4500004)
/*0x80325DA4*/  jr      $ra
/*0x80325DA8*/  lw      $v0, %lo(0xA4500004)($t6)
