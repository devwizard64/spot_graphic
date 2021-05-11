#include <ultra64.h>

.set noreorder
.set noat

/* 0x80327F80 */
.globl __osSpRawStartDma
__osSpRawStartDma:
/*0x80327F80*/  addiu   $sp, $sp, -0x0018
/*0x80327F84*/  sw      $ra, 0x0014($sp)
/*0x80327F88*/  sw      $a0, 0x0018($sp)
/*0x80327F8C*/  sw      $a1, 0x001C($sp)
/*0x80327F90*/  sw      $a2, 0x0020($sp)
/*0x80327F94*/  jal     __osSpDeviceBusy
/*0x80327F98*/  sw      $a3, 0x0024($sp)
/*0x80327F9C*/  beqz    $v0, .L80327FAC
/*0x80327FA0*/  nop
/*0x80327FA4*/  b       .L80327FFC
/*0x80327FA8*/  li      $v0, -0x0001
.L80327FAC:
/*0x80327FAC*/  lw      $t6, 0x001C($sp)
/*0x80327FB0*/  lui     $t7, %hi(0xA4040000)
/*0x80327FB4*/  sw      $t6, %lo(0xA4040000)($t7)
/*0x80327FB8*/  jal     osVirtualToPhysical
/*0x80327FBC*/  lw      $a0, 0x0020($sp)
/*0x80327FC0*/  lui     $t8, %hi(0xA4040004)
/*0x80327FC4*/  sw      $v0, %lo(0xA4040004)($t8)
/*0x80327FC8*/  lw      $t9, 0x0018($sp)
/*0x80327FCC*/  bnez    $t9, .L80327FE8
/*0x80327FD0*/  nop
/*0x80327FD4*/  lw      $t0, 0x0024($sp)
/*0x80327FD8*/  lui     $t2, %hi(0xA404000C)
/*0x80327FDC*/  addiu   $t1, $t0, -0x0001
/*0x80327FE0*/  b       .L80327FF8
/*0x80327FE4*/  sw      $t1, %lo(0xA404000C)($t2)
.L80327FE8:
/*0x80327FE8*/  lw      $t3, 0x0024($sp)
/*0x80327FEC*/  lui     $t5, %hi(0xA4040008)
/*0x80327FF0*/  addiu   $t4, $t3, -0x0001
/*0x80327FF4*/  sw      $t4, %lo(0xA4040008)($t5)
.L80327FF8:
/*0x80327FF8*/  move    $v0, $0
.L80327FFC:
/*0x80327FFC*/  lw      $ra, 0x0014($sp)
/*0x80328000*/  addiu   $sp, $sp, 0x0018
/*0x80328004*/  jr      $ra
/*0x80328008*/  nop
