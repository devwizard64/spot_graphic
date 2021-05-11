#include <ultra64.h>

.set noreorder
.set noat

/* 0x80325AD0 */
ultra_80325AD0:
/*0x80325AD0*/  jr      $ra
/*0x80325AD4*/  nop

/* 0x80325AD8 */
ultra_80325AD8:
/*0x80325AD8*/  jr      $ra
/*0x80325ADC*/  nop

/* 0x80325AE0 */
ultra_80325AE0:
/*0x80325AE0*/  lbu     $t6, 0x0003($a0)
/*0x80325AE4*/  bnez    $t6, .L80325BC4
/*0x80325AE8*/  nop
/*0x80325AEC*/  lh      $t7, 0x000E($a0)
/*0x80325AF0*/  li      $t1, 0x0001
/*0x80325AF4*/  sb      $t1, 0x0003($a0)
/*0x80325AF8*/  blez    $t7, .L80325BC4
/*0x80325AFC*/  move    $v0, $0
/*0x80325B00*/  move    $v1, $a0
/*0x80325B04*/  li      $t2, 0x0001
/*0x80325B08*/  lw      $t8, 0x0010($v1)
.L80325B0C:
/*0x80325B0C*/  addu    $t9, $t8, $a1
/*0x80325B10*/  sw      $t9, 0x0010($v1)
/*0x80325B14*/  lbu     $t6, 0x000E($t9)
/*0x80325B18*/  move    $a2, $t9
/*0x80325B1C*/  bnezl   $t6, .L80325BB0
/*0x80325B20*/  lh      $t8, 0x000E($a0)
/*0x80325B24*/  lw      $t7, 0x0000($t9)
/*0x80325B28*/  sb      $t1, 0x000E($t9)
/*0x80325B2C*/  addu    $t8, $t7, $a1
/*0x80325B30*/  sw      $t8, 0x0000($t9)
/*0x80325B34*/  lw      $t9, 0x0004($t9)
/*0x80325B38*/  lw      $t7, 0x0008($a2)
/*0x80325B3C*/  addu    $t6, $t9, $a1
/*0x80325B40*/  addu    $t8, $t7, $a1
/*0x80325B44*/  sw      $t6, 0x0004($a2)
/*0x80325B48*/  sw      $t8, 0x0008($a2)
/*0x80325B4C*/  lbu     $t9, 0x0009($t8)
/*0x80325B50*/  move    $t0, $t8
/*0x80325B54*/  bnezl   $t9, .L80325BB0
/*0x80325B58*/  lh      $t8, 0x000E($a0)
/*0x80325B5C*/  lw      $t6, 0x0000($t8)
/*0x80325B60*/  lbu     $a2, 0x0008($t8)
/*0x80325B64*/  sb      $t1, 0x0009($t8)
/*0x80325B68*/  addu    $t7, $t6, $a3
/*0x80325B6C*/  bnez    $a2, .L80325B94
/*0x80325B70*/  sw      $t7, 0x0000($t8)
/*0x80325B74*/  lw      $t8, 0x0010($t8)
/*0x80325B78*/  lw      $a2, 0x000C($t0)
/*0x80325B7C*/  addu    $t9, $t8, $a1
/*0x80325B80*/  beqz    $a2, .L80325BAC
/*0x80325B84*/  sw      $t9, 0x0010($t0)
/*0x80325B88*/  addu    $t6, $a2, $a1
/*0x80325B8C*/  b       .L80325BAC
/*0x80325B90*/  sw      $t6, 0x000C($t0)
.L80325B94:
/*0x80325B94*/  bnel    $t2, $a2, .L80325BB0
/*0x80325B98*/  lh      $t8, 0x000E($a0)
/*0x80325B9C*/  lw      $a2, 0x000C($t0)
/*0x80325BA0*/  beqz    $a2, .L80325BAC
/*0x80325BA4*/  addu    $t7, $a2, $a1
/*0x80325BA8*/  sw      $t7, 0x000C($t0)
.L80325BAC:
/*0x80325BAC*/  lh      $t8, 0x000E($a0)
.L80325BB0:
/*0x80325BB0*/  addiu   $v0, $v0, 0x0001
/*0x80325BB4*/  addiu   $v1, $v1, 0x0004
/*0x80325BB8*/  slt     $at, $v0, $t8
/*0x80325BBC*/  bnezl   $at, .L80325B0C
/*0x80325BC0*/  lw      $t8, 0x0010($v1)
.L80325BC4:
/*0x80325BC4*/  jr      $ra
/*0x80325BC8*/  nop
/*0x80325BCC*/  jr      $ra
/*0x80325BD0*/  nop

