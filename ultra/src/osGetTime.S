#include <ultra64.h>

.set noreorder
.set noat

/* 0x80325070   OSTime osGetTime(void) */
.globl osGetTime
osGetTime:
/*0x80325070*/  addiu   $sp, $sp, -0x0038
/*0x80325074*/  sw      $ra, 0x001C($sp)
/*0x80325078*/  jal     __osDisableInt
/*0x8032507C*/  sw      $s0, 0x0018($sp)
/*0x80325080*/  jal     osGetCount
/*0x80325084*/  move    $s0, $v0
/*0x80325088*/  sw      $v0, 0x0034($sp)
/*0x8032508C*/  lui     $t7, %hi(ultra_bss+0x2578)
/*0x80325090*/  lw      $t7, %lo(ultra_bss+0x2578)($t7)
/*0x80325094*/  lw      $t6, 0x0034($sp)
/*0x80325098*/  lui     $t0, %hi(ultra_bss+0x2570)
/*0x8032509C*/  lui     $t1, %hi(ultra_bss+0x2574)
/*0x803250A0*/  lw      $t1, %lo(ultra_bss+0x2574)($t1)
/*0x803250A4*/  lw      $t0, %lo(ultra_bss+0x2570)($t0)
/*0x803250A8*/  subu    $t8, $t6, $t7
/*0x803250AC*/  sw      $t8, 0x0030($sp)
/*0x803250B0*/  move    $a0, $s0
/*0x803250B4*/  sw      $t1, 0x002C($sp)
/*0x803250B8*/  jal     __osRestoreInt
/*0x803250BC*/  sw      $t0, 0x0028($sp)
/*0x803250C0*/  lw      $t9, 0x0030($sp)
/*0x803250C4*/  lw      $t5, 0x002C($sp)
/*0x803250C8*/  lw      $ra, 0x001C($sp)
/*0x803250CC*/  move    $t3, $t9
/*0x803250D0*/  addu    $v1, $t3, $t5
/*0x803250D4*/  lw      $t4, 0x0028($sp)
/*0x803250D8*/  addiu   $t2, $0, 0x0000
/*0x803250DC*/  sltu    $at, $v1, $t5
/*0x803250E0*/  addu    $v0, $at, $t2
/*0x803250E4*/  lw      $s0, 0x0018($sp)
/*0x803250E8*/  addiu   $sp, $sp, 0x0038
/*0x803250EC*/  jr      $ra
/*0x803250F0*/  addu    $v0, $v0, $t4
