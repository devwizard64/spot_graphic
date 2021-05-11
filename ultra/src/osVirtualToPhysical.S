#include <ultra64.h>

.set noreorder
.set noat

/* 0x80327EB0   u32 osVirtualToPhysical(void *vaddr) */
.globl osVirtualToPhysical
osVirtualToPhysical:
/*0x80327EB0*/  addiu   $sp, $sp, -0x0018
/*0x80327EB4*/  sw      $a0, 0x0018($sp)
/*0x80327EB8*/  lw      $t6, 0x0018($sp)
/*0x80327EBC*/  li      $at, 0x80000000
/*0x80327EC0*/  sw      $ra, 0x0014($sp)
/*0x80327EC4*/  sltu    $at, $t6, $at
/*0x80327EC8*/  bnez    $at, .L80327EE8
/*0x80327ECC*/  li      $at, 0xA0000000
/*0x80327ED0*/  sltu    $at, $t6, $at
/*0x80327ED4*/  beqz    $at, .L80327EE8
/*0x80327ED8*/  lui     $at, 0x1FFFFFFF >> 16
/*0x80327EDC*/  ori     $at, $at, 0x1FFFFFFF & 0xFFFF
/*0x80327EE0*/  b       .L80327F1C
/*0x80327EE4*/  and     $v0, $t6, $at
.L80327EE8:
/*0x80327EE8*/  lw      $t7, 0x0018($sp)
/*0x80327EEC*/  li      $at, 0xA0000000
/*0x80327EF0*/  sltu    $at, $t7, $at
/*0x80327EF4*/  bnez    $at, .L80327F14
/*0x80327EF8*/  li      $at, 0xC0000000
/*0x80327EFC*/  sltu    $at, $t7, $at
/*0x80327F00*/  beqz    $at, .L80327F14
/*0x80327F04*/  lui     $at, 0x1FFFFFFF >> 16
/*0x80327F08*/  ori     $at, $at, 0x1FFFFFFF & 0xFFFF
/*0x80327F0C*/  b       .L80327F1C
/*0x80327F10*/  and     $v0, $t7, $at
.L80327F14:
/*0x80327F14*/  jal     __osProbeTLB
/*0x80327F18*/  lw      $a0, 0x0018($sp)
.L80327F1C:
/*0x80327F1C*/  lw      $ra, 0x0014($sp)
/*0x80327F20*/  addiu   $sp, $sp, 0x0018
/*0x80327F24*/  jr      $ra
/*0x80327F28*/  nop