/* 0x80325BD4 */
alBnkfNew:
/*0x80325BD4*/  addiu   $sp, $sp, -0x0030
/*0x80325BD8*/  sw      $ra, 0x002C($sp)
/*0x80325BDC*/  sw      $s4, 0x0028($sp)
/*0x80325BE0*/  sw      $s3, 0x0024($sp)
/*0x80325BE4*/  sw      $s2, 0x0020($sp)
/*0x80325BE8*/  sw      $s1, 0x001C($sp)
/*0x80325BEC*/  sw      $s0, 0x0018($sp)
/*0x80325BF0*/  lh      $t6, 0x0000($a0)
/*0x80325BF4*/  li      $at, 0x4231
/*0x80325BF8*/  move    $s0, $a0
/*0x80325BFC*/  bne     $t6, $at, .L80325CB8
/*0x80325C00*/  move    $s1, $a1
/*0x80325C04*/  lh      $t7, 0x0002($a0)
/*0x80325C08*/  move    $s3, $0
/*0x80325C0C*/  move    $s2, $a0
/*0x80325C10*/  blez    $t7, .L80325CB8
/*0x80325C14*/  li      $s4, 0x0001
/*0x80325C18*/  lw      $t8, 0x0004($s2)
.L80325C1C:
/*0x80325C1C*/  addu    $t9, $t8, $s0
/*0x80325C20*/  beqz    $t9, .L80325CA0
/*0x80325C24*/  sw      $t9, 0x0004($s2)
/*0x80325C28*/  lbu     $t6, 0x0002($t9)
/*0x80325C2C*/  move    $t5, $t9
/*0x80325C30*/  bnezl   $t6, .L80325CA4
/*0x80325C34*/  lh      $t8, 0x0002($s0)
/*0x80325C38*/  lw      $v0, 0x0008($t9)
/*0x80325C3C*/  sb      $s4, 0x0002($t9)
/*0x80325C40*/  move    $t4, $0
/*0x80325C44*/  beqz    $v0, .L80325C5C
/*0x80325C48*/  addu    $a0, $v0, $s0
/*0x80325C4C*/  sw      $a0, 0x0008($t9)
/*0x80325C50*/  move    $a1, $s0
/*0x80325C54*/  jal     ultra_80325AE0
/*0x80325C58*/  move    $a3, $s1
.L80325C5C:
/*0x80325C5C*/  lh      $t8, 0x0000($t5)
/*0x80325C60*/  move    $t3, $t5
/*0x80325C64*/  blezl   $t8, .L80325CA4
/*0x80325C68*/  lh      $t8, 0x0002($s0)
/*0x80325C6C*/  lw      $t9, 0x000C($t3)
.L80325C70:
/*0x80325C70*/  move    $a1, $s0
/*0x80325C74*/  addu    $a0, $t9, $s0
/*0x80325C78*/  beqz    $a0, .L80325C88
/*0x80325C7C*/  sw      $a0, 0x000C($t3)
/*0x80325C80*/  jal     ultra_80325AE0
/*0x80325C84*/  move    $a3, $s1
.L80325C88:
/*0x80325C88*/  lh      $t7, 0x0000($t5)
/*0x80325C8C*/  addiu   $t4, $t4, 0x0001
/*0x80325C90*/  addiu   $t3, $t3, 0x0004
/*0x80325C94*/  slt     $at, $t4, $t7
/*0x80325C98*/  bnezl   $at, .L80325C70
/*0x80325C9C*/  lw      $t9, 0x000C($t3)
.L80325CA0:
/*0x80325CA0*/  lh      $t8, 0x0002($s0)
.L80325CA4:
/*0x80325CA4*/  addiu   $s3, $s3, 0x0001
/*0x80325CA8*/  addiu   $s2, $s2, 0x0004
/*0x80325CAC*/  slt     $at, $s3, $t8
/*0x80325CB0*/  bnezl   $at, .L80325C1C
/*0x80325CB4*/  lw      $t8, 0x0004($s2)
.L80325CB8:
/*0x80325CB8*/  lw      $ra, 0x002C($sp)
/*0x80325CBC*/  lw      $s0, 0x0018($sp)
/*0x80325CC0*/  lw      $s1, 0x001C($sp)
/*0x80325CC4*/  lw      $s2, 0x0020($sp)
/*0x80325CC8*/  lw      $s3, 0x0024($sp)
/*0x80325CCC*/  lw      $s4, 0x0028($sp)
/*0x80325CD0*/  jr      $ra
/*0x80325CD4*/  addiu   $sp, $sp, 0x0030

/* 0x80325CD8   void alSeqFileNew(ALSeqFile *file, u8 *base) */
.globl alSeqFileNew
alSeqFileNew:
/*0x80325CD8*/  lh      $t6, 0x0002($a0)
/*0x80325CDC*/  move    $v0, $0
/*0x80325CE0*/  move    $v1, $a0
/*0x80325CE4*/  blez    $t6, .L80325D10
/*0x80325CE8*/  nop
/*0x80325CEC*/  lw      $t7, 0x0004($v1)
.L80325CF0:
/*0x80325CF0*/  addiu   $v0, $v0, 0x0001
/*0x80325CF4*/  addiu   $v1, $v1, 0x0008
/*0x80325CF8*/  addu    $t8, $t7, $a1
/*0x80325CFC*/  sw      $t8, -0x0004($v1)
/*0x80325D00*/  lh      $t9, 0x0002($a0)
/*0x80325D04*/  slt     $at, $v0, $t9
/*0x80325D08*/  bnezl   $at, .L80325CF0
/*0x80325D0C*/  lw      $t7, 0x0004($v1)
.L80325D10:
/*0x80325D10*/  jr      $ra
/*0x80325D14*/  nop
