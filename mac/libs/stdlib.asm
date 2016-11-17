; Standard Library
; Mac OS X

;-----------------------------------
;	SYSTEM CALLS
;-----------------------------------

SYS_EXIT: equ			0x2000001
SYS_WRITE: equ			0x2000004

;-----------------------------------
;	void exit(int code)
;-----------------------------------
exit:
	mov rdi, rax				; Move function arg to syscall arg
	mov rax, SYS_EXIT			; Set system call
	syscall						; Syscall
	ret

;-----------------------------------
;	int strlen(char* str)
;-----------------------------------
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

;-----------------------------------
;	void sprint(char* str)
;-----------------------------------
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