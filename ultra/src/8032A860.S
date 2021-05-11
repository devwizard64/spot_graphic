#include <ultra64.h>

.set noreorder
.set noat

/* 0x8032A860 */
ultra_8032A860:
/*0x8032A860*/  srl     $t6, $a0, 24
/*0x8032A864*/  srl     $t8, $a0, 16
/*0x8032A868*/  srl     $t0, $a0, 8
/*0x8032A86C*/  andi    $t7, $t6, 0x00FF
/*0x8032A870*/  andi    $t9, $t8, 0x00FF
/*0x8032A874*/  andi    $t1, $t0, 0x00FF
/*0x8032A878*/  andi    $t2, $a0, 0x00FF
/*0x8032A87C*/  sb      $t7, 0x0000($a1)
/*0x8032A880*/  sb      $t9, 0x0001($a1)
/*0x8032A884*/  sb      $t1, 0x0002($a1)
/*0x8032A888*/  jr      $ra
/*0x8032A88C*/  sb      $t2, 0x0003($a1)

/* 0x8032A890 */
ultra_8032A890:
/*0x8032A890*/  lbu     $t6, 0x0000($a0)
/*0x8032A894*/  addiu   $sp, $sp, -0x0008
/*0x8032A898*/  andi    $t7, $t6, 0x00FF
/*0x8032A89C*/  sll     $t8, $t7, 24
/*0x8032A8A0*/  sw      $t8, 0x0004($sp)
/*0x8032A8A4*/  lbu     $t9, 0x0001($a0)
/*0x8032A8A8*/  andi    $t0, $t9, 0x00FF
/*0x8032A8AC*/  sll     $t1, $t0, 16
/*0x8032A8B0*/  or      $t2, $t8, $t1
/*0x8032A8B4*/  sw      $t2, 0x0004($sp)
/*0x8032A8B8*/  lbu     $t3, 0x0002($a0)
/*0x8032A8BC*/  andi    $t4, $t3, 0x00FF
/*0x8032A8C0*/  sll     $t5, $t4, 8
/*0x8032A8C4*/  or      $t6, $t2, $t5
/*0x8032A8C8*/  sw      $t6, 0x0004($sp)
/*0x8032A8CC*/  lbu     $t7, 0x0003($a0)
/*0x8032A8D0*/  andi    $t9, $t7, 0x00FF
/*0x8032A8D4*/  or      $t0, $t6, $t9
/*0x8032A8D8*/  sw      $t0, 0x0004($sp)
/*0x8032A8DC*/  addiu   $sp, $sp, 0x0008
/*0x8032A8E0*/  jr      $ra
/*0x8032A8E4*/  move    $v0, $t0

