#include <ultra64.h>

.set noreorder
.set noat

/* 0x803226B0   void osCreateThread(
    OSThread *t,
    OSId id,
    void (*entry)(void *),
    void *arg,
    void *sp,
    OSPri pri
) */
.globl osCreateThread
osCreateThread:
/*0x803226B0*/  addiu   $sp, $sp, -0x0028
/*0x803226B4*/  sw      $a0, 0x0028($sp)
/*0x803226B8*/  sw      $a1, 0x002C($sp)
/*0x803226BC*/  lw      $t6, 0x002C($sp)
/*0x803226C0*/  lw      $t7, 0x0028($sp)
/*0x803226C4*/  sw      $ra, 0x001C($sp)
/*0x803226C8*/  sw      $a2, 0x0030($sp)
/*0x803226CC*/  sw      $a3, 0x0034($sp)
/*0x803226D0*/  sw      $s0, 0x0018($sp)
/*0x803226D4*/  sw      $t6, 0x0014($t7)
/*0x803226D8*/  lw      $t9, 0x0028($sp)
/*0x803226DC*/  lw      $t8, 0x003C($sp)
/*0x803226E0*/  sw      $t8, 0x0004($t9)
/*0x803226E4*/  lw      $t0, 0x0028($sp)
/*0x803226E8*/  sw      $0, 0x0000($t0)
/*0x803226EC*/  lw      $t1, 0x0028($sp)
/*0x803226F0*/  sw      $0, 0x0008($t1)
/*0x803226F4*/  lw      $t3, 0x0028($sp)
/*0x803226F8*/  lw      $t2, 0x0030($sp)
/*0x803226FC*/  sw      $t2, 0x011C($t3)
/*0x80322700*/  lw      $t4, 0x0034($sp)
/*0x80322704*/  lw      $t5, 0x0028($sp)
/*0x80322708*/  move    $t7, $t4
/*0x8032270C*/  sra     $t6, $t4, 31
/*0x80322710*/  sw      $t6, 0x0038($t5)
/*0x80322714*/  sw      $t7, 0x003C($t5)
/*0x80322718*/  lw      $t8, 0x0038($sp)
/*0x8032271C*/  lw      $t9, 0x0028($sp)
/*0x80322720*/  lui     $t4, %hi(__osCleanupThread)
/*0x80322724*/  move    $t1, $t8
/*0x80322728*/  sltiu   $at, $t1, 0x0010
/*0x8032272C*/  sra     $t0, $t8, 31
/*0x80322730*/  subu    $t2, $t0, $at
/*0x80322734*/  addiu   $t3, $t1, -0x0010
/*0x80322738*/  sw      $t3, 0x00F4($t9)
/*0x8032273C*/  sw      $t2, 0x00F0($t9)
/*0x80322740*/  lw      $t5, 0x0028($sp)
/*0x80322744*/  addiu   $t4, $t4, %lo(__osCleanupThread)
/*0x80322748*/  move    $t7, $t4
/*0x8032274C*/  sra     $t6, $t4, 31
/*0x80322750*/  sw      $t6, 0x0100($t5)
/*0x80322754*/  sw      $t7, 0x0104($t5)
/*0x80322758*/  lw      $t1, 0x0028($sp)
/*0x8032275C*/  lui     $t8, 0x003FFF01 >> 16
/*0x80322760*/  ori     $t8, $t8, 0x003FFF01 & 0xFFFF
/*0x80322764*/  sw      $t8, 0x0020($sp)
/*0x80322768*/  li      $t0, 0xFF03
/*0x8032276C*/  sw      $t0, 0x0118($t1)
/*0x80322770*/  lw      $t2, 0x0020($sp)
/*0x80322774*/  lw      $t4, 0x0028($sp)
/*0x80322778*/  li      $at, 0x003F0000
/*0x8032277C*/  and     $t3, $t2, $at
/*0x80322780*/  srl     $t9, $t3, 16
/*0x80322784*/  sw      $t9, 0x0128($t4)
/*0x80322788*/  lw      $t7, 0x0028($sp)
/*0x8032278C*/  lui     $t6, 0x01000800 >> 16
/*0x80322790*/  ori     $t6, $t6, 0x01000800 & 0xFFFF
/*0x80322794*/  sw      $t6, 0x012C($t7)
/*0x80322798*/  lw      $t5, 0x0028($sp)
/*0x8032279C*/  li      $t8, 0x0001
/*0x803227A0*/  sw      $0, 0x0018($t5)
/*0x803227A4*/  lw      $t0, 0x0028($sp)
/*0x803227A8*/  sh      $t8, 0x0010($t0)
/*0x803227AC*/  lw      $t1, 0x0028($sp)
/*0x803227B0*/  jal     __osDisableInt
/*0x803227B4*/  sh      $0, 0x0012($t1)
/*0x803227B8*/  lui     $t2, %hi(__osActiveQueue)
/*0x803227BC*/  lw      $t2, %lo(__osActiveQueue)($t2)
/*0x803227C0*/  lw      $t3, 0x0028($sp)
/*0x803227C4*/  move    $s0, $v0
/*0x803227C8*/  lui     $at, %hi(__osActiveQueue)
/*0x803227CC*/  sw      $t2, 0x000C($t3)
/*0x803227D0*/  lw      $t9, 0x0028($sp)
/*0x803227D4*/  move    $a0, $s0
/*0x803227D8*/  jal     __osRestoreInt
/*0x803227DC*/  sw      $t9, %lo(__osActiveQueue)($at)
/*0x803227E0*/  lw      $ra, 0x001C($sp)
/*0x803227E4*/  lw      $s0, 0x0018($sp)
/*0x803227E8*/  addiu   $sp, $sp, 0x0028
/*0x803227EC*/  jr      $ra
/*0x803227F0*/  nop
