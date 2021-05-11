#include <ultra64.h>

.set noreorder
.set noat

/* 0x80327490 */
.globl __osDequeueThread
__osDequeueThread:
/*0x80327490*/  move    $a2, $a0
/*0x80327494*/  lw      $a3, 0x0000($a2)
/*0x80327498*/  addiu   $sp, $sp, -0x0008
/*0x8032749C*/  beqz    $a3, .L803274C8
/*0x803274A0*/  nop
.L803274A4:
/*0x803274A4*/  bne     $a3, $a1, .L803274B8
/*0x803274A8*/  nop
/*0x803274AC*/  lw      $t6, 0x0000($a1)
/*0x803274B0*/  b       .L803274C8
/*0x803274B4*/  sw      $t6, 0x0000($a2)
.L803274B8:
/*0x803274B8*/  move    $a2, $a3
/*0x803274BC*/  lw      $a3, 0x0000($a2)
/*0x803274C0*/  bnez    $a3, .L803274A4
/*0x803274C4*/  nop
.L803274C8:
/*0x803274C8*/  jr      $ra
/*0x803274CC*/  addiu   $sp, $sp, 0x0008
