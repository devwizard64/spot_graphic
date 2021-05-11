#include <ultra64.h>

.set noreorder
.set noat
.set gp = 64

/* 0x80327640 */
.globl __osExceptionPreamble
__osExceptionPreamble:
/*0x80327640*/  lui     $k0, %hi(__osException)
/*0x80327644*/  addiu   $k0, $k0, %lo(__osException)
/*0x80327648*/  jr      $k0
/*0x8032764C*/  nop

/* 0x80327650 */
__osException:
/*0x80327650*/  lui     $k0, %hi(ultra_bss+0x2710)
/*0x80327654*/  addiu   $k0, $k0, %lo(ultra_bss+0x2710)
/*0x80327658*/  sd      $at, 0x0020($k0)
/*0x8032765C*/  mfc0    $k1, C0_SR
/*0x80327660*/  sw      $k1, 0x0118($k0)
/*0x80327664*/  li      $at, -0x0004
/*0x80327668*/  and     $k1, $k1, $at
/*0x8032766C*/  mtc0    $k1, C0_SR
/*0x80327670*/  sd      $t0, 0x0058($k0)
/*0x80327674*/  sd      $t1, 0x0060($k0)
/*0x80327678*/  sd      $t2, 0x0068($k0)
/*0x8032767C*/  sw      $0, 0x0018($k0)
/*0x80327680*/  mfc0    $t0, C0_CAUSE
/*0x80327684*/  andi    $t1, $t0, 0x007C
/*0x80327688*/  addiu   $t2, $0, 0x0000
/*0x8032768C*/  bne     $t1, $t2, .L803276D0
/*0x80327690*/  nop
/*0x80327694*/  and     $t1, $k1, $t0
/*0x80327698*/  andi    $t2, $t1, 0x4000
/*0x8032769C*/  beqz    $t2, .L803276B4
/*0x803276A0*/  nop
/*0x803276A4*/  li      $t1, 0x0001
/*0x803276A8*/  lui     $at, %hi(ultra_data_80335A44)
/*0x803276AC*/  b       .L80327714
/*0x803276B0*/  sw      $t1, %lo(ultra_data_80335A44)($at)
.L803276B4:
/*0x803276B4*/  andi    $t2, $t1, 0x2000
/*0x803276B8*/  beqz    $t2, .L803276D0
/*0x803276BC*/  nop
/*0x803276C0*/  li      $t1, 0x0001
/*0x803276C4*/  lui     $at, %hi(ultra_data_80335A48)
/*0x803276C8*/  b       .L80327714
/*0x803276CC*/  sw      $t1, %lo(ultra_data_80335A48)($at)
.L803276D0:
/*0x803276D0*/  lui     $at, %hi(ultra_data_80335A44)
/*0x803276D4*/  sw      $0, %lo(ultra_data_80335A44)($at)
/*0x803276D8*/  lui     $at, %hi(ultra_data_80335A48)
/*0x803276DC*/  move    $t0, $k0
/*0x803276E0*/  sw      $0, %lo(ultra_data_80335A48)($at)
/*0x803276E4*/  lui     $k0, %hi(__osRunningThread)
/*0x803276E8*/  lw      $k0, %lo(__osRunningThread)($k0)
/*0x803276EC*/  ld      $t1, 0x0020($t0)
/*0x803276F0*/  sd      $t1, 0x0020($k0)
/*0x803276F4*/  ld      $t1, 0x0118($t0)
/*0x803276F8*/  sd      $t1, 0x0118($k0)
/*0x803276FC*/  ld      $t1, 0x0058($t0)
/*0x80327700*/  sd      $t1, 0x0058($k0)
/*0x80327704*/  ld      $t1, 0x0060($t0)
/*0x80327708*/  sd      $t1, 0x0060($k0)
/*0x8032770C*/  ld      $t1, 0x0068($t0)
/*0x80327710*/  sd      $t1, 0x0068($k0)
.L80327714:
/*0x80327714*/  mflo    $t0
/*0x80327718*/  sd      $t0, 0x0108($k0)
/*0x8032771C*/  mfhi    $t0
/*0x80327720*/  sd      $v0, 0x0028($k0)
/*0x80327724*/  sd      $v1, 0x0030($k0)
/*0x80327728*/  sd      $a0, 0x0038($k0)
/*0x8032772C*/  sd      $a1, 0x0040($k0)
/*0x80327730*/  sd      $a2, 0x0048($k0)
/*0x80327734*/  sd      $a3, 0x0050($k0)
/*0x80327738*/  sd      $t3, 0x0070($k0)
/*0x8032773C*/  sd      $t4, 0x0078($k0)
/*0x80327740*/  sd      $t5, 0x0080($k0)
/*0x80327744*/  sd      $t6, 0x0088($k0)
/*0x80327748*/  sd      $t7, 0x0090($k0)
/*0x8032774C*/  sd      $s0, 0x0098($k0)
/*0x80327750*/  sd      $s1, 0x00A0($k0)
/*0x80327754*/  sd      $s2, 0x00A8($k0)
/*0x80327758*/  sd      $s3, 0x00B0($k0)
/*0x8032775C*/  sd      $s4, 0x00B8($k0)
/*0x80327760*/  sd      $s5, 0x00C0($k0)
/*0x80327764*/  sd      $s6, 0x00C8($k0)
/*0x80327768*/  sd      $s7, 0x00D0($k0)
/*0x8032776C*/  sd      $t8, 0x00D8($k0)
/*0x80327770*/  sd      $t9, 0x00E0($k0)
/*0x80327774*/  sd      $gp, 0x00E8($k0)
/*0x80327778*/  sd      $sp, 0x00F0($k0)
/*0x8032777C*/  sd      $s8, 0x00F8($k0)
/*0x80327780*/  sd      $ra, 0x0100($k0)
/*0x80327784*/  sd      $t0, 0x0110($k0)
/*0x80327788*/  mfc0    $t0, C0_EPC
/*0x8032778C*/  sw      $t0, 0x011C($k0)
/*0x80327790*/  lw      $t0, 0x0018($k0)
/*0x80327794*/  beqz    $t0, .L803277E8
/*0x80327798*/  nop
/*0x8032779C*/  cfc1    $t0, $31
/*0x803277A0*/  nop
/*0x803277A4*/  sw      $t0, 0x012C($k0)
/*0x803277A8*/  sdc1    $f0, 0x0130($k0)
/*0x803277AC*/  sdc1    $f2, 0x0138($k0)
/*0x803277B0*/  sdc1    $f4, 0x0140($k0)
/*0x803277B4*/  sdc1    $f6, 0x0148($k0)
/*0x803277B8*/  sdc1    $f8, 0x0150($k0)
/*0x803277BC*/  sdc1    $f10, 0x0158($k0)
/*0x803277C0*/  sdc1    $f12, 0x0160($k0)
/*0x803277C4*/  sdc1    $f14, 0x0168($k0)
/*0x803277C8*/  sdc1    $f16, 0x0170($k0)
/*0x803277CC*/  sdc1    $f18, 0x0178($k0)
/*0x803277D0*/  sdc1    $f20, 0x0180($k0)
/*0x803277D4*/  sdc1    $f22, 0x0188($k0)
/*0x803277D8*/  sdc1    $f24, 0x0190($k0)
/*0x803277DC*/  sdc1    $f26, 0x0198($k0)
/*0x803277E0*/  sdc1    $f28, 0x01A0($k0)
/*0x803277E4*/  sdc1    $f30, 0x01A8($k0)
.L803277E8:
/*0x803277E8*/  mfc0    $t0, C0_CAUSE
/*0x803277EC*/  sw      $t0, 0x0120($k0)
/*0x803277F0*/  lui     $t1, %hi(0xA430000C)
/*0x803277F4*/  lw      $t1, %lo(0xA430000C)($t1)
/*0x803277F8*/  sw      $t1, 0x0128($k0)
/*0x803277FC*/  li      $t1, 0x0002
/*0x80327800*/  sh      $t1, 0x0010($k0)
/*0x80327804*/  lui     $t1, %hi(ultra_data_80335A44)
/*0x80327808*/  lw      $t1, %lo(ultra_data_80335A44)($t1)
/*0x8032780C*/  beqz    $t1, .L80327834
/*0x80327810*/  nop
/*0x80327814*/  lui     $t2, %hi(0xC0000008)
/*0x80327818*/  sw      $0, %lo(0xC0000008)($t2)
/*0x8032781C*/  lui     $a0, %hi(0xC0000000)
/*0x80327820*/  addiu   $t2, $t2, %lo(0xC0000008)
/*0x80327824*/  jal     ultra_8032AAF8
/*0x80327828*/  lw      $a0, %lo(0xC0000000)($a0)
/*0x8032782C*/  b       .L80327D88
/*0x80327830*/  nop
.L80327834:
/*0x80327834*/  lui     $t1, %hi(ultra_data_80335A48)
/*0x80327838*/  lw      $t1, %lo(ultra_data_80335A48)($t1)
/*0x8032783C*/  beqz    $t1, .L80327880
/*0x80327840*/  nop
/*0x80327844*/  lui     $t2, %hi(0xC000000C)
/*0x80327848*/  sw      $0, %lo(0xC000000C)($t2)
/*0x8032784C*/  lui     $t1, %hi(__osRdbSendMessage)
/*0x80327850*/  lw      $t1, %lo(__osRdbSendMessage)($t1)
/*0x80327854*/  addiu   $t2, $t2, %lo(0xC000000C)
/*0x80327858*/  beqz    $t1, .L80327868
/*0x8032785C*/  nop
/*0x80327860*/  jal     send_mesg
/*0x80327864*/  li      $a0, 0x0078
.L80327868:
/*0x80327868*/  lui     $t1, %hi(__osRdbWriteOK)
/*0x8032786C*/  lw      $t1, %lo(__osRdbWriteOK)($t1)
/*0x80327870*/  lui     $at, %hi(__osRdbWriteOK)
/*0x80327874*/  addi    $t1, $t1, 0x0001
/*0x80327878*/  b       .L80327D88
/*0x8032787C*/  sw      $t1, %lo(__osRdbWriteOK)($at)
.L80327880:
/*0x80327880*/  andi    $t1, $t0, 0x007C
/*0x80327884*/  li      $t2, 0x0024
/*0x80327888*/  beq     $t1, $t2, .L80327B04
/*0x8032788C*/  nop
/*0x80327890*/  li      $t2, 0x002C
/*0x80327894*/  beq     $t1, $t2, .L80327C4C
/*0x80327898*/  nop
/*0x8032789C*/  addiu   $t2, $0, 0x0000
/*0x803278A0*/  bne     $t1, $t2, L80327B68
/*0x803278A4*/  nop
/*0x803278A8*/  and     $s0, $k1, $t0
.L803278AC:
/*0x803278AC*/  andi    $t1, $s0, 0xFF00
/*0x803278B0*/  srl     $t2, $t1, 12
/*0x803278B4*/  bnez    $t2, .L803278C4
/*0x803278B8*/  nop
/*0x803278BC*/  srl     $t2, $t1, 8
/*0x803278C0*/  addi    $t2, $t2, 0x0010
.L803278C4:
/*0x803278C4*/  lui     $at, %hi(ultra_rodata_80339980)
/*0x803278C8*/  addu    $at, $at, $t2
/*0x803278CC*/  lbu     $t2, %lo(ultra_rodata_80339980)($at)
/*0x803278D0*/  lui     $at, %hi(ultra_rodata_803399A0)
/*0x803278D4*/  addu    $at, $at, $t2
/*0x803278D8*/  lw      $t2, %lo(ultra_rodata_803399A0)($at)
/*0x803278DC*/  jr      $t2
/*0x803278E0*/  nop
.globl L803278E4
L803278E4:
/*0x803278E4*/  mfc0    $t1, C0_COMPARE
/*0x803278E8*/  mtc0    $t1, C0_COMPARE
/*0x803278EC*/  jal     send_mesg
/*0x803278F0*/  li      $a0, 0x0018
/*0x803278F4*/  lui     $at, 0xFFFF7FFF >> 16
/*0x803278F8*/  ori     $at, $at, 0xFFFF7FFF & 0xFFFF
/*0x803278FC*/  b       .L803278AC
/*0x80327900*/  and     $s0, $s0, $at
.globl L80327904
L80327904:
/*0x80327904*/  li      $t2, 0x0004
/*0x80327908*/  lui     $at, %hi(__osHwIntTable)
/*0x8032790C*/  addu    $at, $at, $t2
/*0x80327910*/  lw      $t2, %lo(__osHwIntTable)($at)
/*0x80327914*/  beqz    $t2, .L80327924
/*0x80327918*/  nop
/*0x8032791C*/  jalr    $t2
/*0x80327920*/  nop
.L80327924:
/*0x80327924*/  jal     send_mesg
/*0x80327928*/  li      $a0, 0x0010
/*0x8032792C*/  li      $at, -0x0801
/*0x80327930*/  b       .L803278AC
/*0x80327934*/  and     $s0, $s0, $at
.globl L80327938
L80327938:
/*0x80327938*/  lui     $s1, %hi(0xA4300008)
/*0x8032793C*/  lw      $s1, %lo(0xA4300008)($s1)
/*0x80327940*/  andi    $s1, $s1, 0x003F
/*0x80327944*/  andi    $t1, $s1, 0x0001
/*0x80327948*/  beqz    $t1, .L80327998
/*0x8032794C*/  nop
/*0x80327950*/  lui     $t4, %hi(0xA4040010)
/*0x80327954*/  lw      $t4, %lo(0xA4040010)($t4)
/*0x80327958*/  li      $t1, 0x0008
/*0x8032795C*/  lui     $at, %hi(0xA4040010)
/*0x80327960*/  andi    $t4, $t4, 0x0300
/*0x80327964*/  andi    $s1, $s1, 0x003E
/*0x80327968*/  beqz    $t4, .L80327988
/*0x8032796C*/  sw      $t1, %lo(0xA4040010)($at)
/*0x80327970*/  jal     send_mesg
/*0x80327974*/  li      $a0, 0x0020
/*0x80327978*/  beqz    $s1, .L80327A5C
/*0x8032797C*/  nop
/*0x80327980*/  b       .L80327998
/*0x80327984*/  nop
.L80327988:
/*0x80327988*/  jal     send_mesg
/*0x8032798C*/  li      $a0, 0x0058
/*0x80327990*/  beqz    $s1, .L80327A5C
/*0x80327994*/  nop
.L80327998:
/*0x80327998*/  andi    $t1, $s1, 0x0008
/*0x8032799C*/  beqz    $t1, .L803279BC
/*0x803279A0*/  lui     $at, %hi(0xA4400010)
/*0x803279A4*/  andi    $s1, $s1, 0x0037
/*0x803279A8*/  sw      $0, %lo(0xA4400010)($at)
/*0x803279AC*/  jal     send_mesg
/*0x803279B0*/  li      $a0, 0x0038
/*0x803279B4*/  beqz    $s1, .L80327A5C
/*0x803279B8*/  nop
.L803279BC:
/*0x803279BC*/  andi    $t1, $s1, 0x0004
/*0x803279C0*/  beqz    $t1, .L803279E8
/*0x803279C4*/  nop
/*0x803279C8*/  li      $t1, 0x0001
/*0x803279CC*/  lui     $at, %hi(0xA450000C)
/*0x803279D0*/  andi    $s1, $s1, 0x003B
/*0x803279D4*/  sw      $t1, %lo(0xA450000C)($at)
/*0x803279D8*/  jal     send_mesg
/*0x803279DC*/  li      $a0, 0x0030
/*0x803279E0*/  beqz    $s1, .L80327A5C
/*0x803279E4*/  nop
.L803279E8:
/*0x803279E8*/  andi    $t1, $s1, 0x0002
/*0x803279EC*/  beqz    $t1, .L80327A0C
/*0x803279F0*/  lui     $at, %hi(0xA4800018)
/*0x803279F4*/  andi    $s1, $s1, 0x003D
/*0x803279F8*/  sw      $0, %lo(0xA4800018)($at)
/*0x803279FC*/  jal     send_mesg
/*0x80327A00*/  li      $a0, 0x0028
/*0x80327A04*/  beqz    $s1, .L80327A5C
/*0x80327A08*/  nop
.L80327A0C:
/*0x80327A0C*/  andi    $t1, $s1, 0x0010
/*0x80327A10*/  beqz    $t1, .L80327A38
/*0x80327A14*/  nop
/*0x80327A18*/  li      $t1, 0x0002
/*0x80327A1C*/  lui     $at, %hi(0xA4600010)
/*0x80327A20*/  andi    $s1, $s1, 0x002F
/*0x80327A24*/  sw      $t1, %lo(0xA4600010)($at)
/*0x80327A28*/  jal     send_mesg
/*0x80327A2C*/  li      $a0, 0x0040
/*0x80327A30*/  beqz    $s1, .L80327A5C
/*0x80327A34*/  nop
.L80327A38:
/*0x80327A38*/  andi    $t1, $s1, 0x0020
/*0x80327A3C*/  beqz    $t1, .L80327A5C
/*0x80327A40*/  nop
/*0x80327A44*/  li      $t1, 0x0800
/*0x80327A48*/  lui     $at, %hi(0xA4300000)
/*0x80327A4C*/  andi    $s1, $s1, 0x001F
/*0x80327A50*/  sw      $t1, %lo(0xA4300000)($at)
/*0x80327A54*/  jal     send_mesg
/*0x80327A58*/  li      $a0, 0x0048
.L80327A5C:
/*0x80327A5C*/  li      $at, -0x0401
/*0x80327A60*/  b       .L803278AC
/*0x80327A64*/  and     $s0, $s0, $at
.globl L80327A68
L80327A68:
/*0x80327A68*/  lw      $k1, 0x0118($k0)
/*0x80327A6C*/  li      $at, -0x1001
/*0x80327A70*/  lui     $t1, %hi(osViClock)
/*0x80327A74*/  and     $k1, $k1, $at
/*0x80327A78*/  sw      $k1, 0x0118($k0)
/*0x80327A7C*/  addiu   $t1, $t1, %lo(osViClock)
/*0x80327A80*/  lw      $t2, 0x0000($t1)
/*0x80327A84*/  beqz    $t2, .L80327A94
/*0x80327A88*/  li      $at, -0x1001
/*0x80327A8C*/  b       L80327B1C
/*0x80327A90*/  and     $s0, $s0, $at
.L80327A94:
/*0x80327A94*/  li      $t2, 0x0001
/*0x80327A98*/  sw      $t2, 0x0000($t1)
/*0x80327A9C*/  jal     send_mesg
/*0x80327AA0*/  li      $a0, 0x0070
/*0x80327AA4*/  lui     $t2, %hi(__osRunQueue)
/*0x80327AA8*/  lw      $t2, %lo(__osRunQueue)($t2)
/*0x80327AAC*/  li      $at, -0x1001
/*0x80327AB0*/  and     $s0, $s0, $at
/*0x80327AB4*/  lw      $k1, 0x0118($t2)
/*0x80327AB8*/  and     $k1, $k1, $at
/*0x80327ABC*/  b       L80327B1C
/*0x80327AC0*/  sw      $k1, 0x0118($t2)
.globl L80327AC4
L80327AC4:
/*0x80327AC4*/  li      $at, -0x0201
/*0x80327AC8*/  and     $t0, $t0, $at
/*0x80327ACC*/  mtc0    $t0, C0_CAUSE
/*0x80327AD0*/  jal     send_mesg
/*0x80327AD4*/  li      $a0, 0x0008
/*0x80327AD8*/  li      $at, -0x0201
/*0x80327ADC*/  b       .L803278AC
/*0x80327AE0*/  and     $s0, $s0, $at
.globl L80327AE4
L80327AE4:
/*0x80327AE4*/  li      $at, -0x0101
/*0x80327AE8*/  and     $t0, $t0, $at
/*0x80327AEC*/  mtc0    $t0, C0_CAUSE
/*0x80327AF0*/  jal     send_mesg
/*0x80327AF4*/  addiu   $a0, $0, 0x0000
/*0x80327AF8*/  li      $at, -0x0101
/*0x80327AFC*/  b       .L803278AC
/*0x80327B00*/  and     $s0, $s0, $at
.L80327B04:
/*0x80327B04*/  li      $t1, 0x0001
/*0x80327B08*/  sh      $t1, 0x0012($k0)
/*0x80327B0C*/  jal     send_mesg
/*0x80327B10*/  li      $a0, 0x0050
/*0x80327B14*/  b       L80327B1C
/*0x80327B18*/  nop
.globl L80327B1C
L80327B1C:
/*0x80327B1C*/  lui     $t2, %hi(__osRunQueue)
/*0x80327B20*/  lw      $t2, %lo(__osRunQueue)($t2)
/*0x80327B24*/  lw      $t1, 0x0004($k0)
/*0x80327B28*/  lw      $t3, 0x0004($t2)
/*0x80327B2C*/  slt     $at, $t1, $t3
/*0x80327B30*/  beqz    $at, .L80327B50
/*0x80327B34*/  nop
/*0x80327B38*/  lui     $a0, %hi(__osRunQueue)
/*0x80327B3C*/  move    $a1, $k0
/*0x80327B40*/  jal     __osEnqueueThread
/*0x80327B44*/  addiu   $a0, $a0, %lo(__osRunQueue)
/*0x80327B48*/  j       __osDispatchThread
/*0x80327B4C*/  nop
.L80327B50:
/*0x80327B50*/  lui     $t1, %hi(__osRunQueue)
/*0x80327B54*/  addiu   $t1, $t1, %lo(__osRunQueue)
/*0x80327B58*/  lw      $t2, 0x0000($t1)
/*0x80327B5C*/  sw      $t2, 0x0000($k0)
/*0x80327B60*/  j       __osDispatchThread
/*0x80327B64*/  sw      $k0, 0x0000($t1)
.globl L80327B68
L80327B68:
/*0x80327B68*/  lui     $at, %hi(__osFaultedThread)
/*0x80327B6C*/  sw      $k0, %lo(__osFaultedThread)($at)
/*0x80327B70*/  li      $t1, 0x0001
/*0x80327B74*/  sh      $t1, 0x0010($k0)
/*0x80327B78*/  li      $t1, 0x0002
/*0x80327B7C*/  sh      $t1, 0x0012($k0)
/*0x80327B80*/  mfc0    $t2, C0_BADVADDR
/*0x80327B84*/  sw      $t2, 0x0124($k0)
/*0x80327B88*/  jal     send_mesg
/*0x80327B8C*/  li      $a0, 0x0060
/*0x80327B90*/  j       __osDispatchThread
/*0x80327B94*/  nop

