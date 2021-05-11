#include <ultra64.h>

.set noreorder
.set noat

/* 0x80325970   void osAiSetFrequency(u32 frequency) */
.globl osAiSetFrequency
osAiSetFrequency:
/*0x80325970*/  lui     $t6, %hi(ultra_data_80335A2C)
/*0x80325974*/  lw      $t6, %lo(ultra_data_80335A2C)($t6)
/*0x80325978*/  mtc1    $a0, $f8
/*0x8032597C*/  addiu   $sp, $sp, -0x0010
/*0x80325980*/  mtc1    $t6, $f4
/*0x80325984*/  cvt.s.w $f10, $f8
/*0x80325988*/  bgez    $a0, .L803259A0
/*0x8032598C*/  cvt.s.w $f6, $f4
/*0x80325990*/  li      $at, 0x4F800000
/*0x80325994*/  mtc1    $at, $f16
/*0x80325998*/  nop
/*0x8032599C*/  add.s   $f10, $f10, $f16
.L803259A0:
/*0x803259A0*/  div.s   $f18, $f6, $f10
/*0x803259A4*/  li      $at, 0x3F000000
/*0x803259A8*/  mtc1    $at, $f4
/*0x803259AC*/  li      $a1, 0x0001
/*0x803259B0*/  add.s   $f12, $f18, $f4
/*0x803259B4*/  cfc1    $t7, $31
/*0x803259B8*/  ctc1    $a1, $31
/*0x803259BC*/  nop
/*0x803259C0*/  cvt.w.s $f8, $f12
/*0x803259C4*/  cfc1    $a1, $31
/*0x803259C8*/  nop
/*0x803259CC*/  andi    $at, $a1, 0x0004
/*0x803259D0*/  andi    $a1, $a1, 0x0078
/*0x803259D4*/  beqz    $a1, .L80325A24
/*0x803259D8*/  li      $at, 0x4F000000
/*0x803259DC*/  mtc1    $at, $f8
/*0x803259E0*/  li      $a1, 0x0001
/*0x803259E4*/  sub.s   $f8, $f12, $f8
/*0x803259E8*/  ctc1    $a1, $31
/*0x803259EC*/  nop
/*0x803259F0*/  cvt.w.s $f8, $f8
/*0x803259F4*/  cfc1    $a1, $31
/*0x803259F8*/  nop
/*0x803259FC*/  andi    $at, $a1, 0x0004
/*0x80325A00*/  andi    $a1, $a1, 0x0078
/*0x80325A04*/  bnez    $a1, .L80325A1C
/*0x80325A08*/  nop
/*0x80325A0C*/  mfc1    $a1, $f8
/*0x80325A10*/  li      $at, 0x80000000
/*0x80325A14*/  b       .L80325A34
/*0x80325A18*/  or      $a1, $a1, $at
.L80325A1C:
/*0x80325A1C*/  b       .L80325A34
/*0x80325A20*/  li      $a1, -0x0001
.L80325A24:
/*0x80325A24*/  mfc1    $a1, $f8
/*0x80325A28*/  nop
/*0x80325A2C*/  bltz    $a1, .L80325A1C
/*0x80325A30*/  nop
.L80325A34:
/*0x80325A34*/  ctc1    $t7, $31
/*0x80325A38*/  sltiu   $at, $a1, 0x0084
/*0x80325A3C*/  beqz    $at, .L80325A4C
/*0x80325A40*/  nop
/*0x80325A44*/  b       .L80325AC8
/*0x80325A48*/  li      $v0, -0x0001
.L80325A4C:
/*0x80325A4C*/  li      $at, 0x0042
/*0x80325A50*/  divu    $0, $a1, $at
/*0x80325A54*/  mflo    $a2
/*0x80325A58*/  andi    $t8, $a2, 0x00FF
/*0x80325A5C*/  move    $a2, $t8
/*0x80325A60*/  slti    $at, $a2, 0x0011
/*0x80325A64*/  bnez    $at, .L80325A70
/*0x80325A68*/  nop
/*0x80325A6C*/  li      $a2, 0x0010
.L80325A70:
/*0x80325A70*/  addiu   $t9, $a1, -0x0001
/*0x80325A74*/  lui     $t0, %hi(0xA4500010)
/*0x80325A78*/  sw      $t9, %lo(0xA4500010)($t0)
/*0x80325A7C*/  addiu   $t1, $a2, -0x0001
/*0x80325A80*/  lui     $t2, %hi(0xA4500014)
/*0x80325A84*/  sw      $t1, %lo(0xA4500014)($t2)
/*0x80325A88*/  li      $t3, 0x0001
/*0x80325A8C*/  lui     $t4, %hi(0xA4500008)
/*0x80325A90*/  sw      $t3, %lo(0xA4500008)($t4)
/*0x80325A94*/  lui     $t5, %hi(ultra_data_80335A2C)
/*0x80325A98*/  lw      $t5, %lo(ultra_data_80335A2C)($t5)
/*0x80325A9C*/  div     $0, $t5, $a1
/*0x80325AA0*/  mflo    $v0
/*0x80325AA4*/  bnez    $a1, .L80325AB0
/*0x80325AA8*/  nop
/*0x80325AAC*/  break   7
.L80325AB0:
/*0x80325AB0*/  li      $at, -0x0001
/*0x80325AB4*/  bne     $a1, $at, .L80325AC8
/*0x80325AB8*/  li      $at, 0x80000000
/*0x80325ABC*/  bne     $t5, $at, .L80325AC8
/*0x80325AC0*/  nop
/*0x80325AC4*/  break   6
.L80325AC8:
/*0x80325AC8*/  jr      $ra
/*0x80325ACC*/  addiu   $sp, $sp, 0x0010
