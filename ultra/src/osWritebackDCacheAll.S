#include <ultra64.h>

.set noreorder
.set noat

/* 0x80322F40   void osWritebackDCacheAll(void) */
.globl osWritebackDCacheAll
osWritebackDCacheAll:
/*0x80322F40*/  lui     $t0, %hi(0x80000010)
/*0x80322F44*/  li      $t2, 0x2000
/*0x80322F48*/  addu    $t1, $t0, $t2
/*0x80322F4C*/  addiu   $t1, $t1, -0x0010
.L80322F50:
/*0x80322F50*/  cache   0x01, %lo(0x80000000)($t0)
/*0x80322F54*/  sltu    $at, $t0, $t1
/*0x80322F58*/  bnez    $at, .L80322F50
/*0x80322F5C*/  addiu   $t0, $t0, %lo(0x80000010)
/*0x80322F60*/  jr      $ra
/*0x80322F64*/  nop
