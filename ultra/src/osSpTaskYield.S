#include <ultra64.h>

.set noreorder
.set noat

/* 0x80322C00   s32 osSpTaskYield(void) */
.globl osSpTaskYield
osSpTaskYield:
/*0x80322C00*/  addiu   $sp, $sp, -0x0018
/*0x80322C04*/  sw      $ra, 0x0014($sp)
/*0x80322C08*/  jal     __osSpSetStatus
/*0x80322C0C*/  li      $a0, 0x0400
/*0x80322C10*/  lw      $ra, 0x0014($sp)
/*0x80322C14*/  addiu   $sp, $sp, 0x0018
/*0x80322C18*/  jr      $ra
/*0x80322C1C*/  nop
