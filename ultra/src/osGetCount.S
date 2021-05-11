#include <ultra64.h>

.set noreorder
.set noat

/* 0x803283E0   u32 osGetCount(void) */
.globl osGetCount
osGetCount:
/*0x803283E0*/  mfc0    $v0, C0_COUNT
/*0x803283E4*/  jr      $ra
/*0x803283E8*/  nop
