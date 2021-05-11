.include "PR/rsp.inc"
.create "build/PR/aspMain.text.bin", 0x04001080

/*0x04001080*/  addi    $24, $0, 0x0360
/*0x04001084*/  addi    $23, $0, 0x0F90
/*0x04001088*/  lw      $28, 0x0030($1)
/*0x0400108C*/  lw      $27, 0x0034($1)
/*0x04001090*/  mfc0    $5, DPC_STATUS
/*0x04001094*/  andi    $4, $5, 0x0001
/*0x04001098*/  beqz    $4, .L040010B4
/*0x0400109C*/  andi    $4, $5, 0x0100
/*0x040010A0*/  beqz    $4, .L040010B4
/*0x040010A4*/  nop
.L040010A8:
/*0x040010A8*/  mfc0    $4, DPC_STATUS
/*0x040010AC*/  andi    $4, $4, 0x0100
/*0x040010B0*/  bgtz    $4, .L040010A8
.L040010B4:
/*0x040010B4*/  nop
/*0x040010B8*/  jal     _04001150
/*0x040010BC*/  nop
/*0x040010C0*/  addi    $2, $0, 0x000F
/*0x040010C4*/  addi    $1, $0, 0x0320
.L040010C8:
/*0x040010C8*/  sw      $0, 0x0000($1)
/*0x040010CC*/  bgtz    $2, .L040010C8
/*0x040010D0*/  addi    $2, $2, -0x0001

/* 0x040010D4 */
_040010D4:
/*0x040010D4*/  mfc0    $2, SP_DMA_BUSY
/*0x040010D8*/  bnez    $2, _040010D4
/*0x040010DC*/  addi    $29, $0, 0x0380
/*0x040010E0*/  mtc0    $0, SP_SEMAPHORE
.L040010E4:
/*0x040010E4*/  lw      $26, 0x0000($29)
/*0x040010E8*/  lw      $25, 0x0004($29)
/*0x040010EC*/  srl     $1, $26, 23
/*0x040010F0*/  andi    $1, $1, 0x00FE
/*0x040010F4*/  addi    $28, $28, 0x0008
/*0x040010F8*/  addi    $27, $27, -0x0008
/*0x040010FC*/  addi    $29, $29, 0x0008
/*0x04001100*/  addi    $30, $30, -0x0008
/*0x04001104*/  add     $2, $0, $1
/*0x04001108*/  lh      $2, 0x0010($2)
/*0x0400110C*/  jr      $2
/*0x04001110*/  nop
/*0x04001114*/  break   0

/* 0x04001118 */
_04001118:
/*0x04001118*/  bgtz    $30, .L040010E4
/*0x0400111C*/  nop
/*0x04001120*/  blez    $27, .L04001138
/*0x04001124*/  nop
/*0x04001128*/  jal     _04001150
/*0x0400112C*/  nop
/*0x04001130*/  j       _040010D4
/*0x04001134*/  nop
.L04001138:
/*0x04001138*/  ori     $1, $0, 0x4000
/*0x0400113C*/  mtc0    $1, SP_STATUS
/*0x04001140*/  break   0
/*0x04001144*/  nop
.L04001148:
/*0x04001148*/  b       .L04001148
/*0x0400114C*/  nop

/* 0x04001150 */
_04001150:
/*0x04001150*/  addi    $5, $ra, 0x0000
/*0x04001154*/  add     $2, $0, $28
/*0x04001158*/  addi    $3, $27, 0x0000
/*0x0400115C*/  addi    $4, $3, -0x0140
/*0x04001160*/  blez    $4, .L0400116C
/*0x04001164*/  addi    $1, $0, 0x0380
/*0x04001168*/  addi    $3, $0, 0x0140
.L0400116C:
/*0x0400116C*/  addi    $30, $3, 0x0000
/*0x04001170*/  jal     _04001184
/*0x04001174*/  addi    $3, $3, -0x0001
/*0x04001178*/  addi    $29, $0, 0x0380
/*0x0400117C*/  jr      $5
/*0x04001180*/  nop

/* 0x04001184 */
_04001184:
/*0x04001184*/  mfc0    $4, SP_SEMAPHORE
/*0x04001188*/  bnez    $4, _04001184
/*0x0400118C*/  nop
.L04001190:
/*0x04001190*/  mfc0    $4, SP_DMA_FULL
/*0x04001194*/  bnez    $4, .L04001190
/*0x04001198*/  nop
/*0x0400119C*/  mtc0    $1, SP_MEM_ADDR
/*0x040011A0*/  mtc0    $2, SP_DRAM_ADDR
/*0x040011A4*/  mtc0    $3, SP_RD_LEN
/*0x040011A8*/  jr      $ra
/*0x040011AC*/  nop

