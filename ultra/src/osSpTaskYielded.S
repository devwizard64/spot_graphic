#include <ultra64.h>

.set noreorder
.set noat

/* 0x80322D70   OSYieldResult osSpTaskYielded(
    O,
    S,
    T,
    a,
    s,
    k,
     ,
    *,
    t,
    a,
    s,
    k
) */
.globl osSpTaskYielded
osSpTaskYielded:
/*0x80322D70*/  addiu   $sp, $sp, -0x0020
/*0x80322D74*/  sw      $ra, 0x0014($sp)
/*0x80322D78*/  jal     __osSpGetStatus
/*0x80322D7C*/  sw      $a0, 0x0020($sp)
/*0x80322D80*/  sw      $v0, 0x001C($sp)
/*0x80322D84*/  lw      $t6, 0x001C($sp)
/*0x80322D88*/  andi    $t7, $t6, 0x0100
/*0x80322D8C*/  beqz    $t7, .L80322DA0
/*0x80322D90*/  nop
/*0x80322D94*/  li      $t8, 0x0001
/*0x80322D98*/  b       .L80322DA4
/*0x80322D9C*/  sw      $t8, 0x0018($sp)
.L80322DA0:
/*0x80322DA0*/  sw      $0, 0x0018($sp)
.L80322DA4:
/*0x80322DA4*/  lw      $t9, 0x001C($sp)
/*0x80322DA8*/  andi    $t0, $t9, 0x0080
/*0x80322DAC*/  beqz    $t0, .L80322DDC
/*0x80322DB0*/  nop
/*0x80322DB4*/  lw      $t1, 0x0020($sp)
/*0x80322DB8*/  lw      $t3, 0x0018($sp)
/*0x80322DBC*/  li      $at, -0x0003
/*0x80322DC0*/  lw      $t2, 0x0004($t1)
/*0x80322DC4*/  or      $t4, $t2, $t3
/*0x80322DC8*/  sw      $t4, 0x0004($t1)
/*0x80322DCC*/  lw      $t5, 0x0020($sp)
/*0x80322DD0*/  lw      $t6, 0x0004($t5)
/*0x80322DD4*/  and     $t7, $t6, $at
/*0x80322DD8*/  sw      $t7, 0x0004($t5)
.L80322DDC:
/*0x80322DDC*/  lw      $ra, 0x0014($sp)
/*0x80322DE0*/  lw      $v0, 0x0018($sp)
/*0x80322DE4*/  addiu   $sp, $sp, 0x0020
/*0x80322DE8*/  jr      $ra
/*0x80322DEC*/  nop
