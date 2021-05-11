#include <ultra64.h>

.set noreorder
.set noat

/* 0x803288A0 */
.globl __osSiCreateAccessQueue
__osSiCreateAccessQueue:
/*0x803288A0*/  addiu   $sp, $sp, -0x0018
/*0x803288A4*/  sw      $ra, 0x0014($sp)
/*0x803288A8*/  li      $t6, 0x0001
/*0x803288AC*/  lui     $at, %hi(__osSiAccessQueueEnabled)
/*0x803288B0*/  lui     $a0, %hi(ultra_bss+0x25B8)
/*0x803288B4*/  lui     $a1, %hi(ultra_bss+0x25B0)
/*0x803288B8*/  sw      $t6, %lo(__osSiAccessQueueEnabled)($at)
/*0x803288BC*/  addiu   $a1, $a1, %lo(ultra_bss+0x25B0)
/*0x803288C0*/  addiu   $a0, $a0, %lo(ultra_bss+0x25B8)
/*0x803288C4*/  jal     osCreateMesgQueue
/*0x803288C8*/  li      $a2, 0x0001
/*0x803288CC*/  lui     $a0, %hi(ultra_bss+0x25B8)
/*0x803288D0*/  addiu   $a0, $a0, %lo(ultra_bss+0x25B8)
/*0x803288D4*/  move    $a1, $0
/*0x803288D8*/  jal     osSendMesg
/*0x803288DC*/  move    $a2, $0
/*0x803288E0*/  lw      $ra, 0x0014($sp)
/*0x803288E4*/  addiu   $sp, $sp, 0x0018
/*0x803288E8*/  jr      $ra
/*0x803288EC*/  nop

/* 0x803288F0 */
.globl __osSiGetAccess
__osSiGetAccess:
/*0x803288F0*/  lui     $t6, %hi(__osSiAccessQueueEnabled)
/*0x803288F4*/  lw      $t6, %lo(__osSiAccessQueueEnabled)($t6)
/*0x803288F8*/  addiu   $sp, $sp, -0x0020
/*0x803288FC*/  sw      $ra, 0x0014($sp)
/*0x80328900*/  bnez    $t6, .L80328910
/*0x80328904*/  nop
/*0x80328908*/  jal     __osSiCreateAccessQueue
/*0x8032890C*/  nop
.L80328910:
/*0x80328910*/  lui     $a0, %hi(ultra_bss+0x25B8)
/*0x80328914*/  addiu   $a0, $a0, %lo(ultra_bss+0x25B8)
/*0x80328918*/  addiu   $a1, $sp, 0x001C
/*0x8032891C*/  jal     osRecvMesg
/*0x80328920*/  li      $a2, 0x0001
/*0x80328924*/  lw      $ra, 0x0014($sp)
/*0x80328928*/  addiu   $sp, $sp, 0x0020
/*0x8032892C*/  jr      $ra
/*0x80328930*/  nop

/* 0x80328934 */
.globl __osSiRelAccess
__osSiRelAccess:
/*0x80328934*/  addiu   $sp, $sp, -0x0018
/*0x80328938*/  sw      $ra, 0x0014($sp)
/*0x8032893C*/  lui     $a0, %hi(ultra_bss+0x25B8)
/*0x80328940*/  addiu   $a0, $a0, %lo(ultra_bss+0x25B8)
/*0x80328944*/  move    $a1, $0
/*0x80328948*/  jal     osSendMesg
/*0x8032894C*/  move    $a2, $0
/*0x80328950*/  lw      $ra, 0x0014($sp)
/*0x80328954*/  addiu   $sp, $sp, 0x0018
/*0x80328958*/  jr      $ra
/*0x8032895C*/  nop
