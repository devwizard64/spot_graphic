#include <ultra64.h>

.set noreorder
.set noat
.set gp = 64

/* 0x803240F0 */
.globl __ull_rshift
__ull_rshift:
/*0x803240F0*/  sw      $a0, 0x0000($sp)
/*0x803240F4*/  sw      $a1, 0x0004($sp)
/*0x803240F8*/  sw      $a2, 0x0008($sp)
/*0x803240FC*/  sw      $a3, 0x000C($sp)
/*0x80324100*/  ld      $t7, 0x0008($sp)
/*0x80324104*/  ld      $t6, 0x0000($sp)
/*0x80324108*/  dsrlv   $v0, $t6, $t7
/*0x8032410C*/  dsll32  $v1, $v0, 0
/*0x80324110*/  dsra32  $v1, $v1, 0
/*0x80324114*/  jr      $ra
/*0x80324118*/  dsra32  $v0, $v0, 0

/* 0x8032411C */
.globl __ull_rem
__ull_rem:
/*0x8032411C*/  sw      $a0, 0x0000($sp)
/*0x80324120*/  sw      $a1, 0x0004($sp)
/*0x80324124*/  sw      $a2, 0x0008($sp)
/*0x80324128*/  sw      $a3, 0x000C($sp)
/*0x8032412C*/  ld      $t7, 0x0008($sp)
/*0x80324130*/  ld      $t6, 0x0000($sp)
/*0x80324134*/  ddivu   $0, $t6, $t7
/*0x80324138*/  bnez    $t7, .L80324144
/*0x8032413C*/  nop
/*0x80324140*/  break   7
.L80324144:
/*0x80324144*/  mfhi    $v0
/*0x80324148*/  dsll32  $v1, $v0, 0
/*0x8032414C*/  dsra32  $v1, $v1, 0
/*0x80324150*/  jr      $ra
/*0x80324154*/  dsra32  $v0, $v0, 0

/* 0x80324158 */
.globl __ull_div
__ull_div:
/*0x80324158*/  sw      $a0, 0x0000($sp)
/*0x8032415C*/  sw      $a1, 0x0004($sp)
/*0x80324160*/  sw      $a2, 0x0008($sp)
/*0x80324164*/  sw      $a3, 0x000C($sp)
/*0x80324168*/  ld      $t7, 0x0008($sp)
/*0x8032416C*/  ld      $t6, 0x0000($sp)
/*0x80324170*/  ddivu   $0, $t6, $t7
/*0x80324174*/  bnez    $t7, .L80324180
/*0x80324178*/  nop
/*0x8032417C*/  break   7
.L80324180:
/*0x80324180*/  mflo    $v0
/*0x80324184*/  dsll32  $v1, $v0, 0
/*0x80324188*/  dsra32  $v1, $v1, 0
/*0x8032418C*/  jr      $ra
/*0x80324190*/  dsra32  $v0, $v0, 0

/* 0x80324194 */
.globl __ll_lshift
__ll_lshift:
/*0x80324194*/  sw      $a0, 0x0000($sp)
/*0x80324198*/  sw      $a1, 0x0004($sp)
/*0x8032419C*/  sw      $a2, 0x0008($sp)
/*0x803241A0*/  sw      $a3, 0x000C($sp)
/*0x803241A4*/  ld      $t7, 0x0008($sp)
/*0x803241A8*/  ld      $t6, 0x0000($sp)
/*0x803241AC*/  dsllv   $v0, $t6, $t7
/*0x803241B0*/  dsll32  $v1, $v0, 0
/*0x803241B4*/  dsra32  $v1, $v1, 0
/*0x803241B8*/  jr      $ra
/*0x803241BC*/  dsra32  $v0, $v0, 0

/* 0x803241C0 */
.globl __ll_rem
__ll_rem:
/*0x803241C0*/  sw      $a0, 0x0000($sp)
/*0x803241C4*/  sw      $a1, 0x0004($sp)
/*0x803241C8*/  sw      $a2, 0x0008($sp)
/*0x803241CC*/  sw      $a3, 0x000C($sp)
/*0x803241D0*/  ld      $t7, 0x0008($sp)
/*0x803241D4*/  ld      $t6, 0x0000($sp)
/*0x803241D8*/  ddivu   $0, $t6, $t7
/*0x803241DC*/  bnez    $t7, .L803241E8
/*0x803241E0*/  nop
/*0x803241E4*/  break   7
.L803241E8:
/*0x803241E8*/  mfhi    $v0
/*0x803241EC*/  dsll32  $v1, $v0, 0
/*0x803241F0*/  dsra32  $v1, $v1, 0
/*0x803241F4*/  jr      $ra
/*0x803241F8*/  dsra32  $v0, $v0, 0

/* 0x803241FC */
.globl __ll_div
__ll_div:
/*0x803241FC*/  sw      $a0, 0x0000($sp)
/*0x80324200*/  sw      $a1, 0x0004($sp)
/*0x80324204*/  sw      $a2, 0x0008($sp)
/*0x80324208*/  sw      $a3, 0x000C($sp)
/*0x8032420C*/  ld      $t7, 0x0008($sp)
/*0x80324210*/  ld      $t6, 0x0000($sp)
/*0x80324214*/  ddiv    $0, $t6, $t7
/*0x80324218*/  nop
/*0x8032421C*/  bnez    $t7, .L80324228
/*0x80324220*/  nop
/*0x80324224*/  break   7
.L80324228:
/*0x80324228*/  daddiu  $at, $0, -0x0001
/*0x8032422C*/  bne     $t7, $at, .L80324244
/*0x80324230*/  daddiu  $at, $0, 0x0001
/*0x80324234*/  dsll32  $at, $at, 31
/*0x80324238*/  bne     $t6, $at, .L80324244
/*0x8032423C*/  nop
/*0x80324240*/  break   6
.L80324244:
/*0x80324244*/  mflo    $v0
/*0x80324248*/  dsll32  $v1, $v0, 0
/*0x8032424C*/  dsra32  $v1, $v1, 0
/*0x80324250*/  jr      $ra
/*0x80324254*/  dsra32  $v0, $v0, 0

/* 0x80324258 */
.globl __ll_mul
__ll_mul:
/*0x80324258*/  sw      $a0, 0x0000($sp)
/*0x8032425C*/  sw      $a1, 0x0004($sp)
/*0x80324260*/  sw      $a2, 0x0008($sp)
/*0x80324264*/  sw      $a3, 0x000C($sp)
/*0x80324268*/  ld      $t7, 0x0008($sp)
/*0x8032426C*/  ld      $t6, 0x0000($sp)
/*0x80324270*/  dmultu  $t6, $t7
/*0x80324274*/  mflo    $v0
/*0x80324278*/  dsll32  $v1, $v0, 0
/*0x8032427C*/  dsra32  $v1, $v1, 0
/*0x80324280*/  jr      $ra
/*0x80324284*/  dsra32  $v0, $v0, 0

/* 0x80324288 */
.globl __ull_divremi
__ull_divremi:
/*0x80324288*/  lh      $t7, 0x0012($sp)
/*0x8032428C*/  sw      $a2, 0x0008($sp)
/*0x80324290*/  sw      $a3, 0x000C($sp)
/*0x80324294*/  ld      $t6, 0x0008($sp)
/*0x80324298*/  move    $t8, $t7
/*0x8032429C*/  move    $t9, $t8
/*0x803242A0*/  ddivu   $0, $t6, $t9
/*0x803242A4*/  bnez    $t9, .L803242B0
/*0x803242A8*/  nop
/*0x803242AC*/  break   7
.L803242B0:
/*0x803242B0*/  mflo    $t0
/*0x803242B4*/  sd      $t0, 0x0000($a0)
/*0x803242B8*/  lh      $t2, 0x0012($sp)
/*0x803242BC*/  ld      $t1, 0x0008($sp)
/*0x803242C0*/  move    $t3, $t2
/*0x803242C4*/  move    $t4, $t3
/*0x803242C8*/  ddivu   $0, $t1, $t4
/*0x803242CC*/  bnez    $t4, .L803242D8
/*0x803242D0*/  nop
/*0x803242D4*/  break   7
.L803242D8:
/*0x803242D8*/  mfhi    $t5
/*0x803242DC*/  sd      $t5, 0x0000($a1)
/*0x803242E0*/  jr      $ra
/*0x803242E4*/  nop

