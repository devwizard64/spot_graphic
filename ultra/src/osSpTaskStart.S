#include <ultra64.h>

.set noreorder
.set noat

/* 0x80322940 */
ultra_80322940:
/*0x80322940*/  addiu   $sp, $sp, -0x0020
/*0x80322944*/  lui     $t6, %hi(ultra_bss+0x0080)
/*0x80322948*/  sw      $ra, 0x0014($sp)
/*0x8032294C*/  sw      $a0, 0x0020($sp)
/*0x80322950*/  addiu   $t6, $t6, %lo(ultra_bss+0x0080)
/*0x80322954*/  sw      $t6, 0x001C($sp)
/*0x80322958*/  move    $a1, $t6
/*0x8032295C*/  lw      $a0, 0x0020($sp)
/*0x80322960*/  jal     bcopy
/*0x80322964*/  li      $a2, 0x0040
/*0x80322968*/  lw      $t7, 0x001C($sp)
/*0x8032296C*/  lw      $t8, 0x0010($t7)
/*0x80322970*/  beqz    $t8, .L80322988
/*0x80322974*/  nop
/*0x80322978*/  jal     osVirtualToPhysical
/*0x8032297C*/  move    $a0, $t8
/*0x80322980*/  lw      $t9, 0x001C($sp)
/*0x80322984*/  sw      $v0, 0x0010($t9)
.L80322988:
/*0x80322988*/  lw      $t0, 0x001C($sp)
/*0x8032298C*/  lw      $t1, 0x0018($t0)
/*0x80322990*/  beqz    $t1, .L803229A8
/*0x80322994*/  nop
/*0x80322998*/  jal     osVirtualToPhysical
/*0x8032299C*/  move    $a0, $t1
/*0x803229A0*/  lw      $t2, 0x001C($sp)
/*0x803229A4*/  sw      $v0, 0x0018($t2)
.L803229A8:
/*0x803229A8*/  lw      $t3, 0x001C($sp)
/*0x803229AC*/  lw      $t4, 0x0020($t3)
/*0x803229B0*/  beqz    $t4, .L803229C8
/*0x803229B4*/  nop
/*0x803229B8*/  jal     osVirtualToPhysical
/*0x803229BC*/  move    $a0, $t4
/*0x803229C0*/  lw      $t5, 0x001C($sp)
/*0x803229C4*/  sw      $v0, 0x0020($t5)
.L803229C8:
/*0x803229C8*/  lw      $t6, 0x001C($sp)
/*0x803229CC*/  lw      $t7, 0x0028($t6)
/*0x803229D0*/  beqz    $t7, .L803229E8
/*0x803229D4*/  nop
/*0x803229D8*/  jal     osVirtualToPhysical
/*0x803229DC*/  move    $a0, $t7
/*0x803229E0*/  lw      $t8, 0x001C($sp)
/*0x803229E4*/  sw      $v0, 0x0028($t8)
.L803229E8:
/*0x803229E8*/  lw      $t9, 0x001C($sp)
/*0x803229EC*/  lw      $t0, 0x002C($t9)
/*0x803229F0*/  beqz    $t0, .L80322A08
/*0x803229F4*/  nop
/*0x803229F8*/  jal     osVirtualToPhysical
/*0x803229FC*/  move    $a0, $t0
/*0x80322A00*/  lw      $t1, 0x001C($sp)
/*0x80322A04*/  sw      $v0, 0x002C($t1)
.L80322A08:
/*0x80322A08*/  lw      $t2, 0x001C($sp)
/*0x80322A0C*/  lw      $t3, 0x0030($t2)
/*0x80322A10*/  beqz    $t3, .L80322A28
/*0x80322A14*/  nop
/*0x80322A18*/  jal     osVirtualToPhysical
/*0x80322A1C*/  move    $a0, $t3
/*0x80322A20*/  lw      $t4, 0x001C($sp)
/*0x80322A24*/  sw      $v0, 0x0030($t4)
.L80322A28:
/*0x80322A28*/  lw      $t5, 0x001C($sp)
/*0x80322A2C*/  lw      $t6, 0x0038($t5)
/*0x80322A30*/  beqz    $t6, .L80322A48
/*0x80322A34*/  nop
/*0x80322A38*/  jal     osVirtualToPhysical
/*0x80322A3C*/  move    $a0, $t6
/*0x80322A40*/  lw      $t7, 0x001C($sp)
/*0x80322A44*/  sw      $v0, 0x0038($t7)
.L80322A48:
/*0x80322A48*/  lw      $ra, 0x0014($sp)
/*0x80322A4C*/  lw      $v0, 0x001C($sp)
/*0x80322A50*/  addiu   $sp, $sp, 0x0020
/*0x80322A54*/  jr      $ra
/*0x80322A58*/  nop

