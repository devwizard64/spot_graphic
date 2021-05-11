#include <ultra64.h>

.set noreorder
.set noat

/* 0x80324610   void osInvalICache(void *vaddr, s32 nbytes) */
.globl osInvalICache
osInvalICache:
/*0x80324610*/  blez    $a1, .L80324658
/*0x80324614*/  nop
/*0x80324618*/  li      $t3, 0x4000
/*0x8032461C*/  sltu    $at, $a1, $t3
/*0x80324620*/  beqz    $at, .L80324660
/*0x80324624*/  nop
/*0x80324628*/  move    $t0, $a0
/*0x8032462C*/  addu    $t1, $a0, $a1
/*0x80324630*/  sltu    $at, $t0, $t1
/*0x80324634*/  beqz    $at, .L80324658
/*0x80324638*/  nop
/*0x8032463C*/  andi    $t2, $t0, 0x001F
/*0x80324640*/  addiu   $t1, $t1, -0x0020
/*0x80324644*/  subu    $t0, $t0, $t2
.L80324648:
/*0x80324648*/  cache   0x10, 0x0000($t0)
/*0x8032464C*/  sltu    $at, $t0, $t1
/*0x80324650*/  bnez    $at, .L80324648
/*0x80324654*/  addiu   $t0, $t0, 0x0020
.L80324658:
/*0x80324658*/  jr      $ra
/*0x8032465C*/  nop
.L80324660:
/*0x80324660*/  lui     $t0, %hi(0x80000020)
/*0x80324664*/  addu    $t1, $t0, $t3
/*0x80324668*/  addiu   $t1, $t1, -0x0020
.L8032466C:
/*0x8032466C*/  cache   0x00, %lo(0x80000000)($t0)
/*0x80324670*/  sltu    $at, $t0, $t1
/*0x80324674*/  bnez    $at, .L8032466C
/*0x80324678*/  addiu   $t0, $t0, %lo(0x80000020)
/*0x8032467C*/  jr      $ra
/*0x80324680*/  nop
