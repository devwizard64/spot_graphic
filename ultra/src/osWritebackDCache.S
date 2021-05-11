#include <ultra64.h>

.set noreorder
.set noat

/* 0x80325D20   void osWritebackDCache(void *vaddr, s32 nbytes) */
.globl osWritebackDCache
osWritebackDCache:
/*0x80325D20*/  blez    $a1, .L80325D68
/*0x80325D24*/  nop
/*0x80325D28*/  li      $t3, 0x2000
/*0x80325D2C*/  sltu    $at, $a1, $t3
/*0x80325D30*/  beqz    $at, .L80325D70
/*0x80325D34*/  nop
/*0x80325D38*/  move    $t0, $a0
/*0x80325D3C*/  addu    $t1, $a0, $a1
/*0x80325D40*/  sltu    $at, $t0, $t1
/*0x80325D44*/  beqz    $at, .L80325D68
/*0x80325D48*/  nop
/*0x80325D4C*/  andi    $t2, $t0, 0x000F
/*0x80325D50*/  addiu   $t1, $t1, -0x0010
/*0x80325D54*/  subu    $t0, $t0, $t2
.L80325D58:
/*0x80325D58*/  cache   0x19, 0x0000($t0)
/*0x80325D5C*/  sltu    $at, $t0, $t1
/*0x80325D60*/  bnez    $at, .L80325D58
/*0x80325D64*/  addiu   $t0, $t0, 0x0010
.L80325D68:
/*0x80325D68*/  jr      $ra
/*0x80325D6C*/  nop
.L80325D70:
/*0x80325D70*/  lui     $t0, %hi(0x80000010)
/*0x80325D74*/  addu    $t1, $t0, $t3
/*0x80325D78*/  addiu   $t1, $t1, -0x0010
.L80325D7C:
/*0x80325D7C*/  cache   0x01, %lo(0x80000000)($t0)
/*0x80325D80*/  sltu    $at, $t0, $t1
/*0x80325D84*/  bnez    $at, .L80325D7C
/*0x80325D88*/  addiu   $t0, $t0, %lo(0x80000010)
/*0x80325D8C*/  jr      $ra
/*0x80325D90*/  nop
