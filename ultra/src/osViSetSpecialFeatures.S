#include <ultra64.h>

.set noreorder
.set noat

/* 0x803233B0   void osViSetSpecialFeatures(u, 3, 2,  , f, u, n, c) */
.globl osViSetSpecialFeatures
osViSetSpecialFeatures:
/*0x803233B0*/  addiu   $sp, $sp, -0x0028
/*0x803233B4*/  sw      $ra, 0x001C($sp)
/*0x803233B8*/  sw      $a0, 0x0028($sp)
/*0x803233BC*/  jal     __osDisableInt
/*0x803233C0*/  sw      $s0, 0x0018($sp)
/*0x803233C4*/  lw      $t6, 0x0028($sp)
/*0x803233C8*/  move    $s0, $v0
/*0x803233CC*/  andi    $t7, $t6, 0x0001
/*0x803233D0*/  beqz    $t7, .L803233EC
/*0x803233D4*/  nop
/*0x803233D8*/  lui     $t8, %hi(__osViNext)
/*0x803233DC*/  lw      $t8, %lo(__osViNext)($t8)
/*0x803233E0*/  lw      $t9, 0x000C($t8)
/*0x803233E4*/  ori     $t0, $t9, 0x0008
/*0x803233E8*/  sw      $t0, 0x000C($t8)
.L803233EC:
/*0x803233EC*/  lw      $t1, 0x0028($sp)
/*0x803233F0*/  andi    $t2, $t1, 0x0002
/*0x803233F4*/  beqz    $t2, .L80323414
/*0x803233F8*/  nop
/*0x803233FC*/  lui     $t3, %hi(__osViNext)
/*0x80323400*/  lw      $t3, %lo(__osViNext)($t3)
/*0x80323404*/  li      $at, -0x0009
/*0x80323408*/  lw      $t4, 0x000C($t3)
/*0x8032340C*/  and     $t5, $t4, $at
/*0x80323410*/  sw      $t5, 0x000C($t3)
.L80323414:
/*0x80323414*/  lw      $t6, 0x0028($sp)
/*0x80323418*/  andi    $t7, $t6, 0x0004
/*0x8032341C*/  beqz    $t7, .L80323438
/*0x80323420*/  nop
/*0x80323424*/  lui     $t9, %hi(__osViNext)
/*0x80323428*/  lw      $t9, %lo(__osViNext)($t9)
/*0x8032342C*/  lw      $t0, 0x000C($t9)
/*0x80323430*/  ori     $t8, $t0, 0x0004
/*0x80323434*/  sw      $t8, 0x000C($t9)
.L80323438:
/*0x80323438*/  lw      $t1, 0x0028($sp)
/*0x8032343C*/  andi    $t2, $t1, 0x0008
/*0x80323440*/  beqz    $t2, .L80323460
/*0x80323444*/  nop
/*0x80323448*/  lui     $t4, %hi(__osViNext)
/*0x8032344C*/  lw      $t4, %lo(__osViNext)($t4)
/*0x80323450*/  li      $at, -0x0005
/*0x80323454*/  lw      $t5, 0x000C($t4)
/*0x80323458*/  and     $t3, $t5, $at
/*0x8032345C*/  sw      $t3, 0x000C($t4)
.L80323460:
/*0x80323460*/  lw      $t6, 0x0028($sp)
/*0x80323464*/  andi    $t7, $t6, 0x0010
/*0x80323468*/  beqz    $t7, .L80323484
/*0x8032346C*/  nop
/*0x80323470*/  lui     $t0, %hi(__osViNext)
/*0x80323474*/  lw      $t0, %lo(__osViNext)($t0)
/*0x80323478*/  lw      $t8, 0x000C($t0)
/*0x8032347C*/  ori     $t9, $t8, 0x0010
/*0x80323480*/  sw      $t9, 0x000C($t0)
.L80323484:
/*0x80323484*/  lw      $t1, 0x0028($sp)
/*0x80323488*/  andi    $t2, $t1, 0x0020
/*0x8032348C*/  beqz    $t2, .L803234AC
/*0x80323490*/  nop
/*0x80323494*/  lui     $t5, %hi(__osViNext)
/*0x80323498*/  lw      $t5, %lo(__osViNext)($t5)
/*0x8032349C*/  li      $at, -0x0011
/*0x803234A0*/  lw      $t3, 0x000C($t5)
/*0x803234A4*/  and     $t4, $t3, $at
/*0x803234A8*/  sw      $t4, 0x000C($t5)
.L803234AC:
/*0x803234AC*/  lw      $t6, 0x0028($sp)
/*0x803234B0*/  andi    $t7, $t6, 0x0040
/*0x803234B4*/  beqz    $t7, .L803234EC
/*0x803234B8*/  nop
/*0x803234BC*/  lui     $t8, %hi(__osViNext)
/*0x803234C0*/  lw      $t8, %lo(__osViNext)($t8)
/*0x803234C4*/  li      $at, 0x00010000
/*0x803234C8*/  lui     $t1, %hi(__osViNext)
/*0x803234CC*/  lw      $t9, 0x000C($t8)
/*0x803234D0*/  or      $t0, $t9, $at
/*0x803234D4*/  sw      $t0, 0x000C($t8)
/*0x803234D8*/  lw      $t1, %lo(__osViNext)($t1)
/*0x803234DC*/  li      $at, -0x0301
/*0x803234E0*/  lw      $t2, 0x000C($t1)
/*0x803234E4*/  and     $t3, $t2, $at
/*0x803234E8*/  sw      $t3, 0x000C($t1)
.L803234EC:
/*0x803234EC*/  lw      $t4, 0x0028($sp)
/*0x803234F0*/  andi    $t5, $t4, 0x0080
/*0x803234F4*/  beqz    $t5, .L80323538
/*0x803234F8*/  nop
/*0x803234FC*/  lui     $t6, %hi(__osViNext)
/*0x80323500*/  lw      $t6, %lo(__osViNext)($t6)
/*0x80323504*/  lui     $at, 0xFFFEFFFF >> 16
/*0x80323508*/  ori     $at, $at, 0xFFFEFFFF & 0xFFFF
/*0x8032350C*/  lw      $t7, 0x000C($t6)
/*0x80323510*/  lui     $t0, %hi(__osViNext)
/*0x80323514*/  and     $t9, $t7, $at
/*0x80323518*/  sw      $t9, 0x000C($t6)
/*0x8032351C*/  lw      $t0, %lo(__osViNext)($t0)
/*0x80323520*/  lw      $t2, 0x0008($t0)
/*0x80323524*/  lw      $t8, 0x000C($t0)
/*0x80323528*/  lw      $t3, 0x0004($t2)
/*0x8032352C*/  andi    $t1, $t3, 0x0300
/*0x80323530*/  or      $t4, $t8, $t1
/*0x80323534*/  sw      $t4, 0x000C($t0)
.L80323538:
/*0x80323538*/  lui     $t5, %hi(__osViNext)
/*0x8032353C*/  lw      $t5, %lo(__osViNext)($t5)
/*0x80323540*/  move    $a0, $s0
/*0x80323544*/  lhu     $t7, 0x0000($t5)
/*0x80323548*/  ori     $t9, $t7, 0x0008
/*0x8032354C*/  jal     __osRestoreInt
/*0x80323550*/  sh      $t9, 0x0000($t5)
/*0x80323554*/  lw      $ra, 0x001C($sp)
/*0x80323558*/  lw      $s0, 0x0018($sp)
/*0x8032355C*/  addiu   $sp, $sp, 0x0028
/*0x80323560*/  jr      $ra
/*0x80323564*/  nop
