#include <ultra64.h>

.set noreorder
.set noat

/* 0x80323CC0   s32 osContInit(
    OSMesgQueue *mq,
    u8 *bitpattern,
    OSContStatus *status
) */
.globl osContInit
osContInit:
/*0x80323CC0*/  addiu   $sp, $sp, -0x0080
/*0x80323CC4*/  lui     $t6, %hi(__osContinitialized)
/*0x80323CC8*/  lw      $t6, %lo(__osContinitialized)($t6)
/*0x80323CCC*/  sw      $ra, 0x0024($sp)
/*0x80323CD0*/  sw      $a0, 0x0080($sp)
/*0x80323CD4*/  sw      $a1, 0x0084($sp)
/*0x80323CD8*/  sw      $a2, 0x0088($sp)
/*0x80323CDC*/  beqz    $t6, .L80323CEC
/*0x80323CE0*/  sw      $0, 0x0078($sp)
/*0x80323CE4*/  b       .L80323EAC
/*0x80323CE8*/  move    $v0, $0
.L80323CEC:
/*0x80323CEC*/  li      $t7, 0x0001
/*0x80323CF0*/  lui     $at, %hi(__osContinitialized)
/*0x80323CF4*/  jal     osGetTime
/*0x80323CF8*/  sw      $t7, %lo(__osContinitialized)($at)
/*0x80323CFC*/  lui     $a1, 0x0007A120 >> 16
/*0x80323D00*/  lui     $a2, %hi(osClockRate+0)
/*0x80323D04*/  lui     $a3, %hi(osClockRate+4)
/*0x80323D08*/  sw      $v0, 0x0070($sp)
/*0x80323D0C*/  sw      $v1, 0x0074($sp)
/*0x80323D10*/  lw      $a3, %lo(osClockRate+4)($a3)
/*0x80323D14*/  lw      $a2, %lo(osClockRate+0)($a2)
/*0x80323D18*/  ori     $a1, $a1, 0x0007A120 & 0xFFFF
/*0x80323D1C*/  jal     __ll_mul
/*0x80323D20*/  addiu   $a0, $0, 0x0000
/*0x80323D24*/  sw      $v0, 0x0030($sp)
/*0x80323D28*/  sw      $v1, 0x0034($sp)
/*0x80323D2C*/  lui     $a3, 0x000F4240 >> 16
/*0x80323D30*/  ori     $a3, $a3, 0x000F4240 & 0xFFFF
/*0x80323D34*/  lw      $a1, 0x0034($sp)
/*0x80323D38*/  lw      $a0, 0x0030($sp)
/*0x80323D3C*/  jal     __ull_div
/*0x80323D40*/  addiu   $a2, $0, 0x0000
/*0x80323D44*/  lw      $t8, 0x0070($sp)
/*0x80323D48*/  lw      $t9, 0x0074($sp)
/*0x80323D4C*/  sltu    $at, $v0, $t8
/*0x80323D50*/  bnez    $at, .L80323E18
/*0x80323D54*/  sltu    $at, $t8, $v0
/*0x80323D58*/  bnez    $at, .L80323D68
/*0x80323D5C*/  sltu    $at, $t9, $v1
/*0x80323D60*/  beqz    $at, .L80323E18
/*0x80323D64*/  nop
.L80323D68:
/*0x80323D68*/  addiu   $a0, $sp, 0x0038
/*0x80323D6C*/  addiu   $a1, $sp, 0x007C
/*0x80323D70*/  jal     osCreateMesgQueue
/*0x80323D74*/  li      $a2, 0x0001
/*0x80323D78*/  lui     $a1, 0x0007A120 >> 16
/*0x80323D7C*/  lui     $a2, %hi(osClockRate+0)
/*0x80323D80*/  lui     $a3, %hi(osClockRate+4)
/*0x80323D84*/  lw      $a3, %lo(osClockRate+4)($a3)
/*0x80323D88*/  lw      $a2, %lo(osClockRate+0)($a2)
/*0x80323D8C*/  ori     $a1, $a1, 0x0007A120 & 0xFFFF
/*0x80323D90*/  jal     __ll_mul
/*0x80323D94*/  addiu   $a0, $0, 0x0000
/*0x80323D98*/  sw      $v0, 0x0028($sp)
/*0x80323D9C*/  sw      $v1, 0x002C($sp)
/*0x80323DA0*/  lui     $a3, 0x000F4240 >> 16
/*0x80323DA4*/  ori     $a3, $a3, 0x000F4240 & 0xFFFF
/*0x80323DA8*/  lw      $a1, 0x002C($sp)
/*0x80323DAC*/  lw      $a0, 0x0028($sp)
/*0x80323DB0*/  jal     __ull_div
/*0x80323DB4*/  addiu   $a2, $0, 0x0000
/*0x80323DB8*/  sw      $v0, 0x0030($sp)
/*0x80323DBC*/  sw      $v1, 0x0034($sp)
/*0x80323DC0*/  lw      $t1, 0x0034($sp)
/*0x80323DC4*/  lw      $t0, 0x0030($sp)
/*0x80323DC8*/  lw      $t2, 0x0070($sp)
/*0x80323DCC*/  lw      $t3, 0x0074($sp)
/*0x80323DD0*/  addiu   $t4, $0, 0x0000
/*0x80323DD4*/  addiu   $t5, $0, 0x0000
/*0x80323DD8*/  addiu   $t6, $sp, 0x0038
/*0x80323DDC*/  addiu   $t7, $sp, 0x007C
/*0x80323DE0*/  subu    $a2, $t0, $t2
/*0x80323DE4*/  sltu    $at, $t1, $t3
/*0x80323DE8*/  subu    $a2, $a2, $at
/*0x80323DEC*/  sw      $t7, 0x001C($sp)
/*0x80323DF0*/  sw      $t6, 0x0018($sp)
/*0x80323DF4*/  sw      $t5, 0x0014($sp)
/*0x80323DF8*/  sw      $t4, 0x0010($sp)
/*0x80323DFC*/  addiu   $a0, $sp, 0x0050
/*0x80323E00*/  jal     osSetTimer
/*0x80323E04*/  subu    $a3, $t1, $t3
/*0x80323E08*/  addiu   $a0, $sp, 0x0038
/*0x80323E0C*/  addiu   $a1, $sp, 0x007C
/*0x80323E10*/  jal     osRecvMesg
/*0x80323E14*/  li      $a2, 0x0001
.L80323E18:
/*0x80323E18*/  li      $t8, 0x0004
/*0x80323E1C*/  lui     $at, %hi(ultra_bss+0x24F1)
/*0x80323E20*/  sb      $t8, %lo(ultra_bss+0x24F1)($at)
/*0x80323E24*/  jal     __osPackRequestData
/*0x80323E28*/  li      $a0, 0x00FF
/*0x80323E2C*/  lui     $a1, %hi(ultra_bss+0x24B0)
/*0x80323E30*/  addiu   $a1, $a1, %lo(ultra_bss+0x24B0)
/*0x80323E34*/  jal     __osSiRawStartDma
/*0x80323E38*/  li      $a0, 0x0001
/*0x80323E3C*/  sw      $v0, 0x0078($sp)
/*0x80323E40*/  lw      $a0, 0x0080($sp)
/*0x80323E44*/  addiu   $a1, $sp, 0x007C
/*0x80323E48*/  jal     osRecvMesg
/*0x80323E4C*/  li      $a2, 0x0001
/*0x80323E50*/  lui     $a1, %hi(ultra_bss+0x24B0)
/*0x80323E54*/  addiu   $a1, $a1, %lo(ultra_bss+0x24B0)
/*0x80323E58*/  jal     __osSiRawStartDma
/*0x80323E5C*/  move    $a0, $0
/*0x80323E60*/  sw      $v0, 0x0078($sp)
/*0x80323E64*/  lw      $a0, 0x0080($sp)
/*0x80323E68*/  addiu   $a1, $sp, 0x007C
/*0x80323E6C*/  jal     osRecvMesg
/*0x80323E70*/  li      $a2, 0x0001
/*0x80323E74*/  lw      $a0, 0x0084($sp)
/*0x80323E78*/  jal     __osContGetInitData
/*0x80323E7C*/  lw      $a1, 0x0088($sp)
/*0x80323E80*/  li      $t9, 0x00FF
/*0x80323E84*/  lui     $at, %hi(ultra_bss+0x24F0)
/*0x80323E88*/  jal     __osSiCreateAccessQueue
/*0x80323E8C*/  sb      $t9, %lo(ultra_bss+0x24F0)($at)
/*0x80323E90*/  lui     $a0, %hi(ultra_bss+0x2518)
/*0x80323E94*/  lui     $a1, %hi(ultra_bss+0x2530)
/*0x80323E98*/  addiu   $a1, $a1, %lo(ultra_bss+0x2530)
/*0x80323E9C*/  addiu   $a0, $a0, %lo(ultra_bss+0x2518)
/*0x80323EA0*/  jal     osCreateMesgQueue
/*0x80323EA4*/  li      $a2, 0x0001
/*0x80323EA8*/  lw      $v0, 0x0078($sp)
.L80323EAC:
/*0x80323EAC*/  lw      $ra, 0x0024($sp)
/*0x80323EB0*/  addiu   $sp, $sp, 0x0080
/*0x80323EB4*/  jr      $ra
/*0x80323EB8*/  nop

