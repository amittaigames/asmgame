# Makefile
# Mac OS X

LD = ld
AS = nasm
LD_OPT =
AS_OPT = -f macho64

all: main

main: main.o
	$(LD) $< -o $@

main.o: main.asm
	$(AS) -f macho64 $< -o $@

clean:
	rm main.o main