/* 0x040011B0 */
_040011B0:
/*0x040011B0*/  mfc0    $4, SP_SEMAPHORE
/*0x040011B4*/  bnez    $4, _040011B0
/*0x040011B8*/  nop
.L040011BC:
/*0x040011BC*/  mfc0    $4, SP_DMA_FULL
/*0x040011C0*/  bnez    $4, .L040011BC
/*0x040011C4*/  nop
/*0x040011C8*/  mtc0    $1, SP_MEM_ADDR
/*0x040011CC*/  mtc0    $2, SP_DRAM_ADDR
/*0x040011D0*/  mtc0    $3, SP_WR_LEN
/*0x040011D4*/  jr      $ra
/*0x040011D8*/  nop
/*0x040011DC*/  andi    $3, $25, 0xFFFF
/*0x040011E0*/  beqz    $3, _04001118
/*0x040011E4*/  addi    $4, $0, 0x05C0
/*0x040011E8*/  andi    $2, $26, 0xFFFF
/*0x040011EC*/  add     $2, $2, $4
/*0x040011F0*/  nop :: .org .-4 :: .word 0x4A01086C
/*0x040011F4*/  addi    $3, $3, -0x0010
.L040011F8:
/*0x040011F8*/  nop :: .org .-4 :: .word 0xE8411800
/*0x040011FC*/  nop :: .org .-4 :: .word 0xE8411801
/*0x04001200*/  addi    $2, $2, 0x0010
/*0x04001204*/  bgtz    $3, .L040011F8
/*0x04001208*/  addi    $3, $3, -0x0010
/*0x0400120C*/  j       _04001118
/*0x04001210*/  nop
/*0x04001214*/  lhu     $3, 0x0004($24)
/*0x04001218*/  beqz    $3, _04001118
/*0x0400121C*/  sll     $2, $25, 8
/*0x04001220*/  srl     $2, $2, 8
/*0x04001224*/  srl     $4, $25, 24
/*0x04001228*/  sll     $4, $4, 2
/*0x0400122C*/  lw      $5, 0x0320($4)
/*0x04001230*/  add     $2, $2, $5
/*0x04001234*/  lhu     $1, 0x0000($24)
/*0x04001238*/  jal     _04001184
/*0x0400123C*/  addi    $3, $3, -0x0001
.L04001240:
/*0x04001240*/  mfc0    $1, SP_DMA_BUSY
/*0x04001244*/  bnez    $1, .L04001240
/*0x04001248*/  nop
/*0x0400124C*/  j       _04001118
/*0x04001250*/  mtc0    $0, SP_SEMAPHORE
/*0x04001254*/  lhu     $3, 0x0004($24)
/*0x04001258*/  beqz    $3, _04001118
/*0x0400125C*/  sll     $2, $25, 8
/*0x04001260*/  srl     $2, $2, 8
/*0x04001264*/  srl     $4, $25, 24
/*0x04001268*/  sll     $4, $4, 2
/*0x0400126C*/  lw      $5, 0x0320($4)
/*0x04001270*/  add     $2, $2, $5
/*0x04001274*/  lhu     $1, 0x0002($24)
/*0x04001278*/  jal     _040011B0
/*0x0400127C*/  addi    $3, $3, -0x0001
.L04001280:
/*0x04001280*/  mfc0    $1, SP_DMA_BUSY
/*0x04001284*/  bnez    $1, .L04001280
/*0x04001288*/  nop
/*0x0400128C*/  j       _04001118
/*0x04001290*/  mtc0    $0, SP_SEMAPHORE
/*0x04001294*/  sll     $2, $25, 8
/*0x04001298*/  srl     $2, $2, 8
/*0x0400129C*/  srl     $4, $25, 24
/*0x040012A0*/  sll     $4, $4, 2
/*0x040012A4*/  lw      $5, 0x0320($4)
/*0x040012A8*/  add     $2, $2, $5
/*0x040012AC*/  addi    $1, $0, 0x04C0
/*0x040012B0*/  andi    $3, $26, 0xFFFF
/*0x040012B4*/  jal     _04001184
/*0x040012B8*/  addi    $3, $3, -0x0001
.L040012BC:
/*0x040012BC*/  mfc0    $1, SP_DMA_BUSY
/*0x040012C0*/  bnez    $1, .L040012BC
/*0x040012C4*/  nop
/*0x040012C8*/  j       _04001118
/*0x040012CC*/  mtc0    $0, SP_SEMAPHORE
/*0x040012D0*/  sll     $3, $25, 8
/*0x040012D4*/  srl     $3, $3, 8
/*0x040012D8*/  srl     $2, $25, 24
/*0x040012DC*/  sll     $2, $2, 2
/*0x040012E0*/  add     $4, $0, $2
/*0x040012E4*/  j       _04001118
/*0x040012E8*/  sw      $3, 0x0320($4)
/*0x040012EC*/  addi    $1, $26, 0x05C0
/*0x040012F0*/  srl     $2, $25, 16
/*0x040012F4*/  addi    $2, $2, 0x05C0
/*0x040012F8*/  srl     $4, $26, 16
/*0x040012FC*/  andi    $4, $4, 0x0008
/*0x04001300*/  bgtz    $4, .L04001318
/*0x04001304*/  addi    $3, $25, 0x05C0
/*0x04001308*/  sh      $1, 0x0000($24)
/*0x0400130C*/  sh      $2, 0x0002($24)
/*0x04001310*/  j       _04001118
/*0x04001314*/  sh      $25, 0x0004($24)
.L04001318:
/*0x04001318*/  sh      $3, 0x000E($24)
/*0x0400131C*/  sh      $1, 0x000A($24)
/*0x04001320*/  j       _04001118
/*0x04001324*/  sh      $2, 0x000C($24)
/*0x04001328*/  srl     $2, $26, 16
/*0x0400132C*/  andi    $1, $2, 0x0008
/*0x04001330*/  beqz    $1, .L04001344
/*0x04001334*/  andi    $1, $2, 0x0004
/*0x04001338*/  sh      $26, 0x001C($24)
/*0x0400133C*/  j       _04001118
/*0x04001340*/  sh      $25, 0x001E($24)
.L04001344:
/*0x04001344*/  beqz    $1, .L04001364
/*0x04001348*/  andi    $1, $2, 0x0002
/*0x0400134C*/  beqz    $1, .L0400135C
/*0x04001350*/  nop
/*0x04001354*/  j       _04001118
/*0x04001358*/  sh      $26, 0x0006($24)
.L0400135C:
/*0x0400135C*/  j       _04001118
/*0x04001360*/  sh      $26, 0x0008($24)
.L04001364:
/*0x04001364*/  beqz    $1, .L0400137C
/*0x04001368*/  srl     $1, $25, 16
/*0x0400136C*/  sh      $26, 0x0010($24)
/*0x04001370*/  sh      $1, 0x0012($24)
/*0x04001374*/  j       _04001118
/*0x04001378*/  sh      $25, 0x0014($24)
.L0400137C:
/*0x0400137C*/  sh      $26, 0x0016($24)
/*0x04001380*/  sh      $1, 0x0018($24)
/*0x04001384*/  j       _04001118
/*0x04001388*/  sh      $25, 0x001A($24)
/*0x0400138C*/  lhu     $1, 0x0004($24)
/*0x04001390*/  lhu     $4, 0x0002($24)
/*0x04001394*/  beqz    $1, _04001118
/*0x04001398*/  andi    $3, $25, 0xFFFF
/*0x0400139C*/  addi    $3, $3, 0x05C0
/*0x040013A0*/  srl     $2, $25, 16
/*0x040013A4*/  addi    $2, $2, 0x05C0
.L040013A8:
/*0x040013A8*/  nop :: .org .-4 :: .word 0xC8412000
/*0x040013AC*/  nop :: .org .-4 :: .word 0xC8622000
/*0x040013B0*/  nop :: .org .-4 :: .word 0xE8810800
/*0x040013B4*/  nop :: .org .-4 :: .word 0xE8820801
/*0x040013B8*/  nop :: .org .-4 :: .word 0xE8810902
/*0x040013BC*/  nop :: .org .-4 :: .word 0xE8820903
/*0x040013C0*/  nop :: .org .-4 :: .word 0xE8810A04
/*0x040013C4*/  nop :: .org .-4 :: .word 0xE8820A05
/*0x040013C8*/  nop :: .org .-4 :: .word 0xE8810B06
/*0x040013CC*/  nop :: .org .-4 :: .word 0xE8820B07
/*0x040013D0*/  nop :: .org .-4 :: .word 0xE8810C08
/*0x040013D4*/  nop :: .org .-4 :: .word 0xE8820C09
/*0x040013D8*/  nop :: .org .-4 :: .word 0xE8810D0A
/*0x040013DC*/  nop :: .org .-4 :: .word 0xE8820D0B
/*0x040013E0*/  nop :: .org .-4 :: .word 0xE8810E0C
/*0x040013E4*/  nop :: .org .-4 :: .word 0xE8820E0D
/*0x040013E8*/  nop :: .org .-4 :: .word 0xE8810F0E
/*0x040013EC*/  nop :: .org .-4 :: .word 0xE8820F0F
/*0x040013F0*/  addi    $1, $1, -0x0010
/*0x040013F4*/  addi    $2, $2, 0x0010
/*0x040013F8*/  addi    $3, $3, 0x0010
/*0x040013FC*/  bgtz    $1, .L040013A8
/*0x04001400*/  addi    $4, $4, 0x0020
/*0x04001404*/  j       _04001118
/*0x04001408*/  nop
/*0x0400140C*/  andi    $1, $25, 0xFFFF
/*0x04001410*/  beqz    $1, _04001118
/*0x04001414*/  andi    $2, $26, 0xFFFF
/*0x04001418*/  addi    $2, $2, 0x05C0
/*0x0400141C*/  srl     $3, $25, 16
/*0x04001420*/  addi    $3, $3, 0x05C0
.L04001424:
/*0x04001424*/  nop :: .org .-4 :: .word 0xC8411800
/*0x04001428*/  nop :: .org .-4 :: .word 0xC8421801
/*0x0400142C*/  addi    $1, $1, -0x0010
/*0x04001430*/  addi    $2, $2, 0x0010
/*0x04001434*/  nop :: .org .-4 :: .word 0xE8611800
/*0x04001438*/  nop :: .org .-4 :: .word 0xE8621801
/*0x0400143C*/  bgtz    $1, .L04001424
/*0x04001440*/  addi    $3, $3, 0x0010
/*0x04001444*/  j       _04001118
/*0x04001448*/  nop
/*0x0400144C*/  sll     $1, $25, 8
/*0x04001450*/  srl     $1, $1, 8
/*0x04001454*/  srl     $3, $25, 24
/*0x04001458*/  sll     $3, $3, 2
/*0x0400145C*/  lw      $2, 0x0320($3)
/*0x04001460*/  add     $1, $1, $2
/*0x04001464*/  sw      $1, 0x0010($24)
/*0x04001468*/  j       _04001118
/*0x0400146C*/  nop
/*0x04001470*/  nop :: .org .-4 :: .word 0xC81F2000
/*0x04001474*/  nop :: .org .-4 :: .word 0x4A1BDEEC
/*0x04001478*/  lhu     $21, 0x0000($24)
/*0x0400147C*/  nop :: .org .-4 :: .word 0x4A19CE6C
/*0x04001480*/  nop :: .org .-4 :: .word 0x4A18C62C
/*0x04001484*/  addi    $20, $21, 0x0001
/*0x04001488*/  lhu     $19, 0x0002($24)
/*0x0400148C*/  nop :: .org .-4 :: .word 0x4A0D6B6C
/*0x04001490*/  nop :: .org .-4 :: .word 0x4A0E73AC
/*0x04001494*/  lhu     $18, 0x0004($24)
/*0x04001498*/  nop :: .org .-4 :: .word 0x4A0F7BEC
/*0x0400149C*/  lui     $1, 0x00FFFFFF >> 16
/*0x040014A0*/  nop :: .org .-4 :: .word 0x4A10842C
/*0x040014A4*/  ori     $1, $1, 0x00FFFFFF & 0xFFFF
/*0x040014A8*/  nop :: .org .-4 :: .word 0x4A118C6C
/*0x040014AC*/  and     $17, $25, $1
/*0x040014B0*/  nop :: .org .-4 :: .word 0x4A1294AC
/*0x040014B4*/  srl     $2, $25, 24
/*0x040014B8*/  nop :: .org .-4 :: .word 0x4A139CEC
/*0x040014BC*/  sll     $2, $2, 2
/*0x040014C0*/  lw      $3, 0x0320($2)
/*0x040014C4*/  add     $17, $17, $3
/*0x040014C8*/  nop :: .org .-4 :: .word 0xEA7B2000
/*0x040014CC*/  nop :: .org .-4 :: .word 0xEA7B2001
/*0x040014D0*/  srl     $1, $26, 16
/*0x040014D4*/  andi    $1, $1, 0x0001
/*0x040014D8*/  bgtz    $1, .L0400150C
/*0x040014DC*/  srl     $1, $26, 16
/*0x040014E0*/  andi    $1, $1, 0x0002
/*0x040014E4*/  beq     $0, $1, .L040014F0
/*0x040014E8*/  addi    $2, $17, 0x0000
/*0x040014EC*/  lw      $2, 0x0010($24)
.L040014F0:
/*0x040014F0*/  addi    $1, $19, 0x0000
/*0x040014F4*/  jal     _04001184
/*0x040014F8*/  addi    $3, $0, 0x001F
.L040014FC:
/*0x040014FC*/  mfc0    $5, SP_DMA_BUSY
/*0x04001500*/  bnez    $5, .L040014FC
/*0x04001504*/  nop
/*0x04001508*/  mtc0    $0, SP_SEMAPHORE
.L0400150C:
/*0x0400150C*/  addi    $16, $0, 0x0030
/*0x04001510*/  addi    $15, $0, 0x04C0
/*0x04001514*/  nop :: .org .-4 :: .word 0xCA191800
/*0x04001518*/  nop :: .org .-4 :: .word 0xCA181C00
/*0x0400151C*/  nop :: .org .-4 :: .word 0xCA171801
/*0x04001520*/  nop :: .org .-4 :: .word 0xCA171C01
/*0x04001524*/  nop :: .org .-4 :: .word 0xCA7B2001
/*0x04001528*/  addi    $19, $19, 0x0020
/*0x0400152C*/  beqz    $18, .L040016E8
/*0x04001530*/  nop :: .org .-4 :: .word 0xCA811800
/*0x04001534*/  lbu     $1, 0x0000($21)
/*0x04001538*/  andi    $11, $1, 0x000F
/*0x0400153C*/  sll     $11, $11, 5
/*0x04001540*/  nop :: .org .-4 :: .word 0x4B01C8E8
/*0x04001544*/  add     $13, $11, $15
/*0x04001548*/  nop :: .org .-4 :: .word 0x4B21C128
/*0x0400154C*/  srl     $14, $1, 4
/*0x04001550*/  nop :: .org .-4 :: .word 0x4B41C968
/*0x04001554*/  addi    $2, $0, 0x000C
/*0x04001558*/  nop :: .org .-4 :: .word 0x4B61C1A8
/*0x0400155C*/  sub     $14, $2, $14
/*0x04001560*/  addi    $2, $14, -0x0001
/*0x04001564*/  addi    $3, $0, 0x0001
/*0x04001568*/  sll     $3, $3, 15
/*0x0400156C*/  srlv    $4, $3, $2
/*0x04001570*/  nop :: .org .-4 :: .word 0x4884B000
/*0x04001574*/  nop :: .org .-4 :: .word 0xC9B52000
/*0x04001578*/  nop :: .org .-4 :: .word 0xC9B42001
/*0x0400157C*/  addi    $13, $13, -0x0002
/*0x04001580*/  nop :: .org .-4 :: .word 0xC9B32802
/*0x04001584*/  addi    $13, $13, -0x0002
/*0x04001588*/  nop :: .org .-4 :: .word 0xC9B22802
/*0x0400158C*/  addi    $13, $13, -0x0002
/*0x04001590*/  nop :: .org .-4 :: .word 0xC9B12802
/*0x04001594*/  addi    $13, $13, -0x0002
/*0x04001598*/  nop :: .org .-4 :: .word 0xC9B02802
/*0x0400159C*/  addi    $13, $13, -0x0002
/*0x040015A0*/  nop :: .org .-4 :: .word 0xC9AF2802
/*0x040015A4*/  addi    $13, $13, -0x0002
/*0x040015A8*/  nop :: .org .-4 :: .word 0xC9AE2802
/*0x040015AC*/  addi    $13, $13, -0x0002
/*0x040015B0*/  nop :: .org .-4 :: .word 0xC9AD2802
.L040015B4:
/*0x040015B4*/  addi    $20, $20, 0x0009
/*0x040015B8*/  nop :: .org .-4 :: .word 0x4A171F86
/*0x040015BC*/  addi    $21, $21, 0x0009
/*0x040015C0*/  nop :: .org .-4 :: .word 0x4A17278E
/*0x040015C4*/  nop :: .org .-4 :: .word 0xCA811800
/*0x040015C8*/  nop :: .org .-4 :: .word 0x4A172F46
/*0x040015CC*/  lbu     $1, 0x0000($21)
/*0x040015D0*/  nop :: .org .-4 :: .word 0x4A17374E
/*0x040015D4*/  blez    $14, .L040015E4
/*0x040015D8*/  andi    $11, $1, 0x000F
/*0x040015DC*/  nop :: .org .-4 :: .word 0x4B16F785
/*0x040015E0*/  nop :: .org .-4 :: .word 0x4B16EF45
.L040015E4:
/*0x040015E4*/  sll     $11, $11, 5
/*0x040015E8*/  nop :: .org .-4 :: .word 0x4B01C8E8
/*0x040015EC*/  add     $13, $11, $15
/*0x040015F0*/  nop :: .org .-4 :: .word 0x4B21C128
/*0x040015F4*/  nop :: .org .-4 :: .word 0x4B41C968
/*0x040015F8*/  nop :: .org .-4 :: .word 0x4B61C1A8
/*0x040015FC*/  srl     $14, $1, 4
/*0x04001600*/  nop :: .org .-4 :: .word 0x4BDBA887
/*0x04001604*/  addi    $2, $0, 0x000C
/*0x04001608*/  nop :: .org .-4 :: .word 0x4BFBA08F
/*0x0400160C*/  sub     $14, $2, $14
/*0x04001610*/  nop :: .org .-4 :: .word 0x4B1E988F
/*0x04001614*/  addi    $2, $14, -0x0001
/*0x04001618*/  nop :: .org .-4 :: .word 0x4B3E908F
/*0x0400161C*/  addi    $3, $0, 0x0001
/*0x04001620*/  nop :: .org .-4 :: .word 0x4B5E888F
/*0x04001624*/  sll     $3, $3, 15
/*0x04001628*/  nop :: .org .-4 :: .word 0x4B7E808F
/*0x0400162C*/  srlv    $4, $3, $2
/*0x04001630*/  nop :: .org .-4 :: .word 0x4B9E7F0F
/*0x04001634*/  nop :: .org .-4 :: .word 0x4884B000
/*0x04001638*/  nop :: .org .-4 :: .word 0x4BBE708F
/*0x0400163C*/  nop :: .org .-4 :: .word 0x4BDE688F
/*0x04001640*/  nop :: .org .-4 :: .word 0x4BBFF08F
/*0x04001644*/  nop :: .org .-4 :: .word 0x4B3C3E9D
/*0x04001648*/  nop :: .org .-4 :: .word 0x4B1C3F1D
/*0x0400164C*/  nop :: .org .-4 :: .word 0x4B9FD086
/*0x04001650*/  nop :: .org .-4 :: .word 0x4B9FE70F
/*0x04001654*/  nop :: .org .-4 :: .word 0x4B1D9887
/*0x04001658*/  addi    $12, $13, -0x0002
/*0x0400165C*/  nop :: .org .-4 :: .word 0x4B3D908F
/*0x04001660*/  nop :: .org .-4 :: .word 0xC9932802
/*0x04001664*/  nop :: .org .-4 :: .word 0x4B5D888F
/*0x04001668*/  addi    $12, $12, -0x0002
/*0x0400166C*/  nop :: .org .-4 :: .word 0x4B7D808F
/*0x04001670*/  nop :: .org .-4 :: .word 0xC9922802
/*0x04001674*/  nop :: .org .-4 :: .word 0x4B9D788F
/*0x04001678*/  addi    $12, $12, -0x0002
/*0x0400167C*/  nop :: .org .-4 :: .word 0x4BBD708F
/*0x04001680*/  nop :: .org .-4 :: .word 0xC9912802
/*0x04001684*/  nop :: .org .-4 :: .word 0x4BDD688F
/*0x04001688*/  addi    $12, $12, -0x0002
/*0x0400168C*/  nop :: .org .-4 :: .word 0x4BBFE88F
/*0x04001690*/  nop :: .org .-4 :: .word 0xC9902802
/*0x04001694*/  nop :: .org .-4 :: .word 0x4BDCA88F
/*0x04001698*/  addi    $12, $12, -0x0002
/*0x0400169C*/  nop :: .org .-4 :: .word 0x4BFCA08F
/*0x040016A0*/  nop :: .org .-4 :: .word 0xC98F2802
/*0x040016A4*/  nop :: .org .-4 :: .word 0x4B3B3E9D
/*0x040016A8*/  addi    $12, $12, -0x0002
/*0x040016AC*/  nop :: .org .-4 :: .word 0x4B1B3EDD
/*0x040016B0*/  nop :: .org .-4 :: .word 0xC98E2802
/*0x040016B4*/  addi    $12, $12, -0x0002
/*0x040016B8*/  nop :: .org .-4 :: .word 0xC98D2802
/*0x040016BC*/  nop :: .org .-4 :: .word 0xC9B52000
/*0x040016C0*/  nop :: .org .-4 :: .word 0x4B9FD086
/*0x040016C4*/  nop :: .org .-4 :: .word 0xC9B42001
/*0x040016C8*/  nop :: .org .-4 :: .word 0x4B9FDECF
/*0x040016CC*/  addi    $18, $18, -0x0020
/*0x040016D0*/  nop :: .org .-4 :: .word 0xEA7C1800
/*0x040016D4*/  nop :: .org .-4 :: .word 0xEA7C1C01
/*0x040016D8*/  nop :: .org .-4 :: .word 0xEA7B1802
/*0x040016DC*/  nop :: .org .-4 :: .word 0xEA7B1C03
/*0x040016E0*/  bgtz    $18, .L040015B4
/*0x040016E4*/  addi    $19, $19, 0x0020
.L040016E8:
/*0x040016E8*/  addi    $1, $19, -0x0020
/*0x040016EC*/  addi    $2, $17, 0x0000
/*0x040016F0*/  jal     _040011B0
/*0x040016F4*/  addi    $3, $0, 0x001F
.L040016F8:
/*0x040016F8*/  mfc0    $5, SP_DMA_BUSY
/*0x040016FC*/  bnez    $5, .L040016F8
/*0x04001700*/  nop
/*0x04001704*/  j       _04001118
/*0x04001708*/  mtc0    $0, SP_SEMAPHORE
/*0x0400170C*/  nop :: .org .-4 :: .word 0xC81F2000
/*0x04001710*/  nop :: .org .-4 :: .word 0x4A1CE72C
/*0x04001714*/  lhu     $21, 0x0000($24)
/*0x04001718*/  nop :: .org .-4 :: .word 0x4A118C6C
/*0x0400171C*/  lhu     $20, 0x0002($24)
/*0x04001720*/  nop :: .org .-4 :: .word 0x4A1294AC
/*0x04001724*/  lhu     $19, 0x0004($24)
/*0x04001728*/  nop :: .org .-4 :: .word 0x4A139CEC
/*0x0400172C*/  beqz    $19, .L04001874
/*0x04001730*/  andi    $14, $26, 0xFFFF
/*0x04001734*/  nop :: .org .-4 :: .word 0x488EFD00
/*0x04001738*/  sll     $14, $14, 2
/*0x0400173C*/  nop :: .org .-4 :: .word 0x488E8000
/*0x04001740*/  lui     $1, 0x00FFFFFF >> 16
/*0x04001744*/  nop :: .org .-4 :: .word 0x4A14A52C
/*0x04001748*/  ori     $1, $1, 0x00FFFFFF & 0xFFFF
/*0x0400174C*/  nop :: .org .-4 :: .word 0x4A15AD6C
/*0x04001750*/  and     $18, $25, $1
/*0x04001754*/  nop :: .org .-4 :: .word 0x4A16B5AC
/*0x04001758*/  srl     $2, $25, 24
/*0x0400175C*/  nop :: .org .-4 :: .word 0x4A17BDEC
/*0x04001760*/  sll     $2, $2, 2
/*0x04001764*/  lw      $3, 0x0320($2)
/*0x04001768*/  add     $18, $18, $3
/*0x0400176C*/  nop :: .org .-4 :: .word 0xEAFC1000
/*0x04001770*/  srl     $1, $26, 16
/*0x04001774*/  andi    $1, $1, 0x0001
/*0x04001778*/  bgtz    $1, .L040017A0
/*0x0400177C*/  nop
/*0x04001780*/  addi    $1, $23, 0x0000
/*0x04001784*/  addi    $2, $18, 0x0000
/*0x04001788*/  jal     _04001184
/*0x0400178C*/  addi    $3, $0, 0x0007
.L04001790:
/*0x04001790*/  mfc0    $5, SP_DMA_BUSY
/*0x04001794*/  bnez    $5, .L04001790
/*0x04001798*/  nop
/*0x0400179C*/  mtc0    $0, SP_SEMAPHORE
.L040017A0:
/*0x040017A0*/  addi    $13, $0, 0x04C0
/*0x040017A4*/  addi    $1, $0, 0x0004
/*0x040017A8*/  nop :: .org .-4 :: .word 0x48817000
/*0x040017AC*/  nop :: .org .-4 :: .word 0xC9B82001
/*0x040017B0*/  nop :: .org .-4 :: .word 0x4B10C405
/*0x040017B4*/  nop :: .org .-4 :: .word 0xCAFC1C00
/*0x040017B8*/  nop :: .org .-4 :: .word 0xE9B02001
/*0x040017BC*/  nop :: .org .-4 :: .word 0xC9B92000
/*0x040017C0*/  addi    $13, $13, -0x0002
/*0x040017C4*/  nop :: .org .-4 :: .word 0xC9B72802
/*0x040017C8*/  addi    $13, $13, -0x0002
/*0x040017CC*/  nop :: .org .-4 :: .word 0xC9B62802
/*0x040017D0*/  addi    $13, $13, -0x0002
/*0x040017D4*/  nop :: .org .-4 :: .word 0xC9B52802
/*0x040017D8*/  addi    $13, $13, -0x0002
/*0x040017DC*/  nop :: .org .-4 :: .word 0xC9B42802
/*0x040017E0*/  addi    $13, $13, -0x0002
/*0x040017E4*/  nop :: .org .-4 :: .word 0xC9B32802
/*0x040017E8*/  addi    $13, $13, -0x0002
/*0x040017EC*/  nop :: .org .-4 :: .word 0xC9B22802
/*0x040017F0*/  addi    $13, $13, -0x0002
/*0x040017F4*/  nop :: .org .-4 :: .word 0xC9B12802
/*0x040017F8*/  nop :: .org .-4 :: .word 0xCABE1800
/*0x040017FC*/  nop :: .org .-4 :: .word 0xCABE1C01
.L04001800:
/*0x04001800*/  nop :: .org .-4 :: .word 0x4BDCCC07
/*0x04001804*/  addi    $21, $21, 0x0010
/*0x04001808*/  nop :: .org .-4 :: .word 0x4BFCC40F
/*0x0400180C*/  addi    $19, $19, -0x0010
/*0x04001810*/  nop :: .org .-4 :: .word 0x4B1EBC0F
/*0x04001814*/  nop :: .org .-4 :: .word 0x4B3EB40F
/*0x04001818*/  nop :: .org .-4 :: .word 0x4B5EAC0F
/*0x0400181C*/  nop :: .org .-4 :: .word 0x4B7EA40F
/*0x04001820*/  nop :: .org .-4 :: .word 0x4B9E9F0F
/*0x04001824*/  nop :: .org .-4 :: .word 0x4BBE940F
/*0x04001828*/  nop :: .org .-4 :: .word 0x4BDE8C0F
/*0x0400182C*/  nop :: .org .-4 :: .word 0x4BBFF40F
/*0x04001830*/  nop :: .org .-4 :: .word 0xCABE1800
/*0x04001834*/  nop :: .org .-4 :: .word 0x4B3C7E9D
/*0x04001838*/  nop :: .org .-4 :: .word 0xCABE1C01
/*0x0400183C*/  nop :: .org .-4 :: .word 0x4B1C7F1D
/*0x04001840*/  nop :: .org .-4 :: .word 0x4B0ED406
/*0x04001844*/  nop :: .org .-4 :: .word 0x4B0EE70F
/*0x04001848*/  nop :: .org .-4 :: .word 0xEA9C1800
/*0x0400184C*/  nop :: .org .-4 :: .word 0xEA9C1C01
/*0x04001850*/  bgtz    $19, .L04001800
/*0x04001854*/  addi    $20, $20, 0x0010
/*0x04001858*/  addi    $1, $20, -0x0008
/*0x0400185C*/  addi    $2, $18, 0x0000
/*0x04001860*/  jal     _040011B0
/*0x04001864*/  addi    $3, $0, 0x0007
.L04001868:
/*0x04001868*/  mfc0    $5, SP_DMA_BUSY
/*0x0400186C*/  bnez    $5, .L04001868
/*0x04001870*/  nop
.L04001874:
/*0x04001874*/  j       _04001118
/*0x04001878*/  mtc0    $0, SP_SEMAPHORE
/*0x0400187C*/  lh      $8, 0x0000($24)
/*0x04001880*/  lh      $19, 0x0002($24)
/*0x04001884*/  lh      $18, 0x0004($24)
/*0x04001888*/  lui     $4, 0x00FFFFFF >> 16
/*0x0400188C*/  ori     $4, $4, 0x00FFFFFF & 0xFFFF
/*0x04001890*/  and     $2, $25, $4
/*0x04001894*/  srl     $5, $25, 24
/*0x04001898*/  sll     $5, $5, 2
/*0x0400189C*/  lw      $6, 0x0320($5)
/*0x040018A0*/  add     $2, $2, $6
/*0x040018A4*/  addi    $1, $23, 0x0000
/*0x040018A8*/  sw      $2, 0x0040($23)
/*0x040018AC*/  addi    $3, $0, 0x001F
/*0x040018B0*/  srl     $7, $26, 16
/*0x040018B4*/  andi    $10, $7, 0x0001
/*0x040018B8*/  bgtz    $10, .L040018DC
/*0x040018BC*/  nop
/*0x040018C0*/  jal     _04001184
/*0x040018C4*/  nop
.L040018C8:
/*0x040018C8*/  mfc0    $1, SP_DMA_BUSY
/*0x040018CC*/  bnez    $1, .L040018C8
/*0x040018D0*/  nop
/*0x040018D4*/  j       _040018E8
/*0x040018D8*/  mtc0    $0, SP_SEMAPHORE
.L040018DC:
/*0x040018DC*/  sh      $0, 0x0008($23)
/*0x040018E0*/  nop :: .org .-4 :: .word 0x4A10842C
/*0x040018E4*/  nop :: .org .-4 :: .word 0xEAF01800

