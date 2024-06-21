%include "../game/scripts/incs/renderUtilities.inc"
segment code
global createForLoop
createForLoop:
push ax
push bx
push bp
mov bp, sp
sub sp, 2
mov word [bp-2], 0
mov bx, [bp+6]
sub bx, 1
mov ax, [bp+8]
jmp iterateForLoop

iterateForLoop:
PRINT_STRING babybel
cmp 1, bx
je endForLoop

;call ax
add word [bp-2], 1
jmp iterateForLoop

endForLoop:
add sp, 2
pop bp
pop bx
pop ax
PRINT_STRING endloop
ret 4
segment data
babybel: db "Iterate Loop", 13, 10, '$'
endloop: db "End Loop", 13, 10, '$'