/* 0x8032A8E8 */
ultra_8032A8E8:
/*0x8032A8E8*/  addiu   $sp, $sp, -0x0020
/*0x8032A8EC*/  lbu     $t6, 0x001C($sp)
/*0x8032A8F0*/  sw      $a1, 0x0024($sp)
/*0x8032A8F4*/  lw      $t9, 0x0024($sp)
/*0x8032A8F8*/  andi    $t7, $t6, 0xFF3F
/*0x8032A8FC*/  ori     $t8, $t7, 0x0080
/*0x8032A900*/  andi    $t2, $t8, 0x00FF
/*0x8032A904*/  andi    $t0, $t9, 0x0003
/*0x8032A908*/  andi    $t1, $t0, 0x0003
/*0x8032A90C*/  andi    $t3, $t2, 0xFFFC
/*0x8032A910*/  sb      $t8, 0x001C($sp)
/*0x8032A914*/  or      $t4, $t1, $t3
/*0x8032A918*/  sw      $ra, 0x0014($sp)
/*0x8032A91C*/  sw      $a0, 0x0020($sp)
/*0x8032A920*/  sb      $t4, 0x001C($sp)
/*0x8032A924*/  blez    $t9, .L8032A95C
/*0x8032A928*/  sw      $0, 0x0018($sp)
.L8032A92C:
/*0x8032A92C*/  lw      $t5, 0x0020($sp)
/*0x8032A930*/  lw      $t6, 0x0018($sp)
/*0x8032A934*/  addu    $t7, $t5, $t6
/*0x8032A938*/  lbu     $t0, 0x0000($t7)
/*0x8032A93C*/  addu    $t8, $sp, $t6
/*0x8032A940*/  sb      $t0, 0x001D($t8)
/*0x8032A944*/  lw      $t2, 0x0018($sp)
/*0x8032A948*/  lw      $t3, 0x0024($sp)
/*0x8032A94C*/  addiu   $t1, $t2, 0x0001
/*0x8032A950*/  slt     $at, $t1, $t3
/*0x8032A954*/  bnez    $at, .L8032A92C
/*0x8032A958*/  sw      $t1, 0x0018($sp)
.L8032A95C:
/*0x8032A95C*/  addiu   $t4, $sp, 0x001C
/*0x8032A960*/  lw      $t9, 0x0000($t4)
/*0x8032A964*/  lui     $t5, %hi(0xC0000000)
/*0x8032A968*/  jal     __osGetCause
/*0x8032A96C*/  sw      $t9, %lo(0xC0000000)($t5)
/*0x8032A970*/  andi    $t7, $v0, 0x2000
/*0x8032A974*/  bnez    $t7, .L8032A990
/*0x8032A978*/  nop
.L8032A97C:
/*0x8032A97C*/  jal     __osGetCause
/*0x8032A980*/  nop
/*0x8032A984*/  andi    $t0, $v0, 0x2000
/*0x8032A988*/  beqz    $t0, .L8032A97C
/*0x8032A98C*/  nop
.L8032A990:
/*0x8032A990*/  lui     $t6, %hi(0xC000000C)
/*0x8032A994*/  sw      $0, %lo(0xC000000C)($t6)
/*0x8032A998*/  lw      $ra, 0x0014($sp)
/*0x8032A99C*/  addiu   $sp, $sp, 0x0020
/*0x8032A9A0*/  jr      $ra
/*0x8032A9A4*/  nop

/* 0x8032A9A8 */
ultra_8032A9A8:
/*0x8032A9A8*/  lui     $t6, %hi(__osRdbWriteOK)
/*0x8032A9AC*/  lw      $t6, %lo(__osRdbWriteOK)($t6)
/*0x8032A9B0*/  addiu   $sp, $sp, -0x0028
/*0x8032A9B4*/  sw      $ra, 0x0014($sp)
/*0x8032A9B8*/  sw      $a0, 0x0028($sp)
/*0x8032A9BC*/  bnez    $t6, .L8032AA00
/*0x8032A9C0*/  sw      $a1, 0x002C($sp)
/*0x8032A9C4*/  jal     __osGetCause
/*0x8032A9C8*/  nop
/*0x8032A9CC*/  andi    $t7, $v0, 0x2000
/*0x8032A9D0*/  bnez    $t7, .L8032A9EC
/*0x8032A9D4*/  nop
.L8032A9D8:
/*0x8032A9D8*/  jal     __osGetCause
/*0x8032A9DC*/  nop
/*0x8032A9E0*/  andi    $t8, $v0, 0x2000
/*0x8032A9E4*/  beqz    $t8, .L8032A9D8
/*0x8032A9E8*/  nop
.L8032A9EC:
/*0x8032A9EC*/  lui     $t9, %hi(0xC000000C)
/*0x8032A9F0*/  sw      $0, %lo(0xC000000C)($t9)
/*0x8032A9F4*/  li      $t0, 0x0001
/*0x8032A9F8*/  lui     $at, %hi(__osRdbWriteOK)
/*0x8032A9FC*/  sw      $t0, %lo(__osRdbWriteOK)($at)
.L8032AA00:
/*0x8032AA00*/  lw      $t1, 0x002C($sp)
/*0x8032AA04*/  li      $at, 0x0003
/*0x8032AA08*/  sw      $0, 0x0024($sp)
/*0x8032AA0C*/  div     $0, $t1, $at
/*0x8032AA10*/  mfhi    $t2
/*0x8032AA14*/  subu    $t3, $t1, $t2
/*0x8032AA18*/  sw      $t2, 0x001C($sp)
/*0x8032AA1C*/  blez    $t3, .L8032AA50
/*0x8032AA20*/  sw      $t3, 0x0020($sp)
.L8032AA24:
/*0x8032AA24*/  lw      $t4, 0x0028($sp)
/*0x8032AA28*/  lw      $t5, 0x0024($sp)
/*0x8032AA2C*/  li      $a1, 0x0003
/*0x8032AA30*/  jal     ultra_8032A8E8
/*0x8032AA34*/  addu    $a0, $t4, $t5
/*0x8032AA38*/  lw      $t6, 0x0024($sp)
/*0x8032AA3C*/  lw      $t8, 0x0020($sp)
/*0x8032AA40*/  addiu   $t7, $t6, 0x0003
/*0x8032AA44*/  slt     $at, $t7, $t8
/*0x8032AA48*/  bnez    $at, .L8032AA24
/*0x8032AA4C*/  sw      $t7, 0x0024($sp)
.L8032AA50:
/*0x8032AA50*/  lw      $t9, 0x001C($sp)
/*0x8032AA54*/  blez    $t9, .L8032AA70
/*0x8032AA58*/  nop
/*0x8032AA5C*/  lw      $t0, 0x0028($sp)
/*0x8032AA60*/  lw      $t1, 0x0020($sp)
/*0x8032AA64*/  move    $a1, $t9
/*0x8032AA68*/  jal     ultra_8032A8E8
/*0x8032AA6C*/  addu    $a0, $t0, $t1
.L8032AA70:
/*0x8032AA70*/  lw      $ra, 0x0014($sp)
/*0x8032AA74*/  addiu   $sp, $sp, 0x0028
/*0x8032AA78*/  jr      $ra
/*0x8032AA7C*/  nop

