#include <ultra64.h>

.set noreorder
.set noat

/* 0x8032AF70 */
.globl __osProbeTLB
__osProbeTLB:
/*0x8032AF70*/  mfc0    $t0, C0_ENTRYHI
/*0x8032AF74*/  andi    $t1, $t0, 0x00FF
/*0x8032AF78*/  li      $at, -0x2000
/*0x8032AF7C*/  and     $t2, $a0, $at
/*0x8032AF80*/  or      $t1, $t1, $t2
/*0x8032AF84*/  mtc0    $t1, C0_ENTRYHI
/*0x8032AF88*/  nop
/*0x8032AF8C*/  nop
/*0x8032AF90*/  nop
/*0x8032AF94*/  tlbp
/*0x8032AF98*/  nop
/*0x8032AF9C*/  nop
/*0x8032AFA0*/  mfc0    $t3, C0_INX
/*0x8032AFA4*/  li      $at, 0x80000000
/*0x8032AFA8*/  and     $t3, $t3, $at
/*0x8032AFAC*/  bnez    $t3, .L8032B018
/*0x8032AFB0*/  nop
/*0x8032AFB4*/  tlbr
/*0x8032AFB8*/  nop
/*0x8032AFBC*/  nop
/*0x8032AFC0*/  nop
/*0x8032AFC4*/  mfc0    $t3, C0_PAGEMASK
/*0x8032AFC8*/  addi    $t3, $t3, 0x2000
/*0x8032AFCC*/  srl     $t3, $t3, 1
/*0x8032AFD0*/  and     $t4, $t3, $a0
/*0x8032AFD4*/  bnez    $t4, .L8032AFE8
/*0x8032AFD8*/  addi    $t3, $t3, -0x0001
/*0x8032AFDC*/  mfc0    $v0, C0_ENTRYLO0
/*0x8032AFE0*/  b       .L8032AFEC
/*0x8032AFE4*/  nop
.L8032AFE8:
/*0x8032AFE8*/  mfc0    $v0, C0_ENTRYLO1
.L8032AFEC:
/*0x8032AFEC*/  andi    $t5, $v0, 0x0002
/*0x8032AFF0*/  beqz    $t5, .L8032B018
/*0x8032AFF4*/  nop
/*0x8032AFF8*/  lui     $at, 0x3FFFFFC0 >> 16
/*0x8032AFFC*/  ori     $at, $at, 0x3FFFFFC0 & 0xFFFF
/*0x8032B000*/  and     $v0, $v0, $at
/*0x8032B004*/  sll     $v0, $v0, 6
/*0x8032B008*/  and     $t5, $a0, $t3
/*0x8032B00C*/  add     $v0, $v0, $t5
/*0x8032B010*/  b       .L8032B01C
/*0x8032B014*/  nop
.L8032B018:
/*0x8032B018*/  li      $v0, -0x0001
.L8032B01C:
/*0x8032B01C*/  mtc0    $t0, C0_ENTRYHI
/*0x8032B020*/  jr      $ra
/*0x8032B024*/  nop
