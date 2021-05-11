#include <ultra64.h>

.set noreorder
.set noat

/* 0x80328AF0   void osEepromWrite(OSMesgQueue *mq, u8 address, u8 *buffer) */
.globl osEepromWrite
osEepromWrite:
/*0x80328AF0*/  addiu   $sp, $sp, -0x0038
/*0x80328AF4*/  sw      $a1, 0x003C($sp)
/*0x80328AF8*/  lbu     $t7, 0x003F($sp)
/*0x80328AFC*/  lui     $t6, %hi(ultra_bss+0x25D0)
/*0x80328B00*/  addiu   $t6, $t6, %lo(ultra_bss+0x25D0)
/*0x80328B04*/  slti    $at, $t7, 0x0041
/*0x80328B08*/  sw      $ra, 0x0014($sp)
/*0x80328B0C*/  sw      $a0, 0x0038($sp)
/*0x80328B10*/  sw      $a2, 0x0040($sp)
/*0x80328B14*/  sw      $0, 0x0034($sp)
/*0x80328B18*/  bnez    $at, .L80328B28
/*0x80328B1C*/  sw      $t6, 0x002C($sp)
/*0x80328B20*/  b       .L80328C90
/*0x80328B24*/  li      $v0, -0x0001
.L80328B28:
/*0x80328B28*/  jal     __osSiGetAccess
/*0x80328B2C*/  nop
/*0x80328B30*/  lw      $a0, 0x0038($sp)
/*0x80328B34*/  jal     __osEepStatus
/*0x80328B38*/  addiu   $a1, $sp, 0x001C
/*0x80328B3C*/  sw      $v0, 0x0034($sp)
/*0x80328B40*/  lw      $t8, 0x0034($sp)
/*0x80328B44*/  bnez    $t8, .L80328B5C
/*0x80328B48*/  nop
/*0x80328B4C*/  lhu     $t9, 0x001C($sp)
/*0x80328B50*/  li      $at, 0x8000
/*0x80328B54*/  beq     $t9, $at, .L80328B64
/*0x80328B58*/  nop
.L80328B5C:
/*0x80328B5C*/  b       .L80328C90
/*0x80328B60*/  li      $v0, 0x0008
.L80328B64:
/*0x80328B64*/  lbu     $t0, 0x001E($sp)
/*0x80328B68*/  andi    $t1, $t0, 0x0080
/*0x80328B6C*/  beqz    $t1, .L80328B90
/*0x80328B70*/  nop
.L80328B74:
/*0x80328B74*/  lw      $a0, 0x0038($sp)
/*0x80328B78*/  jal     __osEepStatus
/*0x80328B7C*/  addiu   $a1, $sp, 0x001C
/*0x80328B80*/  lbu     $t2, 0x001E($sp)
/*0x80328B84*/  andi    $t3, $t2, 0x0080
/*0x80328B88*/  bnez    $t3, .L80328B74
/*0x80328B8C*/  nop
.L80328B90:
/*0x80328B90*/  lbu     $a0, 0x003F($sp)
/*0x80328B94*/  jal     __osPackEepWriteData
/*0x80328B98*/  lw      $a1, 0x0040($sp)
/*0x80328B9C*/  lui     $a1, %hi(ultra_bss+0x25D0)
/*0x80328BA0*/  addiu   $a1, $a1, %lo(ultra_bss+0x25D0)
/*0x80328BA4*/  jal     __osSiRawStartDma
/*0x80328BA8*/  li      $a0, 0x0001
/*0x80328BAC*/  sw      $v0, 0x0034($sp)
/*0x80328BB0*/  lw      $a0, 0x0038($sp)
/*0x80328BB4*/  move    $a1, $0
/*0x80328BB8*/  jal     osRecvMesg
/*0x80328BBC*/  li      $a2, 0x0001
/*0x80328BC0*/  sw      $0, 0x0030($sp)
.L80328BC4:
/*0x80328BC4*/  lw      $t5, 0x0030($sp)
/*0x80328BC8*/  lw      $t7, 0x0030($sp)
/*0x80328BCC*/  lui     $at, %hi(ultra_bss+0x25D0)
/*0x80328BD0*/  sll     $t6, $t5, 2
/*0x80328BD4*/  addu    $at, $at, $t6
/*0x80328BD8*/  li      $t4, 0x00FF
/*0x80328BDC*/  sw      $t4, %lo(ultra_bss+0x25D0)($at)
/*0x80328BE0*/  addiu   $t8, $t7, 0x0001
/*0x80328BE4*/  slti    $at, $t8, 0x0010
/*0x80328BE8*/  bnez    $at, .L80328BC4
/*0x80328BEC*/  sw      $t8, 0x0030($sp)
/*0x80328BF0*/  lui     $at, %hi(ultra_bss+0x260C)
/*0x80328BF4*/  lui     $a1, %hi(ultra_bss+0x25D0)
/*0x80328BF8*/  sw      $0, %lo(ultra_bss+0x260C)($at)
/*0x80328BFC*/  addiu   $a1, $a1, %lo(ultra_bss+0x25D0)
/*0x80328C00*/  jal     __osSiRawStartDma
/*0x80328C04*/  move    $a0, $0
/*0x80328C08*/  li      $t9, 0x0005
/*0x80328C0C*/  lui     $at, %hi(ultra_bss+0x24F0)
/*0x80328C10*/  sw      $v0, 0x0034($sp)
/*0x80328C14*/  sb      $t9, %lo(ultra_bss+0x24F0)($at)
/*0x80328C18*/  lw      $a0, 0x0038($sp)
/*0x80328C1C*/  move    $a1, $0
/*0x80328C20*/  jal     osRecvMesg
/*0x80328C24*/  li      $a2, 0x0001
/*0x80328C28*/  sw      $0, 0x0030($sp)
.L80328C2C:
/*0x80328C2C*/  lw      $t2, 0x0030($sp)
/*0x80328C30*/  lw      $t0, 0x002C($sp)
/*0x80328C34*/  addiu   $t3, $t2, 0x0001
/*0x80328C38*/  slti    $at, $t3, 0x0004
/*0x80328C3C*/  addiu   $t1, $t0, 0x0001
/*0x80328C40*/  sw      $t3, 0x0030($sp)
/*0x80328C44*/  bnez    $at, .L80328C2C
/*0x80328C48*/  sw      $t1, 0x002C($sp)
/*0x80328C4C*/  lw      $t4, 0x002C($sp)
/*0x80328C50*/  addiu   $t5, $sp, 0x0020
/*0x80328C54*/  lwl     $at, 0x0000($t4)
/*0x80328C58*/  lwr     $at, 0x0003($t4)
/*0x80328C5C*/  sw      $at, 0x0000($t5)
/*0x80328C60*/  lwl     $t7, 0x0004($t4)
/*0x80328C64*/  lwr     $t7, 0x0007($t4)
/*0x80328C68*/  sw      $t7, 0x0004($t5)
/*0x80328C6C*/  lwl     $at, 0x0008($t4)
/*0x80328C70*/  lwr     $at, 0x000B($t4)
/*0x80328C74*/  sw      $at, 0x0008($t5)
/*0x80328C78*/  lbu     $t8, 0x0021($sp)
/*0x80328C7C*/  andi    $t9, $t8, 0x00C0
/*0x80328C80*/  sra     $t0, $t9, 4
/*0x80328C84*/  jal     __osSiRelAccess
/*0x80328C88*/  sw      $t0, 0x0034($sp)
/*0x80328C8C*/  lw      $v0, 0x0034($sp)
.L80328C90:
/*0x80328C90*/  lw      $ra, 0x0014($sp)
/*0x80328C94*/  addiu   $sp, $sp, 0x0038
/*0x80328C98*/  jr      $ra
/*0x80328C9C*/  nop