/* 0x80327B98 */
send_mesg:
/*0x80327B98*/  lui     $t2, %hi(ultra_bss+0x0000)
/*0x80327B9C*/  addiu   $t2, $t2, %lo(ultra_bss+0x0000)
/*0x80327BA0*/  addu    $t2, $t2, $a0
/*0x80327BA4*/  lw      $t1, 0x0000($t2)
/*0x80327BA8*/  move    $s2, $ra
/*0x80327BAC*/  beqz    $t1, .L80327C44
/*0x80327BB0*/  nop
/*0x80327BB4*/  lw      $t3, 0x0008($t1)
/*0x80327BB8*/  lw      $t4, 0x0010($t1)
/*0x80327BBC*/  slt     $at, $t3, $t4
/*0x80327BC0*/  beqz    $at, .L80327C44
/*0x80327BC4*/  nop
/*0x80327BC8*/  lw      $t5, 0x000C($t1)
/*0x80327BCC*/  addu    $t5, $t5, $t3
/*0x80327BD0*/  div     $0, $t5, $t4
/*0x80327BD4*/  bnez    $t4, .L80327BE0
/*0x80327BD8*/  nop
/*0x80327BDC*/  break   7
.L80327BE0:
/*0x80327BE0*/  li      $at, -0x0001
/*0x80327BE4*/  bne     $t4, $at, .L80327BF8
/*0x80327BE8*/  li      $at, 0x80000000
/*0x80327BEC*/  bne     $t5, $at, .L80327BF8
/*0x80327BF0*/  nop
/*0x80327BF4*/  break   6
.L80327BF8:
/*0x80327BF8*/  lw      $t4, 0x0014($t1)
/*0x80327BFC*/  mfhi    $t5
/*0x80327C00*/  sll     $t5, $t5, 2
/*0x80327C04*/  addu    $t4, $t4, $t5
/*0x80327C08*/  lw      $t5, 0x0004($t2)
/*0x80327C0C*/  addiu   $t2, $t3, 0x0001
/*0x80327C10*/  sw      $t5, 0x0000($t4)
/*0x80327C14*/  sw      $t2, 0x0008($t1)
/*0x80327C18*/  lw      $t2, 0x0000($t1)
/*0x80327C1C*/  lw      $t3, 0x0000($t2)
/*0x80327C20*/  beqz    $t3, .L80327C44
/*0x80327C24*/  nop
/*0x80327C28*/  jal     __osPopThread
/*0x80327C2C*/  move    $a0, $t1
/*0x80327C30*/  move    $t2, $v0
/*0x80327C34*/  lui     $a0, %hi(__osRunQueue)
/*0x80327C38*/  move    $a1, $t2
/*0x80327C3C*/  jal     __osEnqueueThread
/*0x80327C40*/  addiu   $a0, $a0, %lo(__osRunQueue)
.L80327C44:
/*0x80327C44*/  jr      $s2
/*0x80327C48*/  nop
.L80327C4C:
/*0x80327C4C*/  li      $at, 0x30000000
/*0x80327C50*/  and     $t1, $t0, $at
/*0x80327C54*/  srl     $t1, $t1, 28
/*0x80327C58*/  li      $t2, 0x0001
/*0x80327C5C*/  bne     $t1, $t2, L80327B68
/*0x80327C60*/  nop
/*0x80327C64*/  lw      $k1, 0x0118($k0)
/*0x80327C68*/  li      $at, 0x20000000
/*0x80327C6C*/  li      $t1, 0x0001
/*0x80327C70*/  or      $k1, $k1, $at
/*0x80327C74*/  sw      $t1, 0x0018($k0)
/*0x80327C78*/  b       .L80327B50
/*0x80327C7C*/  sw      $k1, 0x0118($k0)

