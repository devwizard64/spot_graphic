#include <ultra64.h>

.set noreorder
.set noat

/* 0x803283F0 */
.globl __osPiCreateAccessQueue
__osPiCreateAccessQueue:
/*0x803283F0*/  addiu   $sp, $sp, -0x0018
/*0x803283F4*/  sw      $ra, 0x0014($sp)
/*0x803283F8*/  li      $t6, 0x0001
/*0x803283FC*/  lui     $at, %hi(__osPiAccessQueueEnabled)
/*0x80328400*/  lui     $a0, %hi(ultra_bss+0x2598)
/*0x80328404*/  lui     $a1, %hi(ultra_bss+0x2590)
/*0x80328408*/  sw      $t6, %lo(__osPiAccessQueueEnabled)($at)
/*0x8032840C*/  addiu   $a1, $a1, %lo(ultra_bss+0x2590)
/*0x80328410*/  addiu   $a0, $a0, %lo(ultra_bss+0x2598)
/*0x80328414*/  jal     osCreateMesgQueue
/*0x80328418*/  li      $a2, 0x0001
/*0x8032841C*/  lui     $a0, %hi(ultra_bss+0x2598)
/*0x80328420*/  addiu   $a0, $a0, %lo(ultra_bss+0x2598)
/*0x80328424*/  move    $a1, $0
/*0x80328428*/  jal     osSendMesg
/*0x8032842C*/  move    $a2, $0
/*0x80328430*/  lw      $ra, 0x0014($sp)
/*0x80328434*/  addiu   $sp, $sp, 0x0018
/*0x80328438*/  jr      $ra
/*0x8032843C*/  nop

/* 0x80328440 */
__osPiGetAccess:
/*0x80328440*/  lui     $t6, %hi(__osPiAccessQueueEnabled)
/*0x80328444*/  lw      $t6, %lo(__osPiAccessQueueEnabled)($t6)
/*0x80328448*/  addiu   $sp, $sp, -0x0020
/*0x8032844C*/  sw      $ra, 0x0014($sp)
/*0x80328450*/  bnez    $t6, .L80328460
/*0x80328454*/  nop
/*0x80328458*/  jal     __osPiCreateAccessQueue
/*0x8032845C*/  nop
.L80328460:
/*0x80328460*/  lui     $a0, %hi(ultra_bss+0x2598)
/*0x80328464*/  addiu   $a0, $a0, %lo(ultra_bss+0x2598)
/*0x80328468*/  addiu   $a1, $sp, 0x001C
/*0x8032846C*/  jal     osRecvMesg
/*0x80328470*/  li      $a2, 0x0001
/*0x80328474*/  lw      $ra, 0x0014($sp)
/*0x80328478*/  addiu   $sp, $sp, 0x0020
/*0x8032847C*/  jr      $ra
/*0x80328480*/  nop

/* 0x80328484 */
__osPiRelAccess:
/*0x80328484*/  addiu   $sp, $sp, -0x0018
/*0x80328488*/  sw      $ra, 0x0014($sp)
/*0x8032848C*/  lui     $a0, %hi(ultra_bss+0x2598)
/*0x80328490*/  addiu   $a0, $a0, %lo(ultra_bss+0x2598)
/*0x80328494*/  move    $a1, $0
/*0x80328498*/  jal     osSendMesg
/*0x8032849C*/  move    $a2, $0
/*0x803284A0*/  lw      $ra, 0x0014($sp)
/*0x803284A4*/  addiu   $sp, $sp, 0x0018
/*0x803284A8*/  jr      $ra
/*0x803284AC*/  nop
