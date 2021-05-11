#include <ultra64.h>

.set noreorder
.set noat

/* 0x80323340   void osViBlack(u, 8,  , a, c, t, i, v, e) */
.globl osViBlack
osViBlack:
/*0x80323340*/  addiu   $sp, $sp, -0x0028
/*0x80323344*/  sw      $ra, 0x001C($sp)
/*0x80323348*/  sw      $a0, 0x0028($sp)
/*0x8032334C*/  jal     __osDisableInt
/*0x80323350*/  sw      $s0, 0x0018($sp)
/*0x80323354*/  lbu     $t6, 0x002B($sp)
/*0x80323358*/  move    $s0, $v0
/*0x8032335C*/  beqz    $t6, .L8032337C
/*0x80323360*/  nop
/*0x80323364*/  lui     $t7, %hi(__osViNext)
/*0x80323368*/  lw      $t7, %lo(__osViNext)($t7)
/*0x8032336C*/  lhu     $t8, 0x0000($t7)
/*0x80323370*/  ori     $t9, $t8, 0x0020
/*0x80323374*/  b       .L80323394
/*0x80323378*/  sh      $t9, 0x0000($t7)
.L8032337C:
/*0x8032337C*/  lui     $t0, %hi(__osViNext)
/*0x80323380*/  lw      $t0, %lo(__osViNext)($t0)
/*0x80323384*/  li      $at, -0x0021
/*0x80323388*/  lhu     $t1, 0x0000($t0)
/*0x8032338C*/  and     $t2, $t1, $at
/*0x80323390*/  sh      $t2, 0x0000($t0)
.L80323394:
/*0x80323394*/  jal     __osRestoreInt
/*0x80323398*/  move    $a0, $s0
/*0x8032339C*/  lw      $ra, 0x001C($sp)
/*0x803233A0*/  lw      $s0, 0x0018($sp)
/*0x803233A4*/  addiu   $sp, $sp, 0x0028
/*0x803233A8*/  jr      $ra
/*0x803233AC*/  nop
