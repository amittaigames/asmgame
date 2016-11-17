; Standard library
; Linux 32 bit

;-----------------------------------
;   SYSTEM CALLS
;-----------------------------------

SYS_EXIT: equ           0x0001
SYS_WRITE: equ          0x0004

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
    
;-----------------------------------
;   void sprint(char* str)
;-----------------------------------
sprint:
    push eax                    ; Store registers
    push ebx
    push ecx
    push edx
    
    call strlen                 ; Get string length in EDX
    mov ecx, eax                ; Move string to system call argument
    mov ebx, 1                  ; Standard output
    mov eax, SYS_WRITE          ; System call
    int 0x80
    
    pop edx                     ; Restore registers
    pop ecx
    pop ebx
    pop eax
    
    ret