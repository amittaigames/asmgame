; Main game code
; Linux 32 bit

%include "libs/stdlib.asm"
%include "libs/game.asm"

SECTION .text
global _start

_start:
    mov eax, msg
    call sprint
    
    mov eax, name
    mov ebx, 256
    call gets
    
    ; Set new-line to null
    call strlen
    mov ebx, 0
    mov ecx, edx
    sub ecx, 1
    call setChar
    
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