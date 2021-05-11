#include <ultra64.h>

.set noreorder
.set noat

/* 0x8032AE10   OSIntMask osSetIntMask(OSIntMask im) */
.globl osSetIntMask
osSetIntMask:
/*0x8032AE10*/  mfc0    $t1, C0_SR
/*0x8032AE14*/  andi    $v0, $t1, 0xFF01
/*0x8032AE18*/  lui     $t2, %hi(0xA430000C)
/*0x8032AE1C*/  lw      $t2, %lo(0xA430000C)($t2)
/*0x8032AE20*/  sll     $t2, $t2, 16
/*0x8032AE24*/  or      $v0, $v0, $t2
/*0x8032AE28*/  li      $at, 0x003F0000
/*0x8032AE2C*/  and     $t0, $a0, $at
/*0x8032AE30*/  srl     $t0, $t0, 15
/*0x8032AE34*/  lui     $t2, %hi(__osRcpImTable)
/*0x8032AE38*/  addu    $t2, $t2, $t0
/*0x8032AE3C*/  lhu     $t2, %lo(__osRcpImTable)($t2)
/*0x8032AE40*/  lui     $at, %hi(0xA430000C)
/*0x8032AE44*/  sw      $t2, %lo(0xA430000C)($at)
/*0x8032AE48*/  andi    $t0, $a0, 0xFF01
/*0x8032AE4C*/  lui     $at, 0xFFFF00FF >> 16
/*0x8032AE50*/  ori     $at, $at, 0xFFFF00FF & 0xFFFF
/*0x8032AE54*/  and     $t1, $t1, $at
/*0x8032AE58*/  or      $t1, $t1, $t0
/*0x8032AE5C*/  mtc0    $t1, C0_SR
/*0x8032AE60*/  nop
/*0x8032AE64*/  nop
/*0x8032AE68*/  jr      $ra
/*0x8032AE6C*/  nop