/* 0x8032AA80 */
ultra_8032AA80:
/*0x8032AA80*/  addiu   $sp, $sp, -0x0020
/*0x8032AA84*/  lui     $a0, %hi(ultra_bss+0x2610)
/*0x8032AA88*/  sw      $ra, 0x0014($sp)
/*0x8032AA8C*/  addiu   $a0, $a0, %lo(ultra_bss+0x2610)
/*0x8032AA90*/  jal     ultra_8032A890
/*0x8032AA94*/  addiu   $a0, $a0, 0x0001
/*0x8032AA98*/  lui     $a0, %hi(ultra_bss+0x2610)
/*0x8032AA9C*/  addiu   $a0, $a0, %lo(ultra_bss+0x2610)
/*0x8032AAA0*/  sw      $v0, 0x001C($sp)
/*0x8032AAA4*/  jal     ultra_8032A890
/*0x8032AAA8*/  addiu   $a0, $a0, 0x0005
/*0x8032AAAC*/  sw      $v0, 0x0018($sp)
/*0x8032AAB0*/  lw      $a1, 0x0018($sp)
/*0x8032AAB4*/  jal     ultra_8032A9A8
/*0x8032AAB8*/  lw      $a0, 0x001C($sp)
/*0x8032AABC*/  lw      $ra, 0x0014($sp)
/*0x8032AAC0*/  addiu   $sp, $sp, 0x0020
/*0x8032AAC4*/  jr      $ra
/*0x8032AAC8*/  nop

/* 0x8032AACC */
ultra_8032AACC:
/*0x8032AACC*/  addiu   $sp, $sp, -0x0018
/*0x8032AAD0*/  lui     $a0, %hi(ultra_bss+0x2710)
/*0x8032AAD4*/  sw      $ra, 0x0014($sp)
/*0x8032AAD8*/  addiu   $a0, $a0, %lo(ultra_bss+0x2710)
/*0x8032AADC*/  addiu   $a0, $a0, 0x0020
/*0x8032AAE0*/  jal     ultra_8032A9A8
/*0x8032AAE4*/  li      $a1, 0x0190
/*0x8032AAE8*/  lw      $ra, 0x0014($sp)
/*0x8032AAEC*/  addiu   $sp, $sp, 0x0018
/*0x8032AAF0*/  jr      $ra
/*0x8032AAF4*/  nop

