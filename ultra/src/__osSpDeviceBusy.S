#include <ultra64.h>

.set noreorder
.set noat

/* 0x80328010 */
.globl __osSpDeviceBusy
__osSpDeviceBusy:
/*0x80328010*/  lui     $t6, %hi(0xA4040010)
/*0x80328014*/  lw      $a0, %lo(0xA4040010)($t6)
/*0x80328018*/  addiu   $sp, $sp, -0x0008
/*0x8032801C*/  andi    $t7, $a0, 0x001C
/*0x80328020*/  beqz    $t7, .L80328030
/*0x80328024*/  nop
/*0x80328028*/  b       .L80328034
/*0x8032802C*/  li      $v0, 0x0001
.L80328030:
/*0x80328030*/  move    $v0, $0
.L80328034:
/*0x80328034*/  jr      $ra
/*0x80328038*/  addiu   $sp, $sp, 0x0008
