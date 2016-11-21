; Standard library
; Linux 32 bit

;----------------------------------------------------------------------
;   SYSTEM CALLS
;----------------------------------------------------------------------

SYS_EXIT: equ           0x0001
SYS_READ: equ           0x0003
SYS_WRITE: equ          0x0004

;----------------------------------------------------------------------
;   void exit(int code)
;
;   Exits the program
;----------------------------------------------------------------------
exit:
    mov ebx, eax                ; Move function arg to system call arg
    mov eax, SYS_EXIT           ; System call
    int 0x80
    ret

;----------------------------------------------------------------------
;   int strlen(char* str)
;
;   Returns the length of a string
;----------------------------------------------------------------------
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

;----------------------------------------------------------------------
;   void sprint(char* str)
;
;   Prints a string
;----------------------------------------------------------------------
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

;----------------------------------------------------------------------
;   void sprintNL()
;
;   Prints a new line character
;----------------------------------------------------------------------
sprintNL:
    push eax					; Store registers

    mov eax, 10					; Move new line to EAX
    push eax					; Push it
    mov eax, esp				; Get new line from stack pointer
    call sprint					; Print it
    pop eax						; Pop the new line

    pop eax						; Restore registers
    ret

;----------------------------------------------------------------------
;   void gets(char* dest, int size)
;
;   Gets string from standard input (removes new line)
;----------------------------------------------------------------------
gets:
    push eax                    ; Store registers
    push ebx
    push ecx
    push edx

    mov edx, ebx                ; Set last system call arg to function arg
    mov ecx, eax                ; Set system call string to function arg
    mov ebx, 0                  ; Standard input
    mov eax, SYS_READ           ; System call
    int 0x80
    
    mov eax, ecx                ; Get string back
    mov ebx, 0                  ; Null character
    call strlen                 ; Get string length
    mov ecx, edx                ; Move length to 3rd param
    sub ecx, 1                  ; Subtract to new line
    call setChar                ; Set the new line to null char

    pop edx                     ; Restore registers
    pop ecx
    pop ebx
    pop eax

    ret

;----------------------------------------------------------------------
;   int strEquals(char* a, char* b)
;
;   Compares strings
;----------------------------------------------------------------------
strcmp:
    push eax                    ; Store registers
    push ebx
    push ecx

    call strlen                 ; Get string length for A
    push eax                    ; Store string
    push edx                    ; Store length

    mov eax, ebx                ; Move string B to function arg
    call strlen                 ; Get string length for B

    pop ecx                     ; Get A length
    cmp ecx, edx                ; Compare lengths
    jne .ne2                    ; If not equal, end

    pop eax                     ; Get string back
    mov ecx, 0                  ; Begin counter

.charLoop:
    cmp ecx, edx                ; Compare counter and length
    je .done                    ; If end of string, finish

    mov al, [eax + ecx]         ; Check character from string A
    mov bl, [ebx + ecx]         ; Check character from string B
    cmp al, bl                  ; Check if same
    jne .ne                     ; If different, jump somewhere else

    inc ecx                     ; Increment counter
    jmp .charLoop               ; Start over

.ne2:
    pop eax                     ; Restore push

.ne:
    pop ecx                     ; Restore registers
    pop ebx
    pop eax

    mov edx, 0                  ; Set return value to false
    ret

.done:
    pop ecx                     ; Restore registers
    pop ebx
    pop eax

    mov edx, 1                  ; Set return value to true
    ret


;----------------------------------------------------------------------
;   void setChar(char* a, char c, int index)
;
;   Sets a charater in a string
;----------------------------------------------------------------------
setChar:
    mov [eax + ecx], ebx        ; Set the string pointer offset to char
    ret