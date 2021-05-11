#include <ultra64.h>

.set noreorder
.set noat

/* 0x80322F70   void osCreateViManager(OSPri pri) */
.globl osCreateViManager
osCreateViManager:
/*0x80322F70*/  lui     $t6, %hi(__osViDevMgr+0x00)
/*0x80322F74*/  lw      $t6, %lo(__osViDevMgr+0x00)($t6)
/*0x80322F78*/  addiu   $sp, $sp, -0x0030
/*0x80322F7C*/  sw      $ra, 0x001C($sp)
/*0x80322F80*/  bnez    $t6, .L803230E4
/*0x80322F84*/  sw      $a0, 0x0030($sp)
/*0x80322F88*/  jal     __osTimerServicesInit
/*0x80322F8C*/  nop
/*0x80322F90*/  lui     $a0, %hi(ultra_bss+0x1270)
/*0x80322F94*/  lui     $a1, %hi(ultra_bss+0x1288)
/*0x80322F98*/  addiu   $a1, $a1, %lo(ultra_bss+0x1288)
/*0x80322F9C*/  addiu   $a0, $a0, %lo(ultra_bss+0x1270)
/*0x80322FA0*/  jal     osCreateMesgQueue
/*0x80322FA4*/  li      $a2, 0x0005
/*0x80322FA8*/  lui     $at, %hi(ultra_bss+0x12A4)
/*0x80322FAC*/  li      $t7, 0x000D
/*0x80322FB0*/  sh      $t7, %lo(ultra_bss+0x12A0)($at)
/*0x80322FB4*/  sb      $0, %lo(ultra_bss+0x12A2)($at)
/*0x80322FB8*/  sw      $0, %lo(ultra_bss+0x12A4)($at)
/*0x80322FBC*/  lui     $at, %hi(ultra_bss+0x12BC)
/*0x80322FC0*/  li      $t8, 0x000E
/*0x80322FC4*/  lui     $a1, %hi(ultra_bss+0x1270)
/*0x80322FC8*/  lui     $a2, %hi(ultra_bss+0x12A0)
/*0x80322FCC*/  sh      $t8, %lo(ultra_bss+0x12B8)($at)
/*0x80322FD0*/  sb      $0, %lo(ultra_bss+0x12BA)($at)
/*0x80322FD4*/  sw      $0, %lo(ultra_bss+0x12BC)($at)
/*0x80322FD8*/  addiu   $a2, $a2, %lo(ultra_bss+0x12A0)
/*0x80322FDC*/  addiu   $a1, $a1, %lo(ultra_bss+0x1270)
/*0x80322FE0*/  jal     osSetEventMesg
/*0x80322FE4*/  li      $a0, 0x0007
/*0x80322FE8*/  lui     $a1, %hi(ultra_bss+0x1270)
/*0x80322FEC*/  lui     $a2, %hi(ultra_bss+0x12B8)
/*0x80322FF0*/  addiu   $a2, $a2, %lo(ultra_bss+0x12B8)
/*0x80322FF4*/  addiu   $a1, $a1, %lo(ultra_bss+0x1270)
/*0x80322FF8*/  jal     osSetEventMesg
/*0x80322FFC*/  li      $a0, 0x0003
/*0x80323000*/  li      $t9, -0x0001
/*0x80323004*/  sw      $t9, 0x0028($sp)
/*0x80323008*/  jal     osGetThreadPri
/*0x8032300C*/  move    $a0, $0
/*0x80323010*/  sw      $v0, 0x0024($sp)
/*0x80323014*/  lw      $t0, 0x0024($sp)
/*0x80323018*/  lw      $t1, 0x0030($sp)
/*0x8032301C*/  slt     $at, $t0, $t1
/*0x80323020*/  beqz    $at, .L80323038
/*0x80323024*/  nop
/*0x80323028*/  sw      $t0, 0x0028($sp)
/*0x8032302C*/  move    $a0, $0
/*0x80323030*/  jal     osSetThreadPri
/*0x80323034*/  move    $a1, $t1
.L80323038:
/*0x80323038*/  jal     __osDisableInt
/*0x8032303C*/  nop
/*0x80323040*/  lui     $at, %hi(__osViDevMgr+0x0C)
/*0x80323044*/  lui     $t4, %hi(ultra_bss+0x1270)
/*0x80323048*/  lui     $t3, %hi(ultra_bss+0x00C0)
/*0x8032304C*/  addiu   $t4, $t4, %lo(ultra_bss+0x1270)
/*0x80323050*/  li      $t2, 0x0001
/*0x80323054*/  addiu   $t3, $t3, %lo(ultra_bss+0x00C0)
/*0x80323058*/  lui     $t5, %hi(ultra_bss+0x0270)
/*0x8032305C*/  lw      $t7, 0x0030($sp)
/*0x80323060*/  sw      $t2, %lo(__osViDevMgr+0x00)($at)
/*0x80323064*/  sw      $t3, %lo(__osViDevMgr+0x04)($at)
/*0x80323068*/  sw      $t4, %lo(__osViDevMgr+0x08)($at)
/*0x8032306C*/  sw      $t4, %lo(__osViDevMgr+0x0C)($at)
/*0x80323070*/  addiu   $t5, $t5, %lo(ultra_bss+0x0270)
/*0x80323074*/  lui     $at, %hi(__osViDevMgr+0x14)
/*0x80323078*/  addiu   $t6, $t5, 0x1000
/*0x8032307C*/  lui     $a2, %hi(viMgrMain)
/*0x80323080*/  lui     $a3, %hi(__osViDevMgr+0x00)
/*0x80323084*/  sw      $v0, 0x002C($sp)
/*0x80323088*/  sw      $0, %lo(__osViDevMgr+0x10)($at)
/*0x8032308C*/  sw      $0, %lo(__osViDevMgr+0x14)($at)
/*0x80323090*/  addiu   $a3, $a3, %lo(__osViDevMgr+0x00)
/*0x80323094*/  addiu   $a2, $a2, %lo(viMgrMain)
/*0x80323098*/  sw      $t6, 0x0010($sp)
/*0x8032309C*/  move    $a0, $t3
/*0x803230A0*/  move    $a1, $0
/*0x803230A4*/  jal     osCreateThread
/*0x803230A8*/  sw      $t7, 0x0014($sp)
/*0x803230AC*/  jal     __osViInit
/*0x803230B0*/  nop
/*0x803230B4*/  lui     $a0, %hi(ultra_bss+0x00C0)
/*0x803230B8*/  jal     osStartThread
/*0x803230BC*/  addiu   $a0, $a0, %lo(ultra_bss+0x00C0)
/*0x803230C0*/  jal     __osRestoreInt
/*0x803230C4*/  lw      $a0, 0x002C($sp)
/*0x803230C8*/  lw      $t8, 0x0028($sp)
/*0x803230CC*/  li      $at, -0x0001
/*0x803230D0*/  beq     $t8, $at, .L803230E4
/*0x803230D4*/  nop
/*0x803230D8*/  move    $a0, $0
/*0x803230DC*/  jal     osSetThreadPri
/*0x803230E0*/  move    $a1, $t8
.L803230E4:
/*0x803230E4*/  lw      $ra, 0x001C($sp)
/*0x803230E8*/  addiu   $sp, $sp, 0x0030
/*0x803230EC*/  jr      $ra
/*0x803230F0*/  nop

