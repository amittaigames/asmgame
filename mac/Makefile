# Makefile
# Mac OS X

all: main

main: main.o
	ld $< -o $@

main.o: main.asm
	nasm -f macho64 $< -o $@

clean:
	rm main.o main