/* 0x80327C80 */
.globl __osEnqueueAndYield
__osEnqueueAndYield:
/*0x80327C80*/  lui     $a1, %hi(__osRunningThread)
/*0x80327C84*/  lw      $a1, %lo(__osRunningThread)($a1)
/*0x80327C88*/  mfc0    $t0, C0_SR
/*0x80327C8C*/  lw      $k1, 0x0018($a1)
/*0x80327C90*/  ori     $t0, $t0, 0x0002
/*0x80327C94*/  sw      $t0, 0x0118($a1)
/*0x80327C98*/  sd      $s0, 0x0098($a1)
/*0x80327C9C*/  sd      $s1, 0x00A0($a1)
/*0x80327CA0*/  sd      $s2, 0x00A8($a1)
/*0x80327CA4*/  sd      $s3, 0x00B0($a1)
/*0x80327CA8*/  sd      $s4, 0x00B8($a1)
/*0x80327CAC*/  sd      $s5, 0x00C0($a1)
/*0x80327CB0*/  sd      $s6, 0x00C8($a1)
/*0x80327CB4*/  sd      $s7, 0x00D0($a1)
/*0x80327CB8*/  sd      $gp, 0x00E8($a1)
/*0x80327CBC*/  sd      $sp, 0x00F0($a1)
/*0x80327CC0*/  sd      $s8, 0x00F8($a1)
/*0x80327CC4*/  sd      $ra, 0x0100($a1)
/*0x80327CC8*/  beqz    $k1, .L80327CF0
/*0x80327CCC*/  sw      $ra, 0x011C($a1)
/*0x80327CD0*/  cfc1    $k1, $31
/*0x80327CD4*/  sdc1    $f20, 0x0180($a1)
/*0x80327CD8*/  sdc1    $f22, 0x0188($a1)
/*0x80327CDC*/  sdc1    $f24, 0x0190($a1)
/*0x80327CE0*/  sdc1    $f26, 0x0198($a1)
/*0x80327CE4*/  sdc1    $f28, 0x01A0($a1)
/*0x80327CE8*/  sdc1    $f30, 0x01A8($a1)
/*0x80327CEC*/  sw      $k1, 0x012C($a1)
.L80327CF0:
/*0x80327CF0*/  lui     $k1, %hi(0xA430000C)
/*0x80327CF4*/  lw      $k1, %lo(0xA430000C)($k1)
/*0x80327CF8*/  beqz    $a0, .L80327D08
/*0x80327CFC*/  sw      $k1, 0x0128($a1)
/*0x80327D00*/  jal     __osEnqueueThread
/*0x80327D04*/  nop
.L80327D08:
/*0x80327D08*/  j       __osDispatchThread
/*0x80327D0C*/  nop

