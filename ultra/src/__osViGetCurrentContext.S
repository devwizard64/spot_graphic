#include <ultra64.h>

.set noreorder
.set noat

/* 0x80328070 */
.globl __osViGetCurrentContext
__osViGetCurrentContext:
/*0x80328070*/  lui     $v0, %hi(__osViCurr)
/*0x80328074*/  jr      $ra
/*0x80328078*/  lw      $v0, %lo(__osViCurr)($v0)
