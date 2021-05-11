#include <ultra64.h>

.set noreorder
.set noat

/* 0x80323570   void osCreatePiManager(
    OSPri pri,
    OSMesgQueue *cmdQ,
    OSMesg *cmdBuf,
    s32 cmdMsgCnt
) */
.globl osCreatePiManager
osCreatePiManager:
/*0x80323570*/  addiu   $sp, $sp, -0x0030
/*0x80323574*/  lui     $t6, %hi(__osPiDevMgr+0x00)
/*0x80323578*/  lw      $t6, %lo(__osPiDevMgr+0x00)($t6)
/*0x8032357C*/  sw      $ra, 0x001C($sp)
/*0x80323580*/  sw      $a0, 0x0030($sp)
/*0x80323584*/  sw      $a1, 0x0034($sp)
/*0x80323588*/  sw      $a2, 0x0038($sp)
/*0x8032358C*/  bnez    $t6, .L803236DC
/*0x80323590*/  sw      $a3, 0x003C($sp)
/*0x80323594*/  lw      $a0, 0x0034($sp)
/*0x80323598*/  lw      $a1, 0x0038($sp)
/*0x8032359C*/  jal     osCreateMesgQueue
/*0x803235A0*/  lw      $a2, 0x003C($sp)
/*0x803235A4*/  lui     $a0, %hi(ultra_bss+0x2480)
/*0x803235A8*/  lui     $a1, %hi(ultra_bss+0x2498)
/*0x803235AC*/  addiu   $a1, $a1, %lo(ultra_bss+0x2498)
/*0x803235B0*/  addiu   $a0, $a0, %lo(ultra_bss+0x2480)
/*0x803235B4*/  jal     osCreateMesgQueue
/*0x803235B8*/  li      $a2, 0x0001
/*0x803235BC*/  lui     $t7, %hi(__osPiAccessQueueEnabled)
/*0x803235C0*/  lw      $t7, %lo(__osPiAccessQueueEnabled)($t7)
/*0x803235C4*/  bnez    $t7, .L803235D4
/*0x803235C8*/  nop
/*0x803235CC*/  jal     __osPiCreateAccessQueue
/*0x803235D0*/  nop
.L803235D4:
/*0x803235D4*/  lui     $a1, %hi(ultra_bss+0x2480)
/*0x803235D8*/  lui     $a2, 0x22222222 >> 16
/*0x803235DC*/  ori     $a2, $a2, 0x22222222 & 0xFFFF
/*0x803235E0*/  addiu   $a1, $a1, %lo(ultra_bss+0x2480)
/*0x803235E4*/  jal     osSetEventMesg
/*0x803235E8*/  li      $a0, 0x0008
/*0x803235EC*/  li      $t8, -0x0001
/*0x803235F0*/  sw      $t8, 0x0028($sp)
/*0x803235F4*/  jal     osGetThreadPri
/*0x803235F8*/  move    $a0, $0
/*0x803235FC*/  sw      $v0, 0x0024($sp)
/*0x80323600*/  lw      $t9, 0x0024($sp)
/*0x80323604*/  lw      $t0, 0x0030($sp)
/*0x80323608*/  slt     $at, $t9, $t0
/*0x8032360C*/  beqz    $at, .L80323624
/*0x80323610*/  nop
/*0x80323614*/  sw      $t9, 0x0028($sp)
/*0x80323618*/  move    $a0, $0
/*0x8032361C*/  jal     osSetThreadPri
/*0x80323620*/  move    $a1, $t0
.L80323624:
/*0x80323624*/  jal     __osDisableInt
/*0x80323628*/  nop
/*0x8032362C*/  lui     $at, %hi(__osPiDevMgr+0x08)
/*0x80323630*/  lw      $t3, 0x0034($sp)
/*0x80323634*/  lui     $t2, %hi(ultra_bss+0x12D0)
/*0x80323638*/  lui     $t4, %hi(ultra_bss+0x2480)
/*0x8032363C*/  li      $t1, 0x0001
/*0x80323640*/  addiu   $t2, $t2, %lo(ultra_bss+0x12D0)
/*0x80323644*/  addiu   $t4, $t4, %lo(ultra_bss+0x2480)
/*0x80323648*/  lui     $t7, %hi(ultra_bss+0x1480)
/*0x8032364C*/  lw      $t9, 0x0030($sp)
/*0x80323650*/  sw      $t1, %lo(__osPiDevMgr+0x00)($at)
/*0x80323654*/  sw      $t2, %lo(__osPiDevMgr+0x04)($at)
/*0x80323658*/  sw      $t4, %lo(__osPiDevMgr+0x0C)($at)
/*0x8032365C*/  lui     $t5, %hi(ultra_bss+0x2598)
/*0x80323660*/  lui     $t6, %hi(osPiRawStartDma)
/*0x80323664*/  addiu   $t7, $t7, %lo(ultra_bss+0x1480)
/*0x80323668*/  sw      $t3, %lo(__osPiDevMgr+0x08)($at)
/*0x8032366C*/  lui     $at, %hi(__osPiDevMgr+0x14)
/*0x80323670*/  addiu   $t5, $t5, %lo(ultra_bss+0x2598)
/*0x80323674*/  addiu   $t6, $t6, %lo(osPiRawStartDma)
/*0x80323678*/  addiu   $t8, $t7, 0x1000
/*0x8032367C*/  lui     $a2, %hi(__osDevMgrMain)
/*0x80323680*/  lui     $a3, %hi(__osPiDevMgr+0x00)
/*0x80323684*/  sw      $v0, 0x002C($sp)
/*0x80323688*/  sw      $t5, %lo(__osPiDevMgr+0x10)($at)
/*0x8032368C*/  sw      $t6, %lo(__osPiDevMgr+0x14)($at)
/*0x80323690*/  addiu   $a3, $a3, %lo(__osPiDevMgr+0x00)
/*0x80323694*/  addiu   $a2, $a2, %lo(__osDevMgrMain)
/*0x80323698*/  sw      $t8, 0x0010($sp)
/*0x8032369C*/  move    $a0, $t2
/*0x803236A0*/  move    $a1, $0
/*0x803236A4*/  jal     osCreateThread
/*0x803236A8*/  sw      $t9, 0x0014($sp)
/*0x803236AC*/  lui     $a0, %hi(ultra_bss+0x12D0)
/*0x803236B0*/  jal     osStartThread
/*0x803236B4*/  addiu   $a0, $a0, %lo(ultra_bss+0x12D0)
/*0x803236B8*/  jal     __osRestoreInt
/*0x803236BC*/  lw      $a0, 0x002C($sp)
/*0x803236C0*/  lw      $t0, 0x0028($sp)
/*0x803236C4*/  li      $at, -0x0001
/*0x803236C8*/  beq     $t0, $at, .L803236DC
/*0x803236CC*/  nop
/*0x803236D0*/  move    $a0, $0
/*0x803236D4*/  jal     osSetThreadPri
/*0x803236D8*/  move    $a1, $t0
.L803236DC:
/*0x803236DC*/  lw      $ra, 0x001C($sp)
/*0x803236E0*/  addiu   $sp, $sp, 0x0030
/*0x803236E4*/  jr      $ra
/*0x803236E8*/  nop
