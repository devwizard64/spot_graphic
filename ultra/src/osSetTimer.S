#include <ultra64.h>

.set noreorder
.set noat

/* 0x80328A10   void osSetTimer(
    OSTimer *timer,
    OSTime countdown,
    OSTime interval,
    OSMesgQueue *mq,
    OSMesg msg
) */
.globl osSetTimer
osSetTimer:
/*0x80328A10*/  addiu   $sp, $sp, -0x0020
/*0x80328A14*/  sw      $a0, 0x0020($sp)
/*0x80328A18*/  lw      $t6, 0x0020($sp)
/*0x80328A1C*/  sw      $ra, 0x0014($sp)
/*0x80328A20*/  sw      $a2, 0x0028($sp)
/*0x80328A24*/  sw      $a3, 0x002C($sp)
/*0x80328A28*/  sw      $0, 0x0000($t6)
/*0x80328A2C*/  lw      $t7, 0x0020($sp)
/*0x80328A30*/  sw      $0, 0x0004($t7)
/*0x80328A34*/  lw      $t0, 0x0020($sp)
/*0x80328A38*/  lw      $t9, 0x0034($sp)
/*0x80328A3C*/  lw      $t8, 0x0030($sp)
/*0x80328A40*/  sw      $t9, 0x000C($t0)
/*0x80328A44*/  sw      $t8, 0x0008($t0)
/*0x80328A48*/  lw      $t2, 0x0028($sp)
/*0x80328A4C*/  lw      $t3, 0x002C($sp)
/*0x80328A50*/  bnez    $t2, .L80328A60
/*0x80328A54*/  nop
/*0x80328A58*/  beqz    $t3, .L80328A70
/*0x80328A5C*/  nop
.L80328A60:
/*0x80328A60*/  lw      $t1, 0x0020($sp)
/*0x80328A64*/  sw      $t2, 0x0010($t1)
/*0x80328A68*/  b       .L80328A84
/*0x80328A6C*/  sw      $t3, 0x0014($t1)
.L80328A70:
/*0x80328A70*/  lw      $t6, 0x0020($sp)
/*0x80328A74*/  lw      $t4, 0x0030($sp)
/*0x80328A78*/  lw      $t5, 0x0034($sp)
/*0x80328A7C*/  sw      $t4, 0x0010($t6)
/*0x80328A80*/  sw      $t5, 0x0014($t6)
.L80328A84:
/*0x80328A84*/  lw      $t7, 0x0038($sp)
/*0x80328A88*/  lw      $t8, 0x0020($sp)
/*0x80328A8C*/  sw      $t7, 0x0018($t8)
/*0x80328A90*/  lw      $t0, 0x0020($sp)
/*0x80328A94*/  lw      $t9, 0x003C($sp)
/*0x80328A98*/  sw      $t9, 0x001C($t0)
/*0x80328A9C*/  jal     __osInsertTimer
/*0x80328AA0*/  lw      $a0, 0x0020($sp)
/*0x80328AA4*/  lui     $t2, %hi(__osTimerList)
/*0x80328AA8*/  lw      $t2, %lo(__osTimerList)($t2)
/*0x80328AAC*/  sw      $v0, 0x0018($sp)
/*0x80328AB0*/  sw      $v1, 0x001C($sp)
/*0x80328AB4*/  lw      $t1, 0x0020($sp)
/*0x80328AB8*/  lw      $t3, 0x0000($t2)
/*0x80328ABC*/  bne     $t3, $t1, .L80328AD0
/*0x80328AC0*/  nop
/*0x80328AC4*/  lw      $a0, 0x0018($sp)
/*0x80328AC8*/  jal     __osSetTimerIntr
/*0x80328ACC*/  lw      $a1, 0x001C($sp)
.L80328AD0:
/*0x80328AD0*/  lw      $ra, 0x0014($sp)
/*0x80328AD4*/  addiu   $sp, $sp, 0x0020
/*0x80328AD8*/  move    $v0, $0
/*0x80328ADC*/  jr      $ra
/*0x80328AE0*/  nop
