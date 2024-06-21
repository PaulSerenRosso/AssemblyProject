%include "../game/scripts/incs/renderUtilities.inc"
segment code

extern print_message
extern read_inputs
extern init_timer
extern timer_loop
extern createForLoop
..start:
 mov ax,data
 mov ds,ax
 mov ax,stack
 mov ss,ax
 mov sp,stacktop

mov ah, 0       ; Set video mode function
mov al, 13h     ; Mode 13h (320x200, 256 colors)
int 10h         ; Call BIOS video interrupt
call init_timer
;PRINT_STRING hello
push test
push 2
call createForLoop
PRINT_STRING hello

;SET_CURSOR 40,50

;PRINT_STRING hello
;jmp main_loop
 ;mov ax,0x4c00
 ;int 0x21 close application

main_loop:
call read_inputs
call timer_loop

jmp main_loop; 


test:
PRINT_STRING babybel
ret
segment data
hello: db "Initt", 13, 10, '$'
babybel: db "Loop", 13, 10, '$'
VIDEO_MODE equ 13h    ; Mode 13h (320x200 256-color VGA)
segment stack stack
 resb 64
stacktop:

