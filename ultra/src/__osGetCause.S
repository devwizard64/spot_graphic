#include <ultra64.h>

.set noreorder
.set noat

/* 0x8032B1F0   u32 __osGetCause(void) */
.globl __osGetCause
__osGetCause:
/*0x8032B1F0*/  mfc0    $v0, C0_CAUSE
/*0x8032B1F4*/  jr      $ra
/*0x8032B1F8*/  nop
