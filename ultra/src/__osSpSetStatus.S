#include <ultra64.h>

.set noreorder
.set noat

/* 0x80327F30 */
.globl __osSpSetStatus
__osSpSetStatus:
/*0x80327F30*/  lui     $t6, %hi(0xA4040010)
/*0x80327F34*/  jr      $ra
/*0x80327F38*/  sw      $a0, %lo(0xA4040010)($t6)
