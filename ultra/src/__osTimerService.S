#include <ultra64.h>

.set noreorder
.set noat

/* 0x80325E60 */
.globl __osTimerServicesInit
__osTimerServicesInit:
/*0x80325E60*/  lui     $at, %hi(ultra_bss+0x2570)
/*0x80325E64*/  addiu   $t6, $0, 0x0000
/*0x80325E68*/  addiu   $t7, $0, 0x0000
/*0x80325E6C*/  sw      $t7, %lo(ultra_bss+0x2574)($at)
/*0x80325E70*/  sw      $t6, %lo(ultra_bss+0x2570)($at)
/*0x80325E74*/  lui     $at, %hi(ultra_bss+0x2578)
/*0x80325E78*/  lui     $t8, %hi(__osTimerList)
/*0x80325E7C*/  lw      $t8, %lo(__osTimerList)($t8)
/*0x80325E80*/  sw      $0, %lo(ultra_bss+0x2578)($at)
/*0x80325E84*/  lui     $at, %hi(ultra_bss+0x257C)
/*0x80325E88*/  sw      $0, %lo(ultra_bss+0x257C)($at)
/*0x80325E8C*/  lui     $t9, %hi(__osTimerList)
/*0x80325E90*/  sw      $t8, 0x0004($t8)
/*0x80325E94*/  lw      $t9, %lo(__osTimerList)($t9)
/*0x80325E98*/  lui     $t1, %hi(__osTimerList)
/*0x80325E9C*/  addiu   $t2, $0, 0x0000
/*0x80325EA0*/  lw      $t0, 0x0004($t9)
/*0x80325EA4*/  addiu   $t3, $0, 0x0000
/*0x80325EA8*/  lui     $t4, %hi(__osTimerList)
/*0x80325EAC*/  sw      $t0, 0x0000($t9)
/*0x80325EB0*/  lw      $t1, %lo(__osTimerList)($t1)
/*0x80325EB4*/  lui     $t5, %hi(__osTimerList)
/*0x80325EB8*/  lui     $t8, %hi(__osTimerList)
/*0x80325EBC*/  sw      $t2, 0x0010($t1)
/*0x80325EC0*/  sw      $t3, 0x0014($t1)
/*0x80325EC4*/  lw      $t4, %lo(__osTimerList)($t4)
/*0x80325EC8*/  lw      $t6, 0x0010($t4)
/*0x80325ECC*/  lw      $t7, 0x0014($t4)
/*0x80325ED0*/  sw      $t6, 0x0008($t4)
/*0x80325ED4*/  sw      $t7, 0x000C($t4)
/*0x80325ED8*/  lw      $t5, %lo(__osTimerList)($t5)
/*0x80325EDC*/  sw      $0, 0x0018($t5)
/*0x80325EE0*/  lw      $t8, %lo(__osTimerList)($t8)
/*0x80325EE4*/  jr      $ra
/*0x80325EE8*/  sw      $0, 0x001C($t8)