/* 0x80327D10 */
.globl __osEnqueueThread
__osEnqueueThread:
/*0x80327D10*/  lw      $t8, 0x0000($a0)
/*0x80327D14*/  lw      $t7, 0x0004($a1)
/*0x80327D18*/  move    $t9, $a0
/*0x80327D1C*/  lw      $t6, 0x0004($t8)
/*0x80327D20*/  slt     $at, $t6, $t7
/*0x80327D24*/  bnez    $at, .L80327D44
/*0x80327D28*/  nop
.L80327D2C:
/*0x80327D2C*/  move    $t9, $t8
/*0x80327D30*/  lw      $t8, 0x0000($t8)
/*0x80327D34*/  lw      $t6, 0x0004($t8)
/*0x80327D38*/  slt     $at, $t6, $t7
/*0x80327D3C*/  beqz    $at, .L80327D2C
/*0x80327D40*/  nop
.L80327D44:
/*0x80327D44*/  lw      $t8, 0x0000($t9)
/*0x80327D48*/  sw      $t8, 0x0000($a1)
/*0x80327D4C*/  sw      $a1, 0x0000($t9)
/*0x80327D50*/  jr      $ra
/*0x80327D54*/  sw      $a0, 0x0008($a1)

/* 0x80327D58 */
.globl __osPopThread
__osPopThread:
/*0x80327D58*/  lw      $v0, 0x0000($a0)
/*0x80327D5C*/  lw      $t9, 0x0000($v0)
/*0x80327D60*/  jr      $ra
/*0x80327D64*/  sw      $t9, 0x0000($a0)

