#include <ultra64.h>

.set noreorder
.set noat

/* 0x80328840   s32 osPiRawReadIo(u32 devAddr, u32 *data) */
.globl osPiRawReadIo
osPiRawReadIo:
/*0x80328840*/  lui     $t6, %hi(0xA4600010)
/*0x80328844*/  lw      $a2, %lo(0xA4600010)($t6)
/*0x80328848*/  addiu   $sp, $sp, -0x0008
/*0x8032884C*/  andi    $t7, $a2, 0x0003
/*0x80328850*/  beqz    $t7, .L8032886C
/*0x80328854*/  nop
.L80328858:
/*0x80328858*/  lui     $t8, %hi(0xA4600010)
/*0x8032885C*/  lw      $a2, %lo(0xA4600010)($t8)
/*0x80328860*/  andi    $t9, $a2, 0x0003
/*0x80328864*/  bnez    $t9, .L80328858
/*0x80328868*/  nop
.L8032886C:
/*0x8032886C*/  lui     $t0, %hi(osRomBase)
/*0x80328870*/  lw      $t0, %lo(osRomBase)($t0)
/*0x80328874*/  li      $at, 0xA0000000
/*0x80328878*/  move    $v0, $0
/*0x8032887C*/  or      $t1, $t0, $a0
/*0x80328880*/  or      $t2, $t1, $at
/*0x80328884*/  lw      $t3, 0x0000($t2)
/*0x80328888*/  addiu   $sp, $sp, 0x0008
/*0x8032888C*/  jr      $ra
/*0x80328890*/  sw      $t3, 0x0000($a1)
