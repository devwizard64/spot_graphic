#include <ultra64.h>

.set noreorder
.set noat

/* 0x803232D0   void osViSetMode(O, S, V, i, M, o, d, e,  , *, m, o, d, e) */
.globl osViSetMode
osViSetMode:
/*0x803232D0*/  addiu   $sp, $sp, -0x0028
/*0x803232D4*/  sw      $ra, 0x001C($sp)
/*0x803232D8*/  sw      $a0, 0x0028($sp)
/*0x803232DC*/  jal     __osDisableInt
/*0x803232E0*/  sw      $s0, 0x0018($sp)
/*0x803232E4*/  lui     $t7, %hi(__osViNext)
/*0x803232E8*/  lw      $t7, %lo(__osViNext)($t7)
/*0x803232EC*/  lw      $t6, 0x0028($sp)
/*0x803232F0*/  lui     $t9, %hi(__osViNext)
/*0x803232F4*/  li      $t8, 0x0001
/*0x803232F8*/  sw      $t6, 0x0008($t7)
/*0x803232FC*/  lw      $t9, %lo(__osViNext)($t9)
/*0x80323300*/  lui     $t0, %hi(__osViNext)
/*0x80323304*/  move    $s0, $v0
/*0x80323308*/  sh      $t8, 0x0000($t9)
/*0x8032330C*/  lw      $t0, %lo(__osViNext)($t0)
/*0x80323310*/  move    $a0, $s0
/*0x80323314*/  lw      $t1, 0x0008($t0)
/*0x80323318*/  lw      $t2, 0x0004($t1)
/*0x8032331C*/  jal     __osRestoreInt
/*0x80323320*/  sw      $t2, 0x000C($t0)
/*0x80323324*/  lw      $ra, 0x001C($sp)
/*0x80323328*/  lw      $s0, 0x0018($sp)
/*0x8032332C*/  addiu   $sp, $sp, 0x0028
/*0x80323330*/  jr      $ra
/*0x80323334*/  nop