/* 0x040018E8 */
_040018E8:
/*0x040018E8*/  andi    $10, $7, 0x0002
/*0x040018EC*/  beqz    $10, .L04001908
/*0x040018F0*/  nop
/*0x040018F4*/  lh      $11, 0x000A($23)
/*0x040018F8*/  nop :: .org .-4 :: .word 0xCAE32001
/*0x040018FC*/  nop :: .org .-4 :: .word 0xE903187E
/*0x04001900*/  nop :: .org .-4 :: .word 0xE9031C7F
/*0x04001904*/  sub     $8, $8, $11
.L04001908:
/*0x04001908*/  addi    $8, $8, -0x0008
/*0x0400190C*/  nop :: .org .-4 :: .word 0xCAF70F04
/*0x04001910*/  nop :: .org .-4 :: .word 0xCAF01800
/*0x04001914*/  nop :: .org .-4 :: .word 0xE9101800
/*0x04001918*/  nop :: .org .-4 :: .word 0x48889200
/*0x0400191C*/  addi    $10, $0, 0x00C0
/*0x04001920*/  nop :: .org .-4 :: .word 0x488A9300
/*0x04001924*/  nop :: .org .-4 :: .word 0x489A9400
/*0x04001928*/  addi    $10, $0, 0x0040
/*0x0400192C*/  nop :: .org .-4 :: .word 0x488A9500
/*0x04001930*/  addi    $9, $0, 0x0040
/*0x04001934*/  nop :: .org .-4 :: .word 0xC93F2001
/*0x04001938*/  nop :: .org .-4 :: .word 0xC9392000
/*0x0400193C*/  nop :: .org .-4 :: .word 0x4A1FCE51
/*0x04001940*/  nop :: .org .-4 :: .word 0xC93E2002
/*0x04001944*/  nop :: .org .-4 :: .word 0xC93D2003
/*0x04001948*/  nop :: .org .-4 :: .word 0xC93C2004
/*0x0400194C*/  nop :: .org .-4 :: .word 0xC93B2005
/*0x04001950*/  nop :: .org .-4 :: .word 0xC93A2006
/*0x04001954*/  nop :: .org .-4 :: .word 0x4A1FCE51
/*0x04001958*/  nop :: .org .-4 :: .word 0xC9382007
/*0x0400195C*/  addi    $21, $23, 0x0020
/*0x04001960*/  addi    $20, $23, 0x0030
/*0x04001964*/  nop :: .org .-4 :: .word 0x4A16B5AC
/*0x04001968*/  nop :: .org .-4 :: .word 0x4BF7FDC5
/*0x0400196C*/  nop :: .org .-4 :: .word 0x4B92CD8D
/*0x04001970*/  nop :: .org .-4 :: .word 0x4B1EFDCE
/*0x04001974*/  nop :: .org .-4 :: .word 0x4B52FD46
/*0x04001978*/  nop :: .org .-4 :: .word 0x4B5EB54E
/*0x0400197C*/  nop :: .org .-4 :: .word 0x4BB2BC44
/*0x04001980*/  nop :: .org .-4 :: .word 0x4B9E8C46
/*0x04001984*/  nop :: .org .-4 :: .word 0x4B72FC4E
/*0x04001988*/  nop :: .org .-4 :: .word 0xC9392000
/*0x0400198C*/  nop :: .org .-4 :: .word 0xEAB52000
/*0x04001990*/  nop :: .org .-4 :: .word 0xEA912000
/*0x04001994*/  nop :: .org .-4 :: .word 0xEAF70B84
/*0x04001998*/  lh      $17, 0x0000($21)
/*0x0400199C*/  lh      $9, 0x0000($20)
/*0x040019A0*/  lh      $13, 0x0008($21)
/*0x040019A4*/  lh      $5, 0x0008($20)
/*0x040019A8*/  lh      $16, 0x0002($21)
/*0x040019AC*/  lh      $8, 0x0002($20)
/*0x040019B0*/  lh      $12, 0x000A($21)
/*0x040019B4*/  lh      $4, 0x000A($20)
/*0x040019B8*/  lh      $15, 0x0004($21)
/*0x040019BC*/  lh      $7, 0x0004($20)
/*0x040019C0*/  lh      $11, 0x000C($21)
/*0x040019C4*/  lh      $3, 0x000C($20)
/*0x040019C8*/  lh      $14, 0x0006($21)
/*0x040019CC*/  lh      $6, 0x0006($20)
/*0x040019D0*/  lh      $10, 0x000E($21)
/*0x040019D4*/  lh      $2, 0x000E($20)

