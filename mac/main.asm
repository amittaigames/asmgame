; Main game code
; Mac OS X

%include "libs/stdlib.asm"
%include "libs/game.asm"

SECTION .text
global start

start:
	mov rax, msg
	call sprint

	mov rax, name
	mov rbx, 256
	call gets

	call nameEasterEgg
	cmp edx, 1
	je easter

	mov rax, hi
	call sprint
	mov rax, name
	call sprint

	mov rax, 0
	call exit

easter:
	mov rax, egg_name_yes
	call sprint

	mov rax, 69
	call exit

SECTION .data

;-----------------------------------
;	Intro Sequence
;-----------------------------------
msg: db "What is your name: ",0
hi: db "Hello ",0

;-----------------------------------
;	Easter Eggs
;-----------------------------------
egg_name: db "Bob Saggit",10,0
egg_name_yes: db "DUDE YES",10,0

;-----------------------------------
;	Debug
;-----------------------------------
dbg_err: db "Error!",10,0

SECTION .bss
name: resb 256