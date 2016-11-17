; Main game code
; Mac OS X

%include "libs/stdlib.asm"

SECTION .text
global start

start:
	mov rax, 0
	call exit

SECTION .data
null: db 0x0		; Needed for Mac compilation