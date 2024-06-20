segment code
extern print_message
extern read_inputs
extern init_timer
extern timer_loop
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

push hello
call print_message
push hello
call print_message
jmp main_loop
 ;mov ax,0x4c00
 ;int 0x21 close application

main_loop:
call read_inputs
call timer_loop
call print_message;
;push dx
;push hello
;call print_message
;pop dx 
;pop dx
;jmp main_loop; 

segment data
hello: db "Init", 13, 10, '$'
VIDEO_MODE equ 13h    ; Mode 13h (320x200 256-color VGA)
segment stack stack
 resb 64
stacktop:

