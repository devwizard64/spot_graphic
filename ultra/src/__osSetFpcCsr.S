#include <ultra64.h>

.set noreorder
.set noat

/* 0x80328730   u32 __osSetFpcCsr(u32 value) */
.globl __osSetFpcCsr
__osSetFpcCsr:
/*0x80328730*/  cfc1    $v0, $31
/*0x80328734*/  ctc1    $a0, $31
/*0x80328738*/  jr      $ra
/*0x8032873C*/  nop