/* 0x040019D8 */
_040019D8:
/*0x040019D8*/  nop :: .org .-4 :: .word 0xCA301800
/*0x040019DC*/  nop :: .org .-4 :: .word 0x4BF7FDC5
/*0x040019E0*/  nop :: .org .-4 :: .word 0xC92F1800
/*0x040019E4*/  nop :: .org .-4 :: .word 0x4BF6FDCF
/*0x040019E8*/  nop :: .org .-4 :: .word 0xC9B01C00
/*0x040019EC*/  nop :: .org .-4 :: .word 0x4B92CD8D
/*0x040019F0*/  nop :: .org .-4 :: .word 0xC8AF1C00
/*0x040019F4*/  nop :: .org .-4 :: .word 0x4B1EFDCE
/*0x040019F8*/  nop :: .org .-4 :: .word 0xCA0E1800
/*0x040019FC*/  nop :: .org .-4 :: .word 0x4B52FD46
/*0x04001A00*/  nop :: .org .-4 :: .word 0xC90D1800
/*0x04001A04*/  nop :: .org .-4 :: .word 0x4B5EB54E
/*0x04001A08*/  nop :: .org .-4 :: .word 0xC98E1C00
/*0x04001A0C*/  nop :: .org .-4 :: .word 0x4BB2BC44
/*0x04001A10*/  nop :: .org .-4 :: .word 0xC88D1C00
/*0x04001A14*/  nop :: .org .-4 :: .word 0xC9EC1800
/*0x04001A18*/  nop :: .org .-4 :: .word 0xC8EB1800
/*0x04001A1C*/  nop :: .org .-4 :: .word 0xC96C1C00
/*0x04001A20*/  nop :: .org .-4 :: .word 0x4B9E8C46
/*0x04001A24*/  nop :: .org .-4 :: .word 0xC86B1C00
/*0x04001A28*/  nop :: .org .-4 :: .word 0xC9CA1800
/*0x04001A2C*/  nop :: .org .-4 :: .word 0xC8C91800
/*0x04001A30*/  nop :: .org .-4 :: .word 0x4B72FC4E
/*0x04001A34*/  nop :: .org .-4 :: .word 0xC94A1C00
/*0x04001A38*/  nop :: .org .-4 :: .word 0x4A0F8200
/*0x04001A3C*/  nop :: .org .-4 :: .word 0xC8491C00
/*0x04001A40*/  nop :: .org .-4 :: .word 0x4A0D71C0
/*0x04001A44*/  nop :: .org .-4 :: .word 0xEAB52000
/*0x04001A48*/  nop :: .org .-4 :: .word 0x4A0B6180
/*0x04001A4C*/  nop :: .org .-4 :: .word 0xEA912000
/*0x04001A50*/  lh      $17, 0x0000($21)
/*0x04001A54*/  nop :: .org .-4 :: .word 0x4A095140
/*0x04001A58*/  lh      $9, 0x0000($20)
/*0x04001A5C*/  nop :: .org .-4 :: .word 0x4A684210
/*0x04001A60*/  lh      $13, 0x0008($21)
/*0x04001A64*/  nop :: .org .-4 :: .word 0x4A6739D0
/*0x04001A68*/  lh      $5, 0x0008($20)
/*0x04001A6C*/  nop :: .org .-4 :: .word 0x4A663190
/*0x04001A70*/  lh      $16, 0x0002($21)
/*0x04001A74*/  nop :: .org .-4 :: .word 0x4A652950
/*0x04001A78*/  lh      $8, 0x0002($20)
/*0x04001A7C*/  nop :: .org .-4 :: .word 0x4AC84210
/*0x04001A80*/  lh      $12, 0x000A($21)
/*0x04001A84*/  nop :: .org .-4 :: .word 0x4AC739D0
/*0x04001A88*/  lh      $4, 0x000A($20)
/*0x04001A8C*/  nop :: .org .-4 :: .word 0x4AC63190
/*0x04001A90*/  lh      $15, 0x0004($21)
/*0x04001A94*/  nop :: .org .-4 :: .word 0x4AC52950
/*0x04001A98*/  lh      $7, 0x0004($20)
/*0x04001A9C*/  nop :: .org .-4 :: .word 0x4A88E906
/*0x04001AA0*/  lh      $11, 0x000C($21)
/*0x04001AA4*/  nop :: .org .-4 :: .word 0x4A87E10E
/*0x04001AA8*/  lh      $3, 0x000C($20)
/*0x04001AAC*/  nop :: .org .-4 :: .word 0x4A86D90E
/*0x04001AB0*/  lh      $14, 0x0006($21)
/*0x04001AB4*/  nop :: .org .-4 :: .word 0x4A85D10E
/*0x04001AB8*/  lh      $6, 0x0006($20)
/*0x04001ABC*/  lh      $10, 0x000E($21)
/*0x04001AC0*/  addi    $18, $18, -0x0010
/*0x04001AC4*/  nop :: .org .-4 :: .word 0xEA642000
/*0x04001AC8*/  blez    $18, .L04001AD8
/*0x04001ACC*/  lh      $2, 0x000E($20)
/*0x04001AD0*/  j       _040019D8
/*0x04001AD4*/  addi    $19, $19, 0x0010
.L04001AD8:
/*0x04001AD8*/  nop :: .org .-4 :: .word 0xEAF70804
/*0x04001ADC*/  nop :: .org .-4 :: .word 0xCA301800
/*0x04001AE0*/  nop :: .org .-4 :: .word 0xEAF01800
/*0x04001AE4*/  lh      $6, 0x0000($24)
/*0x04001AE8*/  addi    $17, $17, 0x0008
/*0x04001AEC*/  sub     $5, $17, $6
/*0x04001AF0*/  andi    $4, $5, 0x000F
/*0x04001AF4*/  sub     $17, $17, $4
/*0x04001AF8*/  beqz    $4, .L04001B04
/*0x04001AFC*/  addi    $7, $0, 0x0010
/*0x04001B00*/  sub     $4, $7, $4
.L04001B04:
/*0x04001B04*/  sh      $4, 0x000A($23)
/*0x04001B08*/  nop :: .org .-4 :: .word 0xCA231800
/*0x04001B0C*/  nop :: .org .-4 :: .word 0xCA231C01
/*0x04001B10*/  nop :: .org .-4 :: .word 0xEAE32001
/*0x04001B14*/  lw      $2, 0x0040($23)
/*0x04001B18*/  addi    $1, $23, 0x0000
/*0x04001B1C*/  jal     _040011B0
/*0x04001B20*/  addi    $3, $0, 0x001F
.L04001B24:
/*0x04001B24*/  mfc0    $5, SP_DMA_BUSY
/*0x04001B28*/  bnez    $5, .L04001B24
/*0x04001B2C*/  nop
/*0x04001B30*/  j       _04001118
/*0x04001B34*/  mtc0    $0, SP_SEMAPHORE
/*0x04001B38*/  lui     $4, 0x00FFFFFF >> 16
/*0x04001B3C*/  ori     $4, $4, 0x00FFFFFF & 0xFFFF
/*0x04001B40*/  and     $2, $25, $4
/*0x04001B44*/  srl     $5, $25, 24
/*0x04001B48*/  sll     $5, $5, 2
/*0x04001B4C*/  lw      $6, 0x0320($5)
/*0x04001B50*/  add     $2, $2, $6
/*0x04001B54*/  addi    $1, $23, 0x0000
/*0x04001B58*/  addi    $3, $0, 0x004F
/*0x04001B5C*/  nop :: .org .-4 :: .word 0x4A00002C
/*0x04001B60*/  addi    $11, $0, 0x0040
/*0x04001B64*/  nop :: .org .-4 :: .word 0xC97F2001
/*0x04001B68*/  nop :: .org .-4 :: .word 0xC80A2000
/*0x04001B6C*/  srl     $12, $26, 16
/*0x04001B70*/  andi    $10, $12, 0x0001
/*0x04001B74*/  beqz    $10, .L04001B84
/*0x04001B78*/  nop :: .org .-4 :: .word 0xCB182001
/*0x04001B7C*/  j       _04001BB0
/*0x04001B80*/  nop
.L04001B84:
/*0x04001B84*/  jal     _04001184
/*0x04001B88*/  nop
.L04001B8C:
/*0x04001B8C*/  mfc0    $5, SP_DMA_BUSY
/*0x04001B90*/  bnez    $5, .L04001B8C
/*0x04001B94*/  nop
/*0x04001B98*/  mtc0    $0, SP_SEMAPHORE
/*0x04001B9C*/  nop :: .org .-4 :: .word 0xCAF42000
/*0x04001BA0*/  nop :: .org .-4 :: .word 0xCAF52001
/*0x04001BA4*/  nop :: .org .-4 :: .word 0xCAF22002
/*0x04001BA8*/  nop :: .org .-4 :: .word 0xCAF32003
/*0x04001BAC*/  nop :: .org .-4 :: .word 0xCAF82004

/* 0x04001BB0 */
_04001BB0:
/*0x04001BB0*/  lh      $13, 0x0000($24)
/*0x04001BB4*/  lh      $19, 0x0002($24)
/*0x04001BB8*/  lh      $18, 0x000A($24)
/*0x04001BBC*/  lh      $17, 0x000C($24)
/*0x04001BC0*/  lh      $16, 0x000E($24)
/*0x04001BC4*/  lh      $14, 0x0004($24)
/*0x04001BC8*/  addi    $15, $0, 0x0010
/*0x04001BCC*/  nop :: .org .-4 :: .word 0x4815C100
/*0x04001BD0*/  nop :: .org .-4 :: .word 0x4814C400
/*0x04001BD4*/  andi    $9, $12, 0x0008
/*0x04001BD8*/  bgtz    $9, .L04001BEC
/*0x04001BDC*/  nop
/*0x04001BE0*/  addi    $17, $23, 0x0050
/*0x04001BE4*/  add     $16, $0, $17
/*0x04001BE8*/  addi    $15, $0, 0x0000
.L04001BEC:
/*0x04001BEC*/  beqz    $10, .L04001CF0
/*0x04001BF0*/  nop :: .org .-4 :: .word 0xC97E2007
/*0x04001BF4*/  nop :: .org .-4 :: .word 0xC9B12000
/*0x04001BF8*/  nop :: .org .-4 :: .word 0xCA7D2000
/*0x04001BFC*/  nop :: .org .-4 :: .word 0xCA3B2000
/*0x04001C00*/  nop :: .org .-4 :: .word 0x4A15AD6C
/*0x04001C04*/  nop :: .org .-4 :: .word 0xCB140F03
/*0x04001C08*/  nop :: .org .-4 :: .word 0x4B58A5C5
/*0x04001C0C*/  nop :: .org .-4 :: .word 0x4B38A58F
/*0x04001C10*/  nop :: .org .-4 :: .word 0x4B00FDCE
/*0x04001C14*/  nop :: .org .-4 :: .word 0x4A15BDD5
/*0x04001C18*/  nop :: .org .-4 :: .word 0x4A14B591
/*0x04001C1C*/  nop :: .org .-4 :: .word 0x4BF7F5C4
/*0x04001C20*/  nop :: .org .-4 :: .word 0x4BF6F5CE
/*0x04001C24*/  nop :: .org .-4 :: .word 0x4B00FD8D
/*0x04001C28*/  nop :: .org .-4 :: .word 0x4BF5FD4D
/*0x04001C2C*/  nop :: .org .-4 :: .word 0x4BF4FD0F
/*0x04001C30*/  bgtz    $21, .L04001C44
/*0x04001C34*/  nop :: .org .-4 :: .word 0x4B00FD4E
/*0x04001C38*/  nop :: .org .-4 :: .word 0x4B18A523
/*0x04001C3C*/  j       _04001C48
/*0x04001C40*/  nop
.L04001C44:
/*0x04001C44*/  nop :: .org .-4 :: .word 0x4B18A524