/* 0x80325EEC */
.globl __osTimerInterrupt
__osTimerInterrupt:
/*0x80325EEC*/  lui     $t6, %hi(__osTimerList)
/*0x80325EF0*/  lw      $t6, %lo(__osTimerList)($t6)
/*0x80325EF4*/  addiu   $sp, $sp, -0x0028
/*0x80325EF8*/  sw      $ra, 0x0014($sp)
/*0x80325EFC*/  lw      $t7, 0x0000($t6)
/*0x80325F00*/  beq     $t7, $t6, .L80326054
/*0x80325F04*/  nop
.L80325F08:
/*0x80325F08*/  lui     $t8, %hi(__osTimerList)
/*0x80325F0C*/  lw      $t8, %lo(__osTimerList)($t8)
/*0x80325F10*/  lw      $t9, 0x0000($t8)
/*0x80325F14*/  bne     $t9, $t8, .L80325F30
/*0x80325F18*/  sw      $t9, 0x0024($sp)
/*0x80325F1C*/  jal     __osSetCompare
/*0x80325F20*/  move    $a0, $0
/*0x80325F24*/  lui     $at, %hi(ultra_bss+0x2580)
/*0x80325F28*/  b       .L80326054
/*0x80325F2C*/  sw      $0, %lo(ultra_bss+0x2580)($at)
.L80325F30:
/*0x80325F30*/  jal     osGetCount
/*0x80325F34*/  nop
/*0x80325F38*/  sw      $v0, 0x0020($sp)
/*0x80325F3C*/  lui     $t1, %hi(ultra_bss+0x2580)
/*0x80325F40*/  lw      $t1, %lo(ultra_bss+0x2580)($t1)
/*0x80325F44*/  lw      $t0, 0x0020($sp)
/*0x80325F48*/  lw      $t7, 0x0024($sp)
/*0x80325F4C*/  lui     $at, %hi(ultra_bss+0x2580)
/*0x80325F50*/  subu    $t2, $t0, $t1
/*0x80325F54*/  sw      $t2, 0x001C($sp)
/*0x80325F58*/  sw      $t0, %lo(ultra_bss+0x2580)($at)
/*0x80325F5C*/  lw      $t6, 0x0010($t7)
/*0x80325F60*/  lw      $t3, 0x001C($sp)
/*0x80325F64*/  addiu   $t4, $0, 0x0000
/*0x80325F68*/  move    $t9, $t7
/*0x80325F6C*/  sltu    $at, $t6, $t4
/*0x80325F70*/  lw      $t7, 0x0014($t7)
/*0x80325F74*/  bnez    $at, .L80325FD0
/*0x80325F78*/  move    $t5, $t3
/*0x80325F7C*/  sltu    $at, $t4, $t6
/*0x80325F80*/  bnez    $at, .L80325F90
/*0x80325F84*/  sltu    $at, $t5, $t7
/*0x80325F88*/  beqz    $at, .L80325FD0
/*0x80325F8C*/  nop
.L80325F90:
/*0x80325F90*/  addiu   $t8, $t9, 0x0010
/*0x80325F94*/  sw      $t8, 0x0018($sp)
/*0x80325F98*/  lw      $t3, 0x0014($t9)
/*0x80325F9C*/  lw      $t2, 0x0010($t9)
/*0x80325FA0*/  sltu    $at, $t3, $t5
/*0x80325FA4*/  subu    $t0, $t2, $t4
/*0x80325FA8*/  subu    $t0, $t0, $at
/*0x80325FAC*/  subu    $t1, $t3, $t5
/*0x80325FB0*/  sw      $t1, 0x0014($t9)
/*0x80325FB4*/  sw      $t0, 0x0010($t9)
/*0x80325FB8*/  lw      $t6, 0x0024($sp)
/*0x80325FBC*/  lw      $a0, 0x0010($t6)
/*0x80325FC0*/  jal     __osSetTimerIntr
/*0x80325FC4*/  lw      $a1, 0x0014($t6)
/*0x80325FC8*/  b       .L80326054
/*0x80325FCC*/  nop
.L80325FD0:
/*0x80325FD0*/  lw      $t7, 0x0024($sp)
/*0x80325FD4*/  lw      $t8, 0x0000($t7)
/*0x80325FD8*/  lw      $t2, 0x0004($t7)
/*0x80325FDC*/  sw      $t8, 0x0000($t2)
/*0x80325FE0*/  lw      $t3, 0x0024($sp)
/*0x80325FE4*/  lw      $t4, 0x0004($t3)
/*0x80325FE8*/  lw      $t5, 0x0000($t3)
/*0x80325FEC*/  sw      $t4, 0x0004($t5)
/*0x80325FF0*/  lw      $t0, 0x0024($sp)
/*0x80325FF4*/  sw      $0, 0x0000($t0)
/*0x80325FF8*/  lw      $t1, 0x0024($sp)
/*0x80325FFC*/  sw      $0, 0x0004($t1)
/*0x80326000*/  lw      $t9, 0x0024($sp)
/*0x80326004*/  lw      $t6, 0x0018($t9)
/*0x80326008*/  beqz    $t6, .L80326020
/*0x8032600C*/  nop
/*0x80326010*/  move    $a0, $t6
/*0x80326014*/  lw      $a1, 0x001C($t9)
/*0x80326018*/  jal     osSendMesg
/*0x8032601C*/  move    $a2, $0
.L80326020:
/*0x80326020*/  lw      $t7, 0x0024($sp)
/*0x80326024*/  lw      $t8, 0x0008($t7)
/*0x80326028*/  lw      $t9, 0x000C($t7)
/*0x8032602C*/  bnez    $t8, .L8032603C
/*0x80326030*/  nop
/*0x80326034*/  beqz    $t9, .L80325F08
/*0x80326038*/  nop
.L8032603C:
/*0x8032603C*/  sw      $t8, 0x0010($t7)
/*0x80326040*/  sw      $t9, 0x0014($t7)
/*0x80326044*/  jal     __osInsertTimer
/*0x80326048*/  lw      $a0, 0x0024($sp)
/*0x8032604C*/  b       .L80325F08
/*0x80326050*/  nop
.L80326054:
/*0x80326054*/  lw      $ra, 0x0014($sp)
/*0x80326058*/  addiu   $sp, $sp, 0x0028
/*0x8032605C*/  jr      $ra
/*0x80326060*/  nop

