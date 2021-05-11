#include <ultra64.h>

.set noreorder
.set noat

/* 0x80329780   void __osSetCompare(u32 value) */
.globl __osSetCompare
__osSetCompare:
/*0x80329780*/  mtc0    $a0, C0_COMPARE
/*0x80329784*/  jr      $ra
/*0x80329788*/  nop