/* 0x04001C48 */
_04001C48:
/*0x04001C48*/  nop :: .org .-4 :: .word 0x4BD8A400
/*0x04001C4C*/  nop :: .org .-4 :: .word 0x4BF8A3C0
/*0x04001C50*/  nop :: .org .-4 :: .word 0x4BCAEF40
/*0x04001C54*/  nop :: .org .-4 :: .word 0x4A108F48
/*0x04001C58*/  nop :: .org .-4 :: .word 0x4BCADEC0
/*0x04001C5C*/  nop :: .org .-4 :: .word 0x4A0F8EC8
/*0x04001C60*/  nop :: .org .-4 :: .word 0xEA7D2000
/*0x04001C64*/  nop :: .org .-4 :: .word 0xEA3B2000
/*0x04001C68*/  nop :: .org .-4 :: .word 0xCA5C2000
/*0x04001C6C*/  nop :: .org .-4 :: .word 0xCA1A2000
/*0x04001C70*/  nop :: .org .-4 :: .word 0x4A139CEC
/*0x04001C74*/  nop :: .org .-4 :: .word 0xCB120F04
/*0x04001C78*/  nop :: .org .-4 :: .word 0x4BB895C5
/*0x04001C7C*/  nop :: .org .-4 :: .word 0x4B98958F
/*0x04001C80*/  nop :: .org .-4 :: .word 0x4B00FDCE
/*0x04001C84*/  nop :: .org .-4 :: .word 0x4A13BDD5
/*0x04001C88*/  nop :: .org .-4 :: .word 0x4A12B591
/*0x04001C8C*/  nop :: .org .-4 :: .word 0x4BF7F5C4
/*0x04001C90*/  nop :: .org .-4 :: .word 0x4BF6F5CE
/*0x04001C94*/  nop :: .org .-4 :: .word 0x4B00FD8D
/*0x04001C98*/  nop :: .org .-4 :: .word 0x4BF3FCCD
/*0x04001C9C*/  nop :: .org .-4 :: .word 0x4BF2FC8F
/*0x04001CA0*/  bgtz    $20, .L04001CB4
/*0x04001CA4*/  nop :: .org .-4 :: .word 0x4B00FCCE
/*0x04001CA8*/  nop :: .org .-4 :: .word 0x4B7894A3
/*0x04001CAC*/  j       _04001CB8
/*0x04001CB0*/  nop
.L04001CB4:
/*0x04001CB4*/  nop :: .org .-4 :: .word 0x4B7894A4

