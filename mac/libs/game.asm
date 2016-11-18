; Game source
; Mac OS X

;-----------------------------------
;	int nameEasterEgg()
;-----------------------------------
nameEasterEgg:
	mov rax, name				; Set first arg to name
	mov rbx, egg_name			; Set second to easter egg name
	call strcmp					; Compare strings

	ret							; Edx is from the strcmp