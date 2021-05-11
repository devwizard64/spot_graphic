#include <ultra64.h>

.set noreorder
.set noat

/* 0x80322C20   void osSendMesg(OSMesgQueue *mq, OSMesg msg, s32 flag) */
.globl osSendMesg
osSendMesg:
/*0x80322C20*/  addiu   $sp, $sp, -0x0038
/*0x80322C24*/  sw      $ra, 0x0024($sp)
/*0x80322C28*/  sw      $a0, 0x0038($sp)
/*0x80322C2C*/  sw      $a1, 0x003C($sp)
/*0x80322C30*/  sw      $a2, 0x0040($sp)
/*0x80322C34*/  sw      $s2, 0x0020($sp)
/*0x80322C38*/  sw      $s1, 0x001C($sp)
/*0x80322C3C*/  jal     __osDisableInt
/*0x80322C40*/  sw      $s0, 0x0018($sp)
/*0x80322C44*/  lw      $t6, 0x0038($sp)
/*0x80322C48*/  move    $s0, $v0
/*0x80322C4C*/  lw      $t7, 0x0008($t6)
/*0x80322C50*/  lw      $t8, 0x0010($t6)
/*0x80322C54*/  slt     $at, $t7, $t8
/*0x80322C58*/  bnez    $at, .L80322CBC
/*0x80322C5C*/  nop
.L80322C60:
/*0x80322C60*/  lw      $t9, 0x0040($sp)
/*0x80322C64*/  li      $at, 0x0001
/*0x80322C68*/  bne     $t9, $at, .L80322C94
/*0x80322C6C*/  nop
/*0x80322C70*/  lui     $t1, %hi(__osRunningThread)
/*0x80322C74*/  lw      $t1, %lo(__osRunningThread)($t1)
/*0x80322C78*/  li      $t0, 0x0008
/*0x80322C7C*/  sh      $t0, 0x0010($t1)
/*0x80322C80*/  lw      $a0, 0x0038($sp)
/*0x80322C84*/  jal     __osEnqueueAndYield
/*0x80322C88*/  addiu   $a0, $a0, 0x0004
/*0x80322C8C*/  b       .L80322CA4
/*0x80322C90*/  nop
.L80322C94:
/*0x80322C94*/  jal     __osRestoreInt
/*0x80322C98*/  move    $a0, $s0
/*0x80322C9C*/  b       .L80322D54
/*0x80322CA0*/  li      $v0, -0x0001
.L80322CA4:
/*0x80322CA4*/  lw      $t2, 0x0038($sp)
/*0x80322CA8*/  lw      $t3, 0x0008($t2)
/*0x80322CAC*/  lw      $t4, 0x0010($t2)
/*0x80322CB0*/  slt     $at, $t3, $t4
/*0x80322CB4*/  beqz    $at, .L80322C60
/*0x80322CB8*/  nop
.L80322CBC:
/*0x80322CBC*/  lw      $t5, 0x0038($sp)
/*0x80322CC0*/  lw      $t0, 0x003C($sp)
/*0x80322CC4*/  lw      $t6, 0x000C($t5)
/*0x80322CC8*/  lw      $t7, 0x0008($t5)
/*0x80322CCC*/  lw      $t9, 0x0010($t5)
/*0x80322CD0*/  lw      $t1, 0x0014($t5)
/*0x80322CD4*/  addu    $t8, $t6, $t7
/*0x80322CD8*/  div     $0, $t8, $t9
/*0x80322CDC*/  mfhi    $s1
/*0x80322CE0*/  sll     $t2, $s1, 2
/*0x80322CE4*/  addu    $t3, $t1, $t2
/*0x80322CE8*/  sw      $t0, 0x0000($t3)
/*0x80322CEC*/  lw      $t4, 0x0038($sp)
/*0x80322CF0*/  bnez    $t9, .L80322CFC
/*0x80322CF4*/  nop
/*0x80322CF8*/  break   7
.L80322CFC:
/*0x80322CFC*/  li      $at, -0x0001
/*0x80322D00*/  bne     $t9, $at, .L80322D14
/*0x80322D04*/  li      $at, 0x80000000
/*0x80322D08*/  bne     $t8, $at, .L80322D14
/*0x80322D0C*/  nop
/*0x80322D10*/  break   6
.L80322D14:
/*0x80322D14*/  lw      $t6, 0x0008($t4)
/*0x80322D18*/  addiu   $t7, $t6, 0x0001
/*0x80322D1C*/  sw      $t7, 0x0008($t4)
/*0x80322D20*/  lw      $t8, 0x0038($sp)
/*0x80322D24*/  lw      $t9, 0x0000($t8)
/*0x80322D28*/  lw      $t5, 0x0000($t9)
/*0x80322D2C*/  beqz    $t5, .L80322D48
/*0x80322D30*/  nop
/*0x80322D34*/  jal     __osPopThread
/*0x80322D38*/  move    $a0, $t8
/*0x80322D3C*/  move    $s2, $v0
/*0x80322D40*/  jal     osStartThread
/*0x80322D44*/  move    $a0, $s2
.L80322D48:
/*0x80322D48*/  jal     __osRestoreInt
/*0x80322D4C*/  move    $a0, $s0
/*0x80322D50*/  move    $v0, $0
.L80322D54:
/*0x80322D54*/  lw      $ra, 0x0024($sp)
/*0x80322D58*/  lw      $s0, 0x0018($sp)
/*0x80322D5C*/  lw      $s1, 0x001C($sp)
/*0x80322D60*/  lw      $s2, 0x0020($sp)
/*0x80322D64*/  jr      $ra
/*0x80322D68*/  addiu   $sp, $sp, 0x0038
