#include <ultra64.h>

.set noreorder
.set noat

/* 0x80325DB0   s32 osAiSetNextBuffer(void *vaddr, u32 nbytes) */
.globl osAiSetNextBuffer
osAiSetNextBuffer:
/*0x80325DB0*/  addiu   $sp, $sp, -0x0020
/*0x80325DB4*/  lui     $t7, %hi(ultra_data_80335930)
/*0x80325DB8*/  lbu     $t7, %lo(ultra_data_80335930)($t7)
/*0x80325DBC*/  sw      $a0, 0x0020($sp)
/*0x80325DC0*/  lw      $t6, 0x0020($sp)
/*0x80325DC4*/  sw      $ra, 0x0014($sp)
/*0x80325DC8*/  sw      $a1, 0x0024($sp)
/*0x80325DCC*/  beqz    $t7, .L80325DDC
/*0x80325DD0*/  sw      $t6, 0x001C($sp)
/*0x80325DD4*/  addiu   $t8, $t6, -0x2000
/*0x80325DD8*/  sw      $t8, 0x001C($sp)
.L80325DDC:
/*0x80325DDC*/  lw      $t9, 0x0020($sp)
/*0x80325DE0*/  lw      $t0, 0x0024($sp)
/*0x80325DE4*/  li      $at, 0x2000
/*0x80325DE8*/  addu    $t1, $t9, $t0
/*0x80325DEC*/  andi    $t2, $t1, 0x3FFF
/*0x80325DF0*/  bne     $t2, $at, .L80325E08
/*0x80325DF4*/  nop
/*0x80325DF8*/  li      $t3, 0x0001
/*0x80325DFC*/  lui     $at, %hi(ultra_data_80335930)
/*0x80325E00*/  b       .L80325E10
/*0x80325E04*/  sb      $t3, %lo(ultra_data_80335930)($at)
.L80325E08:
/*0x80325E08*/  lui     $at, %hi(ultra_data_80335930)
/*0x80325E0C*/  sb      $0, %lo(ultra_data_80335930)($at)
.L80325E10:
/*0x80325E10*/  jal     __osAiDeviceBusy
/*0x80325E14*/  nop
/*0x80325E18*/  beqz    $v0, .L80325E28
/*0x80325E1C*/  nop
/*0x80325E20*/  b       .L80325E48
/*0x80325E24*/  li      $v0, -0x0001
.L80325E28:
/*0x80325E28*/  jal     osVirtualToPhysical
/*0x80325E2C*/  lw      $a0, 0x001C($sp)
/*0x80325E30*/  lui     $t4, %hi(0xA4500000)
/*0x80325E34*/  sw      $v0, %lo(0xA4500000)($t4)
/*0x80325E38*/  lw      $t5, 0x0024($sp)
/*0x80325E3C*/  lui     $t7, %hi(0xA4500004)
/*0x80325E40*/  move    $v0, $0
/*0x80325E44*/  sw      $t5, %lo(0xA4500004)($t7)
.L80325E48:
/*0x80325E48*/  lw      $ra, 0x0014($sp)
/*0x80325E4C*/  addiu   $sp, $sp, 0x0020
/*0x80325E50*/  jr      $ra
/*0x80325E54*/  nop
