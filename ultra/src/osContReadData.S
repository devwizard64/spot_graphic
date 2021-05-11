#include <ultra64.h>

.set noreorder
.set noat

/* 0x80323A60   s32 osContStartReadData(
    O,
    S,
    M,
    e,
    s,
    g,
    Q,
    u,
    e,
    u,
    e,
     ,
    *,
    m,
    q
) */
.globl osContStartReadData
osContStartReadData:
/*0x80323A60*/  addiu   $sp, $sp, -0x0020
/*0x80323A64*/  sw      $ra, 0x0014($sp)
/*0x80323A68*/  sw      $a0, 0x0020($sp)
/*0x80323A6C*/  jal     __osSiGetAccess
/*0x80323A70*/  sw      $0, 0x001C($sp)
/*0x80323A74*/  lui     $t6, %hi(ultra_bss+0x24F0)
/*0x80323A78*/  lbu     $t6, %lo(ultra_bss+0x24F0)($t6)
/*0x80323A7C*/  li      $at, 0x0001
/*0x80323A80*/  beq     $t6, $at, .L80323AB4
/*0x80323A84*/  nop
/*0x80323A88*/  jal     __osPackReadData
/*0x80323A8C*/  nop
/*0x80323A90*/  lui     $a1, %hi(ultra_bss+0x24B0)
/*0x80323A94*/  addiu   $a1, $a1, %lo(ultra_bss+0x24B0)
/*0x80323A98*/  jal     __osSiRawStartDma
/*0x80323A9C*/  li      $a0, 0x0001
/*0x80323AA0*/  sw      $v0, 0x001C($sp)
/*0x80323AA4*/  lw      $a0, 0x0020($sp)
/*0x80323AA8*/  move    $a1, $0
/*0x80323AAC*/  jal     osRecvMesg
/*0x80323AB0*/  li      $a2, 0x0001
.L80323AB4:
/*0x80323AB4*/  sw      $0, 0x0018($sp)
.L80323AB8:
/*0x80323AB8*/  lw      $t8, 0x0018($sp)
/*0x80323ABC*/  lw      $t0, 0x0018($sp)
/*0x80323AC0*/  lui     $at, %hi(ultra_bss+0x24B0)
/*0x80323AC4*/  sll     $t9, $t8, 2
/*0x80323AC8*/  addu    $at, $at, $t9
/*0x80323ACC*/  li      $t7, 0x00FF
/*0x80323AD0*/  sw      $t7, %lo(ultra_bss+0x24B0)($at)
/*0x80323AD4*/  addiu   $t1, $t0, 0x0001
/*0x80323AD8*/  slti    $at, $t1, 0x0010
/*0x80323ADC*/  bnez    $at, .L80323AB8
/*0x80323AE0*/  sw      $t1, 0x0018($sp)
/*0x80323AE4*/  lui     $at, %hi(ultra_bss+0x24EC)
/*0x80323AE8*/  lui     $a1, %hi(ultra_bss+0x24B0)
/*0x80323AEC*/  sw      $0, %lo(ultra_bss+0x24EC)($at)
/*0x80323AF0*/  addiu   $a1, $a1, %lo(ultra_bss+0x24B0)
/*0x80323AF4*/  jal     __osSiRawStartDma
/*0x80323AF8*/  move    $a0, $0
/*0x80323AFC*/  li      $t2, 0x0001
/*0x80323B00*/  lui     $at, %hi(ultra_bss+0x24F0)
/*0x80323B04*/  sw      $v0, 0x001C($sp)
/*0x80323B08*/  jal     __osSiRelAccess
/*0x80323B0C*/  sb      $t2, %lo(ultra_bss+0x24F0)($at)
/*0x80323B10*/  lw      $ra, 0x0014($sp)
/*0x80323B14*/  lw      $v0, 0x001C($sp)
/*0x80323B18*/  addiu   $sp, $sp, 0x0020
/*0x80323B1C*/  jr      $ra
/*0x80323B20*/  nop

