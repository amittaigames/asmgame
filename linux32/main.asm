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
    
    call nameEasterEgg
    cmp edx, 1
    je .nameEgg
    
    mov eax, hi
    call sprint
    
    mov eax, name
    call sprint
    
    mov eax, 0
    call exit
    
.nameEgg:
    mov eax, egg_name_yes
    call sprint
    
    mov eax, 69
    call exit
    
SECTION .data
msg: db "What is your name: ",0
hi: db "Hello ",0

egg_name: db "Bob Saggit",10,0
egg_name_yes: db "DUDE YES",10,0

dbg_err: db "Error!",10,0

SECTION .bss
name: resb 256