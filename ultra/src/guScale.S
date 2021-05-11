#include <ultra64.h>

.set noreorder
.set noat

/* 0x803258D0   void guScaleF(float mf[4][4], float x, float y, float z) */
.globl guScaleF
guScaleF:
/*0x803258D0*/  addiu   $sp, $sp, -0x0018
/*0x803258D4*/  sw      $ra, 0x0014($sp)
/*0x803258D8*/  sw      $a1, 0x001C($sp)
/*0x803258DC*/  sw      $a2, 0x0020($sp)
/*0x803258E0*/  sw      $a3, 0x0024($sp)
/*0x803258E4*/  jal     guMtxIdentF
/*0x803258E8*/  sw      $a0, 0x0018($sp)
/*0x803258EC*/  lw      $a0, 0x0018($sp)
/*0x803258F0*/  lwc1    $f4, 0x001C($sp)
/*0x803258F4*/  li      $at, 0x3F800000
/*0x803258F8*/  mtc1    $at, $f10
/*0x803258FC*/  swc1    $f4, 0x0000($a0)
/*0x80325900*/  lwc1    $f6, 0x0020($sp)
/*0x80325904*/  swc1    $f6, 0x0014($a0)
/*0x80325908*/  lwc1    $f8, 0x0024($sp)
/*0x8032590C*/  swc1    $f10, 0x003C($a0)
/*0x80325910*/  swc1    $f8, 0x0028($a0)
/*0x80325914*/  lw      $ra, 0x0014($sp)
/*0x80325918*/  addiu   $sp, $sp, 0x0018
/*0x8032591C*/  jr      $ra
/*0x80325920*/  nop

/* 0x80325924   void guScale(Mtx *m, float x, float y, float z) */
.globl guScale
guScale:
/*0x80325924*/  mtc1    $a1, $f12
/*0x80325928*/  mtc1    $a2, $f14
/*0x8032592C*/  mtc1    $a3, $f16
/*0x80325930*/  addiu   $sp, $sp, -0x0058
/*0x80325934*/  sw      $ra, 0x0014($sp)
/*0x80325938*/  sw      $a0, 0x0058($sp)
/*0x8032593C*/  mfc1    $a1, $f12
/*0x80325940*/  mfc1    $a2, $f14
/*0x80325944*/  mfc1    $a3, $f16
/*0x80325948*/  jal     guScaleF
/*0x8032594C*/  addiu   $a0, $sp, 0x0018
/*0x80325950*/  addiu   $a0, $sp, 0x0018
/*0x80325954*/  jal     guMtxF2L
/*0x80325958*/  lw      $a1, 0x0058($sp)
/*0x8032595C*/  lw      $ra, 0x0014($sp)
/*0x80325960*/  addiu   $sp, $sp, 0x0058
/*0x80325964*/  jr      $ra
/*0x80325968*/  nop