/* 0x04001CB8 */
_04001CB8:
/*0x04001CB8*/  nop :: .org .-4 :: .word 0x4BD89400
/*0x04001CBC*/  nop :: .org .-4 :: .word 0x4BF893C0
/*0x04001CC0*/  nop :: .org .-4 :: .word 0x4BCAE700
/*0x04001CC4*/  nop :: .org .-4 :: .word 0x4A108F08
/*0x04001CC8*/  nop :: .org .-4 :: .word 0x4BCAD680
/*0x04001CCC*/  nop :: .org .-4 :: .word 0x4A0F8E88
/*0x04001CD0*/  nop :: .org .-4 :: .word 0xEA5C2000
/*0x04001CD4*/  nop :: .org .-4 :: .word 0xEA1A2000
/*0x04001CD8*/  addi    $14, $14, -0x0010
/*0x04001CDC*/  addi    $13, $13, 0x0010
/*0x04001CE0*/  addi    $19, $19, 0x0010
/*0x04001CE4*/  addi    $18, $18, 0x0010
/*0x04001CE8*/  add     $17, $17, $15
/*0x04001CEC*/  add     $16, $16, $15
.L04001CF0:
/*0x04001CF0*/  nop :: .org .-4 :: .word 0x4B58ADC4
/*0x04001CF4*/  nop :: .org .-4 :: .word 0x4B58A5CD
/*0x04001CF8*/  nop :: .org .-4 :: .word 0x4B38ADCE
/*0x04001CFC*/  nop :: .org .-4 :: .word 0x4B38A50F
/*0x04001D00*/  nop :: .org .-4 :: .word 0x4B00FD4E

/* 0x04001D04 */
_04001D04:
/*0x04001D04*/  bgtz    $21, .L04001D30
/*0x04001D08*/  nop :: .org .-4 :: .word 0xC9B12000
/*0x04001D0C*/  nop :: .org .-4 :: .word 0x4B18A523
/*0x04001D10*/  nop :: .org .-4 :: .word 0x4BB89DC4
/*0x04001D14*/  nop :: .org .-4 :: .word 0x4BB895CD
/*0x04001D18*/  nop :: .org .-4 :: .word 0x4B989DCE
/*0x04001D1C*/  nop :: .org .-4 :: .word 0xCA7D2000
/*0x04001D20*/  nop :: .org .-4 :: .word 0x4B98948F
/*0x04001D24*/  nop :: .org .-4 :: .word 0xCA3B2000
/*0x04001D28*/  j       _04001D50
/*0x04001D2C*/  nop :: .org .-4 :: .word 0x4B00FCCE
.L04001D30:
/*0x04001D30*/  nop :: .org .-4 :: .word 0x4B18A524
/*0x04001D34*/  nop :: .org .-4 :: .word 0x4BB89DC4
/*0x04001D38*/  nop :: .org .-4 :: .word 0x4BB895CD
/*0x04001D3C*/  nop :: .org .-4 :: .word 0x4B989DCE
/*0x04001D40*/  nop :: .org .-4 :: .word 0xCA7D2000
/*0x04001D44*/  nop :: .org .-4 :: .word 0x4B98948F
/*0x04001D48*/  nop :: .org .-4 :: .word 0xCA3B2000
/*0x04001D4C*/  nop :: .org .-4 :: .word 0x4B00FCCE

/* 0x04001D50 */
_04001D50:
/*0x04001D50*/  nop :: .org .-4 :: .word 0x4BD8A400
/*0x04001D54*/  nop :: .org .-4 :: .word 0xEAF42000
/*0x04001D58*/  nop :: .org .-4 :: .word 0x4BF8A3C0
/*0x04001D5C*/  nop :: .org .-4 :: .word 0xEAF52001
/*0x04001D60*/  nop :: .org .-4 :: .word 0x4BCAEF40
/*0x04001D64*/  nop :: .org .-4 :: .word 0x4A108F48
/*0x04001D68*/  nop :: .org .-4 :: .word 0xCA5C2000
/*0x04001D6C*/  nop :: .org .-4 :: .word 0x4BCADEC0
/*0x04001D70*/  nop :: .org .-4 :: .word 0xCA1A2000
/*0x04001D74*/  nop :: .org .-4 :: .word 0x4A0F8EC8
/*0x04001D78*/  bgtz    $20, .L04001DA0
/*0x04001D7C*/  nop :: .org .-4 :: .word 0xEA7D2000
/*0x04001D80*/  nop :: .org .-4 :: .word 0x4B7894A3
/*0x04001D84*/  nop :: .org .-4 :: .word 0x4B58ADC4
/*0x04001D88*/  nop :: .org .-4 :: .word 0xEA3B2000
/*0x04001D8C*/  nop :: .org .-4 :: .word 0x4B58A5CD
/*0x04001D90*/  nop :: .org .-4 :: .word 0x4B38ADCE
/*0x04001D94*/  nop :: .org .-4 :: .word 0x4B38A50F
/*0x04001D98*/  j       _04001DBC
/*0x04001D9C*/  nop :: .org .-4 :: .word 0x4B00FD4E
.L04001DA0:
/*0x04001DA0*/  nop :: .org .-4 :: .word 0x4B7894A4
/*0x04001DA4*/  nop :: .org .-4 :: .word 0x4B58ADC4
/*0x04001DA8*/  nop :: .org .-4 :: .word 0xEA3B2000
/*0x04001DAC*/  nop :: .org .-4 :: .word 0x4B58A5CD
/*0x04001DB0*/  nop :: .org .-4 :: .word 0x4B38ADCE
/*0x04001DB4*/  nop :: .org .-4 :: .word 0x4B38A50F
/*0x04001DB8*/  nop :: .org .-4 :: .word 0x4B00FD4E

