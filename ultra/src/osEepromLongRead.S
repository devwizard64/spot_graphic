#include <ultra64.h>

.set noreorder
.set noat

/* 0x80324690   void osEepromLongRead(
    OSMesgQueue *mq,
    u8 address,
    u8 *buffer,
    s32 nbytes
) */
.globl osEepromLongRead
osEepromLongRead:
/*0x80324690*/  addiu   $sp, $sp, -0x0040
/*0x80324694*/  sw      $a1, 0x0044($sp)
/*0x80324698*/  lbu     $t6, 0x0047($sp)
/*0x8032469C*/  sw      $ra, 0x0024($sp)
/*0x803246A0*/  sw      $a0, 0x0040($sp)
/*0x803246A4*/  slti    $at, $t6, 0x0041
/*0x803246A8*/  sw      $a2, 0x0048($sp)
/*0x803246AC*/  sw      $a3, 0x004C($sp)
/*0x803246B0*/  bnez    $at, .L803246C0
/*0x803246B4*/  sw      $0, 0x003C($sp)
/*0x803246B8*/  b       .L803247BC
/*0x803246BC*/  li      $v0, -0x0001
.L803246C0:
/*0x803246C0*/  lw      $t7, 0x004C($sp)
/*0x803246C4*/  blez    $t7, .L803247B8
/*0x803246C8*/  nop
.L803246CC:
/*0x803246CC*/  lw      $a0, 0x0040($sp)
/*0x803246D0*/  lbu     $a1, 0x0047($sp)
/*0x803246D4*/  jal     osEepromRead
/*0x803246D8*/  lw      $a2, 0x0048($sp)
/*0x803246DC*/  sw      $v0, 0x003C($sp)
/*0x803246E0*/  lw      $t8, 0x003C($sp)
/*0x803246E4*/  beqz    $t8, .L803246F4
/*0x803246E8*/  nop
/*0x803246EC*/  b       .L803247BC
/*0x803246F0*/  move    $v0, $t8
.L803246F4:
/*0x803246F4*/  lw      $t9, 0x004C($sp)
/*0x803246F8*/  lbu     $t1, 0x0047($sp)
/*0x803246FC*/  lw      $t3, 0x0048($sp)
/*0x80324700*/  lui     $a2, %hi(osClockRate+0)
/*0x80324704*/  lui     $a3, %hi(osClockRate+4)
/*0x80324708*/  addiu   $t0, $t9, -0x0008
/*0x8032470C*/  addiu   $t2, $t1, 0x0001
/*0x80324710*/  addiu   $t4, $t3, 0x0008
/*0x80324714*/  sw      $t0, 0x004C($sp)
/*0x80324718*/  sb      $t2, 0x0047($sp)
/*0x8032471C*/  sw      $t4, 0x0048($sp)
/*0x80324720*/  lw      $a3, %lo(osClockRate+4)($a3)
/*0x80324724*/  lw      $a2, %lo(osClockRate+0)($a2)
/*0x80324728*/  addiu   $a0, $0, 0x0000
/*0x8032472C*/  jal     __ll_mul
/*0x80324730*/  li      $a1, 0x2EE0
/*0x80324734*/  sw      $v0, 0x0028($sp)
/*0x80324738*/  sw      $v1, 0x002C($sp)
/*0x8032473C*/  lui     $a3, 0x000F4240 >> 16
/*0x80324740*/  ori     $a3, $a3, 0x000F4240 & 0xFFFF
/*0x80324744*/  lw      $a1, 0x002C($sp)
/*0x80324748*/  lw      $a0, 0x0028($sp)
/*0x8032474C*/  jal     __ull_div
/*0x80324750*/  addiu   $a2, $0, 0x0000
/*0x80324754*/  lui     $t5, %hi(ultra_bss+0x2518)
/*0x80324758*/  lui     $t8, %hi(ultra_bss+0x2530)
/*0x8032475C*/  addiu   $t8, $t8, %lo(ultra_bss+0x2530)
/*0x80324760*/  addiu   $t5, $t5, %lo(ultra_bss+0x2518)
/*0x80324764*/  sw      $v0, 0x0030($sp)
/*0x80324768*/  sw      $v1, 0x0034($sp)
/*0x8032476C*/  lui     $a0, %hi(ultra_bss+0x24F8)
/*0x80324770*/  addiu   $t6, $0, 0x0000
/*0x80324774*/  addiu   $t7, $0, 0x0000
/*0x80324778*/  sw      $t7, 0x0014($sp)
/*0x8032477C*/  sw      $t6, 0x0010($sp)
/*0x80324780*/  addiu   $a0, $a0, %lo(ultra_bss+0x24F8)
/*0x80324784*/  lw      $a3, 0x0034($sp)
/*0x80324788*/  lw      $a2, 0x0030($sp)
/*0x8032478C*/  sw      $t5, 0x0018($sp)
/*0x80324790*/  jal     osSetTimer
/*0x80324794*/  sw      $t8, 0x001C($sp)
/*0x80324798*/  lui     $a0, %hi(ultra_bss+0x2518)
/*0x8032479C*/  addiu   $a0, $a0, %lo(ultra_bss+0x2518)
/*0x803247A0*/  move    $a1, $0
/*0x803247A4*/  jal     osRecvMesg
/*0x803247A8*/  li      $a2, 0x0001
/*0x803247AC*/  lw      $t9, 0x004C($sp)
/*0x803247B0*/  bgtz    $t9, .L803246CC
/*0x803247B4*/  nop
.L803247B8:
/*0x803247B8*/  lw      $v0, 0x003C($sp)
.L803247BC:
/*0x803247BC*/  lw      $ra, 0x0024($sp)
/*0x803247C0*/  addiu   $sp, $sp, 0x0040
/*0x803247C4*/  jr      $ra
/*0x803247C8*/  nop
