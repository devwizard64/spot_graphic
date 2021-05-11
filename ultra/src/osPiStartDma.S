#include <ultra64.h>

.set noreorder
.set noat

/* 0x80324460   void osPiStartDma(
    OSIoMesg *mb,
    s32 priority,
    s32 direction,
    u32 devAddr,
    void *vAddr,
    u32 nbytes,
    OSMesgQueue *mq
) */
.globl osPiStartDma
osPiStartDma:
/*0x80324460*/  addiu   $sp, $sp, -0x0028
/*0x80324464*/  lui     $t6, %hi(__osPiDevMgr+0x00)
/*0x80324468*/  lw      $t6, %lo(__osPiDevMgr+0x00)($t6)
/*0x8032446C*/  sw      $ra, 0x001C($sp)
/*0x80324470*/  sw      $a0, 0x0028($sp)
/*0x80324474*/  sw      $a1, 0x002C($sp)
/*0x80324478*/  sw      $a2, 0x0030($sp)
/*0x8032447C*/  sw      $a3, 0x0034($sp)
/*0x80324480*/  sw      $s1, 0x0018($sp)
/*0x80324484*/  bnez    $t6, .L80324494
/*0x80324488*/  sw      $s0, 0x0014($sp)
/*0x8032448C*/  b       .L80324550
/*0x80324490*/  li      $v0, -0x0001
.L80324494:
/*0x80324494*/  lw      $t7, 0x0030($sp)
/*0x80324498*/  bnez    $t7, .L803244B0
/*0x8032449C*/  nop
/*0x803244A0*/  lw      $t9, 0x0028($sp)
/*0x803244A4*/  li      $t8, 0x000B
/*0x803244A8*/  b       .L803244BC
/*0x803244AC*/  sh      $t8, 0x0000($t9)
.L803244B0:
/*0x803244B0*/  lw      $t1, 0x0028($sp)
/*0x803244B4*/  li      $t0, 0x000C
/*0x803244B8*/  sh      $t0, 0x0000($t1)
.L803244BC:
/*0x803244BC*/  lw      $t2, 0x002C($sp)
/*0x803244C0*/  lw      $t3, 0x0028($sp)
/*0x803244C4*/  li      $at, 0x0001
/*0x803244C8*/  sb      $t2, 0x0002($t3)
/*0x803244CC*/  lw      $t5, 0x0028($sp)
/*0x803244D0*/  lw      $t4, 0x0040($sp)
/*0x803244D4*/  sw      $t4, 0x0004($t5)
/*0x803244D8*/  lw      $t7, 0x0028($sp)
/*0x803244DC*/  lw      $t6, 0x0038($sp)
/*0x803244E0*/  sw      $t6, 0x0008($t7)
/*0x803244E4*/  lw      $t9, 0x0028($sp)
/*0x803244E8*/  lw      $t8, 0x0034($sp)
/*0x803244EC*/  sw      $t8, 0x000C($t9)
/*0x803244F0*/  lw      $t1, 0x0028($sp)
/*0x803244F4*/  lw      $t0, 0x003C($sp)
/*0x803244F8*/  sw      $t0, 0x0010($t1)
/*0x803244FC*/  lw      $t2, 0x002C($sp)
/*0x80324500*/  bne     $t2, $at, .L8032452C
/*0x80324504*/  nop
/*0x80324508*/  jal     osPiGetCmdQueue
/*0x8032450C*/  nop
/*0x80324510*/  move    $s1, $v0
/*0x80324514*/  move    $a0, $s1
/*0x80324518*/  lw      $a1, 0x0028($sp)
/*0x8032451C*/  jal     osJamMesg
/*0x80324520*/  move    $a2, $0
/*0x80324524*/  b       .L8032454C
/*0x80324528*/  move    $s0, $v0
.L8032452C:
/*0x8032452C*/  jal     osPiGetCmdQueue
/*0x80324530*/  nop
/*0x80324534*/  move    $s1, $v0
/*0x80324538*/  move    $a0, $s1
/*0x8032453C*/  lw      $a1, 0x0028($sp)
/*0x80324540*/  jal     osSendMesg
/*0x80324544*/  move    $a2, $0
/*0x80324548*/  move    $s0, $v0
.L8032454C:
/*0x8032454C*/  move    $v0, $s0
.L80324550:
/*0x80324550*/  lw      $ra, 0x001C($sp)
/*0x80324554*/  lw      $s0, 0x0014($sp)
/*0x80324558*/  lw      $s1, 0x0018($sp)
/*0x8032455C*/  jr      $ra
/*0x80324560*/  addiu   $sp, $sp, 0x0028
