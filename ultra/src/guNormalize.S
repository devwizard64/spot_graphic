#include <ultra64.h>

.set noreorder
.set noat

/* 0x803296C0   void guNormalize(float *x, float *y, float *z) */
.globl guNormalize
guNormalize:
/*0x803296C0*/  addiu   $sp, $sp, -0x0018
/*0x803296C4*/  sw      $ra, 0x0014($sp)
/*0x803296C8*/  lwc1    $f2, 0x0000($a0)
/*0x803296CC*/  lwc1    $f14, 0x0000($a1)
/*0x803296D0*/  lwc1    $f0, 0x0000($a2)
/*0x803296D4*/  mul.s   $f4, $f2, $f2
/*0x803296D8*/  sw      $a2, 0x0020($sp)
/*0x803296DC*/  sw      $a1, 0x001C($sp)
/*0x803296E0*/  mul.s   $f6, $f14, $f14
/*0x803296E4*/  sw      $a0, 0x0018($sp)
/*0x803296E8*/  mul.s   $f10, $f0, $f0
/*0x803296EC*/  add.s   $f8, $f4, $f6
/*0x803296F0*/  jal     sqrtf
/*0x803296F4*/  add.s   $f12, $f10, $f8
/*0x803296F8*/  li      $at, 0x3F800000
/*0x803296FC*/  mtc1    $at, $f16
/*0x80329700*/  lw      $a0, 0x0018($sp)
/*0x80329704*/  lw      $a1, 0x001C($sp)
/*0x80329708*/  div.s   $f2, $f16, $f0
/*0x8032970C*/  lwc1    $f18, 0x0000($a0)
/*0x80329710*/  lw      $a2, 0x0020($sp)
/*0x80329714*/  mul.s   $f4, $f18, $f2
/*0x80329718*/  swc1    $f4, 0x0000($a0)
/*0x8032971C*/  lwc1    $f6, 0x0000($a1)
/*0x80329720*/  mul.s   $f10, $f6, $f2
/*0x80329724*/  swc1    $f10, 0x0000($a1)
/*0x80329728*/  lwc1    $f8, 0x0000($a2)
/*0x8032972C*/  mul.s   $f16, $f8, $f2
/*0x80329730*/  swc1    $f16, 0x0000($a2)
/*0x80329734*/  lw      $ra, 0x0014($sp)
/*0x80329738*/  addiu   $sp, $sp, 0x0018
/*0x8032973C*/  jr      $ra
/*0x80329740*/  nop
