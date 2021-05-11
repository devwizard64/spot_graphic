#include <ultra64.h>

.set noreorder
.set noat

/* 0x80328710   void __osSetSR(u32 value) */
.globl __osSetSR
__osSetSR:
/*0x80328710*/  mtc0    $a0, C0_SR
/*0x80328714*/  nop
/*0x80328718*/  jr      $ra
/*0x8032871C*/  nop