/* 0x80326064 */
.globl __osSetTimerIntr
__osSetTimerIntr:
/*0x80326064*/  addiu   $sp, $sp, -0x0028
/*0x80326068*/  sw      $ra, 0x0014($sp)
/*0x8032606C*/  sw      $a0, 0x0028($sp)
/*0x80326070*/  jal     __osDisableInt
/*0x80326074*/  sw      $a1, 0x002C($sp)
/*0x80326078*/  jal     osGetCount
/*0x8032607C*/  sw      $v0, 0x001C($sp)
/*0x80326080*/  lui     $at, %hi(ultra_bss+0x2580)
/*0x80326084*/  sw      $v0, %lo(ultra_bss+0x2580)($at)
/*0x80326088*/  lui     $t6, %hi(ultra_bss+0x2580)
/*0x8032608C*/  lw      $t6, %lo(ultra_bss+0x2580)($t6)
/*0x80326090*/  lw      $t1, 0x002C($sp)
/*0x80326094*/  lw      $t0, 0x0028($sp)
/*0x80326098*/  move    $t9, $t6
/*0x8032609C*/  addu    $t3, $t9, $t1
/*0x803260A0*/  addiu   $t8, $0, 0x0000
/*0x803260A4*/  sltu    $at, $t3, $t1
/*0x803260A8*/  addu    $t2, $at, $t8
/*0x803260AC*/  addu    $t2, $t2, $t0
/*0x803260B0*/  sw      $t2, 0x0020($sp)
/*0x803260B4*/  sw      $t3, 0x0024($sp)
/*0x803260B8*/  jal     __osSetCompare
/*0x803260BC*/  move    $a0, $t3
/*0x803260C0*/  jal     __osRestoreInt
/*0x803260C4*/  lw      $a0, 0x001C($sp)
/*0x803260C8*/  lw      $ra, 0x0014($sp)
/*0x803260CC*/  addiu   $sp, $sp, 0x0028
/*0x803260D0*/  jr      $ra
/*0x803260D4*/  nop

