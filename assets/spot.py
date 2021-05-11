import sys
import struct
import png
s = int(sys.argv[1])
with open("spot.bin", "rb") as f:
    data = f.read()
data = [
    [struct.unpack(">B", data[i:i+1])[0] for i in range(i, i+s)]
    for i in range(0, len(data), s)
]
writer = png.Writer(s, s, greyscale=True, alpha=False)
with open("spot.i8.png", "wb") as f:
    writer.write(f, data)
