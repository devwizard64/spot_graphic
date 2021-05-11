#include <ultra64.h>

.set noreorder
.set noat

/* 0x803273F0   void *memcpy(void *, const void *, size_t) */
.globl memcpy
memcpy:
/*0x803273F0*/  move    $v0, $a0
/*0x803273F4*/  beqz    $a2, .L80327414
/*0x803273F8*/  move    $v1, $a1
.L803273FC:
/*0x803273FC*/  lbu     $t6, 0x0000($v1)
/*0x80327400*/  addiu   $a2, $a2, -0x0001
/*0x80327404*/  addiu   $v0, $v0, 0x0001
/*0x80327408*/  addiu   $v1, $v1, 0x0001
/*0x8032740C*/  bnez    $a2, .L803273FC
/*0x80327410*/  sb      $t6, -0x0001($v0)
.L80327414:
/*0x80327414*/  jr      $ra
/*0x80327418*/  move    $v0, $a0

/* 0x8032741C   size_t strlen(const char *) */
.globl strlen
strlen:
/*0x8032741C*/  lbu     $t6, 0x0000($a0)
/*0x80327420*/  move    $v1, $a0
/*0x80327424*/  beqz    $t6, .L8032743C
/*0x80327428*/  nop
/*0x8032742C*/  lbu     $t7, 0x0001($v1)
.L80327430:
/*0x80327430*/  addiu   $v1, $v1, 0x0001
/*0x80327434*/  bnezl   $t7, .L80327430
/*0x80327438*/  lbu     $t7, 0x0001($v1)
.L8032743C:
/*0x8032743C*/  jr      $ra
/*0x80327440*/  subu    $v0, $v1, $a0

/* 0x80327444   const char *strchr(const char *, int) */
.globl strchr
strchr:
/*0x80327444*/  lbu     $v1, 0x0000($a0)
/*0x80327448*/  andi    $t6, $a1, 0x00FF
/*0x8032744C*/  andi    $v0, $a1, 0x00FF
/*0x80327450*/  beql    $t6, $v1, .L8032747C
/*0x80327454*/  move    $v0, $a0
.L80327458:
/*0x80327458*/  bnezl   $v1, .L8032746C
/*0x8032745C*/  lbu     $v1, 0x0001($a0)
/*0x80327460*/  jr      $ra
/*0x80327464*/  move    $v0, $0
/*0x80327468*/  lbu     $v1, 0x0001($a0)
.L8032746C:
/*0x8032746C*/  addiu   $a0, $a0, 0x0001
/*0x80327470*/  bne     $v0, $v1, .L80327458
/*0x80327474*/  nop
/*0x80327478*/  move    $v0, $a0
.L8032747C:
/*0x8032747C*/  jr      $ra
/*0x80327480*/  nop
