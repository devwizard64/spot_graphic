#include <ultra64.h>

.set noreorder
.set noat

/* 0x803224A0   void osUnmapTLBAll(void) */
.globl osUnmapTLBAll
osUnmapTLBAll:
/*0x803224A0*/  mfc0    $t0, C0_ENTRYHI
/*0x803224A4*/  li      $t1, 0x001F
/*0x803224A8*/  li      $t2, 0x80000000
/*0x803224AC*/  mtc0    $t2, C0_ENTRYHI
/*0x803224B0*/  mtc0    $0, C0_ENTRYLO0
/*0x803224B4*/  mtc0    $0, C0_ENTRYLO1
.L803224B8:
/*0x803224B8*/  mtc0    $t1, C0_INX
/*0x803224BC*/  nop
/*0x803224C0*/  tlbwi
/*0x803224C4*/  nop
/*0x803224C8*/  nop
/*0x803224CC*/  addi    $t1, $t1, -0x0001
/*0x803224D0*/  bnezl   $t1, .L803224B8
/*0x803224D4*/  nop
/*0x803224D8*/  mtc0    $t0, C0_ENTRYHI
/*0x803224DC*/  jr      $ra
/*0x803224E0*/  nop
