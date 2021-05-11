#include <ultra64.h>

.set noreorder
.set noat

/* 0x80328050   OSPri osGetThreadPri(OSThread *t) */
.globl osGetThreadPri
osGetThreadPri:
/*0x80328050*/  bnez    $a0, .L80328060
/*0x80328054*/  nop
/*0x80328058*/  lui     $a0, %hi(__osRunningThread)
/*0x8032805C*/  lw      $a0, %lo(__osRunningThread)($a0)
.L80328060:
/*0x80328060*/  jr      $ra
/*0x80328064*/  lw      $v0, 0x0004($a0)
