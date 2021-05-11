#include <ultra64.h>

.set noreorder
.set noat

/* 0x803287E0   void osMapTLBRdb(void) */
.globl osMapTLBRdb
osMapTLBRdb:
/*0x803287E0*/  mfc0    $t0, C0_ENTRYHI
/*0x803287E4*/  li      $t1, 0x001F
/*0x803287E8*/  mtc0    $t1, C0_INX
/*0x803287EC*/  mtc0    $0, C0_PAGEMASK
/*0x803287F0*/  li      $t2, 0x0017
/*0x803287F4*/  li      $t1, 0xC0000000
/*0x803287F8*/  mtc0    $t1, C0_ENTRYHI
/*0x803287FC*/  li      $t1, 0x80000000
/*0x80328800*/  srl     $t3, $t1, 6
/*0x80328804*/  or      $t3, $t3, $t2
/*0x80328808*/  mtc0    $t3, C0_ENTRYLO0
/*0x8032880C*/  li      $t1, 0x0001
/*0x80328810*/  mtc0    $t1, C0_ENTRYLO1
/*0x80328814*/  nop
/*0x80328818*/  tlbwi
/*0x8032881C*/  nop
/*0x80328820*/  nop
/*0x80328824*/  nop
/*0x80328828*/  nop
/*0x8032882C*/  mtc0    $t0, C0_ENTRYHI
/*0x80328830*/  jr      $ra
/*0x80328834*/  nop
