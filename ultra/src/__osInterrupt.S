#include <ultra64.h>

.set noreorder
.set noat

/* 0x803274D0 */
.globl __osDisableInt
__osDisableInt:
/*0x803274D0*/  mfc0    $t0, C0_SR
/*0x803274D4*/  li      $at, -0x0002
/*0x803274D8*/  and     $t1, $t0, $at
/*0x803274DC*/  mtc0    $t1, C0_SR
/*0x803274E0*/  andi    $v0, $t0, 0x0001
/*0x803274E4*/  nop
/*0x803274E8*/  jr      $ra
/*0x803274EC*/  nop

/* 0x803274F0 */
.globl __osRestoreInt
__osRestoreInt:
/*0x803274F0*/  mfc0    $t0, C0_SR
/*0x803274F4*/  or      $t0, $t0, $a0
/*0x803274F8*/  mtc0    $t0, C0_SR
/*0x803274FC*/  nop
/*0x80327500*/  nop
/*0x80327504*/  jr      $ra
/*0x80327508*/  nop
