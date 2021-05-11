#include <ultra64.h>

.set noreorder
.set noat

/* 0x803223E0   void osMapTLB(
    s32 index,
    OSPageMask pm,
    void *vaddr,
    u32 evenpaddr,
    u32 oddpaddr,
    s32 asid
) */
.globl osMapTLB
osMapTLB:
/*0x803223E0*/  mfc0    $t0, C0_ENTRYHI
/*0x803223E4*/  mtc0    $a0, C0_INX
/*0x803223E8*/  mtc0    $a1, C0_PAGEMASK
/*0x803223EC*/  lw      $t1, 0x0014($sp)
/*0x803223F0*/  li      $at, -0x0001
/*0x803223F4*/  beq     $t1, $at, .L80322408
/*0x803223F8*/  li      $t4, 0x0001
/*0x803223FC*/  li      $t2, 0x001E
/*0x80322400*/  b       .L8032240C
/*0x80322404*/  or      $a2, $a2, $t1
.L80322408:
/*0x80322408*/  li      $t2, 0x001F
.L8032240C:
/*0x8032240C*/  mtc0    $a2, C0_ENTRYHI
/*0x80322410*/  li      $at, -0x0001
/*0x80322414*/  beq     $a3, $at, .L80322430
/*0x80322418*/  nop
/*0x8032241C*/  srl     $t3, $a3, 6
/*0x80322420*/  or      $t3, $t3, $t2
/*0x80322424*/  mtc0    $t3, C0_ENTRYLO0
/*0x80322428*/  b       .L80322434
/*0x8032242C*/  nop
.L80322430:
/*0x80322430*/  mtc0    $t4, C0_ENTRYLO0
.L80322434:
/*0x80322434*/  lw      $t3, 0x0010($sp)
/*0x80322438*/  li      $at, -0x0001
/*0x8032243C*/  beq     $t3, $at, .L80322458
/*0x80322440*/  nop
/*0x80322444*/  srl     $t3, $t3, 6
/*0x80322448*/  or      $t3, $t3, $t2
/*0x8032244C*/  mtc0    $t3, C0_ENTRYLO1
/*0x80322450*/  b       .L80322470
/*0x80322454*/  nop
.L80322458:
/*0x80322458*/  mtc0    $t4, C0_ENTRYLO1
/*0x8032245C*/  li      $at, -0x0001
/*0x80322460*/  bne     $a3, $at, .L80322470
/*0x80322464*/  nop
/*0x80322468*/  li      $t3, 0x80000000
/*0x8032246C*/  mtc0    $t3, C0_ENTRYHI
.L80322470:
/*0x80322470*/  nop
/*0x80322474*/  tlbwi
/*0x80322478*/  nop
/*0x8032247C*/  nop
/*0x80322480*/  nop
/*0x80322484*/  nop
/*0x80322488*/  mtc0    $t0, C0_ENTRYHI
/*0x8032248C*/  jr      $ra
/*0x80322490*/  nop
