#include <ultra64.h>

.set noreorder
.set noat

/* 0x803284B0 */
.globl osPiRawStartDma
osPiRawStartDma:
/*0x803284B0*/  addiu   $sp, $sp, -0x0028
/*0x803284B4*/  sw      $ra, 0x001C($sp)
/*0x803284B8*/  sw      $a0, 0x0028($sp)
/*0x803284BC*/  sw      $a1, 0x002C($sp)
/*0x803284C0*/  sw      $a2, 0x0030($sp)
/*0x803284C4*/  sw      $a3, 0x0034($sp)
/*0x803284C8*/  sw      $s1, 0x0018($sp)
/*0x803284CC*/  sw      $s0, 0x0014($sp)
/*0x803284D0*/  lui     $t6, %hi(0xA4600010)
/*0x803284D4*/  lw      $s0, %lo(0xA4600010)($t6)
/*0x803284D8*/  andi    $t7, $s0, 0x0003
/*0x803284DC*/  beqz    $t7, .L803284F8
/*0x803284E0*/  nop
.L803284E4:
/*0x803284E4*/  lui     $t8, %hi(0xA4600010)
/*0x803284E8*/  lw      $s0, %lo(0xA4600010)($t8)
/*0x803284EC*/  andi    $t9, $s0, 0x0003
/*0x803284F0*/  bnez    $t9, .L803284E4
/*0x803284F4*/  nop
.L803284F8:
/*0x803284F8*/  jal     osVirtualToPhysical
/*0x803284FC*/  lw      $a0, 0x0030($sp)
/*0x80328500*/  lui     $t0, %hi(0xA4600000)
/*0x80328504*/  sw      $v0, %lo(0xA4600000)($t0)
/*0x80328508*/  lui     $t1, %hi(osRomBase)
/*0x8032850C*/  lw      $t1, %lo(osRomBase)($t1)
/*0x80328510*/  lw      $t2, 0x002C($sp)
/*0x80328514*/  lui     $at, 0x1FFFFFFF >> 16
/*0x80328518*/  ori     $at, $at, 0x1FFFFFFF & 0xFFFF
/*0x8032851C*/  or      $t3, $t1, $t2
/*0x80328520*/  and     $t4, $t3, $at
/*0x80328524*/  lui     $t5, %hi(0xA4600004)
/*0x80328528*/  sw      $t4, %lo(0xA4600004)($t5)
/*0x8032852C*/  lw      $s1, 0x0028($sp)
/*0x80328530*/  beqz    $s1, .L80328548
/*0x80328534*/  li      $at, 0x0001
/*0x80328538*/  beq     $s1, $at, .L8032855C
/*0x8032853C*/  nop
/*0x80328540*/  b       .L80328570
/*0x80328544*/  nop
.L80328548:
/*0x80328548*/  lw      $t6, 0x0034($sp)
/*0x8032854C*/  lui     $t8, %hi(0xA460000C)
/*0x80328550*/  addiu   $t7, $t6, -0x0001
/*0x80328554*/  b       .L80328578
/*0x80328558*/  sw      $t7, %lo(0xA460000C)($t8)
.L8032855C:
/*0x8032855C*/  lw      $t9, 0x0034($sp)
/*0x80328560*/  lui     $t1, %hi(0xA4600008)
/*0x80328564*/  addiu   $t0, $t9, -0x0001
/*0x80328568*/  b       .L80328578
/*0x8032856C*/  sw      $t0, %lo(0xA4600008)($t1)
.L80328570:
/*0x80328570*/  b       .L8032857C
/*0x80328574*/  li      $v0, -0x0001
.L80328578:
/*0x80328578*/  move    $v0, $0
.L8032857C:
/*0x8032857C*/  lw      $ra, 0x001C($sp)
/*0x80328580*/  lw      $s0, 0x0014($sp)
/*0x80328584*/  lw      $s1, 0x0018($sp)
/*0x80328588*/  jr      $ra
/*0x8032858C*/  addiu   $sp, $sp, 0x0028
