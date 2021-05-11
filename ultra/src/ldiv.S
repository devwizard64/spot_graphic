#include <ultra64.h>

.set noreorder
.set noat

/* 0x8032B060 */
.globl lldiv
lldiv:
/*0x8032B060*/  addiu   $sp, $sp, -0x0030
/*0x8032B064*/  sw      $a0, 0x0030($sp)
/*0x8032B068*/  sw      $ra, 0x0014($sp)
/*0x8032B06C*/  sw      $a2, 0x0038($sp)
/*0x8032B070*/  sw      $a3, 0x003C($sp)
/*0x8032B074*/  move    $a0, $a2
/*0x8032B078*/  move    $a1, $a3
/*0x8032B07C*/  lw      $a3, 0x0044($sp)
/*0x8032B080*/  jal     __ll_div
/*0x8032B084*/  lw      $a2, 0x0040($sp)
/*0x8032B088*/  sw      $v0, 0x0020($sp)
/*0x8032B08C*/  sw      $v1, 0x0024($sp)
/*0x8032B090*/  lw      $a0, 0x0040($sp)
/*0x8032B094*/  lw      $a1, 0x0044($sp)
/*0x8032B098*/  move    $a2, $v0
/*0x8032B09C*/  jal     __ll_mul
/*0x8032B0A0*/  move    $a3, $v1
/*0x8032B0A4*/  lw      $t6, 0x0038($sp)
/*0x8032B0A8*/  lw      $t7, 0x003C($sp)
/*0x8032B0AC*/  lw      $t0, 0x0020($sp)
/*0x8032B0B0*/  subu    $t8, $t6, $v0
/*0x8032B0B4*/  sltu    $at, $t7, $v1
/*0x8032B0B8*/  subu    $t8, $t8, $at
/*0x8032B0BC*/  subu    $t9, $t7, $v1
/*0x8032B0C0*/  sw      $t9, 0x002C($sp)
/*0x8032B0C4*/  sw      $t8, 0x0028($sp)
/*0x8032B0C8*/  bgtz    $t0, .L8032B128
/*0x8032B0CC*/  lw      $t1, 0x0024($sp)
/*0x8032B0D0*/  bltz    $t0, .L8032B0E0
/*0x8032B0D4*/  nop
/*0x8032B0D8*/  b       .L8032B12C
/*0x8032B0DC*/  addiu   $t0, $sp, 0x0020
.L8032B0E0:
/*0x8032B0E0*/  bltzl   $t8, .L8032B12C
/*0x8032B0E4*/  addiu   $t0, $sp, 0x0020
/*0x8032B0E8*/  bgtz    $t8, .L8032B0F8
/*0x8032B0EC*/  addiu   $t3, $t1, 0x0001
/*0x8032B0F0*/  beqzl   $t9, .L8032B12C
/*0x8032B0F4*/  addiu   $t0, $sp, 0x0020
.L8032B0F8:
/*0x8032B0F8*/  lw      $t4, 0x0040($sp)
/*0x8032B0FC*/  lw      $t5, 0x0044($sp)
/*0x8032B100*/  sltiu   $at, $t3, 0x0001
/*0x8032B104*/  addu    $t2, $t0, $at
/*0x8032B108*/  subu    $t6, $t8, $t4
/*0x8032B10C*/  sltu    $at, $t9, $t5
/*0x8032B110*/  subu    $t6, $t6, $at
/*0x8032B114*/  subu    $t7, $t9, $t5
/*0x8032B118*/  sw      $t2, 0x0020($sp)
/*0x8032B11C*/  sw      $t3, 0x0024($sp)
/*0x8032B120*/  sw      $t7, 0x002C($sp)
/*0x8032B124*/  sw      $t6, 0x0028($sp)
.L8032B128:
/*0x8032B128*/  addiu   $t0, $sp, 0x0020
.L8032B12C:
/*0x8032B12C*/  lw      $v0, 0x0030($sp)
/*0x8032B130*/  lw      $at, 0x0000($t0)
/*0x8032B134*/  sw      $at, 0x0000($v0)
/*0x8032B138*/  lw      $t3, 0x0004($t0)
/*0x8032B13C*/  sw      $t3, 0x0004($v0)
/*0x8032B140*/  lw      $at, 0x0008($t0)
/*0x8032B144*/  sw      $at, 0x0008($v0)
/*0x8032B148*/  lw      $t3, 0x000C($t0)
/*0x8032B14C*/  sw      $t3, 0x000C($v0)
/*0x8032B150*/  lw      $ra, 0x0014($sp)
/*0x8032B154*/  addiu   $sp, $sp, 0x0030
/*0x8032B158*/  jr      $ra
/*0x8032B15C*/  nop

/* 0x8032B160 */
.globl ldiv
ldiv:
/*0x8032B160*/  div     $0, $a1, $a2
/*0x8032B164*/  mflo    $v0
/*0x8032B168*/  addiu   $sp, $sp, -0x0008
/*0x8032B16C*/  bnez    $a2, .L8032B178
/*0x8032B170*/  nop
/*0x8032B174*/  break   7
.L8032B178:
/*0x8032B178*/  li      $at, -0x0001
/*0x8032B17C*/  bne     $a2, $at, .L8032B190
/*0x8032B180*/  li      $at, 0x80000000
/*0x8032B184*/  bne     $a1, $at, .L8032B190
/*0x8032B188*/  nop
/*0x8032B18C*/  break   6
.L8032B190:
/*0x8032B190*/  multu   $a2, $v0
/*0x8032B194*/  sw      $v0, 0x0000($sp)
/*0x8032B198*/  addiu   $t7, $sp, 0x0000
/*0x8032B19C*/  mflo    $t6
/*0x8032B1A0*/  subu    $v1, $a1, $t6
/*0x8032B1A4*/  bgez    $v0, .L8032B1C8
/*0x8032B1A8*/  sw      $v1, 0x0004($sp)
/*0x8032B1AC*/  sw      $v0, 0x0000($sp)
/*0x8032B1B0*/  blez    $v1, .L8032B1C8
/*0x8032B1B4*/  sw      $v1, 0x0004($sp)
/*0x8032B1B8*/  addiu   $v0, $v0, 0x0001
/*0x8032B1BC*/  subu    $v1, $v1, $a2
/*0x8032B1C0*/  sw      $v1, 0x0004($sp)
/*0x8032B1C4*/  sw      $v0, 0x0000($sp)
.L8032B1C8:
/*0x8032B1C8*/  lw      $at, 0x0000($t7)
/*0x8032B1CC*/  move    $v0, $a0
/*0x8032B1D0*/  sw      $at, 0x0000($a0)
/*0x8032B1D4*/  lw      $t0, 0x0004($t7)
/*0x8032B1D8*/  addiu   $sp, $sp, 0x0008
/*0x8032B1DC*/  jr      $ra
/*0x8032B1E0*/  sw      $t0, 0x0004($a0)