/* 0x803242E8 */
.globl __ll_mod
__ll_mod:
/*0x803242E8*/  addiu   $sp, $sp, -0x0008
/*0x803242EC*/  sw      $a0, 0x0008($sp)
/*0x803242F0*/  sw      $a1, 0x000C($sp)
/*0x803242F4*/  sw      $a2, 0x0010($sp)
/*0x803242F8*/  sw      $a3, 0x0014($sp)
/*0x803242FC*/  ld      $t7, 0x0010($sp)
/*0x80324300*/  ld      $t6, 0x0008($sp)
/*0x80324304*/  ddiv    $0, $t6, $t7
/*0x80324308*/  nop
/*0x8032430C*/  bnez    $t7, .L80324318
/*0x80324310*/  nop
/*0x80324314*/  break   7
.L80324318:
/*0x80324318*/  daddiu  $at, $0, -0x0001
/*0x8032431C*/  bne     $t7, $at, .L80324334
/*0x80324320*/  daddiu  $at, $0, 0x0001
/*0x80324324*/  dsll32  $at, $at, 31
/*0x80324328*/  bne     $t6, $at, .L80324334
/*0x8032432C*/  nop
/*0x80324330*/  break   6
.L80324334:
/*0x80324334*/  mfhi    $t8
/*0x80324338*/  sd      $t8, 0x0000($sp)
/*0x8032433C*/  bgez    $t8, .L8032434C
/*0x80324340*/  nop
/*0x80324344*/  bgtz    $t7, .L80324364
/*0x80324348*/  nop
.L8032434C:
/*0x8032434C*/  ld      $t9, 0x0000($sp)
/*0x80324350*/  blez    $t9, .L80324374
/*0x80324354*/  nop
/*0x80324358*/  ld      $t0, 0x0010($sp)
/*0x8032435C*/  bgez    $t0, .L80324374
/*0x80324360*/  nop
.L80324364:
/*0x80324364*/  ld      $t1, 0x0000($sp)
/*0x80324368*/  ld      $t2, 0x0010($sp)
/*0x8032436C*/  daddu   $t3, $t1, $t2
/*0x80324370*/  sd      $t3, 0x0000($sp)
.L80324374:
/*0x80324374*/  lw      $v0, 0x0000($sp)
/*0x80324378*/  lw      $v1, 0x0004($sp)
/*0x8032437C*/  jr      $ra
/*0x80324380*/  addiu   $sp, $sp, 0x0008

/* 0x80324384 */
.globl __ll_rshift
__ll_rshift:
/*0x80324384*/  sw      $a0, 0x0000($sp)
/*0x80324388*/  sw      $a1, 0x0004($sp)
/*0x8032438C*/  sw      $a2, 0x0008($sp)
/*0x80324390*/  sw      $a3, 0x000C($sp)
/*0x80324394*/  ld      $t7, 0x0008($sp)
/*0x80324398*/  ld      $t6, 0x0000($sp)
/*0x8032439C*/  dsrav   $v0, $t6, $t7
/*0x803243A0*/  dsll32  $v1, $v0, 0
/*0x803243A4*/  dsra32  $v1, $v1, 0
/*0x803243A8*/  jr      $ra
/*0x803243AC*/  dsra32  $v0, $v0, 0
