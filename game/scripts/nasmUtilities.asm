%include "../game/scripts/incs/renderUtilities.inc"
segment code
global createForLoop
createForLoop:
push ax
push bx
push bp
mov bp, sp
mov bx, 0
mov ax, [bp+10]
jmp iterateForLoop

iterateForLoop:

cmp word bx, [bp+8]
je endForLoop
call ax
add word bx, 1
jmp iterateForLoop

endForLoop:
pop bp
pop bx
pop ax
ret 4
