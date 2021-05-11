#include <ultra64.h>

.set noreorder
.set noat

/* 0x80327F40 */
.globl __osSpSetPc
__osSpSetPc:
/*0x80327F40*/  lui     $t6, %hi(0xA4040010)
/*0x80327F44*/  lw      $a1, %lo(0xA4040010)($t6)
/*0x80327F48*/  addiu   $sp, $sp, -0x0008
/*0x80327F4C*/  andi    $t7, $a1, 0x0001
/*0x80327F50*/  bnez    $t7, .L80327F60
/*0x80327F54*/  nop
/*0x80327F58*/  b       .L80327F6C
/*0x80327F5C*/  li      $v0, -0x0001
.L80327F60:
/*0x80327F60*/  lui     $t8, %hi(0xA4080000)
/*0x80327F64*/  sw      $a0, %lo(0xA4080000)($t8)
/*0x80327F68*/  move    $v0, $0
.L80327F6C:
/*0x80327F6C*/  jr      $ra
/*0x80327F70*/  addiu   $sp, $sp, 0x0008
