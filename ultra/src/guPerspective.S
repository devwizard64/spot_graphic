#include <ultra64.h>

.set noreorder
.set noat

/* 0x80324DE0   void guPerspectiveF(
    float mf[4][4],
    u16 *perspNorm,
    float fovy,
    float aspect,
    float near,
    float far,
    float scale
) */
.globl guPerspectiveF
guPerspectiveF:
/*0x80324DE0*/  addiu   $sp, $sp, -0x0030
/*0x80324DE4*/  mtc1    $a2, $f14
/*0x80324DE8*/  sw      $ra, 0x0014($sp)
/*0x80324DEC*/  sw      $a3, 0x003C($sp)
/*0x80324DF0*/  sw      $a0, 0x0030($sp)
/*0x80324DF4*/  sw      $a1, 0x0034($sp)
/*0x80324DF8*/  jal     guMtxIdentF
/*0x80324DFC*/  swc1    $f14, 0x0038($sp)
/*0x80324E00*/  lwc1    $f14, 0x0038($sp)
/*0x80324E04*/  lui     $at, %hi(ultra_rodata_803397B0)
/*0x80324E08*/  ldc1    $f6, %lo(ultra_rodata_803397B0)($at)
/*0x80324E0C*/  cvt.d.s $f4, $f14
/*0x80324E10*/  li      $at, 0x40000000
/*0x80324E14*/  mul.d   $f8, $f4, $f6
/*0x80324E18*/  mtc1    $at, $f10
/*0x80324E1C*/  cvt.s.d $f14, $f8
/*0x80324E20*/  div.s   $f12, $f14, $f10
/*0x80324E24*/  jal     cosf
/*0x80324E28*/  swc1    $f12, 0x001C($sp)
/*0x80324E2C*/  lwc1    $f12, 0x001C($sp)
/*0x80324E30*/  jal     sinf
/*0x80324E34*/  swc1    $f0, 0x0020($sp)
/*0x80324E38*/  lwc1    $f4, 0x0020($sp)
/*0x80324E3C*/  lwc1    $f6, 0x003C($sp)
/*0x80324E40*/  lwc1    $f14, 0x0040($sp)
/*0x80324E44*/  div.s   $f2, $f4, $f0
/*0x80324E48*/  lwc1    $f16, 0x0044($sp)
/*0x80324E4C*/  li      $at, 0xBF800000
/*0x80324E50*/  mtc1    $at, $f4
/*0x80324E54*/  add.s   $f18, $f14, $f16
/*0x80324E58*/  lw      $v0, 0x0030($sp)
/*0x80324E5C*/  li      $at, 0x40000000
/*0x80324E60*/  sub.s   $f12, $f14, $f16
/*0x80324E64*/  lw      $a1, 0x0034($sp)
/*0x80324E68*/  swc1    $f4, 0x002C($v0)
/*0x80324E6C*/  move    $v1, $0
/*0x80324E70*/  li      $a0, 0x0004
/*0x80324E74*/  div.s   $f10, $f18, $f12
/*0x80324E78*/  swc1    $f2, 0x0014($v0)
/*0x80324E7C*/  div.s   $f8, $f2, $f6
/*0x80324E80*/  mtc1    $at, $f6
/*0x80324E84*/  swc1    $f10, 0x0028($v0)
/*0x80324E88*/  swc1    $f8, 0x0000($v0)
/*0x80324E8C*/  mul.s   $f8, $f6, $f14
/*0x80324E90*/  mtc1    $0, $f6
/*0x80324E94*/  nop
/*0x80324E98*/  swc1    $f6, 0x003C($v0)
/*0x80324E9C*/  mul.s   $f10, $f8, $f16
/*0x80324EA0*/  div.s   $f4, $f10, $f12
/*0x80324EA4*/  swc1    $f4, 0x0038($v0)
/*0x80324EA8*/  lwc1    $f0, 0x0048($sp)
/*0x80324EAC*/  lwc1    $f6, 0x0000($v0)
/*0x80324EB0*/  addiu   $v1, $v1, 0x0001
/*0x80324EB4*/  lwc1    $f16, 0x0004($v0)
/*0x80324EB8*/  mul.s   $f10, $f6, $f0
/*0x80324EBC*/  lwc1    $f12, 0x0008($v0)
/*0x80324EC0*/  beq     $v1, $a0, .L80324F04
/*0x80324EC4*/  lwc1    $f14, 0x000C($v0)
.L80324EC8:
/*0x80324EC8*/  mul.s   $f8, $f16, $f0
/*0x80324ECC*/  lwc1    $f6, 0x0010($v0)
/*0x80324ED0*/  lwc1    $f16, 0x0014($v0)
/*0x80324ED4*/  mul.s   $f4, $f12, $f0
/*0x80324ED8*/  lwc1    $f12, 0x0018($v0)
/*0x80324EDC*/  addiu   $v1, $v1, 0x0001
/*0x80324EE0*/  mul.s   $f2, $f14, $f0
/*0x80324EE4*/  lwc1    $f14, 0x001C($v0)
/*0x80324EE8*/  swc1    $f10, 0x0000($v0)
/*0x80324EEC*/  mul.s   $f10, $f6, $f0
/*0x80324EF0*/  swc1    $f8, 0x0004($v0)
/*0x80324EF4*/  swc1    $f4, 0x0008($v0)
/*0x80324EF8*/  addiu   $v0, $v0, 0x0010
/*0x80324EFC*/  bne     $v1, $a0, .L80324EC8
/*0x80324F00*/  swc1    $f2, -0x0004($v0)
.L80324F04:
/*0x80324F04*/  mul.s   $f8, $f16, $f0
/*0x80324F08*/  addiu   $v0, $v0, 0x0010
/*0x80324F0C*/  swc1    $f10, -0x0010($v0)
/*0x80324F10*/  mul.s   $f4, $f12, $f0
/*0x80324F14*/  nop
/*0x80324F18*/  mul.s   $f2, $f14, $f0
/*0x80324F1C*/  swc1    $f8, -0x000C($v0)
/*0x80324F20*/  swc1    $f4, -0x0008($v0)
/*0x80324F24*/  swc1    $f2, -0x0004($v0)
/*0x80324F28*/  beqz    $a1, .L80325000
/*0x80324F2C*/  li      $at, 0x40000000
/*0x80324F30*/  mtc1    $at, $f9
/*0x80324F34*/  mtc1    $0, $f8
/*0x80324F38*/  cvt.d.s $f0, $f18
/*0x80324F3C*/  li      $t6, 0xFFFF
/*0x80324F40*/  c.le.d  $f0, $f8
/*0x80324F44*/  li      $at, 0x41000000
/*0x80324F48*/  bc1fl   .L80324F5C
/*0x80324F4C*/  mtc1    $at, $f11
/*0x80324F50*/  b       .L80325000
/*0x80324F54*/  sh      $t6, 0x0000($a1)
/*0x80324F58*/  mtc1    $at, $f11
.L80324F5C:
/*0x80324F5C*/  mtc1    $0, $f10
/*0x80324F60*/  li      $t8, 0x0001
/*0x80324F64*/  li      $at, 0x41E00000
/*0x80324F68*/  div.d   $f4, $f10, $f0
/*0x80324F6C*/  li      $t0, 0x0001
/*0x80324F70*/  cfc1    $t7, $31
/*0x80324F74*/  ctc1    $t8, $31
/*0x80324F78*/  nop
/*0x80324F7C*/  cvt.w.d $f6, $f4
/*0x80324F80*/  cfc1    $t8, $31
/*0x80324F84*/  nop
/*0x80324F88*/  andi    $t8, $t8, 0x0078
/*0x80324F8C*/  beqzl   $t8, .L80324FE0
/*0x80324F90*/  mfc1    $t8, $f6
/*0x80324F94*/  mtc1    $at, $f7
/*0x80324F98*/  mtc1    $0, $f6
/*0x80324F9C*/  li      $t8, 0x0001
/*0x80324FA0*/  sub.d   $f6, $f4, $f6
/*0x80324FA4*/  ctc1    $t8, $31
/*0x80324FA8*/  nop
/*0x80324FAC*/  cvt.w.d $f6, $f6
/*0x80324FB0*/  cfc1    $t8, $31
/*0x80324FB4*/  nop
/*0x80324FB8*/  andi    $t8, $t8, 0x0078
/*0x80324FBC*/  bnez    $t8, .L80324FD4
/*0x80324FC0*/  nop
/*0x80324FC4*/  mfc1    $t8, $f6
/*0x80324FC8*/  li      $at, 0x80000000
/*0x80324FCC*/  b       .L80324FEC
/*0x80324FD0*/  or      $t8, $t8, $at
.L80324FD4:
/*0x80324FD4*/  b       .L80324FEC
/*0x80324FD8*/  li      $t8, -0x0001
/*0x80324FDC*/  mfc1    $t8, $f6
.L80324FE0:
/*0x80324FE0*/  nop
/*0x80324FE4*/  bltz    $t8, .L80324FD4
/*0x80324FE8*/  nop
.L80324FEC:
/*0x80324FEC*/  ctc1    $t7, $31
/*0x80324FF0*/  andi    $t9, $t8, 0xFFFF
/*0x80324FF4*/  bgtz    $t9, .L80325000
/*0x80324FF8*/  sh      $t8, 0x0000($a1)
/*0x80324FFC*/  sh      $t0, 0x0000($a1)
.L80325000:
/*0x80325000*/  lw      $ra, 0x0014($sp)
/*0x80325004*/  addiu   $sp, $sp, 0x0030
/*0x80325008*/  jr      $ra
/*0x8032500C*/  nop

/* 0x80325010   void guPerspective(
    Mtx *m,
    u16 *perspNorm,
    float fovy,
    float aspect,
    float near,
    float far,
    float scale
) */
.globl guPerspective
guPerspective:
/*0x80325010*/  addiu   $sp, $sp, -0x0068
/*0x80325014*/  mtc1    $a2, $f12
/*0x80325018*/  mtc1    $a3, $f14
/*0x8032501C*/  lwc1    $f4, 0x0078($sp)
/*0x80325020*/  lwc1    $f6, 0x007C($sp)
/*0x80325024*/  lwc1    $f8, 0x0080($sp)
/*0x80325028*/  sw      $ra, 0x0024($sp)
/*0x8032502C*/  sw      $a0, 0x0068($sp)
/*0x80325030*/  mfc1    $a2, $f12
/*0x80325034*/  mfc1    $a3, $f14
/*0x80325038*/  addiu   $a0, $sp, 0x0028
/*0x8032503C*/  swc1    $f4, 0x0010($sp)
/*0x80325040*/  swc1    $f6, 0x0014($sp)
/*0x80325044*/  jal     guPerspectiveF
/*0x80325048*/  swc1    $f8, 0x0018($sp)
/*0x8032504C*/  addiu   $a0, $sp, 0x0028
/*0x80325050*/  jal     guMtxF2L
/*0x80325054*/  lw      $a1, 0x0068($sp)
/*0x80325058*/  lw      $ra, 0x0024($sp)
/*0x8032505C*/  addiu   $sp, $sp, 0x0068
/*0x80325060*/  jr      $ra
/*0x80325064*/  nop
