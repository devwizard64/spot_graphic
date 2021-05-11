#include <ultra64.h>

.set noreorder
.set noat

/* 0x80322640   void osViSetEvent(
    OSMesgQueue *mq,
    OSMesg msg,
    u32 retraceCount
) */
.globl osViSetEvent
osViSetEvent:
/*0x80322640*/  addiu   $sp, $sp, -0x0028
/*0x80322644*/  sw      $ra, 0x001C($sp)
/*0x80322648*/  sw      $a0, 0x0028($sp)
/*0x8032264C*/  sw      $a1, 0x002C($sp)
/*0x80322650*/  sw      $a2, 0x0030($sp)
/*0x80322654*/  jal     __osDisableInt
/*0x80322658*/  sw      $s0, 0x0018($sp)
/*0x8032265C*/  lui     $t7, %hi(__osViNext)
/*0x80322660*/  lw      $t7, %lo(__osViNext)($t7)
/*0x80322664*/  lw      $t6, 0x0028($sp)
/*0x80322668*/  lui     $t9, %hi(__osViNext)
/*0x8032266C*/  lui     $t1, %hi(__osViNext)
/*0x80322670*/  sw      $t6, 0x0010($t7)
/*0x80322674*/  lw      $t9, %lo(__osViNext)($t9)
/*0x80322678*/  lw      $t8, 0x002C($sp)
/*0x8032267C*/  move    $s0, $v0
/*0x80322680*/  move    $a0, $s0
/*0x80322684*/  sw      $t8, 0x0014($t9)
/*0x80322688*/  lw      $t1, %lo(__osViNext)($t1)
/*0x8032268C*/  lw      $t0, 0x0030($sp)
/*0x80322690*/  jal     __osRestoreInt
/*0x80322694*/  sh      $t0, 0x0002($t1)
/*0x80322698*/  lw      $ra, 0x001C($sp)
/*0x8032269C*/  lw      $s0, 0x0018($sp)
/*0x803226A0*/  addiu   $sp, $sp, 0x0028
/*0x803226A4*/  jr      $ra
/*0x803226A8*/  nop
