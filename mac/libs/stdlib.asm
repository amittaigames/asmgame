; Standard Library
; Mac OS X

;----------------------------------------------------------------------
;	SYSTEM CALLS
;----------------------------------------------------------------------

SYS_EXIT: equ			0x2000001
SYS_READ: equ			0x2000003
SYS_WRITE: equ			0x2000004

;----------------------------------------------------------------------
;	void exit(int code)
;
;	Exit the program
;----------------------------------------------------------------------
exit:
	mov rdi, rax				; Move function arg to syscall arg
	mov rax, SYS_EXIT			; Set system call
	syscall						; Syscall
	ret

;----------------------------------------------------------------------
;	int strlen(char* str)
;
;	Get the length of a string
;----------------------------------------------------------------------
strlen:
	push rcx					; Store register
	mov rcx, 0					; Set counter

.charLoop:
	cmp byte [rax], 0			; Compare string pointer and 0
	je .done					; Finish if end of string

	inc rax						; Increment string pointer
	inc rcx						; Increment counter
	jmp .charLoop				; Start over

.done:
	sub rax, rcx				; Put string pointer to front of the string
	mov rdx, rcx				; Set return value to the counter
	pop rcx						; Restore register
	ret

;----------------------------------------------------------------------
;	void sprint(char* str)
;
;	Print a string
;----------------------------------------------------------------------
sprint:
	push rax					; Store registers
	push rdi
	push rsi
	push rdx

	call strlen					; String already in RAX
								; RDX now contains string length
	mov rsi, rax				; Move string to syscall arg
	mov rdi, 1					; Standard output
	mov rax, SYS_WRITE			; System call
	syscall

	pop rdx						; Restore registers
	pop rsi
	pop rdi
	pop rax

	ret

;----------------------------------------------------------------------
;	void sprintNL()
;
;	Print a new line
;----------------------------------------------------------------------
sprintNL:
	push rax					; Store registers

	mov rax, 10					; Move new line to RAX
	push rax					; Push new line
	mov rax, rsp				; Get new line from stack pointer
	call sprint					; Print it
	pop rax						; Pop the new line

	pop rax						; Restore registers
	ret

;----------------------------------------------------------------------
;	void gets(char* dest, int size)
;
;	Get a string from standard input (removes new line (not yet tho))
;----------------------------------------------------------------------
gets:
	push rax					; Store registers
	push rdi
	push rsi
	push rdx

	mov rdx, rbx				; Store length in syscall arg
	mov rsi, rax				; Store string location in syscall arg
	mov rdi, 0					; Standard input
	mov rax, SYS_READ			; System call
	syscall

	; TODO: remove new line

	pop rdx						; Restore registers
	pop rsi
	pop rdi
	pop rax

	ret

;----------------------------------------------------------------------
;	int strcmp(char* a, char* b)
;
;	Compare strings
;----------------------------------------------------------------------
strcmp:
	push rax					; Store registers
	push rbx
	push rcx

	call strlen					; Get string length for A
	push rax					; Push the string
	push rdx					; Push the length

	mov rax, rbx				; Get the second string
	call strlen					; Get string length for B

	pop rcx						; Length A is in RCX
	cmp rcx, rdx				; Compare the lengths
	jne .ne2					; If not equal, end

	pop rax						; Get string A back to RAX
	mov rcx, 0					; Begin counter

.charLoop:
	cmp rcx, rdx				; Compare the counter and the length
	je .done					; If they're the same, finish

	mov al, [rax + rcx]
	mov bl, [rbx + rcx]
	cmp al, bl					; Compare the characters
	jne .ne						; If not equal, end

	inc rcx						; Increment counter
	jmp .charLoop				; Start over

.ne2:
	pop rax

.ne:
	pop rcx						; Restore registers
	pop rbx
	pop rax

	mov rdx, 0					; Return false
	ret

.done:
	pop rcx						; Restore registers
	pop rbx
	pop rax

	mov rdx, 1					; Return true
	ret

;----------------------------------------------------------------------
;	void setChar(char* str, char c, int index)
;
;	Set a character of a specified string
;----------------------------------------------------------------------
setChar:
	mov [rax + rcx], rbx		; Set the string pointer offset to char
	ret