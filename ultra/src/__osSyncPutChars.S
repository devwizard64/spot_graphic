#include <ultra64.h>

.set noreorder
.set noat

/* 0x8032ACE0 */
.globl __osSyncPutChars
__osSyncPutChars:
/*0x8032ACE0*/  addiu   $sp, $sp, -0x0028
/*0x8032ACE4*/  sw      $a0, 0x0028($sp)
/*0x8032ACE8*/  lw      $t6, 0x0028($sp)
/*0x8032ACEC*/  lbu     $t0, 0x0024($sp)
/*0x8032ACF0*/  sw      $a1, 0x002C($sp)
/*0x8032ACF4*/  andi    $t7, $t6, 0x0003
/*0x8032ACF8*/  lw      $t3, 0x002C($sp)
/*0x8032ACFC*/  sll     $t8, $t7, 6
/*0x8032AD00*/  andi    $t9, $t8, 0x00C0
/*0x8032AD04*/  andi    $t1, $t0, 0xFF3F
/*0x8032AD08*/  or      $t2, $t9, $t1
/*0x8032AD0C*/  andi    $t6, $t2, 0x00FF
/*0x8032AD10*/  andi    $t4, $t3, 0x0003
/*0x8032AD14*/  andi    $t5, $t4, 0x0003
/*0x8032AD18*/  andi    $t7, $t6, 0xFFFC
/*0x8032AD1C*/  sb      $t2, 0x0024($sp)
/*0x8032AD20*/  or      $t8, $t5, $t7
/*0x8032AD24*/  sw      $ra, 0x0014($sp)
/*0x8032AD28*/  sw      $a2, 0x0030($sp)
/*0x8032AD2C*/  sb      $t8, 0x0024($sp)
/*0x8032AD30*/  blez    $t3, .L8032AD68
/*0x8032AD34*/  sw      $0, 0x0020($sp)
.L8032AD38:
/*0x8032AD38*/  lw      $t0, 0x0030($sp)
/*0x8032AD3C*/  lw      $t9, 0x0020($sp)
/*0x8032AD40*/  addu    $t1, $t0, $t9
/*0x8032AD44*/  lbu     $t4, 0x0000($t1)
/*0x8032AD48*/  addu    $t2, $sp, $t9
/*0x8032AD4C*/  sb      $t4, 0x0025($t2)
/*0x8032AD50*/  lw      $t6, 0x0020($sp)
/*0x8032AD54*/  lw      $t7, 0x002C($sp)
/*0x8032AD58*/  addiu   $t5, $t6, 0x0001
/*0x8032AD5C*/  slt     $at, $t5, $t7
/*0x8032AD60*/  bnez    $at, .L8032AD38
/*0x8032AD64*/  sw      $t5, 0x0020($sp)
.L8032AD68:
/*0x8032AD68*/  lui     $a0, %hi(__osRdbWriteOK)
/*0x8032AD6C*/  jal     __osAtomicDec
/*0x8032AD70*/  addiu   $a0, $a0, %lo(__osRdbWriteOK)
/*0x8032AD74*/  bnez    $v0, .L8032AD90
/*0x8032AD78*/  nop
.L8032AD7C:
/*0x8032AD7C*/  lui     $a0, %hi(__osRdbWriteOK)
/*0x8032AD80*/  jal     __osAtomicDec
/*0x8032AD84*/  addiu   $a0, $a0, %lo(__osRdbWriteOK)
/*0x8032AD88*/  beqz    $v0, .L8032AD7C
/*0x8032AD8C*/  nop
.L8032AD90:
/*0x8032AD90*/  jal     __osDisableInt
/*0x8032AD94*/  nop
/*0x8032AD98*/  sw      $v0, 0x001C($sp)
/*0x8032AD9C*/  addiu   $t8, $sp, 0x0024
/*0x8032ADA0*/  lw      $t3, 0x0000($t8)
/*0x8032ADA4*/  lui     $t0, %hi(0xC0000000)
/*0x8032ADA8*/  jal     __osGetCause
/*0x8032ADAC*/  sw      $t3, %lo(0xC0000000)($t0)
/*0x8032ADB0*/  andi    $t1, $v0, 0x2000
/*0x8032ADB4*/  bnez    $t1, .L8032ADD0
/*0x8032ADB8*/  nop
.L8032ADBC:
/*0x8032ADBC*/  jal     __osGetCause
/*0x8032ADC0*/  nop
/*0x8032ADC4*/  andi    $t4, $v0, 0x2000
/*0x8032ADC8*/  beqz    $t4, .L8032ADBC
/*0x8032ADCC*/  nop
.L8032ADD0:
/*0x8032ADD0*/  lui     $t9, %hi(0xC000000C)
/*0x8032ADD4*/  sw      $0, %lo(0xC000000C)($t9)
/*0x8032ADD8*/  lui     $t2, %hi(__osRdbWriteOK)
/*0x8032ADDC*/  lw      $t2, %lo(__osRdbWriteOK)($t2)
/*0x8032ADE0*/  lui     $at, %hi(__osRdbWriteOK)
/*0x8032ADE4*/  lw      $a0, 0x001C($sp)
/*0x8032ADE8*/  addiu   $t6, $t2, 0x0001
/*0x8032ADEC*/  jal     __osRestoreInt
/*0x8032ADF0*/  sw      $t6, %lo(__osRdbWriteOK)($at)
/*0x8032ADF4*/  lw      $ra, 0x0014($sp)
/*0x8032ADF8*/  addiu   $sp, $sp, 0x0028
/*0x8032ADFC*/  jr      $ra
/*0x8032AE00*/  nop
