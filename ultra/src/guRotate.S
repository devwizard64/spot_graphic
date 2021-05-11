#include <ultra64.h>

.set noreorder
.set noat

/* 0x803256E0   void guRotateF(
    float mf[4][4],
    float a,
    float x,
    float y,
    float z
) */
.globl guRotateF
guRotateF:
/*0x803256E0*/  addiu   $sp, $sp, -0x0038
/*0x803256E4*/  lui     $at, %hi(ultra_rodata_80339870)
/*0x803256E8*/  lwc1    $f4, %lo(ultra_rodata_80339870)($at)
/*0x803256EC*/  sw      $s0, 0x0018($sp)
/*0x803256F0*/  move    $s0, $a0
/*0x803256F4*/  lui     $at, %hi(ultra_bss+0x2540)
/*0x803256F8*/  sw      $ra, 0x001C($sp)
/*0x803256FC*/  sw      $a1, 0x003C($sp)
/*0x80325700*/  sw      $a2, 0x0040($sp)
/*0x80325704*/  sw      $a3, 0x0044($sp)
/*0x80325708*/  addiu   $a2, $sp, 0x0048
/*0x8032570C*/  addiu   $a1, $sp, 0x0044
/*0x80325710*/  addiu   $a0, $sp, 0x0040
/*0x80325714*/  jal     guNormalize
/*0x80325718*/  swc1    $f4, %lo(ultra_bss+0x2540)($at)
/*0x8032571C*/  lui     $at, %hi(ultra_bss+0x2540)
/*0x80325720*/  lwc1    $f12, 0x003C($sp)
/*0x80325724*/  lwc1    $f6, %lo(ultra_bss+0x2540)($at)
/*0x80325728*/  mul.s   $f12, $f12, $f6
/*0x8032572C*/  jal     sinf
/*0x80325730*/  swc1    $f12, 0x003C($sp)
/*0x80325734*/  lwc1    $f12, 0x003C($sp)
/*0x80325738*/  jal     cosf
/*0x8032573C*/  swc1    $f0, 0x0034($sp)
/*0x80325740*/  lwc1    $f10, 0x0040($sp)
/*0x80325744*/  lwc1    $f4, 0x0044($sp)
/*0x80325748*/  li      $at, 0x3F800000
/*0x8032574C*/  mtc1    $at, $f8
/*0x80325750*/  mul.s   $f6, $f10, $f4
/*0x80325754*/  move    $a0, $s0
/*0x80325758*/  sub.s   $f2, $f8, $f0
/*0x8032575C*/  lwc1    $f8, 0x0048($sp)
/*0x80325760*/  swc1    $f0, 0x0030($sp)
/*0x80325764*/  mul.s   $f16, $f6, $f2
/*0x80325768*/  nop
/*0x8032576C*/  mul.s   $f6, $f4, $f8
/*0x80325770*/  swc1    $f16, 0x002C($sp)
/*0x80325774*/  mul.s   $f18, $f6, $f2
/*0x80325778*/  nop
/*0x8032577C*/  mul.s   $f4, $f8, $f10
/*0x80325780*/  swc1    $f18, 0x0028($sp)
/*0x80325784*/  mul.s   $f6, $f4, $f2
/*0x80325788*/  jal     guMtxIdentF
/*0x8032578C*/  swc1    $f6, 0x0024($sp)
/*0x80325790*/  lwc1    $f8, 0x0040($sp)
/*0x80325794*/  li      $at, 0x3F800000
/*0x80325798*/  mtc1    $at, $f10
/*0x8032579C*/  mul.s   $f0, $f8, $f8
/*0x803257A0*/  lwc1    $f12, 0x0030($sp)
/*0x803257A4*/  lwc1    $f14, 0x0034($sp)
/*0x803257A8*/  lwc1    $f16, 0x002C($sp)
/*0x803257AC*/  lwc1    $f18, 0x0028($sp)
/*0x803257B0*/  sub.s   $f4, $f10, $f0
/*0x803257B4*/  mul.s   $f6, $f4, $f12
/*0x803257B8*/  add.s   $f8, $f6, $f0
/*0x803257BC*/  swc1    $f8, 0x0000($s0)
/*0x803257C0*/  lwc1    $f10, 0x0040($sp)
/*0x803257C4*/  mul.s   $f4, $f10, $f14
/*0x803257C8*/  sub.s   $f6, $f18, $f4
/*0x803257CC*/  swc1    $f6, 0x0024($s0)
/*0x803257D0*/  lwc1    $f8, 0x0040($sp)
/*0x803257D4*/  mul.s   $f10, $f8, $f14
/*0x803257D8*/  mtc1    $at, $f8
/*0x803257DC*/  add.s   $f4, $f10, $f18
/*0x803257E0*/  swc1    $f4, 0x0018($s0)
/*0x803257E4*/  lwc1    $f6, 0x0044($sp)
/*0x803257E8*/  mul.s   $f2, $f6, $f6
/*0x803257EC*/  sub.s   $f10, $f8, $f2
/*0x803257F0*/  mul.s   $f4, $f10, $f12
/*0x803257F4*/  add.s   $f6, $f4, $f2
/*0x803257F8*/  swc1    $f6, 0x0014($s0)
/*0x803257FC*/  lwc1    $f8, 0x0044($sp)
/*0x80325800*/  lwc1    $f4, 0x0024($sp)
/*0x80325804*/  mul.s   $f10, $f8, $f14
/*0x80325808*/  add.s   $f6, $f10, $f4
/*0x8032580C*/  swc1    $f6, 0x0020($s0)
/*0x80325810*/  lwc1    $f10, 0x0044($sp)
/*0x80325814*/  lwc1    $f8, 0x0024($sp)
/*0x80325818*/  mul.s   $f4, $f10, $f14
/*0x8032581C*/  sub.s   $f6, $f8, $f4
/*0x80325820*/  mtc1    $at, $f8
/*0x80325824*/  swc1    $f6, 0x0008($s0)
/*0x80325828*/  lwc1    $f10, 0x0048($sp)
/*0x8032582C*/  mul.s   $f0, $f10, $f10
/*0x80325830*/  sub.s   $f4, $f8, $f0
/*0x80325834*/  mul.s   $f6, $f4, $f12
/*0x80325838*/  add.s   $f10, $f6, $f0
/*0x8032583C*/  swc1    $f10, 0x0028($s0)
/*0x80325840*/  lwc1    $f8, 0x0048($sp)
/*0x80325844*/  mul.s   $f4, $f8, $f14
/*0x80325848*/  sub.s   $f6, $f16, $f4
/*0x8032584C*/  swc1    $f6, 0x0010($s0)
/*0x80325850*/  lwc1    $f10, 0x0048($sp)
/*0x80325854*/  mul.s   $f8, $f10, $f14
/*0x80325858*/  add.s   $f4, $f8, $f16
/*0x8032585C*/  swc1    $f4, 0x0004($s0)
/*0x80325860*/  lw      $ra, 0x001C($sp)
/*0x80325864*/  lw      $s0, 0x0018($sp)
/*0x80325868*/  addiu   $sp, $sp, 0x0038
/*0x8032586C*/  jr      $ra
/*0x80325870*/  nop

