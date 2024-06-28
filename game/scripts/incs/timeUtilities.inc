%macro GET_TIMER_HSEC 1
pusha
TIMER_INTERUPT       ; Call DOS interrupt

popa
%endmacro


%macro CHECK_TIMER_HSEC 1
pusha
TIMER_INTERUPT           ; Call DOS interrupt
pusha
%endmacro


%macro GET_TIMER_SEC 1
pusha
TIMER_INTERUPT           ; Call DOS interrupt

popa
%endmacro


%macro CHECK_TIMER_SEC 1
pusha
TIMER_INTERUPT          ; Call DOS interrupt
pusha
%endmacro


%macro GET_TIMER_MIN 2
pusha
push ds
mov ax, data
mov ds, ax
TIMER_INTERUPT          ; Call DOS interrupt
xor dx, dx
xor ax, ax
mov ax, 0
add cl, %1
mov bx, 60
mov al, cl
div bx
mov ax, bss
mov ds, ax
mov %2, dx
pop ds
popa

%endmacro


%macro CHECK_TIMER_MIN 1
pusha
push ds
TIMER_INTERUPT           ; Call DOS interrupt
mov ax, bss
mov ds, ax
cmp cl, %1
pop ds
popa
%endmacro


%macro TIMER_INTERUPT 0
mov ah, 0x2C         ; Get system time function
int 0x21             ; Call DOS interrupt
%endmacro