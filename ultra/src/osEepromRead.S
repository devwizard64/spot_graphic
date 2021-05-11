#include <ultra64.h>

.set noreorder
.set noat

/* 0x80329150   void osEepromRead(OSMesgQueue *mq, u8 address, u8 *buffer) */
.globl osEepromRead
osEepromRead:
/*0x80329150*/  addiu   $sp, $sp, -0x0038
/*0x80329154*/  sw      $a1, 0x003C($sp)
/*0x80329158*/  lbu     $t7, 0x003F($sp)
/*0x8032915C*/  lui     $t6, %hi(ultra_bss+0x25D0)
/*0x80329160*/  addiu   $t6, $t6, %lo(ultra_bss+0x25D0)
/*0x80329164*/  slti    $at, $t7, 0x0041
/*0x80329168*/  sw      $ra, 0x0014($sp)
/*0x8032916C*/  sw      $a0, 0x0038($sp)
/*0x80329170*/  sw      $a2, 0x0040($sp)
/*0x80329174*/  sw      $0, 0x0034($sp)
/*0x80329178*/  sw      $0, 0x0030($sp)
/*0x8032917C*/  bnez    $at, .L8032918C
/*0x80329180*/  sw      $t6, 0x002C($sp)
/*0x80329184*/  b       .L80329330
/*0x80329188*/  li      $v0, -0x0001
.L8032918C:
/*0x8032918C*/  jal     __osSiGetAccess
/*0x80329190*/  nop
/*0x80329194*/  lw      $a0, 0x0038($sp)
/*0x80329198*/  jal     __osEepStatus
/*0x8032919C*/  addiu   $a1, $sp, 0x0028
/*0x803291A0*/  sw      $v0, 0x0034($sp)
/*0x803291A4*/  lw      $t8, 0x0034($sp)
/*0x803291A8*/  bnez    $t8, .L803291C0
/*0x803291AC*/  nop
/*0x803291B0*/  lhu     $t9, 0x0028($sp)
/*0x803291B4*/  li      $at, 0x8000
/*0x803291B8*/  beq     $t9, $at, .L803291C8
/*0x803291BC*/  nop
.L803291C0:
/*0x803291C0*/  b       .L80329330
/*0x803291C4*/  li      $v0, 0x0008
.L803291C8:
/*0x803291C8*/  lbu     $t0, 0x002A($sp)
/*0x803291CC*/  andi    $t1, $t0, 0x0080
/*0x803291D0*/  beqz    $t1, .L803291F4
/*0x803291D4*/  nop
.L803291D8:
/*0x803291D8*/  lw      $a0, 0x0038($sp)
/*0x803291DC*/  jal     __osEepStatus
/*0x803291E0*/  addiu   $a1, $sp, 0x0028
/*0x803291E4*/  lbu     $t2, 0x002A($sp)
/*0x803291E8*/  andi    $t3, $t2, 0x0080
/*0x803291EC*/  bnez    $t3, .L803291D8
/*0x803291F0*/  nop
.L803291F4:
/*0x803291F4*/  jal     __osPackEepReadData
/*0x803291F8*/  lbu     $a0, 0x003F($sp)
/*0x803291FC*/  lui     $a1, %hi(ultra_bss+0x25D0)
/*0x80329200*/  addiu   $a1, $a1, %lo(ultra_bss+0x25D0)
/*0x80329204*/  jal     __osSiRawStartDma
/*0x80329208*/  li      $a0, 0x0001
/*0x8032920C*/  sw      $v0, 0x0034($sp)
/*0x80329210*/  lw      $a0, 0x0038($sp)
/*0x80329214*/  move    $a1, $0
/*0x80329218*/  jal     osRecvMesg
/*0x8032921C*/  li      $a2, 0x0001
/*0x80329220*/  sw      $0, 0x0030($sp)
.L80329224:
/*0x80329224*/  lw      $t5, 0x0030($sp)
/*0x80329228*/  lw      $t7, 0x0030($sp)
/*0x8032922C*/  lui     $at, %hi(ultra_bss+0x25D0)
/*0x80329230*/  sll     $t6, $t5, 2
/*0x80329234*/  addu    $at, $at, $t6
/*0x80329238*/  li      $t4, 0x00FF
/*0x8032923C*/  sw      $t4, %lo(ultra_bss+0x25D0)($at)
/*0x80329240*/  addiu   $t8, $t7, 0x0001
/*0x80329244*/  slti    $at, $t8, 0x0010
/*0x80329248*/  bnez    $at, .L80329224
/*0x8032924C*/  sw      $t8, 0x0030($sp)
/*0x80329250*/  lui     $at, %hi(ultra_bss+0x260C)
/*0x80329254*/  lui     $a1, %hi(ultra_bss+0x25D0)
/*0x80329258*/  sw      $0, %lo(ultra_bss+0x260C)($at)
/*0x8032925C*/  addiu   $a1, $a1, %lo(ultra_bss+0x25D0)
/*0x80329260*/  jal     __osSiRawStartDma
/*0x80329264*/  move    $a0, $0
/*0x80329268*/  li      $t9, 0x0004
/*0x8032926C*/  lui     $at, %hi(ultra_bss+0x24F0)
/*0x80329270*/  sw      $v0, 0x0034($sp)
/*0x80329274*/  sb      $t9, %lo(ultra_bss+0x24F0)($at)
/*0x80329278*/  lw      $a0, 0x0038($sp)
/*0x8032927C*/  move    $a1, $0
/*0x80329280*/  jal     osRecvMesg
/*0x80329284*/  li      $a2, 0x0001
/*0x80329288*/  sw      $0, 0x0030($sp)
.L8032928C:
/*0x8032928C*/  lw      $t2, 0x0030($sp)
/*0x80329290*/  lw      $t0, 0x002C($sp)
/*0x80329294*/  addiu   $t3, $t2, 0x0001
/*0x80329298*/  slti    $at, $t3, 0x0004
/*0x8032929C*/  addiu   $t1, $t0, 0x0001
/*0x803292A0*/  sw      $t3, 0x0030($sp)
/*0x803292A4*/  bnez    $at, .L8032928C
/*0x803292A8*/  sw      $t1, 0x002C($sp)
/*0x803292AC*/  lw      $t4, 0x002C($sp)
/*0x803292B0*/  addiu   $t5, $sp, 0x001C
/*0x803292B4*/  lwl     $at, 0x0000($t4)
/*0x803292B8*/  lwr     $at, 0x0003($t4)
/*0x803292BC*/  sw      $at, 0x0000($t5)
/*0x803292C0*/  lwl     $t7, 0x0004($t4)
/*0x803292C4*/  lwr     $t7, 0x0007($t4)
/*0x803292C8*/  sw      $t7, 0x0004($t5)
/*0x803292CC*/  lwl     $at, 0x0008($t4)
/*0x803292D0*/  lwr     $at, 0x000B($t4)
/*0x803292D4*/  sw      $at, 0x0008($t5)
/*0x803292D8*/  lbu     $t8, 0x001D($sp)
/*0x803292DC*/  andi    $t9, $t8, 0x00C0
/*0x803292E0*/  sra     $t0, $t9, 4
/*0x803292E4*/  bnez    $t0, .L80329324
/*0x803292E8*/  sw      $t0, 0x0034($sp)
/*0x803292EC*/  sw      $0, 0x0030($sp)
.L803292F0:
/*0x803292F0*/  lw      $t1, 0x0030($sp)
/*0x803292F4*/  lw      $t3, 0x0040($sp)
/*0x803292F8*/  addu    $t2, $sp, $t1
/*0x803292FC*/  lbu     $t2, 0x0020($t2)
/*0x80329300*/  sb      $t2, 0x0000($t3)
/*0x80329304*/  lw      $t4, 0x0030($sp)
/*0x80329308*/  lw      $t6, 0x0040($sp)
/*0x8032930C*/  addiu   $t7, $t4, 0x0001
/*0x80329310*/  slti    $at, $t7, 0x0008
/*0x80329314*/  addiu   $t5, $t6, 0x0001
/*0x80329318*/  sw      $t7, 0x0030($sp)
/*0x8032931C*/  bnez    $at, .L803292F0
/*0x80329320*/  sw      $t5, 0x0040($sp)
.L80329324:
/*0x80329324*/  jal     __osSiRelAccess
/*0x80329328*/  nop
/*0x8032932C*/  lw      $v0, 0x0034($sp)
.L80329330:
/*0x80329330*/  lw      $ra, 0x0014($sp)
/*0x80329334*/  addiu   $sp, $sp, 0x0038
/*0x80329338*/  jr      $ra
/*0x8032933C*/  nop

