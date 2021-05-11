#include <ultra64.h>

.set noreorder
.set noat

/* 0x80323A50   float sqrtf(float value) */
.globl sqrtf
sqrtf:
/*0x80323A50*/  jr      $ra
/*0x80323A54*/  sqrt.s  $f0, $f12
