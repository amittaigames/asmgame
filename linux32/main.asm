; Main game code
; Linux 32 bit

%include "libs/stdlib.asm"

SECTION .text
global _start

_start:
    mov eax, msg
    call sprint
    
    mov eax, name
    mov ebx, 256
    call gets
    
    mov eax, hi
    call sprint
    
    mov eax, name
    call sprint
    
    mov eax, 0
    call exit
    
SECTION .data
msg: db "What is your name: ",0
hi: db "Hello ",0

SECTION .bss
name: resb 256