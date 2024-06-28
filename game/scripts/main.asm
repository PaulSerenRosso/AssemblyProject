
segment code
extern initGame

..start:
;set up data register
 mov ax,data
 mov ds,ax
; set up stack register
mov ax,stack
mov ss,ax
mov sp,stacktop
;set video mode
mov ah, 0       ; Set video mode function
mov al, 13h     ; Mode 13h (320x200, 256 colors)
int 10h         ; Call BIOS video interrupt
jmp initGame
segment data

segment bss


segment stack stack 
resb 64
stacktop:
