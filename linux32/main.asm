; Main game code
; Linux 32 bit

%include "libs/stdlib.asm"

SECTION .text
global _start

_start:
    mov eax, 7
    call exit