/* 0x80328CA0 */
__osPackEepWriteData:
/*0x80328CA0*/  addiu   $sp, $sp, -0x0018
/*0x80328CA4*/  lui     $t6, %hi(ultra_bss+0x25D0)
/*0x80328CA8*/  addiu   $t6, $t6, %lo(ultra_bss+0x25D0)
/*0x80328CAC*/  andi    $a0, $a0, 0x00FF
/*0x80328CB0*/  sw      $t6, 0x0014($sp)
/*0x80328CB4*/  sw      $0, 0x0004($sp)
.L80328CB8:
/*0x80328CB8*/  lw      $t8, 0x0004($sp)
/*0x80328CBC*/  lw      $t0, 0x0004($sp)
/*0x80328CC0*/  lui     $at, %hi(ultra_bss+0x25D0)
/*0x80328CC4*/  sll     $t9, $t8, 2
/*0x80328CC8*/  addu    $at, $at, $t9
/*0x80328CCC*/  li      $t7, 0x00FF
/*0x80328CD0*/  sw      $t7, %lo(ultra_bss+0x25D0)($at)
/*0x80328CD4*/  addiu   $t1, $t0, 0x0001
/*0x80328CD8*/  slti    $at, $t1, 0x0010
/*0x80328CDC*/  bnez    $at, .L80328CB8
/*0x80328CE0*/  sw      $t1, 0x0004($sp)
/*0x80328CE4*/  li      $t2, 0x0001
/*0x80328CE8*/  lui     $at, %hi(ultra_bss+0x260C)
/*0x80328CEC*/  li      $t3, 0x000A
/*0x80328CF0*/  li      $t4, 0x0001
/*0x80328CF4*/  li      $t5, 0x0005
/*0x80328CF8*/  sw      $t2, %lo(ultra_bss+0x260C)($at)
/*0x80328CFC*/  sb      $t3, 0x0008($sp)
/*0x80328D00*/  sb      $t4, 0x0009($sp)
/*0x80328D04*/  sb      $t5, 0x000A($sp)
/*0x80328D08*/  sb      $a0, 0x000B($sp)
/*0x80328D0C*/  sw      $0, 0x0004($sp)
.L80328D10:
/*0x80328D10*/  lw      $t8, 0x0004($sp)
/*0x80328D14*/  lbu     $t6, 0x0000($a1)
/*0x80328D18*/  addiu   $a1, $a1, 0x0001
/*0x80328D1C*/  addu    $t7, $sp, $t8
/*0x80328D20*/  sb      $t6, 0x000C($t7)
/*0x80328D24*/  lw      $t9, 0x0004($sp)
/*0x80328D28*/  addiu   $t0, $t9, 0x0001
/*0x80328D2C*/  slti    $at, $t0, 0x0008
/*0x80328D30*/  bnez    $at, .L80328D10
/*0x80328D34*/  sw      $t0, 0x0004($sp)
/*0x80328D38*/  sw      $0, 0x0004($sp)
.L80328D3C:
/*0x80328D3C*/  lw      $t1, 0x0014($sp)
/*0x80328D40*/  sb      $0, 0x0000($t1)
/*0x80328D44*/  lw      $t4, 0x0004($sp)
/*0x80328D48*/  lw      $t2, 0x0014($sp)
/*0x80328D4C*/  addiu   $t5, $t4, 0x0001
/*0x80328D50*/  slti    $at, $t5, 0x0004
/*0x80328D54*/  addiu   $t3, $t2, 0x0001
/*0x80328D58*/  sw      $t5, 0x0004($sp)
/*0x80328D5C*/  bnez    $at, .L80328D3C
/*0x80328D60*/  sw      $t3, 0x0014($sp)
/*0x80328D64*/  addiu   $t8, $sp, 0x0008
/*0x80328D68*/  lw      $at, 0x0000($t8)
/*0x80328D6C*/  lw      $t6, 0x0014($sp)
/*0x80328D70*/  li      $t2, 0x00FE
/*0x80328D74*/  swl     $at, 0x0000($t6)
/*0x80328D78*/  swr     $at, 0x0003($t6)
/*0x80328D7C*/  lw      $t9, 0x0004($t8)
/*0x80328D80*/  swl     $t9, 0x0004($t6)
/*0x80328D84*/  swr     $t9, 0x0007($t6)
/*0x80328D88*/  lw      $at, 0x0008($t8)
/*0x80328D8C*/  swl     $at, 0x0008($t6)
/*0x80328D90*/  swr     $at, 0x000B($t6)
/*0x80328D94*/  lw      $t0, 0x0014($sp)
/*0x80328D98*/  addiu   $t1, $t0, 0x000C
/*0x80328D9C*/  sw      $t1, 0x0014($sp)
/*0x80328DA0*/  sb      $t2, 0x0000($t1)
/*0x80328DA4*/  jr      $ra
/*0x80328DA8*/  addiu   $sp, $sp, 0x0018