/* 0x80323EBC */
__osContGetInitData:
/*0x80323EBC*/  lui     $t7, %hi(ultra_bss+0x24F1)
/*0x80323EC0*/  lbu     $t7, %lo(ultra_bss+0x24F1)($t7)
/*0x80323EC4*/  addiu   $sp, $sp, -0x0018
/*0x80323EC8*/  lui     $t6, %hi(ultra_bss+0x24B0)
/*0x80323ECC*/  addiu   $t6, $t6, %lo(ultra_bss+0x24B0)
/*0x80323ED0*/  sb      $0, 0x0007($sp)
/*0x80323ED4*/  sw      $t6, 0x0014($sp)
/*0x80323ED8*/  blez    $t7, .L80323F7C
/*0x80323EDC*/  sw      $0, 0x0008($sp)
.L80323EE0:
/*0x80323EE0*/  lw      $t9, 0x0014($sp)
/*0x80323EE4*/  addiu   $t8, $sp, 0x000C
/*0x80323EE8*/  lwl     $at, 0x0000($t9)
/*0x80323EEC*/  lwr     $at, 0x0003($t9)
/*0x80323EF0*/  sw      $at, 0x0000($t8)
/*0x80323EF4*/  lwl     $t1, 0x0004($t9)
/*0x80323EF8*/  lwr     $t1, 0x0007($t9)
/*0x80323EFC*/  sw      $t1, 0x0004($t8)
/*0x80323F00*/  lbu     $t2, 0x000E($sp)
/*0x80323F04*/  andi    $t3, $t2, 0x00C0
/*0x80323F08*/  sra     $t4, $t3, 4
/*0x80323F0C*/  sb      $t4, 0x0003($a1)
/*0x80323F10*/  lbu     $t5, 0x0003($a1)
/*0x80323F14*/  bnez    $t5, .L80323F50
/*0x80323F18*/  nop
/*0x80323F1C*/  lbu     $t6, 0x0011($sp)
/*0x80323F20*/  lbu     $t0, 0x0010($sp)
/*0x80323F24*/  li      $t3, 0x0001
/*0x80323F28*/  sll     $t7, $t6, 8
/*0x80323F2C*/  or      $t8, $t7, $t0
/*0x80323F30*/  sh      $t8, 0x0000($a1)
/*0x80323F34*/  lbu     $t9, 0x0012($sp)
/*0x80323F38*/  sb      $t9, 0x0002($a1)
/*0x80323F3C*/  lw      $t2, 0x0008($sp)
/*0x80323F40*/  lbu     $t1, 0x0007($sp)
/*0x80323F44*/  sllv    $t4, $t3, $t2
/*0x80323F48*/  or      $t5, $t1, $t4
/*0x80323F4C*/  sb      $t5, 0x0007($sp)
.L80323F50:
/*0x80323F50*/  lw      $t6, 0x0008($sp)
/*0x80323F54*/  lui     $t9, %hi(ultra_bss+0x24F1)
/*0x80323F58*/  lbu     $t9, %lo(ultra_bss+0x24F1)($t9)
/*0x80323F5C*/  lw      $t0, 0x0014($sp)
/*0x80323F60*/  addiu   $t7, $t6, 0x0001
/*0x80323F64*/  slt     $at, $t7, $t9
/*0x80323F68*/  addiu   $t8, $t0, 0x0008
/*0x80323F6C*/  sw      $t8, 0x0014($sp)
/*0x80323F70*/  sw      $t7, 0x0008($sp)
/*0x80323F74*/  bnez    $at, .L80323EE0
/*0x80323F78*/  addiu   $a1, $a1, 0x0004
.L80323F7C:
/*0x80323F7C*/  lbu     $t3, 0x0007($sp)
/*0x80323F80*/  addiu   $sp, $sp, 0x0018
/*0x80323F84*/  jr      $ra
/*0x80323F88*/  sb      $t3, 0x0000($a0)

