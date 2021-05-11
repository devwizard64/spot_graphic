#include <ultra64.h>

.set noreorder
.set noat

/* 0x80322800   s32 osRecvMesg(OSMesgQueue *mq, OSMesg *msg, s32 flag) */
.globl osRecvMesg
osRecvMesg:
/*0x80322800*/  addiu   $sp, $sp, -0x0028
/*0x80322804*/  sw      $ra, 0x001C($sp)
/*0x80322808*/  sw      $a0, 0x0028($sp)
/*0x8032280C*/  sw      $a1, 0x002C($sp)
/*0x80322810*/  sw      $a2, 0x0030($sp)
/*0x80322814*/  sw      $s1, 0x0018($sp)
/*0x80322818*/  jal     __osDisableInt
/*0x8032281C*/  sw      $s0, 0x0014($sp)
/*0x80322820*/  lw      $t6, 0x0028($sp)
/*0x80322824*/  move    $s0, $v0
/*0x80322828*/  lw      $t7, 0x0008($t6)
/*0x8032282C*/  bnez    $t7, .L80322878
/*0x80322830*/  nop
.L80322834:
/*0x80322834*/  lw      $t8, 0x0030($sp)
/*0x80322838*/  bnez    $t8, .L80322850
/*0x8032283C*/  nop
/*0x80322840*/  jal     __osRestoreInt
/*0x80322844*/  move    $a0, $s0
/*0x80322848*/  b       .L80322924
/*0x8032284C*/  li      $v0, -0x0001
.L80322850:
/*0x80322850*/  lui     $t0, %hi(__osRunningThread)
/*0x80322854*/  lw      $t0, %lo(__osRunningThread)($t0)
/*0x80322858*/  li      $t9, 0x0008
/*0x8032285C*/  sh      $t9, 0x0010($t0)
/*0x80322860*/  jal     __osEnqueueAndYield
/*0x80322864*/  lw      $a0, 0x0028($sp)
/*0x80322868*/  lw      $t1, 0x0028($sp)
/*0x8032286C*/  lw      $t2, 0x0008($t1)
/*0x80322870*/  beqz    $t2, .L80322834
/*0x80322874*/  nop
.L80322878:
/*0x80322878*/  lw      $t3, 0x002C($sp)
/*0x8032287C*/  beqz    $t3, .L803228A0
/*0x80322880*/  nop
/*0x80322884*/  lw      $t4, 0x0028($sp)
/*0x80322888*/  lw      $t6, 0x000C($t4)
/*0x8032288C*/  lw      $t5, 0x0014($t4)
/*0x80322890*/  sll     $t7, $t6, 2
/*0x80322894*/  addu    $t8, $t5, $t7
/*0x80322898*/  lw      $t9, 0x0000($t8)
/*0x8032289C*/  sw      $t9, 0x0000($t3)
.L803228A0:
/*0x803228A0*/  lw      $t0, 0x0028($sp)
/*0x803228A4*/  lw      $t1, 0x000C($t0)
/*0x803228A8*/  lw      $t4, 0x0010($t0)
/*0x803228AC*/  addiu   $t2, $t1, 0x0001
/*0x803228B0*/  div     $0, $t2, $t4
/*0x803228B4*/  mfhi    $t6
/*0x803228B8*/  sw      $t6, 0x000C($t0)
/*0x803228BC*/  lw      $t5, 0x0028($sp)
/*0x803228C0*/  bnez    $t4, .L803228CC
/*0x803228C4*/  nop
/*0x803228C8*/  break   7
.L803228CC:
/*0x803228CC*/  li      $at, -0x0001
/*0x803228D0*/  bne     $t4, $at, .L803228E4
/*0x803228D4*/  li      $at, 0x80000000
/*0x803228D8*/  bne     $t2, $at, .L803228E4
/*0x803228DC*/  nop
/*0x803228E0*/  break   6
.L803228E4:
/*0x803228E4*/  lw      $t7, 0x0008($t5)
/*0x803228E8*/  addiu   $t8, $t7, -0x0001
/*0x803228EC*/  sw      $t8, 0x0008($t5)
/*0x803228F0*/  lw      $t9, 0x0028($sp)
/*0x803228F4*/  lw      $t3, 0x0004($t9)
/*0x803228F8*/  lw      $t1, 0x0000($t3)
/*0x803228FC*/  beqz    $t1, .L80322918
/*0x80322900*/  nop
/*0x80322904*/  jal     __osPopThread
/*0x80322908*/  addiu   $a0, $t9, 0x0004
/*0x8032290C*/  move    $s1, $v0
/*0x80322910*/  jal     osStartThread
/*0x80322914*/  move    $a0, $s1
.L80322918:
/*0x80322918*/  jal     __osRestoreInt
/*0x8032291C*/  move    $a0, $s0
/*0x80322920*/  move    $v0, $0
.L80322924:
/*0x80322924*/  lw      $ra, 0x001C($sp)
/*0x80322928*/  lw      $s0, 0x0014($sp)
/*0x8032292C*/  lw      $s1, 0x0018($sp)
/*0x80322930*/  jr      $ra
/*0x80322934*/  addiu   $sp, $sp, 0x0028
