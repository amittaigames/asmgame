; Main game code
; Linux 32 bit

%include "libs/stdlib.asm"

SECTION .text
global _start

_start:
    mov eax, msg
    call strlen

    mov eax, edx
    call exit
    
SECTION .data
msg: db "Hello World!",10,0