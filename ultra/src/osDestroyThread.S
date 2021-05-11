#include <ultra64.h>

.set noreorder
.set noat

/* 0x8032AE70   void osDestroyThread(OSThread *t) */
.globl osDestroyThread
osDestroyThread:
/*0x8032AE70*/  addiu   $sp, $sp, -0x0038
/*0x8032AE74*/  sw      $ra, 0x0024($sp)
/*0x8032AE78*/  sw      $a0, 0x0038($sp)
/*0x8032AE7C*/  sw      $s2, 0x0020($sp)
/*0x8032AE80*/  sw      $s1, 0x001C($sp)
/*0x8032AE84*/  jal     __osDisableInt
/*0x8032AE88*/  sw      $s0, 0x0018($sp)
/*0x8032AE8C*/  lw      $t6, 0x0038($sp)
/*0x8032AE90*/  move    $s0, $v0
/*0x8032AE94*/  bnez    $t6, .L8032AEAC
/*0x8032AE98*/  nop
/*0x8032AE9C*/  lui     $t7, %hi(__osRunningThread)
/*0x8032AEA0*/  lw      $t7, %lo(__osRunningThread)($t7)
/*0x8032AEA4*/  b       .L8032AECC
/*0x8032AEA8*/  sw      $t7, 0x0038($sp)
.L8032AEAC:
/*0x8032AEAC*/  lw      $t8, 0x0038($sp)
/*0x8032AEB0*/  li      $at, 0x0001
/*0x8032AEB4*/  lhu     $t9, 0x0010($t8)
/*0x8032AEB8*/  beq     $t9, $at, .L8032AECC
/*0x8032AEBC*/  nop
/*0x8032AEC0*/  lw      $a0, 0x0008($t8)
/*0x8032AEC4*/  jal     __osDequeueThread
/*0x8032AEC8*/  move    $a1, $t8
.L8032AECC:
/*0x8032AECC*/  lui     $t0, %hi(__osActiveQueue)
/*0x8032AED0*/  lw      $t0, %lo(__osActiveQueue)($t0)
/*0x8032AED4*/  lw      $t1, 0x0038($sp)
/*0x8032AED8*/  bne     $t0, $t1, .L8032AEF0
/*0x8032AEDC*/  nop
/*0x8032AEE0*/  lw      $t2, 0x000C($t0)
/*0x8032AEE4*/  lui     $at, %hi(__osActiveQueue)
/*0x8032AEE8*/  b       .L8032AF2C
/*0x8032AEEC*/  sw      $t2, %lo(__osActiveQueue)($at)
.L8032AEF0:
/*0x8032AEF0*/  lui     $s1, %hi(__osActiveQueue)
/*0x8032AEF4*/  lw      $s1, %lo(__osActiveQueue)($s1)
/*0x8032AEF8*/  lw      $s2, 0x000C($s1)
/*0x8032AEFC*/  beqz    $s2, .L8032AF2C
/*0x8032AF00*/  nop
.L8032AF04:
/*0x8032AF04*/  lw      $t3, 0x0038($sp)
/*0x8032AF08*/  bne     $s2, $t3, .L8032AF1C
/*0x8032AF0C*/  nop
/*0x8032AF10*/  lw      $t4, 0x000C($t3)
/*0x8032AF14*/  b       .L8032AF2C
/*0x8032AF18*/  sw      $t4, 0x000C($s1)
.L8032AF1C:
/*0x8032AF1C*/  move    $s1, $s2
/*0x8032AF20*/  lw      $s2, 0x000C($s1)
/*0x8032AF24*/  bnez    $s2, .L8032AF04
/*0x8032AF28*/  nop
.L8032AF2C:
/*0x8032AF2C*/  lui     $t6, %hi(__osRunningThread)
/*0x8032AF30*/  lw      $t6, %lo(__osRunningThread)($t6)
/*0x8032AF34*/  lw      $t5, 0x0038($sp)
/*0x8032AF38*/  bne     $t5, $t6, .L8032AF48
/*0x8032AF3C*/  nop
/*0x8032AF40*/  jal     __osDispatchThread
/*0x8032AF44*/  nop
.L8032AF48:
/*0x8032AF48*/  jal     __osRestoreInt
/*0x8032AF4C*/  move    $a0, $s0
/*0x8032AF50*/  lw      $ra, 0x0024($sp)
/*0x8032AF54*/  lw      $s0, 0x0018($sp)
/*0x8032AF58*/  lw      $s1, 0x001C($sp)
/*0x8032AF5C*/  lw      $s2, 0x0020($sp)
/*0x8032AF60*/  jr      $ra
/*0x8032AF64*/  addiu   $sp, $sp, 0x0038
