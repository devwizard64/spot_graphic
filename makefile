SRC_OBJ := \
	build/src/main.o    \
	build/src/demo.o

OBJ := \
	build/src/header.o  \
	build/src/buffer.o  \
	build/src/main.ld.o \
	build/src/gspFast3D_spot.fifo.o

CC      := mips-linux-gnu-gcc
LD      := mips-linux-gnu-ld
CPP     := mips-linux-gnu-cpp
OBJCOPY := mips-linux-gnu-objcopy
CC      += -march=vr4300 -mfix4300 -mfp32 -mno-abicalls -mno-check-zero-division
CC      += -fno-PIC -ffreestanding -fno-common -fno-zero-initialized-in-bss
CC      += -fno-toplevel-reorder -G 0

FLAG    := -I ultra/include -I include -I .
CC      += $(FLAG) -Wall -Wextra -Wpedantic -O2
CPP     += $(FLAG)

ARMIPS  := $(HOME)/sm64/exe/armips

build/app.z64: build/app.elf | exe/build
	$(OBJCOPY) --pad-to 0x00101000 --gap-fill 0xFF -O binary $< $@
	exe/build/crc $@

build/app.elf: build/make/main.ld $(OBJ)
	$(LD) -Map $(@:.elf=.map) -o $@ -T $<

build/make/%: make/% | build/make
	$(CPP) -MMD -MP -MT $@ -P -o $@ $<

build/src/main.ld.o: $(SRC_OBJ) | ultra/lib
	$(LD) -L ultra/lib -r -o $@ $^ -l ultra_rom

build/%.o: %.c
	$(CC) -MMD -MP -c -o $@ $<

build/%.o: %.S
	$(CC) -MMD -MP -c -o $@ $<

build/%.d: %.c
	$(CC) -MM -MG -MP -MF $@ -MT $(@:.d=.o) $<

build/%.d: %.S
	$(CC) -MM -MG -MP -MF $@ -MT $(@:.d=.o) $<

build/%.o: %.asm
	$(ARMIPS) $<
	$(CC) -c -o $@ $(<:.asm=.s)

build/%.d: %.asm
	touch $@

build/%.h: %.png | exe/build
	exe/build/texture $@ $< $(PALETTE)

build/%.h: %.ply
	exe/gfx $@ $^

dirs = $(foreach d,$(wildcard $1*),$(call dirs,$d/,$2) \
	$(filter $(subst *,%,$2),$d))
obj = $(call dirs,src/,$1) $(call dirs,data/,$1)
BUILD_OBJ := $(call obj,*.c *.S *.asm *.png *.ply)
$(foreach f,$(BUILD_OBJ),$(eval $f: | $(addprefix build/,$(dir $f))))
build/make $(sort $(addprefix build/,$(dir $(BUILD_OBJ)))):
	mkdir -p $@

ultra/lib:
	make -C ultra

exe/build:
	make -C exe

clean:
	rm -rf build

-include build/make/main.d
include $(addsuffix .d,$(basename $(SRC_OBJ)))
-include $(addprefix build/,$(addsuffix .d,$(basename $(call obj,*.ply))))

.PHONY: clean
