; Main game code
; Mac OS X

%include "libs/stdlib.asm"

SECTION .text
global start

start:
	mov rax, msg
	call sprint

	mov rax, 0
	call exit

SECTION .data
msg: db "Hello World!",10,0