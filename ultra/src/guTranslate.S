#include <ultra64.h>

.set noreorder
.set noat

/* 0x80325640   void guTranslateF(float mf[4][4], float x, float y, float z) */
.globl guTranslateF
guTranslateF:
/*0x80325640*/  addiu   $sp, $sp, -0x0018
/*0x80325644*/  sw      $ra, 0x0014($sp)
/*0x80325648*/  sw      $a1, 0x001C($sp)
/*0x8032564C*/  sw      $a2, 0x0020($sp)
/*0x80325650*/  sw      $a3, 0x0024($sp)
/*0x80325654*/  jal     guMtxIdentF
/*0x80325658*/  sw      $a0, 0x0018($sp)
/*0x8032565C*/  lw      $a0, 0x0018($sp)
/*0x80325660*/  lwc1    $f4, 0x001C($sp)
/*0x80325664*/  swc1    $f4, 0x0030($a0)
/*0x80325668*/  lwc1    $f6, 0x0020($sp)
/*0x8032566C*/  swc1    $f6, 0x0034($a0)
/*0x80325670*/  lwc1    $f8, 0x0024($sp)
/*0x80325674*/  swc1    $f8, 0x0038($a0)
/*0x80325678*/  lw      $ra, 0x0014($sp)
/*0x8032567C*/  addiu   $sp, $sp, 0x0018
/*0x80325680*/  jr      $ra
/*0x80325684*/  nop

/* 0x80325688   void guTranslate(Mtx *m, float x, float y, float z) */
.globl guTranslate
guTranslate:
/*0x80325688*/  addiu   $sp, $sp, -0x0068
/*0x8032568C*/  sw      $ra, 0x0014($sp)
/*0x80325690*/  sw      $a0, 0x0068($sp)
/*0x80325694*/  sw      $a1, 0x006C($sp)
/*0x80325698*/  sw      $a2, 0x0070($sp)
/*0x8032569C*/  sw      $a3, 0x0074($sp)
/*0x803256A0*/  jal     guMtxIdentF
/*0x803256A4*/  addiu   $a0, $sp, 0x0028
/*0x803256A8*/  lwc1    $f4, 0x006C($sp)
/*0x803256AC*/  lwc1    $f6, 0x0070($sp)
/*0x803256B0*/  lwc1    $f8, 0x0074($sp)
/*0x803256B4*/  addiu   $a0, $sp, 0x0028
/*0x803256B8*/  lw      $a1, 0x0068($sp)
/*0x803256BC*/  swc1    $f4, 0x0058($sp)
/*0x803256C0*/  swc1    $f6, 0x005C($sp)
/*0x803256C4*/  jal     guMtxF2L
/*0x803256C8*/  swc1    $f8, 0x0060($sp)
/*0x803256CC*/  lw      $ra, 0x0014($sp)
/*0x803256D0*/  addiu   $sp, $sp, 0x0068
/*0x803256D4*/  jr      $ra
/*0x803256D8*/  nop
