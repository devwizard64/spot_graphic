#include <ultra64.h>

.set noreorder
.set noat

/* 0x80328960 */
.globl __osSiRawStartDma
__osSiRawStartDma:
/*0x80328960*/  addiu   $sp, $sp, -0x0018
/*0x80328964*/  sw      $ra, 0x0014($sp)
/*0x80328968*/  sw      $a0, 0x0018($sp)
/*0x8032896C*/  jal     __osSiDeviceBusy
/*0x80328970*/  sw      $a1, 0x001C($sp)
/*0x80328974*/  beqz    $v0, .L80328984
/*0x80328978*/  nop
/*0x8032897C*/  b       .L803289FC
/*0x80328980*/  li      $v0, -0x0001
.L80328984:
/*0x80328984*/  lw      $t6, 0x0018($sp)
/*0x80328988*/  li      $at, 0x0001
/*0x8032898C*/  bne     $t6, $at, .L803289A0
/*0x80328990*/  nop
/*0x80328994*/  lw      $a0, 0x001C($sp)
/*0x80328998*/  jal     osWritebackDCache
/*0x8032899C*/  li      $a1, 0x0040
.L803289A0:
/*0x803289A0*/  jal     osVirtualToPhysical
/*0x803289A4*/  lw      $a0, 0x001C($sp)
/*0x803289A8*/  lui     $t7, %hi(0xA4800000)
/*0x803289AC*/  sw      $v0, %lo(0xA4800000)($t7)
/*0x803289B0*/  lw      $t8, 0x0018($sp)
/*0x803289B4*/  bnez    $t8, .L803289D0
/*0x803289B8*/  nop
/*0x803289BC*/  lui     $t9, 0x1FC007C0 >> 16
/*0x803289C0*/  ori     $t9, $t9, 0x1FC007C0 & 0xFFFF
/*0x803289C4*/  lui     $t0, %hi(0xA4800004)
/*0x803289C8*/  b       .L803289E0
/*0x803289CC*/  sw      $t9, %lo(0xA4800004)($t0)
.L803289D0:
/*0x803289D0*/  lui     $t1, 0x1FC007C0 >> 16
/*0x803289D4*/  ori     $t1, $t1, 0x1FC007C0 & 0xFFFF
/*0x803289D8*/  lui     $t2, %hi(0xA4800010)
/*0x803289DC*/  sw      $t1, %lo(0xA4800010)($t2)
.L803289E0:
/*0x803289E0*/  lw      $t3, 0x0018($sp)
/*0x803289E4*/  bnez    $t3, .L803289F8
/*0x803289E8*/  nop
/*0x803289EC*/  lw      $a0, 0x001C($sp)
/*0x803289F0*/  jal     osInvalDCache
/*0x803289F4*/  li      $a1, 0x0040
.L803289F8:
/*0x803289F8*/  move    $v0, $0
.L803289FC:
/*0x803289FC*/  lw      $ra, 0x0014($sp)
/*0x80328A00*/  addiu   $sp, $sp, 0x0018
/*0x80328A04*/  jr      $ra
/*0x80328A08*/  nop