/* 0x8032AAF8 */
.globl ultra_8032AAF8
ultra_8032AAF8:
/*0x8032AAF8*/  addiu   $sp, $sp, -0x0030
/*0x8032AAFC*/  sw      $a0, 0x0030($sp)
/*0x8032AB00*/  lw      $t6, 0x0030($sp)
/*0x8032AB04*/  sw      $ra, 0x001C($sp)
/*0x8032AB08*/  sw      $s0, 0x0018($sp)
/*0x8032AB0C*/  addiu   $t7, $sp, 0x0028
/*0x8032AB10*/  sw      $t6, 0x0000($t7)
/*0x8032AB14*/  lbu     $t8, 0x0028($sp)
/*0x8032AB18*/  sw      $0, 0x002C($sp)
/*0x8032AB1C*/  andi    $t9, $t8, 0x0003
/*0x8032AB20*/  beqz    $t9, .L8032AB78
/*0x8032AB24*/  nop
.L8032AB28:
/*0x8032AB28*/  lw      $t0, 0x002C($sp)
/*0x8032AB2C*/  lui     $t2, %hi(ultra_data_80335B44)
/*0x8032AB30*/  lw      $t2, %lo(ultra_data_80335B44)($t2)
/*0x8032AB34*/  addu    $t1, $sp, $t0
/*0x8032AB38*/  lbu     $t1, 0x0029($t1)
/*0x8032AB3C*/  lui     $t3, %hi(ultra_data_80335B44)
/*0x8032AB40*/  lw      $t3, %lo(ultra_data_80335B44)($t3)
/*0x8032AB44*/  lui     $at, %hi(ultra_bss+0x2610)
/*0x8032AB48*/  lw      $t5, 0x002C($sp)
/*0x8032AB4C*/  lbu     $t7, 0x0028($sp)
/*0x8032AB50*/  addu    $at, $at, $t2
/*0x8032AB54*/  sb      $t1, %lo(ultra_bss+0x2610)($at)
/*0x8032AB58*/  lui     $at, %hi(ultra_data_80335B44)
/*0x8032AB5C*/  addiu   $t4, $t3, 0x0001
/*0x8032AB60*/  sw      $t4, %lo(ultra_data_80335B44)($at)
/*0x8032AB64*/  addiu   $t6, $t5, 0x0001
/*0x8032AB68*/  andi    $t8, $t7, 0x0003
/*0x8032AB6C*/  sltu    $at, $t6, $t8
/*0x8032AB70*/  bnez    $at, .L8032AB28
/*0x8032AB74*/  sw      $t6, 0x002C($sp)
.L8032AB78:
/*0x8032AB78*/  lbu     $t0, 0x0028($sp)
/*0x8032AB7C*/  lui     $t9, %hi(ultra_data_80335B48)
/*0x8032AB80*/  lw      $t9, %lo(ultra_data_80335B48)($t9)
/*0x8032AB84*/  lui     $s0, %hi(ultra_data_80335B40)
/*0x8032AB88*/  lw      $s0, %lo(ultra_data_80335B40)($s0)
/*0x8032AB8C*/  andi    $t1, $t0, 0x0003
/*0x8032AB90*/  lui     $at, %hi(ultra_data_80335B48)
/*0x8032AB94*/  subu    $t2, $t9, $t1
/*0x8032AB98*/  beqz    $s0, .L8032ABB4
/*0x8032AB9C*/  sw      $t2, %lo(ultra_data_80335B48)($at)
/*0x8032ABA0*/  li      $at, 0x0001
/*0x8032ABA4*/  beq     $s0, $at, .L8032AC40
/*0x8032ABA8*/  nop
/*0x8032ABAC*/  b       .L8032ACA8
/*0x8032ABB0*/  nop
.L8032ABB4:
/*0x8032ABB4*/  addiu   $t3, $sp, 0x0028
/*0x8032ABB8*/  lbu     $s0, 0x0001($t3)
/*0x8032ABBC*/  li      $at, 0x0001
/*0x8032ABC0*/  beq     $s0, $at, .L8032ABD8
/*0x8032ABC4*/  li      $at, 0x0002
/*0x8032ABC8*/  beq     $s0, $at, .L8032AC00
/*0x8032ABCC*/  nop
/*0x8032ABD0*/  b       .L8032AC24
/*0x8032ABD4*/  nop
.L8032ABD8:
/*0x8032ABD8*/  lbu     $t5, 0x0028($sp)
/*0x8032ABDC*/  li      $t4, 0x0001
/*0x8032ABE0*/  lui     $at, %hi(ultra_data_80335B40)
/*0x8032ABE4*/  sw      $t4, %lo(ultra_data_80335B40)($at)
/*0x8032ABE8*/  li      $t6, 0x0009
/*0x8032ABEC*/  andi    $t7, $t5, 0x0003
/*0x8032ABF0*/  subu    $t8, $t6, $t7
/*0x8032ABF4*/  lui     $at, %hi(ultra_data_80335B48)
/*0x8032ABF8*/  b       .L8032ACC0
/*0x8032ABFC*/  sw      $t8, %lo(ultra_data_80335B48)($at)
.L8032AC00:
/*0x8032AC00*/  jal     ultra_8032AACC
/*0x8032AC04*/  nop
/*0x8032AC08*/  lui     $at, %hi(ultra_data_80335B40)
/*0x8032AC0C*/  sw      $0, %lo(ultra_data_80335B40)($at)
/*0x8032AC10*/  lui     $at, %hi(ultra_data_80335B44)
/*0x8032AC14*/  sw      $0, %lo(ultra_data_80335B44)($at)
/*0x8032AC18*/  lui     $at, %hi(ultra_data_80335B48)
/*0x8032AC1C*/  b       .L8032ACC0
/*0x8032AC20*/  sw      $0, %lo(ultra_data_80335B48)($at)
.L8032AC24:
/*0x8032AC24*/  lui     $at, %hi(ultra_data_80335B40)
/*0x8032AC28*/  sw      $0, %lo(ultra_data_80335B40)($at)
/*0x8032AC2C*/  lui     $at, %hi(ultra_data_80335B44)
/*0x8032AC30*/  sw      $0, %lo(ultra_data_80335B44)($at)
/*0x8032AC34*/  lui     $at, %hi(ultra_data_80335B48)
/*0x8032AC38*/  b       .L8032ACC0
/*0x8032AC3C*/  sw      $0, %lo(ultra_data_80335B48)($at)
.L8032AC40:
/*0x8032AC40*/  lui     $t0, %hi(ultra_data_80335B48)
/*0x8032AC44*/  lw      $t0, %lo(ultra_data_80335B48)($t0)
/*0x8032AC48*/  bgtz    $t0, .L8032ACC0
/*0x8032AC4C*/  nop
/*0x8032AC50*/  lui     $t9, %hi(ultra_bss+0x2610)
/*0x8032AC54*/  addiu   $t9, $t9, %lo(ultra_bss+0x2610)
/*0x8032AC58*/  lbu     $t1, 0x0000($t9)
/*0x8032AC5C*/  li      $at, 0x0001
/*0x8032AC60*/  bne     $t1, $at, .L8032AC8C
/*0x8032AC64*/  nop
/*0x8032AC68*/  jal     ultra_8032AA80
/*0x8032AC6C*/  nop
/*0x8032AC70*/  lui     $at, %hi(ultra_data_80335B40)
/*0x8032AC74*/  sw      $0, %lo(ultra_data_80335B40)($at)
/*0x8032AC78*/  lui     $at, %hi(ultra_data_80335B44)
/*0x8032AC7C*/  sw      $0, %lo(ultra_data_80335B44)($at)
/*0x8032AC80*/  lui     $at, %hi(ultra_data_80335B48)
/*0x8032AC84*/  b       .L8032ACC0
/*0x8032AC88*/  sw      $0, %lo(ultra_data_80335B48)($at)
.L8032AC8C:
/*0x8032AC8C*/  lui     $at, %hi(ultra_data_80335B40)
/*0x8032AC90*/  sw      $0, %lo(ultra_data_80335B40)($at)
/*0x8032AC94*/  lui     $at, %hi(ultra_data_80335B44)
/*0x8032AC98*/  sw      $0, %lo(ultra_data_80335B44)($at)
/*0x8032AC9C*/  lui     $at, %hi(ultra_data_80335B48)
/*0x8032ACA0*/  b       .L8032ACC0
/*0x8032ACA4*/  sw      $0, %lo(ultra_data_80335B48)($at)
.L8032ACA8:
/*0x8032ACA8*/  lui     $at, %hi(ultra_data_80335B40)
/*0x8032ACAC*/  sw      $0, %lo(ultra_data_80335B40)($at)
/*0x8032ACB0*/  lui     $at, %hi(ultra_data_80335B44)
/*0x8032ACB4*/  sw      $0, %lo(ultra_data_80335B44)($at)
/*0x8032ACB8*/  lui     $at, %hi(ultra_data_80335B48)
/*0x8032ACBC*/  sw      $0, %lo(ultra_data_80335B48)($at)
.L8032ACC0:
/*0x8032ACC0*/  lw      $ra, 0x001C($sp)
/*0x8032ACC4*/  lw      $s0, 0x0018($sp)
/*0x8032ACC8*/  addiu   $sp, $sp, 0x0030
/*0x8032ACCC*/  jr      $ra
/*0x8032ACD0*/  nop