/* 0x80323F8C */
__osPackRequestData:
/*0x80323F8C*/  addiu   $sp, $sp, -0x0010
/*0x80323F90*/  andi    $a0, $a0, 0x00FF
/*0x80323F94*/  sw      $0, 0x0000($sp)
.L80323F98:
/*0x80323F98*/  lw      $t6, 0x0000($sp)
/*0x80323F9C*/  lw      $t8, 0x0000($sp)
/*0x80323FA0*/  lui     $at, %hi(ultra_bss+0x24B0)
/*0x80323FA4*/  sll     $t7, $t6, 2
/*0x80323FA8*/  addu    $at, $at, $t7
/*0x80323FAC*/  sw      $0, %lo(ultra_bss+0x24B0)($at)
/*0x80323FB0*/  addiu   $t9, $t8, 0x0001
/*0x80323FB4*/  slti    $at, $t9, 0x0010
/*0x80323FB8*/  bnez    $at, .L80323F98
/*0x80323FBC*/  sw      $t9, 0x0000($sp)
/*0x80323FC0*/  lui     $t9, %hi(ultra_bss+0x24F1)
/*0x80323FC4*/  lbu     $t9, %lo(ultra_bss+0x24F1)($t9)
/*0x80323FC8*/  lui     $t1, %hi(ultra_bss+0x24B0)
/*0x80323FCC*/  li      $t0, 0x0001
/*0x80323FD0*/  lui     $at, %hi(ultra_bss+0x24EC)
/*0x80323FD4*/  addiu   $t1, $t1, %lo(ultra_bss+0x24B0)
/*0x80323FD8*/  li      $t2, 0x00FF
/*0x80323FDC*/  li      $t3, 0x0001
/*0x80323FE0*/  li      $t4, 0x0003
/*0x80323FE4*/  li      $t5, 0x00FF
/*0x80323FE8*/  li      $t6, 0x00FF
/*0x80323FEC*/  li      $t7, 0x00FF
/*0x80323FF0*/  li      $t8, 0x00FF
/*0x80323FF4*/  sw      $t0, %lo(ultra_bss+0x24EC)($at)
/*0x80323FF8*/  sw      $t1, 0x000C($sp)
/*0x80323FFC*/  sb      $t2, 0x0004($sp)
/*0x80324000*/  sb      $t3, 0x0005($sp)
/*0x80324004*/  sb      $t4, 0x0006($sp)
/*0x80324008*/  sb      $a0, 0x0007($sp)
/*0x8032400C*/  sb      $t5, 0x0008($sp)
/*0x80324010*/  sb      $t6, 0x0009($sp)
/*0x80324014*/  sb      $t7, 0x000A($sp)
/*0x80324018*/  sb      $t8, 0x000B($sp)
/*0x8032401C*/  blez    $t9, .L8032406C
/*0x80324020*/  sw      $0, 0x0000($sp)
.L80324024:
/*0x80324024*/  addiu   $t1, $sp, 0x0004
/*0x80324028*/  lw      $at, 0x0000($t1)
/*0x8032402C*/  lw      $t0, 0x000C($sp)
/*0x80324030*/  lui     $t8, %hi(ultra_bss+0x24F1)
/*0x80324034*/  swl     $at, 0x0000($t0)
/*0x80324038*/  swr     $at, 0x0003($t0)
/*0x8032403C*/  lw      $t3, 0x0004($t1)
/*0x80324040*/  swl     $t3, 0x0004($t0)
/*0x80324044*/  swr     $t3, 0x0007($t0)
/*0x80324048*/  lw      $t6, 0x0000($sp)
/*0x8032404C*/  lbu     $t8, %lo(ultra_bss+0x24F1)($t8)
/*0x80324050*/  lw      $t4, 0x000C($sp)
/*0x80324054*/  addiu   $t7, $t6, 0x0001
/*0x80324058*/  slt     $at, $t7, $t8
/*0x8032405C*/  addiu   $t5, $t4, 0x0008
/*0x80324060*/  sw      $t7, 0x0000($sp)
/*0x80324064*/  bnez    $at, .L80324024
/*0x80324068*/  sw      $t5, 0x000C($sp)
.L8032406C:
/*0x8032406C*/  lw      $t2, 0x000C($sp)
/*0x80324070*/  li      $t9, 0x00FE
/*0x80324074*/  addiu   $sp, $sp, 0x0010
/*0x80324078*/  jr      $ra
/*0x8032407C*/  sb      $t9, 0x0000($t2)