/* 0x80325874   void guRotate(Mtx *m, float a, float x, float y, float z) */
.globl guRotate
guRotate:
/*0x80325874*/  mtc1    $a1, $f12
/*0x80325878*/  mtc1    $a2, $f14
/*0x8032587C*/  mtc1    $a3, $f16
/*0x80325880*/  addiu   $sp, $sp, -0x0060
/*0x80325884*/  lwc1    $f4, 0x0070($sp)
/*0x80325888*/  sw      $ra, 0x001C($sp)
/*0x8032588C*/  sw      $a0, 0x0060($sp)
/*0x80325890*/  mfc1    $a1, $f12
/*0x80325894*/  mfc1    $a2, $f14
/*0x80325898*/  mfc1    $a3, $f16
/*0x8032589C*/  addiu   $a0, $sp, 0x0020
/*0x803258A0*/  jal     guRotateF
/*0x803258A4*/  swc1    $f4, 0x0010($sp)
/*0x803258A8*/  addiu   $a0, $sp, 0x0020
/*0x803258AC*/  jal     guMtxF2L
/*0x803258B0*/  lw      $a1, 0x0060($sp)
/*0x803258B4*/  lw      $ra, 0x001C($sp)
/*0x803258B8*/  addiu   $sp, $sp, 0x0060
/*0x803258BC*/  jr      $ra
/*0x803258C0*/  nop
