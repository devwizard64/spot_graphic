#include <ultra64.h>

.set noreorder
.set noat

/* 0x80329750 */
.globl __osAiDeviceBusy
__osAiDeviceBusy:
/*0x80329750*/  lui     $t6, %hi(0xA450000C)
/*0x80329754*/  lw      $a0, %lo(0xA450000C)($t6)
/*0x80329758*/  li      $at, 0x80000000
/*0x8032975C*/  addiu   $sp, $sp, -0x0008
/*0x80329760*/  and     $t7, $a0, $at
/*0x80329764*/  beqz    $t7, .L80329774
/*0x80329768*/  nop
/*0x8032976C*/  b       .L80329778
/*0x80329770*/  li      $v0, 0x0001
.L80329774:
/*0x80329774*/  move    $v0, $0
.L80329778:
/*0x80329778*/  jr      $ra
/*0x8032977C*/  addiu   $sp, $sp, 0x0008
