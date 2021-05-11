#include <ultra64.h>

.set noreorder
.set noat

/* 0x803237D0   void osInitialize(void) */
.globl osInitialize
osInitialize:
/*0x803237D0*/  addiu   $sp, $sp, -0x0038
/*0x803237D4*/  sw      $ra, 0x001C($sp)
/*0x803237D8*/  li      $t6, 0x0001
/*0x803237DC*/  lui     $at, %hi(ultra_bss+0x24A0)
/*0x803237E0*/  sw      $s0, 0x0018($sp)
/*0x803237E4*/  sw      $0, 0x0030($sp)
/*0x803237E8*/  jal     __osGetSR
/*0x803237EC*/  sw      $t6, %lo(ultra_bss+0x24A0)($at)
/*0x803237F0*/  move    $s0, $v0
/*0x803237F4*/  li      $at, 0x20000000
/*0x803237F8*/  jal     __osSetSR
/*0x803237FC*/  or      $a0, $s0, $at
/*0x80323800*/  lui     $a0, 0x01000800 >> 16
/*0x80323804*/  jal     __osSetFpcCsr
/*0x80323808*/  ori     $a0, $a0, 0x01000800 & 0xFFFF
/*0x8032380C*/  lui     $a0, 0x1FC007FC >> 16
/*0x80323810*/  ori     $a0, $a0, 0x1FC007FC & 0xFFFF
/*0x80323814*/  jal     __osSiRawReadIo
/*0x80323818*/  addiu   $a1, $sp, 0x0034
/*0x8032381C*/  beqz    $v0, .L8032383C
/*0x80323820*/  nop
.L80323824:
/*0x80323824*/  lui     $a0, 0x1FC007FC >> 16
/*0x80323828*/  ori     $a0, $a0, 0x1FC007FC & 0xFFFF
/*0x8032382C*/  jal     __osSiRawReadIo
/*0x80323830*/  addiu   $a1, $sp, 0x0034
/*0x80323834*/  bnez    $v0, .L80323824
/*0x80323838*/  nop
.L8032383C:
/*0x8032383C*/  lw      $a1, 0x0034($sp)
/*0x80323840*/  lui     $a0, 0x1FC007FC >> 16
/*0x80323844*/  ori     $a0, $a0, 0x1FC007FC & 0xFFFF
/*0x80323848*/  ori     $t7, $a1, 0x0008
/*0x8032384C*/  jal     __osSiRawWriteIo
/*0x80323850*/  move    $a1, $t7
/*0x80323854*/  beqz    $v0, .L8032387C
/*0x80323858*/  nop
.L8032385C:
/*0x8032385C*/  lw      $a1, 0x0034($sp)
/*0x80323860*/  lui     $a0, 0x1FC007FC >> 16
/*0x80323864*/  ori     $a0, $a0, 0x1FC007FC & 0xFFFF
/*0x80323868*/  ori     $t8, $a1, 0x0008
/*0x8032386C*/  jal     __osSiRawWriteIo
/*0x80323870*/  move    $a1, $t8
/*0x80323874*/  bnez    $v0, .L8032385C
/*0x80323878*/  nop
.L8032387C:
/*0x8032387C*/  lui     $t0, %hi(__osExceptionPreamble)
/*0x80323880*/  addiu   $t0, $t0, %lo(__osExceptionPreamble)
/*0x80323884*/  lw      $at, 0x0000($t0)
/*0x80323888*/  lui     $t9, %hi(0x8000000C)
/*0x8032388C*/  lui     $t5, %hi(__osExceptionPreamble)
/*0x80323890*/  sw      $at, %lo(0x80000000)($t9)
/*0x80323894*/  lw      $t3, 0x0004($t0)
/*0x80323898*/  addiu   $t5, $t5, %lo(__osExceptionPreamble)
/*0x8032389C*/  lui     $t4, 0x80000080 >> 16
/*0x803238A0*/  sw      $t3, %lo(0x80000004)($t9)
/*0x803238A4*/  lw      $at, 0x0008($t0)
/*0x803238A8*/  ori     $t4, $t4, 0x80000080 & 0xFFFF
/*0x803238AC*/  lui     $t1, %hi(__osExceptionPreamble)
/*0x803238B0*/  sw      $at, %lo(0x80000008)($t9)
/*0x803238B4*/  lw      $t3, 0x000C($t0)
/*0x803238B8*/  addiu   $t1, $t1, %lo(__osExceptionPreamble)
/*0x803238BC*/  lui     $t2, 0x80000100 >> 16
/*0x803238C0*/  sw      $t3, %lo(0x8000000C)($t9)
/*0x803238C4*/  lw      $at, 0x0000($t5)
/*0x803238C8*/  ori     $t2, $t2, 0x80000100 & 0xFFFF
/*0x803238CC*/  lui     $t6, %hi(__osExceptionPreamble)
/*0x803238D0*/  sw      $at, 0x0000($t4)
/*0x803238D4*/  lw      $t8, 0x0004($t5)
/*0x803238D8*/  addiu   $t6, $t6, %lo(__osExceptionPreamble)
/*0x803238DC*/  lui     $t7, 0x80000180 >> 16
/*0x803238E0*/  sw      $t8, 0x0004($t4)
/*0x803238E4*/  lw      $at, 0x0008($t5)
/*0x803238E8*/  ori     $t7, $t7, 0x80000180 & 0xFFFF
/*0x803238EC*/  li      $a0, 0x80000000
/*0x803238F0*/  sw      $at, 0x0008($t4)
/*0x803238F4*/  lw      $t8, 0x000C($t5)
/*0x803238F8*/  li      $a1, 0x0190
/*0x803238FC*/  sw      $t8, 0x000C($t4)
/*0x80323900*/  lw      $at, 0x0000($t1)
/*0x80323904*/  sw      $at, 0x0000($t2)
/*0x80323908*/  lw      $t3, 0x0004($t1)
/*0x8032390C*/  sw      $t3, 0x0004($t2)
/*0x80323910*/  lw      $at, 0x0008($t1)
/*0x80323914*/  sw      $at, 0x0008($t2)
/*0x80323918*/  lw      $t3, 0x000C($t1)
/*0x8032391C*/  sw      $t3, 0x000C($t2)
/*0x80323920*/  lw      $at, 0x0000($t6)
/*0x80323924*/  sw      $at, 0x0000($t7)
/*0x80323928*/  lw      $t8, 0x0004($t6)
/*0x8032392C*/  sw      $t8, 0x0004($t7)
/*0x80323930*/  lw      $at, 0x0008($t6)
/*0x80323934*/  sw      $at, 0x0008($t7)
/*0x80323938*/  lw      $t8, 0x000C($t6)
/*0x8032393C*/  jal     osWritebackDCache
/*0x80323940*/  sw      $t8, 0x000C($t7)
/*0x80323944*/  li      $a0, 0x80000000
/*0x80323948*/  jal     osInvalICache
/*0x8032394C*/  li      $a1, 0x0190
/*0x80323950*/  jal     osMapTLBRdb
/*0x80323954*/  nop
/*0x80323958*/  li      $a0, 0x0004
/*0x8032395C*/  jal     osPiRawReadIo
/*0x80323960*/  addiu   $a1, $sp, 0x0030
/*0x80323964*/  lw      $t0, 0x0030($sp)
/*0x80323968*/  li      $at, -0x0010
/*0x8032396C*/  and     $t9, $t0, $at
/*0x80323970*/  beqz    $t9, .L8032398C
/*0x80323974*/  sw      $t9, 0x0030($sp)
/*0x80323978*/  lui     $at, %hi(osClockRate+4)
/*0x8032397C*/  move    $t3, $t9
/*0x80323980*/  addiu   $t2, $0, 0x0000
/*0x80323984*/  sw      $t2, %lo(osClockRate+0)($at)
/*0x80323988*/  sw      $t3, %lo(osClockRate+4)($at)
.L8032398C:
/*0x8032398C*/  lui     $a0, %hi(osClockRate+0)
/*0x80323990*/  lui     $a1, %hi(osClockRate+4)
/*0x80323994*/  lw      $a1, %lo(osClockRate+4)($a1)
/*0x80323998*/  lw      $a0, %lo(osClockRate+0)($a0)
/*0x8032399C*/  addiu   $a2, $0, 0x0000
/*0x803239A0*/  jal     __ll_mul
/*0x803239A4*/  li      $a3, 0x0003
/*0x803239A8*/  sw      $v0, 0x0020($sp)
/*0x803239AC*/  sw      $v1, 0x0024($sp)
/*0x803239B0*/  lw      $a1, 0x0024($sp)
/*0x803239B4*/  lw      $a0, 0x0020($sp)
/*0x803239B8*/  addiu   $a2, $0, 0x0000
/*0x803239BC*/  jal     __ull_div
/*0x803239C0*/  li      $a3, 0x0004
/*0x803239C4*/  lui     $t1, %hi(osResetType)
/*0x803239C8*/  lw      $t1, %lo(osResetType)($t1)
/*0x803239CC*/  lui     $at, %hi(osClockRate+4)
/*0x803239D0*/  sw      $v0, %lo(osClockRate+0)($at)
/*0x803239D4*/  bnez    $t1, .L803239EC
/*0x803239D8*/  sw      $v1, %lo(osClockRate+4)($at)
/*0x803239DC*/  lui     $a0, %hi(osAppNMIBuffer)
/*0x803239E0*/  addiu   $a0, $a0, %lo(osAppNMIBuffer)
/*0x803239E4*/  jal     bzero
/*0x803239E8*/  li      $a1, 0x0040
.L803239EC:
/*0x803239EC*/  lw      $ra, 0x001C($sp)
/*0x803239F0*/  lw      $s0, 0x0018($sp)
/*0x803239F4*/  addiu   $sp, $sp, 0x0038
/*0x803239F8*/  jr      $ra
/*0x803239FC*/  nop