/* 0x80323B24   void osContGetReadData(
    O,
    S,
    C,
    o,
    n,
    t,
    P,
    a,
    d,
     ,
    *,
    p,
    a,
    d
) */
.globl osContGetReadData
osContGetReadData:
/*0x80323B24*/  lui     $t7, %hi(ultra_bss+0x24F1)
/*0x80323B28*/  lbu     $t7, %lo(ultra_bss+0x24F1)($t7)
/*0x80323B2C*/  lui     $t6, %hi(ultra_bss+0x24B0)
/*0x80323B30*/  addiu   $sp, $sp, -0x0010
/*0x80323B34*/  addiu   $t6, $t6, %lo(ultra_bss+0x24B0)
/*0x80323B38*/  sw      $t6, 0x000C($sp)
/*0x80323B3C*/  blez    $t7, .L80323BC4
/*0x80323B40*/  sw      $0, 0x0000($sp)
.L80323B44:
/*0x80323B44*/  lw      $t9, 0x000C($sp)
/*0x80323B48*/  addiu   $t8, $sp, 0x0004
/*0x80323B4C*/  lwl     $at, 0x0000($t9)
/*0x80323B50*/  lwr     $at, 0x0003($t9)
/*0x80323B54*/  sw      $at, 0x0000($t8)
/*0x80323B58*/  lwl     $t1, 0x0004($t9)
/*0x80323B5C*/  lwr     $t1, 0x0007($t9)
/*0x80323B60*/  sw      $t1, 0x0004($t8)
/*0x80323B64*/  lbu     $t2, 0x0006($sp)
/*0x80323B68*/  andi    $t3, $t2, 0x00C0
/*0x80323B6C*/  sra     $t4, $t3, 4
/*0x80323B70*/  sb      $t4, 0x0004($a0)
/*0x80323B74*/  lbu     $t5, 0x0004($a0)
/*0x80323B78*/  bnez    $t5, .L80323B98
/*0x80323B7C*/  nop
/*0x80323B80*/  lhu     $t6, 0x0008($sp)
/*0x80323B84*/  sh      $t6, 0x0000($a0)
/*0x80323B88*/  lb      $t7, 0x000A($sp)
/*0x80323B8C*/  sb      $t7, 0x0002($a0)
/*0x80323B90*/  lb      $t0, 0x000B($sp)
/*0x80323B94*/  sb      $t0, 0x0003($a0)
.L80323B98:
/*0x80323B98*/  lw      $t8, 0x0000($sp)
/*0x80323B9C*/  lui     $t3, %hi(ultra_bss+0x24F1)
/*0x80323BA0*/  lbu     $t3, %lo(ultra_bss+0x24F1)($t3)
/*0x80323BA4*/  lw      $t1, 0x000C($sp)
/*0x80323BA8*/  addiu   $t9, $t8, 0x0001
/*0x80323BAC*/  slt     $at, $t9, $t3
/*0x80323BB0*/  addiu   $t2, $t1, 0x0008
/*0x80323BB4*/  sw      $t2, 0x000C($sp)
/*0x80323BB8*/  sw      $t9, 0x0000($sp)
/*0x80323BBC*/  bnez    $at, .L80323B44
/*0x80323BC0*/  addiu   $a0, $a0, 0x0006
.L80323BC4:
/*0x80323BC4*/  jr      $ra
/*0x80323BC8*/  addiu   $sp, $sp, 0x0010

