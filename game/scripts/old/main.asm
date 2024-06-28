%include "../game/scripts/incs/renderUtilities.inc"
%include "../game/scripts/incs/timeUtilities.inc"
segment code

extern print_message
extern read_inputs
extern init_timer
extern timer_loop
extern createForLoop
extern drawSquare
..start:
 mov ax,data
 mov ds,ax
 mov ax,stack
 mov ss,ax
 mov sp,stacktop

mov ah, 0       ; Set video mode function
mov al, 13h     ; Mode 13h (320x200, 256 colors)
int 10h         ; Call BIOS video interrupt
PRINT_STRING hello
push test
push 7
call createForLoop
PRINT_STRING hello
push 320
push 200
push 160
push 100
push 50
call drawSquare

PRINT_STRING hello

;timer section
GET_TIMER_MIN [time], [timerTest]
push ds
;mov ax, bss
;mov ds, ax
;mov ax, [timerTest]
;cmp ax, 16
;je testTimer
;pop ds
PRINT_STRING hello
jmp main_loop
 ;mov ax,0x4c00
 ;int 0x21 close application

main_loop:
;call read_inputs
CHECK_TIMER_MIN [timerTest]
jz testTimer
jmp main_loop; 


test:
PRINT_STRING babybel
ret

testTimer:
PRINT_STRING timerMessage
jmp main_loop
segment data
hello: db "Initt", 13, 10, '$'
babybel: db "Loop", 13, 10, '$'
timerMessage: db "Timer la reussite", 13, 10, '$'
time: db 61
VIDEO_MODE equ 13h    ; Mode 13h (320x200 256-color VGA)
segment stack stack
 resb 64
stacktop:
segment bss
timerTest : resw 1

