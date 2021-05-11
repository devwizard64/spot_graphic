#include <ultra64.h>

.set noreorder
.set noat

/* 0x803247D0   void osEepromLongWrite(
    OSMesgQueue *mq,
    u8 address,
    u8 *buffer,
    s32 nbytes
) */
.globl osEepromLongWrite
osEepromLongWrite:
/*0x803247D0*/  addiu   $sp, $sp, -0x0040
/*0x803247D4*/  sw      $a1, 0x0044($sp)
/*0x803247D8*/  lbu     $t6, 0x0047($sp)
/*0x803247DC*/  sw      $ra, 0x0024($sp)
/*0x803247E0*/  sw      $a0, 0x0040($sp)
/*0x803247E4*/  slti    $at, $t6, 0x0041
/*0x803247E8*/  sw      $a2, 0x0048($sp)
/*0x803247EC*/  sw      $a3, 0x004C($sp)
/*0x803247F0*/  bnez    $at, .L80324800
/*0x803247F4*/  sw      $0, 0x003C($sp)
/*0x803247F8*/  b       .L803248FC
/*0x803247FC*/  li      $v0, -0x0001
.L80324800:
/*0x80324800*/  lw      $t7, 0x004C($sp)
/*0x80324804*/  blez    $t7, .L803248F8
/*0x80324808*/  nop
.L8032480C:
/*0x8032480C*/  lw      $a0, 0x0040($sp)
/*0x80324810*/  lbu     $a1, 0x0047($sp)
/*0x80324814*/  jal     osEepromWrite
/*0x80324818*/  lw      $a2, 0x0048($sp)
/*0x8032481C*/  sw      $v0, 0x003C($sp)
/*0x80324820*/  lw      $t8, 0x003C($sp)
/*0x80324824*/  beqz    $t8, .L80324834
/*0x80324828*/  nop
/*0x8032482C*/  b       .L803248FC
/*0x80324830*/  move    $v0, $t8
.L80324834:
/*0x80324834*/  lw      $t9, 0x004C($sp)
/*0x80324838*/  lbu     $t1, 0x0047($sp)
/*0x8032483C*/  lw      $t3, 0x0048($sp)
/*0x80324840*/  lui     $a2, %hi(osClockRate+0)
/*0x80324844*/  lui     $a3, %hi(osClockRate+4)
/*0x80324848*/  addiu   $t0, $t9, -0x0008
/*0x8032484C*/  addiu   $t2, $t1, 0x0001
/*0x80324850*/  addiu   $t4, $t3, 0x0008
/*0x80324854*/  sw      $t0, 0x004C($sp)
/*0x80324858*/  sb      $t2, 0x0047($sp)
/*0x8032485C*/  sw      $t4, 0x0048($sp)
/*0x80324860*/  lw      $a3, %lo(osClockRate+4)($a3)
/*0x80324864*/  lw      $a2, %lo(osClockRate+0)($a2)
/*0x80324868*/  addiu   $a0, $0, 0x0000
/*0x8032486C*/  jal     __ll_mul
/*0x80324870*/  li      $a1, 0x2EE0
/*0x80324874*/  sw      $v0, 0x0028($sp)
/*0x80324878*/  sw      $v1, 0x002C($sp)
/*0x8032487C*/  lui     $a3, 0x000F4240 >> 16
/*0x80324880*/  ori     $a3, $a3, 0x000F4240 & 0xFFFF
/*0x80324884*/  lw      $a1, 0x002C($sp)
/*0x80324888*/  lw      $a0, 0x0028($sp)
/*0x8032488C*/  jal     __ull_div
/*0x80324890*/  addiu   $a2, $0, 0x0000
/*0x80324894*/  lui     $t5, %hi(ultra_bss+0x2518)
/*0x80324898*/  lui     $t8, %hi(ultra_bss+0x2530)
/*0x8032489C*/  addiu   $t8, $t8, %lo(ultra_bss+0x2530)
/*0x803248A0*/  addiu   $t5, $t5, %lo(ultra_bss+0x2518)
/*0x803248A4*/  sw      $v0, 0x0030($sp)
/*0x803248A8*/  sw      $v1, 0x0034($sp)
/*0x803248AC*/  lui     $a0, %hi(ultra_bss+0x24F8)
/*0x803248B0*/  addiu   $t6, $0, 0x0000
/*0x803248B4*/  addiu   $t7, $0, 0x0000
/*0x803248B8*/  sw      $t7, 0x0014($sp)
/*0x803248BC*/  sw      $t6, 0x0010($sp)
/*0x803248C0*/  addiu   $a0, $a0, %lo(ultra_bss+0x24F8)
/*0x803248C4*/  lw      $a3, 0x0034($sp)
/*0x803248C8*/  lw      $a2, 0x0030($sp)
/*0x803248CC*/  sw      $t5, 0x0018($sp)
/*0x803248D0*/  jal     osSetTimer
/*0x803248D4*/  sw      $t8, 0x001C($sp)
/*0x803248D8*/  lui     $a0, %hi(ultra_bss+0x2518)
/*0x803248DC*/  addiu   $a0, $a0, %lo(ultra_bss+0x2518)
/*0x803248E0*/  move    $a1, $0
/*0x803248E4*/  jal     osRecvMesg
/*0x803248E8*/  li      $a2, 0x0001
/*0x803248EC*/  lw      $t9, 0x004C($sp)
/*0x803248F0*/  bgtz    $t9, .L8032480C
/*0x803248F4*/  nop
.L803248F8:
/*0x803248F8*/  lw      $v0, 0x003C($sp)
.L803248FC:
/*0x803248FC*/  lw      $ra, 0x0024($sp)
/*0x80324900*/  addiu   $sp, $sp, 0x0040
/*0x80324904*/  jr      $ra
/*0x80324908*/  nop
