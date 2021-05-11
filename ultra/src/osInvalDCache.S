#include <ultra64.h>

.set noreorder
.set noat

/* 0x803243B0   void osInvalDCache(void *vaddr, s32 nbytes) */
.globl osInvalDCache
osInvalDCache:
/*0x803243B0*/  blez    $a1, .L80324430
/*0x803243B4*/  nop
/*0x803243B8*/  li      $t3, 0x2000
/*0x803243BC*/  sltu    $at, $a1, $t3
/*0x803243C0*/  beqz    $at, .L80324438
/*0x803243C4*/  nop
/*0x803243C8*/  move    $t0, $a0
/*0x803243CC*/  addu    $t1, $a0, $a1
/*0x803243D0*/  sltu    $at, $t0, $t1
/*0x803243D4*/  beqz    $at, .L80324430
/*0x803243D8*/  nop
/*0x803243DC*/  andi    $t2, $t0, 0x000F
/*0x803243E0*/  beqz    $t2, .L80324400
/*0x803243E4*/  addiu   $t1, $t1, -0x0010
/*0x803243E8*/  subu    $t0, $t0, $t2
/*0x803243EC*/  cache   0x15, 0x0000($t0)
/*0x803243F0*/  sltu    $at, $t0, $t1
/*0x803243F4*/  beqz    $at, .L80324430
/*0x803243F8*/  nop
/*0x803243FC*/  addiu   $t0, $t0, 0x0010
.L80324400:
/*0x80324400*/  andi    $t2, $t1, 0x000F
/*0x80324404*/  beqz    $t2, .L80324420
/*0x80324408*/  nop
/*0x8032440C*/  subu    $t1, $t1, $t2
/*0x80324410*/  cache   0x15, 0x0010($t1)
/*0x80324414*/  sltu    $at, $t1, $t0
/*0x80324418*/  bnez    $at, .L80324430
/*0x8032441C*/  nop
.L80324420:
/*0x80324420*/  cache   0x11, 0x0000($t0)
/*0x80324424*/  sltu    $at, $t0, $t1
/*0x80324428*/  bnez    $at, .L80324420
/*0x8032442C*/  addiu   $t0, $t0, 0x0010
.L80324430:
/*0x80324430*/  jr      $ra
/*0x80324434*/  nop
.L80324438:
/*0x80324438*/  lui     $t0, %hi(0x80000010)
/*0x8032443C*/  addu    $t1, $t0, $t3
/*0x80324440*/  addiu   $t1, $t1, -0x0010
.L80324444:
/*0x80324444*/  cache   0x01, %lo(0x80000000)($t0)
/*0x80324448*/  sltu    $at, $t0, $t1
/*0x8032444C*/  bnez    $at, .L80324444
/*0x80324450*/  addiu   $t0, $t0, %lo(0x80000010)
/*0x80324454*/  jr      $ra
/*0x80324458*/  nop
