#include <ultra64.h>

.set noreorder
.set noat

/* 0x80328740 */
.globl __osSiRawReadIo
__osSiRawReadIo:
/*0x80328740*/  addiu   $sp, $sp, -0x0018
/*0x80328744*/  sw      $ra, 0x0014($sp)
/*0x80328748*/  sw      $a0, 0x0018($sp)
/*0x8032874C*/  jal     __osSiDeviceBusy
/*0x80328750*/  sw      $a1, 0x001C($sp)
/*0x80328754*/  beqz    $v0, .L80328764
/*0x80328758*/  nop
/*0x8032875C*/  b       .L80328780
/*0x80328760*/  li      $v0, -0x0001
.L80328764:
/*0x80328764*/  lw      $t6, 0x0018($sp)
/*0x80328768*/  li      $at, 0xA0000000
/*0x8032876C*/  lw      $t9, 0x001C($sp)
/*0x80328770*/  or      $t7, $t6, $at
/*0x80328774*/  lw      $t8, 0x0000($t7)
/*0x80328778*/  move    $v0, $0
/*0x8032877C*/  sw      $t8, 0x0000($t9)
.L80328780:
/*0x80328780*/  lw      $ra, 0x0014($sp)
/*0x80328784*/  addiu   $sp, $sp, 0x0018
/*0x80328788*/  jr      $ra
/*0x8032878C*/  nop
