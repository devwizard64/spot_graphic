#include <ultra64.h>

.set noreorder
.set noat

/* 0x803223B0   void osSetTime(OSTime time) */
.globl osSetTime
osSetTime:
/*0x803223B0*/  sw      $a0, 0x0000($sp)
/*0x803223B4*/  lw      $t6, 0x0000($sp)
/*0x803223B8*/  sw      $a1, 0x0004($sp)
/*0x803223BC*/  lui     $at, %hi(ultra_bss+0x2570)
/*0x803223C0*/  lw      $t7, 0x0004($sp)
/*0x803223C4*/  sw      $t6, %lo(ultra_bss+0x2570)($at)
/*0x803223C8*/  lui     $at, %hi(ultra_bss+0x2574)
/*0x803223CC*/  jr      $ra
/*0x803223D0*/  sw      $t7, %lo(ultra_bss+0x2574)($at)
