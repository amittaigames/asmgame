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
    
;-----------------------------------
;   int strlen(char* str)
;-----------------------------------
strlen:
    push ecx                    ; Store registers
    mov ecx, 0                  ; Set counter
    
.charLoop:
    cmp byte [eax], 0           ; Compare against zero
    je .done                    ; End of string
    
    inc ecx                     ; Increment counter
    inc eax                     ; Increment pointer
    jmp .charLoop               ; Start over
    
.done:
    sub eax, ecx                ; Set string pointer back
    mov edx, ecx                ; Set return value
    pop ecx                     ; Restore registers
    ret