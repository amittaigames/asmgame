; Game source
; Mac OS X

;-----------------------------------
;	int nameEasterEgg()
;-----------------------------------
nameEasterEgg:
	mov rax, name				; Set first arg to name
	mov rbx, egg_name			; Set second to easter egg name
	call strEquals				; Compare strings

	cmp edx, 0					; Compare return value
	je .no						; If false, jump to no

.yes:
	mov edx, 1					; Return true
	ret

.no:
	mov edx, 0					; Return false
	ret