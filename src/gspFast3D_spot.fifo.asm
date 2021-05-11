.rsp

.create "build/src/gspFast3D_spot.fifo.text.bin", 0x04001080

.incbin "src/gspFast3D.fifo.text.bin"

.org 0x04001684
andi $12, $3, 0x0100

.org 0x040016B8
sw $15, 0x0012($7)
srl $16, $16, 24
vmudn $v18, $v7, $v17[0]
vmadh $v18, $v6, $v17[0]
j spot_end
vadd $v18, $v18, $v17[1]
wdiv_ext:
vmudm $v16, $v22, $v20[0]
vmadh $v22, $v22, $v19[0]
j wdiv_end
vmadn $v23, $v31, $v31[0]
spot_end:

.org 0x04001CA8
lb $7, 0x0004($29)
bnez $7, wdiv_end
vmudm $v16, $v9, $v6[0h]
vmadh $v9, $v9, $v5[0h]
j wdiv_ext
vmadn $v10, $v31, $v31[0]
wdiv_end:

.close

.create "build/src/gspFast3D_spot.fifo.data.bin", 0

.incbin "src/gspFast3D.fifo.data.bin"

.close