/* 0x80323BCC */
__osPackReadData:
/*0x80323BCC*/  addiu   $sp, $sp, -0x0010
/*0x80323BD0*/  lui     $t6, %hi(ultra_bss+0x24B0)
/*0x80323BD4*/  addiu   $t6, $t6, %lo(ultra_bss+0x24B0)
/*0x80323BD8*/  sw      $t6, 0x000C($sp)
/*0x80323BDC*/  sw      $0, 0x0000($sp)
.L80323BE0:
/*0x80323BE0*/  lw      $t7, 0x0000($sp)
/*0x80323BE4*/  lw      $t9, 0x0000($sp)
/*0x80323BE8*/  lui     $at, %hi(ultra_bss+0x24B0)
/*0x80323BEC*/  sll     $t8, $t7, 2
/*0x80323BF0*/  addu    $at, $at, $t8
/*0x80323BF4*/  sw      $0, %lo(ultra_bss+0x24B0)($at)
/*0x80323BF8*/  addiu   $t0, $t9, 0x0001
/*0x80323BFC*/  slti    $at, $t0, 0x0010
/*0x80323C00*/  bnez    $at, .L80323BE0
/*0x80323C04*/  sw      $t0, 0x0000($sp)
/*0x80323C08*/  lui     $t9, %hi(ultra_bss+0x24F1)
/*0x80323C0C*/  lbu     $t9, %lo(ultra_bss+0x24F1)($t9)
/*0x80323C10*/  li      $t1, 0x0001
/*0x80323C14*/  lui     $at, %hi(ultra_bss+0x24EC)
/*0x80323C18*/  li      $t2, 0x00FF
/*0x80323C1C*/  li      $t3, 0x0001
/*0x80323C20*/  li      $t4, 0x0004
/*0x80323C24*/  li      $t5, 0x0001
/*0x80323C28*/  li      $t6, 0xFFFF
/*0x80323C2C*/  li      $t7, -0x0001
/*0x80323C30*/  li      $t8, -0x0001
/*0x80323C34*/  sw      $t1, %lo(ultra_bss+0x24EC)($at)
/*0x80323C38*/  sb      $t2, 0x0004($sp)
/*0x80323C3C*/  sb      $t3, 0x0005($sp)
/*0x80323C40*/  sb      $t4, 0x0006($sp)
/*0x80323C44*/  sb      $t5, 0x0007($sp)
/*0x80323C48*/  sh      $t6, 0x0008($sp)
/*0x80323C4C*/  sb      $t7, 0x000A($sp)
/*0x80323C50*/  sb      $t8, 0x000B($sp)
/*0x80323C54*/  blez    $t9, .L80323CA4
/*0x80323C58*/  sw      $0, 0x0000($sp)
.L80323C5C:
/*0x80323C5C*/  addiu   $t1, $sp, 0x0004
/*0x80323C60*/  lw      $at, 0x0000($t1)
/*0x80323C64*/  lw      $t0, 0x000C($sp)
/*0x80323C68*/  lui     $t8, %hi(ultra_bss+0x24F1)
/*0x80323C6C*/  swl     $at, 0x0000($t0)
/*0x80323C70*/  swr     $at, 0x0003($t0)
/*0x80323C74*/  lw      $t3, 0x0004($t1)
/*0x80323C78*/  swl     $t3, 0x0004($t0)
/*0x80323C7C*/  swr     $t3, 0x0007($t0)
/*0x80323C80*/  lw      $t6, 0x0000($sp)
/*0x80323C84*/  lbu     $t8, %lo(ultra_bss+0x24F1)($t8)
/*0x80323C88*/  lw      $t4, 0x000C($sp)
/*0x80323C8C*/  addiu   $t7, $t6, 0x0001
/*0x80323C90*/  slt     $at, $t7, $t8
/*0x80323C94*/  addiu   $t5, $t4, 0x0008
/*0x80323C98*/  sw      $t7, 0x0000($sp)
/*0x80323C9C*/  bnez    $at, .L80323C5C
/*0x80323CA0*/  sw      $t5, 0x000C($sp)
.L80323CA4:
/*0x80323CA4*/  lw      $t2, 0x000C($sp)
/*0x80323CA8*/  li      $t9, 0x00FE
/*0x80323CAC*/  addiu   $sp, $sp, 0x0010
/*0x80323CB0*/  jr      $ra
/*0x80323CB4*/  sb      $t9, 0x0000($t2)
