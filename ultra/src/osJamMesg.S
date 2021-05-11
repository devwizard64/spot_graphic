#include <ultra64.h>

.set noreorder
.set noat

/* 0x80328FD0   void osJamMesg(OSMesgQueue *mq, OSMesg msg, s32 flag) */
.globl osJamMesg
osJamMesg:
/*0x80328FD0*/  addiu   $sp, $sp, -0x0028
/*0x80328FD4*/  sw      $ra, 0x001C($sp)
/*0x80328FD8*/  sw      $a0, 0x0028($sp)
/*0x80328FDC*/  sw      $a1, 0x002C($sp)
/*0x80328FE0*/  sw      $a2, 0x0030($sp)
/*0x80328FE4*/  sw      $s1, 0x0018($sp)
/*0x80328FE8*/  jal     __osDisableInt
/*0x80328FEC*/  sw      $s0, 0x0014($sp)
/*0x80328FF0*/  lw      $t6, 0x0028($sp)
/*0x80328FF4*/  move    $s0, $v0
/*0x80328FF8*/  lw      $t7, 0x0008($t6)
/*0x80328FFC*/  lw      $t8, 0x0010($t6)
/*0x80329000*/  slt     $at, $t7, $t8
/*0x80329004*/  bnez    $at, .L80329068
/*0x80329008*/  nop
.L8032900C:
/*0x8032900C*/  lw      $t9, 0x0030($sp)
/*0x80329010*/  li      $at, 0x0001
/*0x80329014*/  bne     $t9, $at, .L80329040
/*0x80329018*/  nop
/*0x8032901C*/  lui     $t1, %hi(__osRunningThread)
/*0x80329020*/  lw      $t1, %lo(__osRunningThread)($t1)
/*0x80329024*/  li      $t0, 0x0008
/*0x80329028*/  sh      $t0, 0x0010($t1)
/*0x8032902C*/  lw      $a0, 0x0028($sp)
/*0x80329030*/  jal     __osEnqueueAndYield
/*0x80329034*/  addiu   $a0, $a0, 0x0004
/*0x80329038*/  b       .L80329050
/*0x8032903C*/  nop
.L80329040:
/*0x80329040*/  jal     __osRestoreInt
/*0x80329044*/  move    $a0, $s0
/*0x80329048*/  b       .L8032910C
/*0x8032904C*/  li      $v0, -0x0001
.L80329050:
/*0x80329050*/  lw      $t2, 0x0028($sp)
/*0x80329054*/  lw      $t3, 0x0008($t2)
/*0x80329058*/  lw      $t4, 0x0010($t2)
/*0x8032905C*/  slt     $at, $t3, $t4
/*0x80329060*/  beqz    $at, .L8032900C
/*0x80329064*/  nop
.L80329068:
/*0x80329068*/  lw      $t5, 0x0028($sp)
/*0x8032906C*/  lw      $t6, 0x000C($t5)
/*0x80329070*/  lw      $t7, 0x0010($t5)
/*0x80329074*/  addu    $t8, $t6, $t7
/*0x80329078*/  addiu   $t9, $t8, -0x0001
/*0x8032907C*/  div     $0, $t9, $t7
/*0x80329080*/  mfhi    $t0
/*0x80329084*/  sw      $t0, 0x000C($t5)
/*0x80329088*/  lw      $t2, 0x0028($sp)
/*0x8032908C*/  lw      $t1, 0x002C($sp)
/*0x80329090*/  bnez    $t7, .L8032909C
/*0x80329094*/  nop
/*0x80329098*/  break   7
.L8032909C:
/*0x8032909C*/  li      $at, -0x0001
/*0x803290A0*/  bne     $t7, $at, .L803290B4
/*0x803290A4*/  li      $at, 0x80000000
/*0x803290A8*/  bne     $t9, $at, .L803290B4
/*0x803290AC*/  nop
/*0x803290B0*/  break   6
.L803290B4:
/*0x803290B4*/  lw      $t4, 0x000C($t2)
/*0x803290B8*/  lw      $t3, 0x0014($t2)
/*0x803290BC*/  sll     $t6, $t4, 2
/*0x803290C0*/  addu    $t8, $t3, $t6
/*0x803290C4*/  sw      $t1, 0x0000($t8)
/*0x803290C8*/  lw      $t9, 0x0028($sp)
/*0x803290CC*/  lw      $t7, 0x0008($t9)
/*0x803290D0*/  addiu   $t0, $t7, 0x0001
/*0x803290D4*/  sw      $t0, 0x0008($t9)
/*0x803290D8*/  lw      $t5, 0x0028($sp)
/*0x803290DC*/  lw      $t2, 0x0000($t5)
/*0x803290E0*/  lw      $t4, 0x0000($t2)
/*0x803290E4*/  beqz    $t4, .L80329100
/*0x803290E8*/  nop
/*0x803290EC*/  jal     __osPopThread
/*0x803290F0*/  move    $a0, $t5
/*0x803290F4*/  move    $s1, $v0
/*0x803290F8*/  jal     osStartThread
/*0x803290FC*/  move    $a0, $s1
.L80329100:
/*0x80329100*/  jal     __osRestoreInt
/*0x80329104*/  move    $a0, $s0
/*0x80329108*/  move    $v0, $0
.L8032910C:
/*0x8032910C*/  lw      $ra, 0x001C($sp)
/*0x80329110*/  lw      $s0, 0x0014($sp)
/*0x80329114*/  lw      $s1, 0x0018($sp)
/*0x80329118*/  jr      $ra
/*0x8032911C*/  addiu   $sp, $sp, 0x0028
