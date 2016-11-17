; Standard Library
; Mac OS X

;-----------------------------------
;	SYSTEM CALLS
;-----------------------------------

SYS_EXIT: equ			0x2000001

;-----------------------------------
;	void exit(int code)
;-----------------------------------
exit:
	mov rdi, rax					; Move function arg to syscall arg
	mov rax, SYS_EXIT				; Set system call
	syscall							; Syscall
	ret