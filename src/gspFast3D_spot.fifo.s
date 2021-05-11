.globl gspFast3D_spot_fifoTextStart
gspFast3D_spot_fifoTextStart:
.incbin "build/src/gspFast3D_spot.fifo.text.bin"
.globl gspFast3D_spot_fifoTextEnd
gspFast3D_spot_fifoTextEnd:
.data
.globl gspFast3D_spot_fifoDataStart
gspFast3D_spot_fifoDataStart:
.incbin "build/src/gspFast3D_spot.fifo.data.bin"
.globl gspFast3D_spot_fifoDataEnd
gspFast3D_spot_fifoDataEnd:
