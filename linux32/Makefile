# Makefile
# Linux 32 bit

LD = ld
AS = nasm
LD_OPT = -m elf_i386
AS_OPT = -f elf

all: main

main: main.o
	$(LD) $(LD_OPT) $^ -o $@
	
main.o: main.asm
	$(AS) $(AS_OPT) $^ -o $@
	
clean:
	rm main main.o