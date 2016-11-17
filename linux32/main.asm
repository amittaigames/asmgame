; Main game code
; Linux 32 bit

%include "libs/stdlib.asm"

SECTION .text
global _start

_start:
    mov eax, msg
    call sprint

    mov eax, 0
    call exit
    
SECTION .data
msg: db "Hello World!",10,0