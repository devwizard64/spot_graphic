#include <ultra64.h>

.set noreorder
.set noat

/* 0x80246000 */
.globl start
start:
/*0x80246000*/  lui     $t0, %hi(bss_main_start)
/*0x80246004*/  lui     $t1, bss_main_size_hi
/*0x80246008*/  addiu   $t0, $t0, %lo(bss_main_start)
/*0x8024600C*/  ori     $t1, $t1, bss_main_size_lo
.L80246010:
/*0x80246010*/  addi    $t1, $t1, -0x0008
/*0x80246014*/  sw      $0, 0x0000($t0)
/*0x80246018*/  sw      $0, 0x0004($t0)
/*0x8024601C*/  bnez    $t1, .L80246010
/*0x80246020*/  addi    $t0, $t0, 0x0008
/*0x80246024*/  lui     $t2, %hi(main)
/*0x80246028*/  lui     $sp, %hi(stack_main+0x400)
/*0x8024602C*/  addiu   $t2, $t2, %lo(main)
/*0x80246030*/  jr      $t2
/*0x80246034*/  addiu   $sp, $sp, %lo(stack_main+0x400)
/*0x80246038*/  nop
/*0x8024603C*/  nop
/*0x80246040*/  nop
/*0x80246044*/  nop
/*0x80246048*/  nop
/*0x8024604C*/  nop
