#include <ultra64.h>

.set noreorder
.set noat

/* 0x8032B030 */
.globl __osSiDeviceBusy
__osSiDeviceBusy:
/*0x8032B030*/  lui     $t6, %hi(0xA4800018)
/*0x8032B034*/  lw      $a0, %lo(0xA4800018)($t6)
/*0x8032B038*/  addiu   $sp, $sp, -0x0008
/*0x8032B03C*/  andi    $t7, $a0, 0x0003
/*0x8032B040*/  beqz    $t7, .L8032B050
/*0x8032B044*/  nop
/*0x8032B048*/  b       .L8032B054
/*0x8032B04C*/  li      $v0, 0x0001
.L8032B050:
/*0x8032B050*/  move    $v0, $0
.L8032B054:
/*0x8032B054*/  jr      $ra
/*0x8032B058*/  addiu   $sp, $sp, 0x0008
