#include <ultra64.h>

.set noreorder
.set noat

/* 0x803225D0   void osSetEventMesg(OSEvent e, OSMesgQueue *mq, OSMesg m) */
.globl osSetEventMesg
osSetEventMesg:
/*0x803225D0*/  addiu   $sp, $sp, -0x0028
/*0x803225D4*/  sw      $ra, 0x001C($sp)
/*0x803225D8*/  sw      $a0, 0x0028($sp)
/*0x803225DC*/  sw      $a1, 0x002C($sp)
/*0x803225E0*/  sw      $a2, 0x0030($sp)
/*0x803225E4*/  jal     __osDisableInt
/*0x803225E8*/  sw      $s0, 0x0018($sp)
/*0x803225EC*/  lw      $t6, 0x0028($sp)
/*0x803225F0*/  lui     $t8, %hi(ultra_bss+0x0000)
/*0x803225F4*/  lw      $t0, 0x002C($sp)
/*0x803225F8*/  addiu   $t8, $t8, %lo(ultra_bss+0x0000)
/*0x803225FC*/  sll     $t7, $t6, 3
/*0x80322600*/  addu    $t9, $t7, $t8
/*0x80322604*/  sw      $t9, 0x0020($sp)
/*0x80322608*/  sw      $t0, 0x0000($t9)
/*0x8032260C*/  lw      $t2, 0x0020($sp)
/*0x80322610*/  lw      $t1, 0x0030($sp)
/*0x80322614*/  move    $s0, $v0
/*0x80322618*/  move    $a0, $s0
/*0x8032261C*/  jal     __osRestoreInt
/*0x80322620*/  sw      $t1, 0x0004($t2)
/*0x80322624*/  lw      $ra, 0x001C($sp)
/*0x80322628*/  lw      $s0, 0x0018($sp)
/*0x8032262C*/  addiu   $sp, $sp, 0x0028
/*0x80322630*/  jr      $ra
/*0x80322634*/  nop
