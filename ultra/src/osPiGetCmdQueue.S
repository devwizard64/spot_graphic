#include <ultra64.h>

.set noreorder
.set noat

/* 0x80329120   OSMesgQueue *osPiGetCmdQueue(void) */
.globl osPiGetCmdQueue
osPiGetCmdQueue:
/*0x80329120*/  lui     $t6, %hi(__osPiDevMgr+0x00)
/*0x80329124*/  lw      $t6, %lo(__osPiDevMgr+0x00)($t6)
/*0x80329128*/  bnez    $t6, .L80329138
/*0x8032912C*/  nop
/*0x80329130*/  jr      $ra
/*0x80329134*/  move    $v0, $0
.L80329138:
/*0x80329138*/  lui     $v0, %hi(__osPiDevMgr+0x08)
/*0x8032913C*/  lw      $v0, %lo(__osPiDevMgr+0x08)($v0)
/*0x80329140*/  jr      $ra
/*0x80329144*/  nop
