#include <ultra64.h>

.set noreorder
.set noat

/* 0x8032B200 */
.globl __osAtomicDec
__osAtomicDec:
/*0x8032B200*/  addiu   $sp, $sp, -0x0020
/*0x8032B204*/  sw      $ra, 0x0014($sp)
/*0x8032B208*/  jal     __osDisableInt
/*0x8032B20C*/  sw      $a0, 0x0020($sp)
/*0x8032B210*/  lw      $t6, 0x0020($sp)
/*0x8032B214*/  sw      $v0, 0x001C($sp)
/*0x8032B218*/  lw      $t7, 0x0000($t6)
/*0x8032B21C*/  beqz    $t7, .L8032B238
/*0x8032B220*/  nop
/*0x8032B224*/  addiu   $t8, $t7, -0x0001
/*0x8032B228*/  sw      $t8, 0x0000($t6)
/*0x8032B22C*/  li      $t9, 0x0001
/*0x8032B230*/  b       .L8032B23C
/*0x8032B234*/  sw      $t9, 0x0018($sp)
.L8032B238:
/*0x8032B238*/  sw      $0, 0x0018($sp)
.L8032B23C:
/*0x8032B23C*/  jal     __osRestoreInt
/*0x8032B240*/  lw      $a0, 0x001C($sp)
/*0x8032B244*/  lw      $ra, 0x0014($sp)
/*0x8032B248*/  lw      $v0, 0x0018($sp)
/*0x8032B24C*/  addiu   $sp, $sp, 0x0020
/*0x8032B250*/  jr      $ra
/*0x8032B254*/  nop
