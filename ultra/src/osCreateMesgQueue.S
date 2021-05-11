#include <ultra64.h>

.set noreorder
.set noat

/* 0x803225A0   void osCreateMesgQueue(
    OSMesgQueue *mq,
    OSMesg *msg,
    s32 count
) */
.globl osCreateMesgQueue
osCreateMesgQueue:
/*0x803225A0*/  lui     $t6, %hi(__osThreadTail)
/*0x803225A4*/  lui     $t7, %hi(__osThreadTail)
/*0x803225A8*/  addiu   $t6, $t6, %lo(__osThreadTail)
/*0x803225AC*/  addiu   $t7, $t7, %lo(__osThreadTail)
/*0x803225B0*/  sw      $t6, 0x0000($a0)
/*0x803225B4*/  sw      $t7, 0x0004($a0)
/*0x803225B8*/  sw      $0, 0x0008($a0)
/*0x803225BC*/  sw      $0, 0x000C($a0)
/*0x803225C0*/  sw      $a2, 0x0010($a0)
/*0x803225C4*/  jr      $ra
/*0x803225C8*/  sw      $a1, 0x0014($a0)