/* 0x80328DAC */
.globl __osEepStatus
__osEepStatus:
/*0x80328DAC*/  addiu   $sp, $sp, -0x0030
/*0x80328DB0*/  lui     $t6, %hi(ultra_bss+0x25D0)
/*0x80328DB4*/  addiu   $t6, $t6, %lo(ultra_bss+0x25D0)
/*0x80328DB8*/  sw      $ra, 0x0014($sp)
/*0x80328DBC*/  sw      $a0, 0x0030($sp)
/*0x80328DC0*/  sw      $a1, 0x0034($sp)
/*0x80328DC4*/  sw      $0, 0x002C($sp)
/*0x80328DC8*/  sw      $t6, 0x0024($sp)
/*0x80328DCC*/  sw      $0, 0x0028($sp)
.L80328DD0:
/*0x80328DD0*/  lw      $t7, 0x0028($sp)
/*0x80328DD4*/  lw      $t9, 0x0028($sp)
/*0x80328DD8*/  lui     $at, %hi(ultra_bss+0x25D0)
/*0x80328DDC*/  sll     $t8, $t7, 2
/*0x80328DE0*/  addu    $at, $at, $t8
/*0x80328DE4*/  sw      $0, %lo(ultra_bss+0x25D0)($at)
/*0x80328DE8*/  addiu   $t0, $t9, 0x0001
/*0x80328DEC*/  slti    $at, $t0, 0x0010
/*0x80328DF0*/  bnez    $at, .L80328DD0
/*0x80328DF4*/  sw      $t0, 0x0028($sp)
/*0x80328DF8*/  lui     $t2, %hi(ultra_bss+0x25D0)
/*0x80328DFC*/  li      $t1, 0x0001
/*0x80328E00*/  lui     $at, %hi(ultra_bss+0x260C)
/*0x80328E04*/  addiu   $t2, $t2, %lo(ultra_bss+0x25D0)
/*0x80328E08*/  sw      $t1, %lo(ultra_bss+0x260C)($at)
/*0x80328E0C*/  sw      $t2, 0x0024($sp)
/*0x80328E10*/  sw      $0, 0x0028($sp)
.L80328E14:
/*0x80328E14*/  lw      $t3, 0x0024($sp)
/*0x80328E18*/  sb      $0, 0x0000($t3)
/*0x80328E1C*/  lw      $t6, 0x0028($sp)
/*0x80328E20*/  lw      $t4, 0x0024($sp)
/*0x80328E24*/  addiu   $t7, $t6, 0x0001
/*0x80328E28*/  slti    $at, $t7, 0x0004
/*0x80328E2C*/  addiu   $t5, $t4, 0x0001
/*0x80328E30*/  sw      $t7, 0x0028($sp)
/*0x80328E34*/  bnez    $at, .L80328E14
/*0x80328E38*/  sw      $t5, 0x0024($sp)
/*0x80328E3C*/  li      $t8, 0x00FF
/*0x80328E40*/  li      $t9, 0x0001
/*0x80328E44*/  li      $t0, 0x0003
/*0x80328E48*/  li      $t1, 0x00FF
/*0x80328E4C*/  li      $t2, 0x00FF
/*0x80328E50*/  li      $t3, 0x00FF
/*0x80328E54*/  li      $t4, 0x00FF
/*0x80328E58*/  sb      $t8, 0x001C($sp)
/*0x80328E5C*/  sb      $t9, 0x001D($sp)
/*0x80328E60*/  sb      $t0, 0x001E($sp)
/*0x80328E64*/  sb      $0, 0x001F($sp)
/*0x80328E68*/  sb      $t1, 0x0020($sp)
/*0x80328E6C*/  sb      $t2, 0x0021($sp)
/*0x80328E70*/  sb      $t3, 0x0022($sp)
/*0x80328E74*/  sb      $t4, 0x0023($sp)
/*0x80328E78*/  addiu   $t6, $sp, 0x001C
/*0x80328E7C*/  lw      $at, 0x0000($t6)
/*0x80328E80*/  lw      $t5, 0x0024($sp)
/*0x80328E84*/  li      $t2, 0x00FE
/*0x80328E88*/  lui     $a1, %hi(ultra_bss+0x25D0)
/*0x80328E8C*/  swl     $at, 0x0000($t5)
/*0x80328E90*/  swr     $at, 0x0003($t5)
/*0x80328E94*/  lw      $t9, 0x0004($t6)
/*0x80328E98*/  addiu   $a1, $a1, %lo(ultra_bss+0x25D0)
/*0x80328E9C*/  li      $a0, 0x0001
/*0x80328EA0*/  swl     $t9, 0x0004($t5)
/*0x80328EA4*/  swr     $t9, 0x0007($t5)
/*0x80328EA8*/  lw      $t0, 0x0024($sp)
/*0x80328EAC*/  addiu   $t1, $t0, 0x0008
/*0x80328EB0*/  sw      $t1, 0x0024($sp)
/*0x80328EB4*/  jal     __osSiRawStartDma
/*0x80328EB8*/  sb      $t2, 0x0000($t1)
/*0x80328EBC*/  sw      $v0, 0x002C($sp)
/*0x80328EC0*/  lw      $a0, 0x0030($sp)
/*0x80328EC4*/  move    $a1, $0
/*0x80328EC8*/  jal     osRecvMesg
/*0x80328ECC*/  li      $a2, 0x0001
/*0x80328ED0*/  li      $t3, 0x0005
/*0x80328ED4*/  lui     $at, %hi(ultra_bss+0x24F0)
/*0x80328ED8*/  lui     $a1, %hi(ultra_bss+0x25D0)
/*0x80328EDC*/  sb      $t3, %lo(ultra_bss+0x24F0)($at)
/*0x80328EE0*/  addiu   $a1, $a1, %lo(ultra_bss+0x25D0)
/*0x80328EE4*/  jal     __osSiRawStartDma
/*0x80328EE8*/  move    $a0, $0
/*0x80328EEC*/  sw      $v0, 0x002C($sp)
/*0x80328EF0*/  lw      $a0, 0x0030($sp)
/*0x80328EF4*/  move    $a1, $0
/*0x80328EF8*/  jal     osRecvMesg
/*0x80328EFC*/  li      $a2, 0x0001
/*0x80328F00*/  lw      $t4, 0x002C($sp)
/*0x80328F04*/  beqz    $t4, .L80328F14
/*0x80328F08*/  nop
/*0x80328F0C*/  b       .L80328FC0
/*0x80328F10*/  move    $v0, $t4
.L80328F14:
/*0x80328F14*/  lui     $t8, %hi(ultra_bss+0x25D0)
/*0x80328F18*/  addiu   $t8, $t8, %lo(ultra_bss+0x25D0)
/*0x80328F1C*/  sw      $t8, 0x0024($sp)
/*0x80328F20*/  sw      $0, 0x0028($sp)
.L80328F24:
/*0x80328F24*/  lw      $t7, 0x0024($sp)
/*0x80328F28*/  sb      $0, 0x0000($t7)
/*0x80328F2C*/  lw      $t9, 0x0028($sp)
/*0x80328F30*/  lw      $t5, 0x0024($sp)
/*0x80328F34*/  addiu   $t0, $t9, 0x0001
/*0x80328F38*/  slti    $at, $t0, 0x0004
/*0x80328F3C*/  addiu   $t6, $t5, 0x0001
/*0x80328F40*/  sw      $t0, 0x0028($sp)
/*0x80328F44*/  bnez    $at, .L80328F24
/*0x80328F48*/  sw      $t6, 0x0024($sp)
/*0x80328F4C*/  lw      $t1, 0x0024($sp)
/*0x80328F50*/  addiu   $t2, $sp, 0x001C
/*0x80328F54*/  lwl     $at, 0x0000($t1)
/*0x80328F58*/  lwr     $at, 0x0003($t1)
/*0x80328F5C*/  sw      $at, 0x0000($t2)
/*0x80328F60*/  lwl     $t4, 0x0004($t1)
/*0x80328F64*/  lwr     $t4, 0x0007($t1)
/*0x80328F68*/  sw      $t4, 0x0004($t2)
/*0x80328F6C*/  lbu     $t8, 0x001E($sp)
/*0x80328F70*/  lw      $t6, 0x0034($sp)
/*0x80328F74*/  andi    $t7, $t8, 0x00C0
/*0x80328F78*/  sra     $t5, $t7, 4
/*0x80328F7C*/  sb      $t5, 0x0003($t6)
/*0x80328F80*/  lbu     $t9, 0x0021($sp)
/*0x80328F84*/  lbu     $t3, 0x0020($sp)
/*0x80328F88*/  lw      $t1, 0x0034($sp)
/*0x80328F8C*/  sll     $t0, $t9, 8
/*0x80328F90*/  or      $t2, $t0, $t3
/*0x80328F94*/  sh      $t2, 0x0000($t1)
/*0x80328F98*/  lw      $t8, 0x0034($sp)
/*0x80328F9C*/  lbu     $t4, 0x0022($sp)
/*0x80328FA0*/  sb      $t4, 0x0002($t8)
/*0x80328FA4*/  lw      $t7, 0x0034($sp)
/*0x80328FA8*/  lbu     $t5, 0x0003($t7)
/*0x80328FAC*/  beqz    $t5, .L80328FBC
/*0x80328FB0*/  nop
/*0x80328FB4*/  b       .L80328FC0
/*0x80328FB8*/  move    $v0, $t5
.L80328FBC:
/*0x80328FBC*/  move    $v0, $0
.L80328FC0:
/*0x80328FC0*/  lw      $ra, 0x0014($sp)
/*0x80328FC4*/  addiu   $sp, $sp, 0x0030
/*0x80328FC8*/  jr      $ra
/*0x80328FCC*/  nop