/* 0x04001DBC */
_04001DBC:
/*0x04001DBC*/  nop :: .org .-4 :: .word 0x4BD89400
/*0x04001DC0*/  addi    $14, $14, -0x0010
/*0x04001DC4*/  nop :: .org .-4 :: .word 0x4BF893C0
/*0x04001DC8*/  addi    $19, $19, 0x0010
/*0x04001DCC*/  nop :: .org .-4 :: .word 0x4BCAE700
/*0x04001DD0*/  add     $17, $17, $15
/*0x04001DD4*/  nop :: .org .-4 :: .word 0x4A108F08
/*0x04001DD8*/  addi    $13, $13, 0x0010
/*0x04001DDC*/  nop :: .org .-4 :: .word 0x4BCAD680
/*0x04001DE0*/  nop :: .org .-4 :: .word 0x4A0F8E88
/*0x04001DE4*/  nop :: .org .-4 :: .word 0xEA5C2000
/*0x04001DE8*/  addi    $18, $18, 0x0010
/*0x04001DEC*/  blez    $14, .L04001DFC
/*0x04001DF0*/  nop :: .org .-4 :: .word 0xEA1A2000
/*0x04001DF4*/  j       _04001D04
/*0x04001DF8*/  add     $16, $16, $15
.L04001DFC:
/*0x04001DFC*/  nop :: .org .-4 :: .word 0xEAF22002
/*0x04001E00*/  nop :: .org .-4 :: .word 0xEAF32003
/*0x04001E04*/  nop :: .org .-4 :: .word 0xEAF82004
/*0x04001E08*/  jal     _040011B0
/*0x04001E0C*/  addi    $3, $0, 0x004F
.L04001E10:
/*0x04001E10*/  mfc0    $5, SP_DMA_BUSY
/*0x04001E14*/  bnez    $5, .L04001E10
/*0x04001E18*/  nop
/*0x04001E1C*/  j       _04001118
/*0x04001E20*/  mtc0    $0, SP_SEMAPHORE
/*0x04001E24*/  nop :: .org .-4 :: .word 0xC81F2000
/*0x04001E28*/  lhu     $18, 0x0004($24)
/*0x04001E2C*/  beqz    $18, .L04001E94
/*0x04001E30*/  nop
/*0x04001E34*/  andi    $19, $25, 0xFFFF
/*0x04001E38*/  addi    $19, $19, 0x05C0
/*0x04001E3C*/  srl     $20, $25, 16
/*0x04001E40*/  addi    $20, $20, 0x05C0
/*0x04001E44*/  andi    $17, $26, 0xFFFF
/*0x04001E48*/  nop :: .org .-4 :: .word 0x4891F000
/*0x04001E4C*/  nop :: .org .-4 :: .word 0xCA7B2000
/*0x04001E50*/  nop :: .org .-4 :: .word 0xCA9D2000
/*0x04001E54*/  nop :: .org .-4 :: .word 0xCA7A2001
/*0x04001E58*/  nop :: .org .-4 :: .word 0xCA9C2001
.L04001E5C:
/*0x04001E5C*/  nop :: .org .-4 :: .word 0x4BDFDEC0
/*0x04001E60*/  addi    $18, $18, -0x0020
/*0x04001E64*/  nop :: .org .-4 :: .word 0x4B1EEEC8
/*0x04001E68*/  addi    $20, $20, 0x0020
/*0x04001E6C*/  nop :: .org .-4 :: .word 0xEA7B2000
/*0x04001E70*/  nop :: .org .-4 :: .word 0x4BDFD680
/*0x04001E74*/  nop :: .org .-4 :: .word 0xCA9D2000
/*0x04001E78*/  nop :: .org .-4 :: .word 0x4B1EE688
/*0x04001E7C*/  nop :: .org .-4 :: .word 0xCA9C2001
/*0x04001E80*/  nop :: .org .-4 :: .word 0xEA7A2001
/*0x04001E84*/  addi    $19, $19, 0x0020
/*0x04001E88*/  nop :: .org .-4 :: .word 0xCA7B2000
/*0x04001E8C*/  bgtz    $18, .L04001E5C
/*0x04001E90*/  nop :: .org .-4 :: .word 0xCA7A2001
.L04001E94:
/*0x04001E94*/  j       _04001118
/*0x04001E98*/  nop
/*0x04001E9C*/  nop

.close

.create "build/PR/aspMain.data.bin", 0

    .dw 0x00000001, 0x0002FFFF, 0x00200800, 0x7FFF4000
    .dw 0x11181470, 0x11DC1B38, 0x1214187C, 0x125412D0
    .dw 0x12EC1328, 0x140C1294, 0x1E24138C, 0x170C144C
    .dw 0xF0000F00, 0x00F0000F, 0x00010010, 0x01001000
    .dw 0x00020004, 0x00060008, 0x000A000C, 0x000E0010
    .dw 0x00010001, 0x00010001, 0x00010001, 0x00010001
    .dw 0x00000001, 0x00020004, 0x00080010, 0x01000200
    .dw 0x00010000, 0x00000000, 0x00010000, 0x00000000
    .dw 0x00000001, 0x00000000, 0x00000001, 0x00000000
    .dw 0x00000000, 0x00010000, 0x00000000, 0x00010000
    .dw 0x00000000, 0x00000001, 0x00000000, 0x00000001
    .dw 0x20004000, 0x60008000, 0xA000C000, 0xE000FFFF
    .dw 0x0C3966AD, 0x0D46FFDF, 0x0B396696, 0x0E5FFFD8
    .dw 0x0A446669, 0x0F83FFD0, 0x095A6626, 0x10B4FFC8
    .dw 0x087D65CD, 0x11F0FFBF, 0x07AB655E, 0x1338FFB6
    .dw 0x06E464D9, 0x148CFFAC, 0x0628643F, 0x15EBFFA1
    .dw 0x0577638F, 0x1756FF96, 0x04D162CB, 0x18CBFF8A
    .dw 0x043561F3, 0x1A4CFF7E, 0x03A46106, 0x1BD7FF71
    .dw 0x031C6007, 0x1D6CFF64, 0x029F5EF5, 0x1F0BFF56
    .dw 0x022A5DD0, 0x20B3FF48, 0x01BE5C9A, 0x2264FF3A
    .dw 0x015B5B53, 0x241EFF2C, 0x010159FC, 0x25E0FF1E
    .dw 0x00AE5896, 0x27A9FF10, 0x00635720, 0x297AFF02
    .dw 0x001F559D, 0x2B50FEF4, 0xFFE2540D, 0x2D2CFEE8
    .dw 0xFFAC5270, 0x2F0DFEDB, 0xFF7C50C7, 0x30F3FED0
    .dw 0xFF534F14, 0x32DCFEC6, 0xFF2E4D57, 0x34C8FEBD
    .dw 0xFF0F4B91, 0x36B6FEB6, 0xFEF549C2, 0x38A5FEB0
    .dw 0xFEDF47ED, 0x3A95FEAC, 0xFECE4611, 0x3C85FEAB
    .dw 0xFEC04430, 0x3E74FEAC, 0xFEB6424A, 0x4060FEAF
    .dw 0xFEAF4060, 0x424AFEB6, 0xFEAC3E74, 0x4430FEC0
    .dw 0xFEAB3C85, 0x4611FECE, 0xFEAC3A95, 0x47EDFEDF
    .dw 0xFEB038A5, 0x49C2FEF5, 0xFEB636B6, 0x4B91FF0F
    .dw 0xFEBD34C8, 0x4D57FF2E, 0xFEC632DC, 0x4F14FF53
    .dw 0xFED030F3, 0x50C7FF7C, 0xFEDB2F0D, 0x5270FFAC
    .dw 0xFEE82D2C, 0x540DFFE2, 0xFEF42B50, 0x559D001F
    .dw 0xFF02297A, 0x57200063, 0xFF1027A9, 0x589600AE
    .dw 0xFF1E25E0, 0x59FC0101, 0xFF2C241E, 0x5B53015B
    .dw 0xFF3A2264, 0x5C9A01BE, 0xFF4820B3, 0x5DD0022A
    .dw 0xFF561F0B, 0x5EF5029F, 0xFF641D6C, 0x6007031C
    .dw 0xFF711BD7, 0x610603A4, 0xFF7E1A4C, 0x61F30435
    .dw 0xFF8A18CB, 0x62CB04D1, 0xFF961756, 0x638F0577
    .dw 0xFFA115EB, 0x643F0628, 0xFFAC148C, 0x64D906E4
    .dw 0xFFB61338, 0x655E07AB, 0xFFBF11F0, 0x65CD087D
    .dw 0xFFC810B4, 0x6626095A, 0xFFD00F83, 0x66690A44
    .dw 0xFFD80E5F, 0x66960B39, 0xFFDF0D46, 0x66AD0C39

.close
