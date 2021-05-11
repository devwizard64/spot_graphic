#include <ultra64.h>

.set noreorder
.set noat

/* 0x80322DF0   void osStartThread(OSThread *t) */
.globl osStartThread
osStartThread:
/*0x80322DF0*/  addiu   $sp, $sp, -0x0028
/*0x80322DF4*/  sw      $ra, 0x001C($sp)
/*0x80322DF8*/  sw      $a0, 0x0028($sp)
/*0x80322DFC*/  sw      $s1, 0x0018($sp)
/*0x80322E00*/  jal     __osDisableInt
/*0x80322E04*/  sw      $s0, 0x0014($sp)
/*0x80322E08*/  lw      $t6, 0x0028($sp)
/*0x80322E0C*/  li      $at, 0x0001
/*0x80322E10*/  move    $s0, $v0
/*0x80322E14*/  lhu     $s1, 0x0010($t6)
/*0x80322E18*/  beq     $s1, $at, .L80322E4C
/*0x80322E1C*/  li      $at, 0x0008
/*0x80322E20*/  bne     $s1, $at, .L80322ECC
/*0x80322E24*/  nop
/*0x80322E28*/  lw      $t8, 0x0028($sp)
/*0x80322E2C*/  li      $t7, 0x0002
/*0x80322E30*/  lui     $a0, %hi(__osRunQueue)
/*0x80322E34*/  sh      $t7, 0x0010($t8)
/*0x80322E38*/  lw      $a1, 0x0028($sp)
/*0x80322E3C*/  jal     __osEnqueueThread
/*0x80322E40*/  addiu   $a0, $a0, %lo(__osRunQueue)
/*0x80322E44*/  b       .L80322ECC
/*0x80322E48*/  nop
.L80322E4C:
/*0x80322E4C*/  lw      $t9, 0x0028($sp)
/*0x80322E50*/  lw      $t0, 0x0008($t9)
/*0x80322E54*/  beqz    $t0, .L80322E6C
/*0x80322E58*/  nop
/*0x80322E5C*/  lui     $t1, %hi(__osRunQueue)
/*0x80322E60*/  addiu   $t1, $t1, %lo(__osRunQueue)
/*0x80322E64*/  bne     $t0, $t1, .L80322E90
/*0x80322E68*/  nop
.L80322E6C:
/*0x80322E6C*/  lw      $t3, 0x0028($sp)
/*0x80322E70*/  li      $t2, 0x0002
/*0x80322E74*/  lui     $a0, %hi(__osRunQueue)
/*0x80322E78*/  sh      $t2, 0x0010($t3)
/*0x80322E7C*/  lw      $a1, 0x0028($sp)
/*0x80322E80*/  jal     __osEnqueueThread
/*0x80322E84*/  addiu   $a0, $a0, %lo(__osRunQueue)
/*0x80322E88*/  b       .L80322ECC
/*0x80322E8C*/  nop
.L80322E90:
/*0x80322E90*/  lw      $t5, 0x0028($sp)
/*0x80322E94*/  li      $t4, 0x0008
/*0x80322E98*/  sh      $t4, 0x0010($t5)
/*0x80322E9C*/  lw      $t6, 0x0028($sp)
/*0x80322EA0*/  lw      $a0, 0x0008($t6)
/*0x80322EA4*/  jal     __osEnqueueThread
/*0x80322EA8*/  move    $a1, $t6
/*0x80322EAC*/  lw      $t7, 0x0028($sp)
/*0x80322EB0*/  jal     __osPopThread
/*0x80322EB4*/  lw      $a0, 0x0008($t7)
/*0x80322EB8*/  move    $s1, $v0
/*0x80322EBC*/  lui     $a0, %hi(__osRunQueue)
/*0x80322EC0*/  addiu   $a0, $a0, %lo(__osRunQueue)
/*0x80322EC4*/  jal     __osEnqueueThread
/*0x80322EC8*/  move    $a1, $s1
.L80322ECC:
/*0x80322ECC*/  lui     $t8, %hi(__osRunningThread)
/*0x80322ED0*/  lw      $t8, %lo(__osRunningThread)($t8)
/*0x80322ED4*/  bnez    $t8, .L80322EEC
/*0x80322ED8*/  nop
/*0x80322EDC*/  jal     __osDispatchThread
/*0x80322EE0*/  nop
/*0x80322EE4*/  b       .L80322F24
/*0x80322EE8*/  nop
.L80322EEC:
/*0x80322EEC*/  lui     $t9, %hi(__osRunningThread)
/*0x80322EF0*/  lui     $t1, %hi(__osRunQueue)
/*0x80322EF4*/  lw      $t1, %lo(__osRunQueue)($t1)
/*0x80322EF8*/  lw      $t9, %lo(__osRunningThread)($t9)
/*0x80322EFC*/  lw      $t2, 0x0004($t1)
/*0x80322F00*/  lw      $t0, 0x0004($t9)
/*0x80322F04*/  slt     $at, $t0, $t2
/*0x80322F08*/  beqz    $at, .L80322F24
/*0x80322F0C*/  nop
/*0x80322F10*/  li      $t3, 0x0002
/*0x80322F14*/  lui     $a0, %hi(__osRunQueue)
/*0x80322F18*/  sh      $t3, 0x0010($t9)
/*0x80322F1C*/  jal     __osEnqueueAndYield
/*0x80322F20*/  addiu   $a0, $a0, %lo(__osRunQueue)
.L80322F24:
/*0x80322F24*/  jal     __osRestoreInt
/*0x80322F28*/  move    $a0, $s0
/*0x80322F2C*/  lw      $ra, 0x001C($sp)
/*0x80322F30*/  lw      $s0, 0x0014($sp)
/*0x80322F34*/  lw      $s1, 0x0018($sp)
/*0x80322F38*/  jr      $ra
/*0x80322F3C*/  addiu   $sp, $sp, 0x0028
