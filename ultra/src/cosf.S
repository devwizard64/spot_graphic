#include <ultra64.h>

.set noreorder
.set noat

/* 0x80325310   float cosf(float angle) */
.globl cosf
cosf:
/*0x80325310*/  swc1    $f12, 0x0000($sp)
/*0x80325314*/  lw      $v0, 0x0000($sp)
/*0x80325318*/  lwc1    $f6, 0x0000($sp)
/*0x8032531C*/  lwc1    $f10, 0x0000($sp)
/*0x80325320*/  sra     $t6, $v0, 22
/*0x80325324*/  andi    $t7, $t6, 0x01FF
/*0x80325328*/  slti    $at, $t7, 0x0136
/*0x8032532C*/  beqzl   $at, .L80325454
/*0x80325330*/  c.eq.s  $f10, $f10
/*0x80325334*/  mtc1    $0, $f4
/*0x80325338*/  li      $at, 0x3FE00000
/*0x8032533C*/  mtc1    $at, $f19
/*0x80325340*/  c.lt.s  $f4, $f6
/*0x80325344*/  lwc1    $f0, 0x0000($sp)
/*0x80325348*/  lui     $at, %hi(ultra_rodata_803397F8)
/*0x8032534C*/  bc1fl   .L80325360
/*0x80325350*/  neg.s   $f0, $f0
/*0x80325354*/  b       .L80325360
/*0x80325358*/  mov.s   $f0, $f6
/*0x8032535C*/  neg.s   $f0, $f0
.L80325360:
/*0x80325360*/  ldc1    $f8, %lo(ultra_rodata_803397F8)($at)
/*0x80325364*/  cvt.d.s $f12, $f0
/*0x80325368*/  mtc1    $0, $f18
/*0x8032536C*/  mul.d   $f10, $f12, $f8
/*0x80325370*/  mtc1    $0, $f5
/*0x80325374*/  mtc1    $0, $f4
/*0x80325378*/  add.d   $f14, $f10, $f18
/*0x8032537C*/  c.le.d  $f4, $f14
/*0x80325380*/  nop
/*0x80325384*/  bc1fl   .L803253A4
/*0x80325388*/  sub.d   $f10, $f14, $f18
/*0x8032538C*/  add.d   $f6, $f14, $f18
/*0x80325390*/  trunc.w.d $f8, $f6
/*0x80325394*/  mfc1    $v0, $f8
/*0x80325398*/  b       .L803253B4
/*0x8032539C*/  mtc1    $v0, $f6
/*0x803253A0*/  sub.d   $f10, $f14, $f18
.L803253A4:
/*0x803253A4*/  trunc.w.d $f4, $f10
/*0x803253A8*/  mfc1    $v0, $f4
/*0x803253AC*/  nop
/*0x803253B0*/  mtc1    $v0, $f6
.L803253B4:
/*0x803253B4*/  lui     $at, %hi(ultra_rodata_80339800)
/*0x803253B8*/  ldc1    $f10, %lo(ultra_rodata_80339800)($at)
/*0x803253BC*/  cvt.d.w $f8, $f6
/*0x803253C0*/  lui     $at, %hi(ultra_rodata_80339808)
/*0x803253C4*/  ldc1    $f6, %lo(ultra_rodata_80339808)($at)
/*0x803253C8*/  lui     $v1, %hi(ultra_rodata_803397D0)
/*0x803253CC*/  addiu   $v1, $v1, %lo(ultra_rodata_803397D0)
/*0x803253D0*/  sub.d   $f0, $f8, $f18
/*0x803253D4*/  andi    $t0, $v0, 0x0001
/*0x803253D8*/  mul.d   $f4, $f0, $f10
/*0x803253DC*/  ldc1    $f10, 0x0020($v1)
/*0x803253E0*/  mul.d   $f8, $f0, $f6
/*0x803253E4*/  ldc1    $f6, 0x0018($v1)
/*0x803253E8*/  sub.d   $f2, $f12, $f4
/*0x803253EC*/  sub.d   $f2, $f2, $f8
/*0x803253F0*/  mul.d   $f14, $f2, $f2
/*0x803253F4*/  nop
/*0x803253F8*/  mul.d   $f4, $f10, $f14
/*0x803253FC*/  add.d   $f8, $f4, $f6
/*0x80325400*/  ldc1    $f4, 0x0010($v1)
/*0x80325404*/  mul.d   $f10, $f8, $f14
/*0x80325408*/  add.d   $f6, $f10, $f4
/*0x8032540C*/  ldc1    $f10, 0x0008($v1)
/*0x80325410*/  mul.d   $f8, $f6, $f14
/*0x80325414*/  bnez    $t0, .L80325434
/*0x80325418*/  add.d   $f16, $f10, $f8
/*0x8032541C*/  mul.d   $f4, $f2, $f14
/*0x80325420*/  nop
/*0x80325424*/  mul.d   $f6, $f4, $f16
/*0x80325428*/  add.d   $f10, $f6, $f2
/*0x8032542C*/  jr      $ra
/*0x80325430*/  cvt.s.d $f0, $f10
.L80325434:
/*0x80325434*/  mul.d   $f8, $f2, $f14
/*0x80325438*/  nop
/*0x8032543C*/  mul.d   $f4, $f8, $f16
/*0x80325440*/  add.d   $f6, $f4, $f2
/*0x80325444*/  cvt.s.d $f0, $f6
/*0x80325448*/  jr      $ra
/*0x8032544C*/  neg.s   $f0, $f0
/*0x80325450*/  c.eq.s  $f10, $f10
.L80325454:
/*0x80325454*/  lui     $at, %hi(ultra_rodata_80339810)
/*0x80325458*/  bc1t    .L8032546C
/*0x8032545C*/  nop
/*0x80325460*/  lui     $at, %hi(ultra_rodata_80339810)
/*0x80325464*/  jr      $ra
/*0x80325468*/  lwc1    $f0, %lo(__libm_qnan_f)($at)
.L8032546C:
/*0x8032546C*/  lwc1    $f0, %lo(ultra_rodata_80339810)($at)
/*0x80325470*/  jr      $ra
/*0x80325474*/  nop