/* 0x80329340 */
__osPackEepReadData:
/*0x80329340*/  addiu   $sp, $sp, -0x0018
/*0x80329344*/  lui     $t6, %hi(ultra_bss+0x25D0)
/*0x80329348*/  addiu   $t6, $t6, %lo(ultra_bss+0x25D0)
/*0x8032934C*/  andi    $a0, $a0, 0x00FF
/*0x80329350*/  sw      $t6, 0x0014($sp)
/*0x80329354*/  sw      $0, 0x0004($sp)
.L80329358:
/*0x80329358*/  lw      $t8, 0x0004($sp)
/*0x8032935C*/  lw      $t0, 0x0004($sp)
/*0x80329360*/  lui     $at, %hi(ultra_bss+0x25D0)
/*0x80329364*/  sll     $t9, $t8, 2
/*0x80329368*/  addu    $at, $at, $t9
/*0x8032936C*/  li      $t7, 0x00FF
/*0x80329370*/  sw      $t7, %lo(ultra_bss+0x25D0)($at)
/*0x80329374*/  addiu   $t1, $t0, 0x0001
/*0x80329378*/  slti    $at, $t1, 0x0010
/*0x8032937C*/  bnez    $at, .L80329358
/*0x80329380*/  sw      $t1, 0x0004($sp)
/*0x80329384*/  li      $t2, 0x0001
/*0x80329388*/  lui     $at, %hi(ultra_bss+0x260C)
/*0x8032938C*/  li      $t3, 0x0002
/*0x80329390*/  li      $t4, 0x0008
/*0x80329394*/  li      $t5, 0x0004
/*0x80329398*/  sw      $t2, %lo(ultra_bss+0x260C)($at)
/*0x8032939C*/  sb      $t3, 0x0008($sp)
/*0x803293A0*/  sb      $t4, 0x0009($sp)
/*0x803293A4*/  sb      $t5, 0x000A($sp)
/*0x803293A8*/  sb      $a0, 0x000B($sp)
/*0x803293AC*/  sw      $0, 0x0004($sp)
.L803293B0:
/*0x803293B0*/  lw      $t6, 0x0004($sp)
/*0x803293B4*/  addu    $t8, $sp, $t6
/*0x803293B8*/  sb      $0, 0x000C($t8)
/*0x803293BC*/  lw      $t7, 0x0004($sp)
/*0x803293C0*/  addiu   $t9, $t7, 0x0001
/*0x803293C4*/  slti    $at, $t9, 0x0008
/*0x803293C8*/  bnez    $at, .L803293B0
/*0x803293CC*/  sw      $t9, 0x0004($sp)
/*0x803293D0*/  sw      $0, 0x0004($sp)
.L803293D4:
/*0x803293D4*/  lw      $t0, 0x0014($sp)
/*0x803293D8*/  sb      $0, 0x0000($t0)
/*0x803293DC*/  lw      $t3, 0x0004($sp)
/*0x803293E0*/  lw      $t1, 0x0014($sp)
/*0x803293E4*/  addiu   $t4, $t3, 0x0001
/*0x803293E8*/  slti    $at, $t4, 0x0004
/*0x803293EC*/  addiu   $t2, $t1, 0x0001
/*0x803293F0*/  sw      $t4, 0x0004($sp)
/*0x803293F4*/  bnez    $at, .L803293D4
/*0x803293F8*/  sw      $t2, 0x0014($sp)
/*0x803293FC*/  addiu   $t6, $sp, 0x0008
/*0x80329400*/  lw      $at, 0x0000($t6)
/*0x80329404*/  lw      $t5, 0x0014($sp)
/*0x80329408*/  li      $t1, 0x00FE
/*0x8032940C*/  swl     $at, 0x0000($t5)
/*0x80329410*/  swr     $at, 0x0003($t5)
/*0x80329414*/  lw      $t7, 0x0004($t6)
/*0x80329418*/  swl     $t7, 0x0004($t5)
/*0x8032941C*/  swr     $t7, 0x0007($t5)
/*0x80329420*/  lw      $at, 0x0008($t6)
/*0x80329424*/  swl     $at, 0x0008($t5)
/*0x80329428*/  swr     $at, 0x000B($t5)
/*0x8032942C*/  lw      $t9, 0x0014($sp)
/*0x80329430*/  addiu   $t0, $t9, 0x000C
/*0x80329434*/  sw      $t0, 0x0014($sp)
/*0x80329438*/  sb      $t1, 0x0000($t0)
/*0x8032943C*/  jr      $ra
/*0x80329440*/  addiu   $sp, $sp, 0x0018
