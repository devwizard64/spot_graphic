#include <ultra64.h>

.set noreorder
.set noat

/* 0x80328720   u32 __osGetSR(void) */
.globl __osGetSR
__osGetSR:
/*0x80328720*/  mfc0    $v0, C0_SR
/*0x80328724*/  jr      $ra
/*0x80328728*/  nop