/* 0x80327D68 */
.globl __osDispatchThread
__osDispatchThread:
/*0x80327D68*/  lui     $a0, %hi(__osRunQueue)
/*0x80327D6C*/  jal     __osPopThread
/*0x80327D70*/  addiu   $a0, $a0, %lo(__osRunQueue)
/*0x80327D74*/  lui     $at, %hi(__osRunningThread)
/*0x80327D78*/  sw      $v0, %lo(__osRunningThread)($at)
/*0x80327D7C*/  li      $t0, 0x0004
/*0x80327D80*/  sh      $t0, 0x0010($v0)
/*0x80327D84*/  move    $k0, $v0
.L80327D88:
/*0x80327D88*/  ld      $k1, 0x0108($k0)
/*0x80327D8C*/  ld      $at, 0x0020($k0)
/*0x80327D90*/  ld      $v0, 0x0028($k0)
/*0x80327D94*/  mtlo    $k1
/*0x80327D98*/  ld      $k1, 0x0110($k0)
/*0x80327D9C*/  ld      $v1, 0x0030($k0)
/*0x80327DA0*/  ld      $a0, 0x0038($k0)
/*0x80327DA4*/  ld      $a1, 0x0040($k0)
/*0x80327DA8*/  ld      $a2, 0x0048($k0)
/*0x80327DAC*/  ld      $a3, 0x0050($k0)
/*0x80327DB0*/  ld      $t0, 0x0058($k0)
/*0x80327DB4*/  ld      $t1, 0x0060($k0)
/*0x80327DB8*/  ld      $t2, 0x0068($k0)
/*0x80327DBC*/  ld      $t3, 0x0070($k0)
/*0x80327DC0*/  ld      $t4, 0x0078($k0)
/*0x80327DC4*/  ld      $t5, 0x0080($k0)
/*0x80327DC8*/  ld      $t6, 0x0088($k0)
/*0x80327DCC*/  ld      $t7, 0x0090($k0)
/*0x80327DD0*/  ld      $s0, 0x0098($k0)
/*0x80327DD4*/  ld      $s1, 0x00A0($k0)
/*0x80327DD8*/  ld      $s2, 0x00A8($k0)
/*0x80327DDC*/  ld      $s3, 0x00B0($k0)
/*0x80327DE0*/  ld      $s4, 0x00B8($k0)
/*0x80327DE4*/  ld      $s5, 0x00C0($k0)
/*0x80327DE8*/  ld      $s6, 0x00C8($k0)
/*0x80327DEC*/  ld      $s7, 0x00D0($k0)
/*0x80327DF0*/  ld      $t8, 0x00D8($k0)
/*0x80327DF4*/  ld      $t9, 0x00E0($k0)
/*0x80327DF8*/  ld      $gp, 0x00E8($k0)
/*0x80327DFC*/  mthi    $k1
/*0x80327E00*/  ld      $sp, 0x00F0($k0)
/*0x80327E04*/  ld      $s8, 0x00F8($k0)
/*0x80327E08*/  ld      $ra, 0x0100($k0)
/*0x80327E0C*/  lw      $k1, 0x011C($k0)
/*0x80327E10*/  mtc0    $k1, C0_EPC
/*0x80327E14*/  lw      $k1, 0x0118($k0)
/*0x80327E18*/  mtc0    $k1, C0_SR
/*0x80327E1C*/  lw      $k1, 0x0018($k0)
/*0x80327E20*/  beqz    $k1, .L80327E70
/*0x80327E24*/  nop
/*0x80327E28*/  lw      $k1, 0x012C($k0)
/*0x80327E2C*/  ctc1    $k1, $31
/*0x80327E30*/  ldc1    $f0, 0x0130($k0)
/*0x80327E34*/  ldc1    $f2, 0x0138($k0)
/*0x80327E38*/  ldc1    $f4, 0x0140($k0)
/*0x80327E3C*/  ldc1    $f6, 0x0148($k0)
/*0x80327E40*/  ldc1    $f8, 0x0150($k0)
/*0x80327E44*/  ldc1    $f10, 0x0158($k0)
/*0x80327E48*/  ldc1    $f12, 0x0160($k0)
/*0x80327E4C*/  ldc1    $f14, 0x0168($k0)
/*0x80327E50*/  ldc1    $f16, 0x0170($k0)
/*0x80327E54*/  ldc1    $f18, 0x0178($k0)
/*0x80327E58*/  ldc1    $f20, 0x0180($k0)
/*0x80327E5C*/  ldc1    $f22, 0x0188($k0)
/*0x80327E60*/  ldc1    $f24, 0x0190($k0)
/*0x80327E64*/  ldc1    $f26, 0x0198($k0)
/*0x80327E68*/  ldc1    $f28, 0x01A0($k0)
/*0x80327E6C*/  ldc1    $f30, 0x01A8($k0)
.L80327E70:
/*0x80327E70*/  lw      $k1, 0x0128($k0)
/*0x80327E74*/  sll     $k1, $k1, 1
/*0x80327E78*/  lui     $k0, %hi(__osRcpImTable)
/*0x80327E7C*/  addiu   $k0, $k0, %lo(__osRcpImTable)
/*0x80327E80*/  addu    $k1, $k1, $k0
/*0x80327E84*/  lhu     $k1, 0x0000($k1)
/*0x80327E88*/  lui     $k0, %hi(0xA430000C)
/*0x80327E8C*/  addiu   $k0, $k0, %lo(0xA430000C)
/*0x80327E90*/  sw      $k1, 0x0000($k0)
/*0x80327E94*/  nop
/*0x80327E98*/  nop
/*0x80327E9C*/  nop
/*0x80327EA0*/  nop
/*0x80327EA4*/  eret

/* 0x80327EA8 */
.globl __osCleanupThread
__osCleanupThread:
/*0x80327EA8*/  jal     osDestroyThread
/*0x80327EAC*/  move    $a0, $0
