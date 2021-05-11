#include <ultra64.h>

.set noreorder
.set noat

/* 0x80323A00   void osViSwapBuffer(void *vaddr) */
.globl osViSwapBuffer
osViSwapBuffer:
/*0x80323A00*/  addiu   $sp, $sp, -0x0020
/*0x80323A04*/  sw      $ra, 0x0014($sp)
/*0x80323A08*/  jal     __osDisableInt
/*0x80323A0C*/  sw      $a0, 0x0020($sp)
/*0x80323A10*/  lui     $t7, %hi(__osViNext)
/*0x80323A14*/  lw      $t7, %lo(__osViNext)($t7)
/*0x80323A18*/  lw      $t6, 0x0020($sp)
/*0x80323A1C*/  sw      $v0, 0x001C($sp)
/*0x80323A20*/  lui     $t8, %hi(__osViNext)
/*0x80323A24*/  sw      $t6, 0x0004($t7)
/*0x80323A28*/  lw      $t8, %lo(__osViNext)($t8)
/*0x80323A2C*/  lhu     $t9, 0x0000($t8)
/*0x80323A30*/  ori     $t0, $t9, 0x0010
/*0x80323A34*/  sh      $t0, 0x0000($t8)
/*0x80323A38*/  jal     __osRestoreInt
/*0x80323A3C*/  lw      $a0, 0x001C($sp)
/*0x80323A40*/  lw      $ra, 0x0014($sp)
/*0x80323A44*/  addiu   $sp, $sp, 0x0020
/*0x80323A48*/  jr      $ra
/*0x80323A4C*/  nop
