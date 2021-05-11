#include <ultra64.h>

.set noreorder
.set noat

/* 0x803236F0   void osSetThreadPri(OSThread *t, OSPri pri) */
.globl osSetThreadPri
osSetThreadPri:
/*0x803236F0*/  addiu   $sp, $sp, -0x0028
/*0x803236F4*/  sw      $ra, 0x001C($sp)
/*0x803236F8*/  sw      $a0, 0x0028($sp)
/*0x803236FC*/  sw      $a1, 0x002C($sp)
/*0x80323700*/  jal     __osDisableInt
/*0x80323704*/  sw      $s0, 0x0018($sp)
/*0x80323708*/  lw      $t6, 0x0028($sp)
/*0x8032370C*/  move    $s0, $v0
/*0x80323710*/  bnez    $t6, .L80323724
/*0x80323714*/  nop
/*0x80323718*/  lui     $t7, %hi(__osRunningThread)
/*0x8032371C*/  lw      $t7, %lo(__osRunningThread)($t7)
/*0x80323720*/  sw      $t7, 0x0028($sp)
.L80323724:
/*0x80323724*/  lw      $t8, 0x0028($sp)
/*0x80323728*/  lw      $t0, 0x002C($sp)
/*0x8032372C*/  lw      $t9, 0x0004($t8)
/*0x80323730*/  beq     $t9, $t0, .L803237B4
/*0x80323734*/  nop
/*0x80323738*/  sw      $t0, 0x0004($t8)
/*0x8032373C*/  lui     $t2, %hi(__osRunningThread)
/*0x80323740*/  lw      $t2, %lo(__osRunningThread)($t2)
/*0x80323744*/  lw      $t1, 0x0028($sp)
/*0x80323748*/  beq     $t1, $t2, .L8032377C
/*0x8032374C*/  nop
/*0x80323750*/  lhu     $t3, 0x0010($t1)
/*0x80323754*/  li      $at, 0x0001
/*0x80323758*/  beq     $t3, $at, .L8032377C
/*0x8032375C*/  nop
/*0x80323760*/  lw      $a0, 0x0008($t1)
/*0x80323764*/  jal     __osDequeueThread
/*0x80323768*/  move    $a1, $t1
/*0x8032376C*/  lw      $t4, 0x0028($sp)
/*0x80323770*/  lw      $a0, 0x0008($t4)
/*0x80323774*/  jal     __osEnqueueThread
/*0x80323778*/  move    $a1, $t4
.L8032377C:
/*0x8032377C*/  lui     $t5, %hi(__osRunningThread)
/*0x80323780*/  lui     $t7, %hi(__osRunQueue)
/*0x80323784*/  lw      $t7, %lo(__osRunQueue)($t7)
/*0x80323788*/  lw      $t5, %lo(__osRunningThread)($t5)
/*0x8032378C*/  lw      $t9, 0x0004($t7)
/*0x80323790*/  lw      $t6, 0x0004($t5)
/*0x80323794*/  slt     $at, $t6, $t9
/*0x80323798*/  beqz    $at, .L803237B4
/*0x8032379C*/  nop
/*0x803237A0*/  li      $t0, 0x0002
/*0x803237A4*/  lui     $a0, %hi(__osRunQueue)
/*0x803237A8*/  sh      $t0, 0x0010($t5)
/*0x803237AC*/  jal     __osEnqueueAndYield
/*0x803237B0*/  addiu   $a0, $a0, %lo(__osRunQueue)
.L803237B4:
/*0x803237B4*/  jal     __osRestoreInt
/*0x803237B8*/  move    $a0, $s0
/*0x803237BC*/  lw      $ra, 0x001C($sp)
/*0x803237C0*/  lw      $s0, 0x0018($sp)
/*0x803237C4*/  addiu   $sp, $sp, 0x0028
/*0x803237C8*/  jr      $ra
/*0x803237CC*/  nop
