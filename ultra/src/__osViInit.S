#include <ultra64.h>

.set noreorder
.set noat

/* 0x80327510 */
.globl __osViInit
__osViInit:
/*0x80327510*/  lui     $t6, %hi(osTvType)
/*0x80327514*/  lw      $t6, %lo(osTvType)($t6)
/*0x80327518*/  addiu   $sp, $sp, -0x0018
/*0x8032751C*/  sw      $ra, 0x0014($sp)
/*0x80327520*/  lui     $at, %hi(ultra_data_80335A28)
/*0x80327524*/  lui     $a0, %hi(ultra_data_803359C0)
/*0x80327528*/  addiu   $a0, $a0, %lo(ultra_data_803359C0)
/*0x8032752C*/  li      $a1, 0x0060
/*0x80327530*/  jal     bzero
/*0x80327534*/  sw      $t6, %lo(ultra_data_80335A28)($at)
/*0x80327538*/  lui     $t7, %hi(ultra_data_803359C0)
/*0x8032753C*/  addiu   $t7, $t7, %lo(ultra_data_803359C0)
/*0x80327540*/  lui     $at, %hi(__osViCurr)
/*0x80327544*/  sw      $t7, %lo(__osViCurr)($at)
/*0x80327548*/  lui     $at, %hi(__osViNext)
/*0x8032754C*/  addiu   $t8, $t7, 0x0030
/*0x80327550*/  sw      $t8, %lo(__osViNext)($at)
/*0x80327554*/  li      $t9, 0x0001
/*0x80327558*/  sh      $t9, 0x0032($t7)
/*0x8032755C*/  lui     $t1, %hi(__osViCurr)
/*0x80327560*/  lw      $t1, %lo(__osViCurr)($t1)
/*0x80327564*/  li      $t0, 0x0001
/*0x80327568*/  lui     $t2, %hi(ultra_data_80335A28)
/*0x8032756C*/  sh      $t0, 0x0002($t1)
/*0x80327570*/  lw      $t2, %lo(ultra_data_80335A28)($t2)
/*0x80327574*/  li      $at, 0x0001
/*0x80327578*/  bne     $t2, $at, .L803275A8
/*0x8032757C*/  nop
/*0x80327580*/  lui     $t4, %hi(__osViNext)
/*0x80327584*/  lw      $t4, %lo(__osViNext)($t4)
/*0x80327588*/  lui     $t3, %hi(osViModeNtscLan1)
/*0x8032758C*/  addiu   $t3, $t3, %lo(osViModeNtscLan1)
/*0x80327590*/  lui     $t5, 0x02E6D354 >> 16
/*0x80327594*/  ori     $t5, $t5, 0x02E6D354 & 0xFFFF
/*0x80327598*/  lui     $at, %hi(ultra_data_80335A2C)
/*0x8032759C*/  sw      $t3, 0x0008($t4)
/*0x803275A0*/  b       .L803275CC
/*0x803275A4*/  sw      $t5, %lo(ultra_data_80335A2C)($at)
.L803275A8:
/*0x803275A8*/  lui     $t8, %hi(__osViNext)
/*0x803275AC*/  lw      $t8, %lo(__osViNext)($t8)
/*0x803275B0*/  lui     $t6, %hi(osViModePalLan1)
/*0x803275B4*/  addiu   $t6, $t6, %lo(osViModePalLan1)
/*0x803275B8*/  lui     $t9, 0x02E6025C >> 16
/*0x803275BC*/  ori     $t9, $t9, 0x02E6025C & 0xFFFF
/*0x803275C0*/  lui     $at, %hi(ultra_data_80335A2C)
/*0x803275C4*/  sw      $t6, 0x0008($t8)
/*0x803275C8*/  sw      $t9, %lo(ultra_data_80335A2C)($at)
.L803275CC:
/*0x803275CC*/  lui     $t0, %hi(__osViNext)
/*0x803275D0*/  lw      $t0, %lo(__osViNext)($t0)
/*0x803275D4*/  li      $t7, 0x0020
/*0x803275D8*/  lui     $t1, %hi(__osViNext)
/*0x803275DC*/  sh      $t7, 0x0000($t0)
/*0x803275E0*/  lw      $t1, %lo(__osViNext)($t1)
/*0x803275E4*/  lui     $t4, %hi(0xA4400010)
/*0x803275E8*/  lw      $t2, 0x0008($t1)
/*0x803275EC*/  lw      $t3, 0x0004($t2)
/*0x803275F0*/  sw      $t3, 0x000C($t1)
/*0x803275F4*/  lw      $t5, %lo(0xA4400010)($t4)
/*0x803275F8*/  sltiu   $at, $t5, 0x000B
/*0x803275FC*/  bnez    $at, .L80327618
/*0x80327600*/  nop
.L80327604:
/*0x80327604*/  lui     $t6, %hi(0xA4400010)
/*0x80327608*/  lw      $t8, %lo(0xA4400010)($t6)
/*0x8032760C*/  sltiu   $at, $t8, 0x000B
/*0x80327610*/  beqz    $at, .L80327604
/*0x80327614*/  nop
.L80327618:
/*0x80327618*/  lui     $t9, %hi(0xA4400000)
/*0x8032761C*/  jal     __osViSwapContext
/*0x80327620*/  sw      $0, %lo(0xA4400000)($t9)
/*0x80327624*/  lw      $ra, 0x0014($sp)
/*0x80327628*/  addiu   $sp, $sp, 0x0018
/*0x8032762C*/  jr      $ra
/*0x80327630*/  nop
