#include <ultra64.h>

.set noreorder
.set noat

/* 0x80328790 */
.globl __osSiRawWriteIo
__osSiRawWriteIo:
/*0x80328790*/  addiu   $sp, $sp, -0x0018
/*0x80328794*/  sw      $ra, 0x0014($sp)
/*0x80328798*/  sw      $a0, 0x0018($sp)
/*0x8032879C*/  jal     __osSiDeviceBusy
/*0x803287A0*/  sw      $a1, 0x001C($sp)
/*0x803287A4*/  beqz    $v0, .L803287B4
/*0x803287A8*/  nop
/*0x803287AC*/  b       .L803287CC
/*0x803287B0*/  li      $v0, -0x0001
.L803287B4:
/*0x803287B4*/  lw      $t7, 0x0018($sp)
/*0x803287B8*/  lw      $t6, 0x001C($sp)
/*0x803287BC*/  li      $at, 0xA0000000
/*0x803287C0*/  or      $t8, $t7, $at
/*0x803287C4*/  move    $v0, $0
/*0x803287C8*/  sw      $t6, 0x0000($t8)
.L803287CC:
/*0x803287CC*/  lw      $ra, 0x0014($sp)
/*0x803287D0*/  addiu   $sp, $sp, 0x0018
/*0x803287D4*/  jr      $ra
/*0x803287D8*/  nop
