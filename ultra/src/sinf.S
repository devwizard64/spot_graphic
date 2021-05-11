#include <ultra64.h>

.set noreorder
.set noat

/* 0x80325480   float sinf(float angle) */
.globl sinf
sinf:
/*0x80325480*/  swc1    $f12, 0x0000($sp)
/*0x80325484*/  lw      $v0, 0x0000($sp)
/*0x80325488*/  lwc1    $f4, 0x0000($sp)
/*0x8032548C*/  sra     $v1, $v0, 22
/*0x80325490*/  andi    $t6, $v1, 0x01FF
/*0x80325494*/  slti    $at, $t6, 0x00FF
/*0x80325498*/  beqz    $at, .L80325500
/*0x8032549C*/  move    $v1, $t6
/*0x803254A0*/  slti    $at, $t6, 0x00E6
/*0x803254A4*/  bnez    $at, .L803254F8
/*0x803254A8*/  cvt.d.s $f2, $f4
/*0x803254AC*/  mul.d   $f12, $f2, $f2
/*0x803254B0*/  lui     $v1, %hi(ultra_rodata_80339820)
/*0x803254B4*/  addiu   $v1, $v1, %lo(ultra_rodata_80339820)
/*0x803254B8*/  ldc1    $f6, 0x0020($v1)
/*0x803254BC*/  ldc1    $f10, 0x0018($v1)
/*0x803254C0*/  ldc1    $f4, 0x0010($v1)
/*0x803254C4*/  mul.d   $f8, $f6, $f12
/*0x803254C8*/  add.d   $f16, $f8, $f10
/*0x803254CC*/  ldc1    $f10, 0x0008($v1)
/*0x803254D0*/  mul.d   $f18, $f16, $f12
/*0x803254D4*/  add.d   $f6, $f18, $f4
/*0x803254D8*/  mul.d   $f8, $f6, $f12
/*0x803254DC*/  add.d   $f14, $f10, $f8
/*0x803254E0*/  mul.d   $f16, $f2, $f12
/*0x803254E4*/  nop
/*0x803254E8*/  mul.d   $f18, $f16, $f14
/*0x803254EC*/  add.d   $f4, $f18, $f2
/*0x803254F0*/  jr      $ra
/*0x803254F4*/  cvt.s.d $f0, $f4
.L803254F8:
/*0x803254F8*/  jr      $ra
/*0x803254FC*/  lwc1    $f0, 0x0000($sp)
.L80325500:
/*0x80325500*/  slti    $at, $v1, 0x0136
/*0x80325504*/  beqz    $at, .L80325618
/*0x80325508*/  lwc1    $f4, 0x0000($sp)
/*0x8032550C*/  lwc1    $f6, 0x0000($sp)
/*0x80325510*/  lui     $at, %hi(ultra_rodata_80339848)
/*0x80325514*/  ldc1    $f10, %lo(ultra_rodata_80339848)($at)
/*0x80325518*/  cvt.d.s $f2, $f6
/*0x8032551C*/  mtc1    $0, $f9
/*0x80325520*/  mul.d   $f0, $f2, $f10
/*0x80325524*/  mtc1    $0, $f8
/*0x80325528*/  li      $at, 0x3FE00000
/*0x8032552C*/  c.le.d  $f8, $f0
/*0x80325530*/  nop
/*0x80325534*/  bc1fl   .L80325564
/*0x80325538*/  mtc1    $at, $f7
/*0x8032553C*/  li      $at, 0x3FE00000
/*0x80325540*/  mtc1    $at, $f17
/*0x80325544*/  mtc1    $0, $f16
/*0x80325548*/  nop
/*0x8032554C*/  add.d   $f18, $f0, $f16
/*0x80325550*/  trunc.w.d $f4, $f18
/*0x80325554*/  mfc1    $v0, $f4
/*0x80325558*/  b       .L80325580
/*0x8032555C*/  mtc1    $v0, $f16
/*0x80325560*/  mtc1    $at, $f7
.L80325564:
/*0x80325564*/  mtc1    $0, $f6
/*0x80325568*/  nop
/*0x8032556C*/  sub.d   $f10, $f0, $f6
/*0x80325570*/  trunc.w.d $f8, $f10
/*0x80325574*/  mfc1    $v0, $f8
/*0x80325578*/  nop
/*0x8032557C*/  mtc1    $v0, $f16
.L80325580:
/*0x80325580*/  lui     $at, %hi(ultra_rodata_80339850)
/*0x80325584*/  ldc1    $f18, %lo(ultra_rodata_80339850)($at)
/*0x80325588*/  cvt.d.w $f0, $f16
/*0x8032558C*/  lui     $at, %hi(ultra_rodata_80339858)
/*0x80325590*/  ldc1    $f6, %lo(ultra_rodata_80339858)($at)
/*0x80325594*/  lui     $v1, %hi(ultra_rodata_80339820)
/*0x80325598*/  addiu   $v1, $v1, %lo(ultra_rodata_80339820)
/*0x8032559C*/  mul.d   $f4, $f0, $f18
/*0x803255A0*/  ldc1    $f8, 0x0020($v1)
/*0x803255A4*/  ldc1    $f18, 0x0018($v1)
/*0x803255A8*/  andi    $t9, $v0, 0x0001
/*0x803255AC*/  mul.d   $f10, $f0, $f6
/*0x803255B0*/  sub.d   $f2, $f2, $f4
/*0x803255B4*/  sub.d   $f2, $f2, $f10
/*0x803255B8*/  ldc1    $f10, 0x0010($v1)
/*0x803255BC*/  mul.d   $f12, $f2, $f2
/*0x803255C0*/  nop
/*0x803255C4*/  mul.d   $f16, $f8, $f12
/*0x803255C8*/  add.d   $f4, $f16, $f18
/*0x803255CC*/  ldc1    $f18, 0x0008($v1)
/*0x803255D0*/  mul.d   $f6, $f4, $f12
/*0x803255D4*/  add.d   $f8, $f6, $f10
/*0x803255D8*/  mul.d   $f16, $f8, $f12
/*0x803255DC*/  bnez    $t9, .L803255FC
/*0x803255E0*/  add.d   $f14, $f18, $f16
/*0x803255E4*/  mul.d   $f4, $f2, $f12
/*0x803255E8*/  nop
/*0x803255EC*/  mul.d   $f6, $f4, $f14
/*0x803255F0*/  add.d   $f10, $f6, $f2
/*0x803255F4*/  jr      $ra
/*0x803255F8*/  cvt.s.d $f0, $f10
.L803255FC:
/*0x803255FC*/  mul.d   $f8, $f2, $f12
/*0x80325600*/  nop
/*0x80325604*/  mul.d   $f18, $f8, $f14
/*0x80325608*/  add.d   $f16, $f18, $f2
/*0x8032560C*/  cvt.s.d $f0, $f16
/*0x80325610*/  jr      $ra
/*0x80325614*/  neg.s   $f0, $f0
.L80325618:
/*0x80325618*/  c.eq.s  $f4, $f4
/*0x8032561C*/  lui     $at, %hi(ultra_rodata_80339860)
/*0x80325620*/  bc1t    .L80325634
/*0x80325624*/  nop
/*0x80325628*/  lui     $at, %hi(ultra_rodata_80339860)
/*0x8032562C*/  jr      $ra
/*0x80325630*/  lwc1    $f0, %lo(__libm_qnan_f)($at)
.L80325634:
/*0x80325634*/  lwc1    $f0, %lo(ultra_rodata_80339860)($at)
/*0x80325638*/  jr      $ra
/*0x8032563C*/  nop
