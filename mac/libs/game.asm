; Game source
; Mac OS X

;-----------------------------------
;	int nameEasterEgg()
;-----------------------------------
nameEasterEgg:
	mov rax, name
	mov rbx, egg_name
	call strEquals

	cmp edx, 0
	je .no

.yes:
	mov edx, 1
	ret

.no:
	mov edx, 0
	ret