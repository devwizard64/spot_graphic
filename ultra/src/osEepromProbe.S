#include <ultra64.h>

.set noreorder
.set noat

/* 0x80324080   s32 osEepromProbe(
    O,
    S,
    M,
    e,
    s,
    g,
    Q,
    u,
    e,
    u,
    e,
     ,
    *,
    m,
    q
) */
.globl osEepromProbe
osEepromProbe:
/*0x80324080*/  addiu   $sp, $sp, -0x0020
/*0x80324084*/  sw      $ra, 0x0014($sp)
/*0x80324088*/  sw      $a0, 0x0020($sp)
/*0x8032408C*/  jal     __osSiGetAccess
/*0x80324090*/  sw      $0, 0x001C($sp)
/*0x80324094*/  lw      $a0, 0x0020($sp)
/*0x80324098*/  jal     __osEepStatus
/*0x8032409C*/  addiu   $a1, $sp, 0x0018
/*0x803240A0*/  sw      $v0, 0x001C($sp)
/*0x803240A4*/  lw      $t6, 0x001C($sp)
/*0x803240A8*/  bnez    $t6, .L803240CC
/*0x803240AC*/  nop
/*0x803240B0*/  lhu     $t7, 0x0018($sp)
/*0x803240B4*/  andi    $t8, $t7, 0x8000
/*0x803240B8*/  beqz    $t8, .L803240CC
/*0x803240BC*/  nop
/*0x803240C0*/  li      $t9, 0x0001
/*0x803240C4*/  b       .L803240D0
/*0x803240C8*/  sw      $t9, 0x001C($sp)
.L803240CC:
/*0x803240CC*/  sw      $0, 0x001C($sp)
.L803240D0:
/*0x803240D0*/  jal     __osSiRelAccess
/*0x803240D4*/  nop
/*0x803240D8*/  lw      $ra, 0x0014($sp)
/*0x803240DC*/  lw      $v0, 0x001C($sp)
/*0x803240E0*/  addiu   $sp, $sp, 0x0020
/*0x803240E4*/  jr      $ra
/*0x803240E8*/  nop
