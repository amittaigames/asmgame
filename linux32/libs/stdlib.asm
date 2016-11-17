; Standard library
; Linux 32 bit

;-----------------------------------
;   SYSTEM CALLS
;-----------------------------------

SYS_EXIT: equ           0x0001

;-----------------------------------
;   void exit(int code)
;-----------------------------------
exit:
    mov ebx, eax                ; Move function arg to system call arg
    mov eax, SYS_EXIT           ; System call
    int 0x80
    ret