/* 0x803230F4 */
viMgrMain:
/*0x803230F4*/  addiu   $sp, $sp, -0x0038
/*0x803230F8*/  sw      $ra, 0x001C($sp)
/*0x803230FC*/  sw      $a0, 0x0038($sp)
/*0x80323100*/  sw      $s0, 0x0018($sp)
/*0x80323104*/  sw      $0, 0x002C($sp)
/*0x80323108*/  jal     __osViGetCurrentContext
/*0x8032310C*/  sw      $0, 0x0028($sp)
/*0x80323110*/  sw      $v0, 0x0034($sp)
/*0x80323114*/  lw      $t6, 0x0034($sp)
/*0x80323118*/  lui     $at, %hi(ultra_bss+0x12CC)
/*0x8032311C*/  lhu     $t7, 0x0002($t6)
/*0x80323120*/  bnez    $t7, .L80323134
/*0x80323124*/  sh      $t7, %lo(ultra_bss+0x12CC)($at)
/*0x80323128*/  li      $t8, 0x0001
/*0x8032312C*/  lui     $at, %hi(ultra_bss+0x12CC)
/*0x80323130*/  sh      $t8, %lo(ultra_bss+0x12CC)($at)
.L80323134:
/*0x80323134*/  lw      $t9, 0x0038($sp)
/*0x80323138*/  sw      $t9, 0x0030($sp)
.L8032313C:
/*0x8032313C*/  lw      $t0, 0x0030($sp)
/*0x80323140*/  addiu   $a1, $sp, 0x002C
/*0x80323144*/  li      $a2, 0x0001
/*0x80323148*/  jal     osRecvMesg
/*0x8032314C*/  lw      $a0, 0x000C($t0)
/*0x80323150*/  lw      $t1, 0x002C($sp)
/*0x80323154*/  li      $at, 0x000D
/*0x80323158*/  lhu     $s0, 0x0000($t1)
/*0x8032315C*/  beq     $s0, $at, .L80323174
/*0x80323160*/  li      $at, 0x000E
/*0x80323164*/  beq     $s0, $at, .L80323284
/*0x80323168*/  nop
/*0x8032316C*/  b       .L8032313C
/*0x80323170*/  nop
.L80323174:
/*0x80323174*/  jal     __osViSwapContext
/*0x80323178*/  nop
/*0x8032317C*/  lui     $t2, %hi(ultra_bss+0x12CC)
/*0x80323180*/  lhu     $t2, %lo(ultra_bss+0x12CC)($t2)
/*0x80323184*/  lui     $at, %hi(ultra_bss+0x12CC)
/*0x80323188*/  addiu   $t3, $t2, -0x0001
/*0x8032318C*/  andi    $t4, $t3, 0xFFFF
/*0x80323190*/  bnez    $t4, .L803231D4
/*0x80323194*/  sh      $t3, %lo(ultra_bss+0x12CC)($at)
/*0x80323198*/  jal     __osViGetCurrentContext
/*0x8032319C*/  nop
/*0x803231A0*/  sw      $v0, 0x0034($sp)
/*0x803231A4*/  lw      $t5, 0x0034($sp)
/*0x803231A8*/  lw      $t6, 0x0010($t5)
/*0x803231AC*/  beqz    $t6, .L803231C4
/*0x803231B0*/  nop
/*0x803231B4*/  move    $a0, $t6
/*0x803231B8*/  lw      $a1, 0x0014($t5)
/*0x803231BC*/  jal     osSendMesg
/*0x803231C0*/  move    $a2, $0
.L803231C4:
/*0x803231C4*/  lw      $t7, 0x0034($sp)
/*0x803231C8*/  lui     $at, %hi(ultra_bss+0x12CC)
/*0x803231CC*/  lhu     $t8, 0x0002($t7)
/*0x803231D0*/  sh      $t8, %lo(ultra_bss+0x12CC)($at)
.L803231D4:
/*0x803231D4*/  lui     $t9, %hi(ultra_bss+0x257C)
/*0x803231D8*/  lw      $t9, %lo(ultra_bss+0x257C)($t9)
/*0x803231DC*/  lw      $t1, 0x0028($sp)
/*0x803231E0*/  lui     $at, %hi(ultra_bss+0x257C)
/*0x803231E4*/  addiu   $t0, $t9, 0x0001
/*0x803231E8*/  beqz    $t1, .L8032321C
/*0x803231EC*/  sw      $t0, %lo(ultra_bss+0x257C)($at)
/*0x803231F0*/  jal     osGetCount
/*0x803231F4*/  nop
/*0x803231F8*/  sw      $v0, 0x0024($sp)
/*0x803231FC*/  lw      $t2, 0x0024($sp)
/*0x80323200*/  addiu   $t4, $0, 0x0000
/*0x80323204*/  lui     $at, %hi(ultra_bss+0x2570)
/*0x80323208*/  sw      $t4, %lo(ultra_bss+0x2570)($at)
/*0x8032320C*/  lui     $at, %hi(ultra_bss+0x2574)
/*0x80323210*/  move    $t5, $t2
/*0x80323214*/  sw      $t5, %lo(ultra_bss+0x2574)($at)
/*0x80323218*/  sw      $0, 0x0028($sp)
.L8032321C:
/*0x8032321C*/  lui     $t3, %hi(ultra_bss+0x2578)
/*0x80323220*/  lw      $t3, %lo(ultra_bss+0x2578)($t3)
/*0x80323224*/  jal     osGetCount
/*0x80323228*/  sw      $t3, 0x0024($sp)
/*0x8032322C*/  lui     $at, %hi(ultra_bss+0x2578)
/*0x80323230*/  sw      $v0, %lo(ultra_bss+0x2578)($at)
/*0x80323234*/  lui     $t6, %hi(ultra_bss+0x2578)
/*0x80323238*/  lw      $t6, %lo(ultra_bss+0x2578)($t6)
/*0x8032323C*/  lw      $t7, 0x0024($sp)
/*0x80323240*/  lui     $t3, %hi(ultra_bss+0x2574)
/*0x80323244*/  lw      $t3, %lo(ultra_bss+0x2574)($t3)
/*0x80323248*/  subu    $t8, $t6, $t7
/*0x8032324C*/  move    $t1, $t8
/*0x80323250*/  lui     $t2, %hi(ultra_bss+0x2570)
/*0x80323254*/  addu    $t5, $t1, $t3
/*0x80323258*/  lw      $t2, %lo(ultra_bss+0x2570)($t2)
/*0x8032325C*/  addiu   $t0, $0, 0x0000
/*0x80323260*/  sltu    $at, $t5, $t3
/*0x80323264*/  addu    $t4, $at, $t0
/*0x80323268*/  lui     $at, %hi(ultra_bss+0x2570)
/*0x8032326C*/  addu    $t4, $t4, $t2
/*0x80323270*/  sw      $t4, %lo(ultra_bss+0x2570)($at)
/*0x80323274*/  lui     $at, %hi(ultra_bss+0x2574)
/*0x80323278*/  sw      $t8, 0x0024($sp)
/*0x8032327C*/  b       .L8032313C
/*0x80323280*/  sw      $t5, %lo(ultra_bss+0x2574)($at)
.L80323284:
/*0x80323284*/  jal     __osTimerInterrupt
/*0x80323288*/  nop
/*0x8032328C*/  b       .L8032313C
/*0x80323290*/  nop
/*0x80323294*/  nop
/*0x80323298*/  nop
/*0x8032329C*/  nop
/*0x803232A0*/  nop
/*0x803232A4*/  nop
/*0x803232A8*/  nop
/*0x803232AC*/  nop
/*0x803232B0*/  lw      $ra, 0x001C($sp)
/*0x803232B4*/  lw      $s0, 0x0018($sp)
/*0x803232B8*/  addiu   $sp, $sp, 0x0038
/*0x803232BC*/  jr      $ra
/*0x803232C0*/  nop