/* 0x803260D8 */
.globl __osInsertTimer
__osInsertTimer:
/*0x803260D8*/  addiu   $sp, $sp, -0x0038
/*0x803260DC*/  sw      $ra, 0x0014($sp)
/*0x803260E0*/  jal     __osDisableInt
/*0x803260E4*/  sw      $a0, 0x0038($sp)
/*0x803260E8*/  lui     $t6, %hi(__osTimerList)
/*0x803260EC*/  lw      $t6, %lo(__osTimerList)($t6)
/*0x803260F0*/  sw      $v0, 0x0024($sp)
/*0x803260F4*/  lw      $t8, 0x0038($sp)
/*0x803260F8*/  lw      $t7, 0x0000($t6)
/*0x803260FC*/  sw      $t7, 0x0034($sp)
/*0x80326100*/  lw      $t1, 0x0014($t8)
/*0x80326104*/  lw      $t0, 0x0010($t8)
/*0x80326108*/  sw      $t1, 0x002C($sp)
/*0x8032610C*/  beq     $t7, $t6, .L803261B4
/*0x80326110*/  sw      $t0, 0x0028($sp)
/*0x80326114*/  lw      $t2, 0x0010($t7)
/*0x80326118*/  lw      $t3, 0x0014($t7)
/*0x8032611C*/  sltu    $at, $t0, $t2
/*0x80326120*/  bnez    $at, .L803261B4
/*0x80326124*/  sltu    $at, $t2, $t0
/*0x80326128*/  bnez    $at, .L80326138
/*0x8032612C*/  sltu    $at, $t3, $t1
/*0x80326130*/  beqz    $at, .L803261B4
/*0x80326134*/  nop
.L80326138:
/*0x80326138*/  addiu   $t9, $sp, 0x0028
/*0x8032613C*/  lw      $t8, 0x0034($sp)
/*0x80326140*/  sw      $t9, 0x0020($sp)
/*0x80326144*/  lw      $t5, 0x0004($t9)
/*0x80326148*/  lw      $t4, 0x0000($t9)
/*0x8032614C*/  lw      $t7, 0x0014($t8)
/*0x80326150*/  lw      $t6, 0x0010($t8)
/*0x80326154*/  lui     $t8, %hi(__osTimerList)
/*0x80326158*/  sltu    $at, $t5, $t7
/*0x8032615C*/  subu    $t0, $t4, $t6
/*0x80326160*/  subu    $t0, $t0, $at
/*0x80326164*/  subu    $t1, $t5, $t7
/*0x80326168*/  sw      $t1, 0x0004($t9)
/*0x8032616C*/  sw      $t0, 0x0000($t9)
/*0x80326170*/  lw      $t2, 0x0034($sp)
/*0x80326174*/  lw      $t8, %lo(__osTimerList)($t8)
/*0x80326178*/  lw      $t3, 0x0000($t2)
/*0x8032617C*/  beq     $t3, $t8, .L803261B4
/*0x80326180*/  sw      $t3, 0x0034($sp)
/*0x80326184*/  lw      $t4, 0x0028($sp)
/*0x80326188*/  lw      $t6, 0x0010($t3)
/*0x8032618C*/  lw      $t5, 0x002C($sp)
/*0x80326190*/  lw      $t7, 0x0014($t3)
/*0x80326194*/  sltu    $at, $t6, $t4
/*0x80326198*/  bnez    $at, .L80326138
/*0x8032619C*/  nop
/*0x803261A0*/  sltu    $at, $t4, $t6
/*0x803261A4*/  bnez    $at, .L803261B4
/*0x803261A8*/  sltu    $at, $t7, $t5
/*0x803261AC*/  bnez    $at, .L80326138
/*0x803261B0*/  nop
.L803261B4:
/*0x803261B4*/  lw      $t9, 0x0038($sp)
/*0x803261B8*/  lw      $t0, 0x0028($sp)
/*0x803261BC*/  lw      $t1, 0x002C($sp)
/*0x803261C0*/  lui     $t8, %hi(__osTimerList)
/*0x803261C4*/  sw      $t0, 0x0010($t9)
/*0x803261C8*/  sw      $t1, 0x0014($t9)
/*0x803261CC*/  lw      $t8, %lo(__osTimerList)($t8)
/*0x803261D0*/  lw      $t2, 0x0034($sp)
/*0x803261D4*/  beq     $t2, $t8, .L8032620C
/*0x803261D8*/  nop
/*0x803261DC*/  addiu   $t3, $t2, 0x0010
/*0x803261E0*/  sw      $t3, 0x001C($sp)
/*0x803261E4*/  lw      $t5, 0x0014($t2)
/*0x803261E8*/  lw      $t4, 0x0010($t2)
/*0x803261EC*/  lw      $t6, 0x0028($sp)
/*0x803261F0*/  lw      $t7, 0x002C($sp)
/*0x803261F4*/  subu    $t0, $t4, $t6
/*0x803261F8*/  sltu    $at, $t5, $t7
/*0x803261FC*/  subu    $t0, $t0, $at
/*0x80326200*/  subu    $t1, $t5, $t7
/*0x80326204*/  sw      $t1, 0x0014($t2)
/*0x80326208*/  sw      $t0, 0x0010($t2)
.L8032620C:
/*0x8032620C*/  lw      $t9, 0x0034($sp)
/*0x80326210*/  lw      $t8, 0x0038($sp)
/*0x80326214*/  sw      $t9, 0x0000($t8)
/*0x80326218*/  lw      $t3, 0x0034($sp)
/*0x8032621C*/  lw      $t5, 0x0038($sp)
/*0x80326220*/  lw      $t4, 0x0004($t3)
/*0x80326224*/  sw      $t4, 0x0004($t5)
/*0x80326228*/  lw      $t7, 0x0034($sp)
/*0x8032622C*/  lw      $t6, 0x0038($sp)
/*0x80326230*/  lw      $t0, 0x0004($t7)
/*0x80326234*/  sw      $t6, 0x0000($t0)
/*0x80326238*/  lw      $t2, 0x0034($sp)
/*0x8032623C*/  lw      $t1, 0x0038($sp)
/*0x80326240*/  sw      $t1, 0x0004($t2)
/*0x80326244*/  jal     __osRestoreInt
/*0x80326248*/  lw      $a0, 0x0024($sp)
/*0x8032624C*/  lw      $ra, 0x0014($sp)
/*0x80326250*/  lw      $v0, 0x0028($sp)
/*0x80326254*/  lw      $v1, 0x002C($sp)
/*0x80326258*/  jr      $ra
/*0x8032625C*/  addiu   $sp, $sp, 0x0038
