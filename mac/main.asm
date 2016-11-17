; Main game code
; Mac OS X

%include "libs/stdlib.asm"

SECTION .text
global start

start:
	mov rax, msg
	call sprint

	mov rax, name
	mov rbx, 256
	call gets

	mov rax, hi
	call sprint

	mov rax, name
	call sprint

	mov rax, 0
	call exit

SECTION .data
msg: db "What is your name: ",0
hi: db "Hello ",0

SECTION .bss
name: resb 256