#include <ultra64.h>

.set noreorder
.set noat

/* 0x80324C20   void guOrthoF(
    float mf[4][4],
    float l,
    float r,
    float b,
    float t,
    float n,
    float f,
    float scale
) */
.globl guOrthoF
guOrthoF:
/*0x80324C20*/  addiu   $sp, $sp, -0x0018
/*0x80324C24*/  sw      $ra, 0x0014($sp)
/*0x80324C28*/  sw      $a1, 0x001C($sp)
/*0x80324C2C*/  sw      $a2, 0x0020($sp)
/*0x80324C30*/  sw      $a3, 0x0024($sp)
/*0x80324C34*/  jal     guMtxIdentF
/*0x80324C38*/  sw      $a0, 0x0018($sp)
/*0x80324C3C*/  lwc1    $f4, 0x0020($sp)
/*0x80324C40*/  lwc1    $f6, 0x001C($sp)
/*0x80324C44*/  li      $at, 0x40000000
/*0x80324C48*/  mtc1    $at, $f8
/*0x80324C4C*/  sub.s   $f0, $f4, $f6
/*0x80324C50*/  lw      $v0, 0x0018($sp)
/*0x80324C54*/  lwc1    $f14, 0x0028($sp)
/*0x80324C58*/  lwc1    $f16, 0x0030($sp)
/*0x80324C5C*/  div.s   $f10, $f8, $f0
/*0x80324C60*/  lwc1    $f18, 0x002C($sp)
/*0x80324C64*/  mtc1    $at, $f6
/*0x80324C68*/  li      $at, 0xC0000000
/*0x80324C6C*/  sub.s   $f12, $f16, $f18
/*0x80324C70*/  move    $v1, $0
/*0x80324C74*/  li      $a0, 0x0004
/*0x80324C78*/  swc1    $f10, 0x0000($v0)
/*0x80324C7C*/  lwc1    $f4, 0x0024($sp)
/*0x80324C80*/  mtc1    $at, $f10
/*0x80324C84*/  li      $at, 0x3F800000
/*0x80324C88*/  sub.s   $f2, $f14, $f4
/*0x80324C8C*/  div.s   $f4, $f10, $f12
/*0x80324C90*/  div.s   $f8, $f6, $f2
/*0x80324C94*/  swc1    $f4, 0x0028($v0)
/*0x80324C98*/  swc1    $f8, 0x0014($v0)
/*0x80324C9C*/  lwc1    $f8, 0x001C($sp)
/*0x80324CA0*/  lwc1    $f6, 0x0020($sp)
/*0x80324CA4*/  add.s   $f10, $f6, $f8
/*0x80324CA8*/  neg.s   $f4, $f10
/*0x80324CAC*/  div.s   $f6, $f4, $f0
/*0x80324CB0*/  swc1    $f6, 0x0030($v0)
/*0x80324CB4*/  lwc1    $f8, 0x0024($sp)
/*0x80324CB8*/  add.s   $f10, $f14, $f8
/*0x80324CBC*/  add.s   $f8, $f16, $f18
/*0x80324CC0*/  neg.s   $f4, $f10
/*0x80324CC4*/  neg.s   $f10, $f8
/*0x80324CC8*/  div.s   $f6, $f4, $f2
/*0x80324CCC*/  div.s   $f4, $f10, $f12
/*0x80324CD0*/  swc1    $f6, 0x0034($v0)
/*0x80324CD4*/  mtc1    $at, $f6
/*0x80324CD8*/  nop
/*0x80324CDC*/  swc1    $f6, 0x003C($v0)
/*0x80324CE0*/  swc1    $f4, 0x0038($v0)
/*0x80324CE4*/  lwc1    $f0, 0x0034($sp)
/*0x80324CE8*/  lwc1    $f8, 0x0000($v0)
/*0x80324CEC*/  addiu   $v1, $v1, 0x0001
/*0x80324CF0*/  lwc1    $f18, 0x0004($v0)
/*0x80324CF4*/  mul.s   $f12, $f8, $f0
/*0x80324CF8*/  lwc1    $f14, 0x0008($v0)
/*0x80324CFC*/  beq     $v1, $a0, .L80324D40
/*0x80324D00*/  lwc1    $f16, 0x000C($v0)
.L80324D04:
/*0x80324D04*/  mul.s   $f10, $f18, $f0
/*0x80324D08*/  lwc1    $f8, 0x0010($v0)
/*0x80324D0C*/  lwc1    $f18, 0x0014($v0)
/*0x80324D10*/  mul.s   $f6, $f14, $f0
/*0x80324D14*/  lwc1    $f14, 0x0018($v0)
/*0x80324D18*/  addiu   $v1, $v1, 0x0001
/*0x80324D1C*/  mul.s   $f4, $f16, $f0
/*0x80324D20*/  lwc1    $f16, 0x001C($v0)
/*0x80324D24*/  swc1    $f12, 0x0000($v0)
/*0x80324D28*/  mul.s   $f12, $f8, $f0
/*0x80324D2C*/  swc1    $f10, 0x0004($v0)
/*0x80324D30*/  swc1    $f6, 0x0008($v0)
/*0x80324D34*/  addiu   $v0, $v0, 0x0010
/*0x80324D38*/  bne     $v1, $a0, .L80324D04
/*0x80324D3C*/  swc1    $f4, -0x0004($v0)
.L80324D40:
/*0x80324D40*/  mul.s   $f10, $f18, $f0
/*0x80324D44*/  addiu   $v0, $v0, 0x0010
/*0x80324D48*/  swc1    $f12, -0x0010($v0)
/*0x80324D4C*/  mul.s   $f6, $f14, $f0
/*0x80324D50*/  nop
/*0x80324D54*/  mul.s   $f4, $f16, $f0
/*0x80324D58*/  swc1    $f10, -0x000C($v0)
/*0x80324D5C*/  swc1    $f6, -0x0008($v0)
/*0x80324D60*/  swc1    $f4, -0x0004($v0)
/*0x80324D64*/  lw      $ra, 0x0014($sp)
/*0x80324D68*/  addiu   $sp, $sp, 0x0018
/*0x80324D6C*/  jr      $ra
/*0x80324D70*/  nop

/* 0x80324D74   void guOrtho(
    Mtx *m,
    float l,
    float r,
    float b,
    float t,
    float n,
    float f,
    float scale
) */
.globl guOrtho
guOrtho:
/*0x80324D74*/  addiu   $sp, $sp, -0x0068
/*0x80324D78*/  mtc1    $a1, $f12
/*0x80324D7C*/  mtc1    $a2, $f14
/*0x80324D80*/  mtc1    $a3, $f16
/*0x80324D84*/  lwc1    $f4, 0x0078($sp)
/*0x80324D88*/  lwc1    $f6, 0x007C($sp)
/*0x80324D8C*/  lwc1    $f8, 0x0080($sp)
/*0x80324D90*/  lwc1    $f10, 0x0084($sp)
/*0x80324D94*/  sw      $ra, 0x0024($sp)
/*0x80324D98*/  sw      $a0, 0x0068($sp)
/*0x80324D9C*/  mfc1    $a1, $f12
/*0x80324DA0*/  mfc1    $a2, $f14
/*0x80324DA4*/  mfc1    $a3, $f16
/*0x80324DA8*/  addiu   $a0, $sp, 0x0028
/*0x80324DAC*/  swc1    $f4, 0x0010($sp)
/*0x80324DB0*/  swc1    $f6, 0x0014($sp)
/*0x80324DB4*/  swc1    $f8, 0x0018($sp)
/*0x80324DB8*/  jal     guOrthoF
/*0x80324DBC*/  swc1    $f10, 0x001C($sp)
/*0x80324DC0*/  addiu   $a0, $sp, 0x0028
/*0x80324DC4*/  jal     guMtxF2L
/*0x80324DC8*/  lw      $a1, 0x0068($sp)
/*0x80324DCC*/  lw      $ra, 0x0024($sp)
/*0x80324DD0*/  addiu   $sp, $sp, 0x0068
/*0x80324DD4*/  jr      $ra
/*0x80324DD8*/  nop
