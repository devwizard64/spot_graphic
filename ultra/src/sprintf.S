#include <ultra64.h>

.set noreorder
.set noat

/* 0x803224F0   int sprintf(char *, const char *, ...) */
.globl sprintf
sprintf:
/*0x803224F0*/  addiu   $sp, $sp, -0x0020
/*0x803224F4*/  sw      $a0, 0x0020($sp)
/*0x803224F8*/  addiu   $t6, $sp, 0x0024
/*0x803224FC*/  sw      $ra, 0x0014($sp)
/*0x80322500*/  sw      $a1, 0x0024($sp)
/*0x80322504*/  sw      $a2, 0x0028($sp)
/*0x80322508*/  sw      $a3, 0x002C($sp)
/*0x8032250C*/  addiu   $t7, $t6, 0x0004
/*0x80322510*/  lui     $a0, %hi(ultra_8032255C)
/*0x80322514*/  sw      $t7, 0x0018($sp)
/*0x80322518*/  addiu   $a0, $a0, %lo(ultra_8032255C)
/*0x8032251C*/  move    $a3, $t7
/*0x80322520*/  lw      $a2, 0x0024($sp)
/*0x80322524*/  jal     ultra_80326260
/*0x80322528*/  lw      $a1, 0x0020($sp)
/*0x8032252C*/  sw      $v0, 0x001C($sp)
/*0x80322530*/  lw      $t8, 0x001C($sp)
/*0x80322534*/  bltz    $t8, .L80322548
/*0x80322538*/  nop
/*0x8032253C*/  lw      $t9, 0x0020($sp)
/*0x80322540*/  addu    $t0, $t9, $t8
/*0x80322544*/  sb      $0, 0x0000($t0)
.L80322548:
/*0x80322548*/  lw      $ra, 0x0014($sp)
/*0x8032254C*/  lw      $v0, 0x001C($sp)
/*0x80322550*/  addiu   $sp, $sp, 0x0020
/*0x80322554*/  jr      $ra
/*0x80322558*/  nop

/* 0x8032255C */
ultra_8032255C:
/*0x8032255C*/  addiu   $sp, $sp, -0x0018
/*0x80322560*/  sw      $ra, 0x0014($sp)
/*0x80322564*/  sw      $a0, 0x0018($sp)
/*0x80322568*/  sw      $a1, 0x001C($sp)
/*0x8032256C*/  sw      $a2, 0x0020($sp)
/*0x80322570*/  lw      $a2, 0x0020($sp)
/*0x80322574*/  lw      $a1, 0x001C($sp)
/*0x80322578*/  jal     memcpy
/*0x8032257C*/  lw      $a0, 0x0018($sp)
/*0x80322580*/  lw      $ra, 0x0014($sp)
/*0x80322584*/  lw      $t6, 0x0020($sp)
/*0x80322588*/  addiu   $sp, $sp, 0x0018
/*0x8032258C*/  jr      $ra
/*0x80322590*/  addu    $v0, $v0, $t6