/* 0x80322A5C   void osSpTaskLoad(OSTask *task) */
.globl osSpTaskLoad
osSpTaskLoad:
/*0x80322A5C*/  addiu   $sp, $sp, -0x0020
/*0x80322A60*/  sw      $ra, 0x0014($sp)
/*0x80322A64*/  sw      $a0, 0x0020($sp)
/*0x80322A68*/  jal     ultra_80322940
/*0x80322A6C*/  lw      $a0, 0x0020($sp)
/*0x80322A70*/  sw      $v0, 0x001C($sp)
/*0x80322A74*/  lw      $t6, 0x001C($sp)
/*0x80322A78*/  lw      $t7, 0x0004($t6)
/*0x80322A7C*/  andi    $t8, $t7, 0x0001
/*0x80322A80*/  beqz    $t8, .L80322AB0
/*0x80322A84*/  nop
/*0x80322A88*/  lw      $t9, 0x0038($t6)
/*0x80322A8C*/  li      $at, -0x0002
/*0x80322A90*/  sw      $t9, 0x0018($t6)
/*0x80322A94*/  lw      $t0, 0x001C($sp)
/*0x80322A98*/  lw      $t1, 0x003C($t0)
/*0x80322A9C*/  sw      $t1, 0x001C($t0)
/*0x80322AA0*/  lw      $t2, 0x0020($sp)
/*0x80322AA4*/  lw      $t3, 0x0004($t2)
/*0x80322AA8*/  and     $t4, $t3, $at
/*0x80322AAC*/  sw      $t4, 0x0004($t2)
.L80322AB0:
/*0x80322AB0*/  lw      $a0, 0x001C($sp)
/*0x80322AB4*/  jal     osWritebackDCache
/*0x80322AB8*/  li      $a1, 0x0040
/*0x80322ABC*/  jal     __osSpSetStatus
/*0x80322AC0*/  li      $a0, 0x2B00
/*0x80322AC4*/  lui     $a0, 0x04001000 >> 16
/*0x80322AC8*/  jal     __osSpSetPc
/*0x80322ACC*/  ori     $a0, $a0, 0x04001000 & 0xFFFF
/*0x80322AD0*/  li      $at, -0x0001
/*0x80322AD4*/  bne     $v0, $at, .L80322AF4
/*0x80322AD8*/  nop
.L80322ADC:
/*0x80322ADC*/  lui     $a0, 0x04001000 >> 16
/*0x80322AE0*/  jal     __osSpSetPc
/*0x80322AE4*/  ori     $a0, $a0, 0x04001000 & 0xFFFF
/*0x80322AE8*/  li      $at, -0x0001
/*0x80322AEC*/  beq     $v0, $at, .L80322ADC
/*0x80322AF0*/  nop
.L80322AF4:
/*0x80322AF4*/  lui     $a1, 0x04000FC0 >> 16
/*0x80322AF8*/  ori     $a1, $a1, 0x04000FC0 & 0xFFFF
/*0x80322AFC*/  li      $a0, 0x0001
/*0x80322B00*/  lw      $a2, 0x001C($sp)
/*0x80322B04*/  jal     __osSpRawStartDma
/*0x80322B08*/  li      $a3, 0x0040
/*0x80322B0C*/  li      $at, -0x0001
/*0x80322B10*/  bne     $v0, $at, .L80322B3C
/*0x80322B14*/  nop
.L80322B18:
/*0x80322B18*/  lui     $a1, 0x04000FC0 >> 16
/*0x80322B1C*/  ori     $a1, $a1, 0x04000FC0 & 0xFFFF
/*0x80322B20*/  li      $a0, 0x0001
/*0x80322B24*/  lw      $a2, 0x001C($sp)
/*0x80322B28*/  jal     __osSpRawStartDma
/*0x80322B2C*/  li      $a3, 0x0040
/*0x80322B30*/  li      $at, -0x0001
/*0x80322B34*/  beq     $v0, $at, .L80322B18
/*0x80322B38*/  nop
.L80322B3C:
/*0x80322B3C*/  jal     __osSpDeviceBusy
/*0x80322B40*/  nop
/*0x80322B44*/  beqz    $v0, .L80322B5C
/*0x80322B48*/  nop
.L80322B4C:
/*0x80322B4C*/  jal     __osSpDeviceBusy
/*0x80322B50*/  nop
/*0x80322B54*/  bnez    $v0, .L80322B4C
/*0x80322B58*/  nop
.L80322B5C:
/*0x80322B5C*/  lw      $t5, 0x001C($sp)
/*0x80322B60*/  lui     $a1, 0x04001000 >> 16
/*0x80322B64*/  ori     $a1, $a1, 0x04001000 & 0xFFFF
/*0x80322B68*/  li      $a0, 0x0001
/*0x80322B6C*/  lw      $a2, 0x0008($t5)
/*0x80322B70*/  jal     __osSpRawStartDma
/*0x80322B74*/  lw      $a3, 0x000C($t5)
/*0x80322B78*/  li      $at, -0x0001
/*0x80322B7C*/  bne     $v0, $at, .L80322BAC
/*0x80322B80*/  nop
.L80322B84:
/*0x80322B84*/  lw      $t7, 0x001C($sp)
/*0x80322B88*/  lui     $a1, 0x04001000 >> 16
/*0x80322B8C*/  ori     $a1, $a1, 0x04001000 & 0xFFFF
/*0x80322B90*/  li      $a0, 0x0001
/*0x80322B94*/  lw      $a2, 0x0008($t7)
/*0x80322B98*/  jal     __osSpRawStartDma
/*0x80322B9C*/  lw      $a3, 0x000C($t7)
/*0x80322BA0*/  li      $at, -0x0001
/*0x80322BA4*/  beq     $v0, $at, .L80322B84
/*0x80322BA8*/  nop
.L80322BAC:
/*0x80322BAC*/  lw      $ra, 0x0014($sp)
/*0x80322BB0*/  addiu   $sp, $sp, 0x0020
/*0x80322BB4*/  jr      $ra
/*0x80322BB8*/  nop

/* 0x80322BBC   s32 osSpTaskStartGo(OSTask *task) */
.globl osSpTaskStartGo
osSpTaskStartGo:
/*0x80322BBC*/  addiu   $sp, $sp, -0x0018
/*0x80322BC0*/  sw      $ra, 0x0014($sp)
/*0x80322BC4*/  jal     __osSpDeviceBusy
/*0x80322BC8*/  sw      $a0, 0x0018($sp)
/*0x80322BCC*/  beqz    $v0, .L80322BE4
/*0x80322BD0*/  nop
.L80322BD4:
/*0x80322BD4*/  jal     __osSpDeviceBusy
/*0x80322BD8*/  nop
/*0x80322BDC*/  bnez    $v0, .L80322BD4
/*0x80322BE0*/  nop
.L80322BE4:
/*0x80322BE4*/  jal     __osSpSetStatus
/*0x80322BE8*/  li      $a0, 0x0125
/*0x80322BEC*/  lw      $ra, 0x0014($sp)
/*0x80322BF0*/  addiu   $sp, $sp, 0x0018
/*0x80322BF4*/  jr      $ra
/*0x80322BF8*/  nop
