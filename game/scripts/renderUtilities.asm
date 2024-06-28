%include "../game/scripts/incs/renderUtilities.inc"
segment code
extern createForLoop
global drawSquare
drawSquare:
push bp
push ax
push bx
push ds
mov ax, bss
mov ds, ax
mov bp, sp
mov ax, [bp+10]
mov [currentColor], ax
mov ax, [bp+12]
mov [currentPositionY], ax
mov ax, [bp+14]
mov  [currentPositionX], ax
mov ax, [bp+16]
mov [currentHeight], ax
 xor dx, dx  ;
mov bx, 2
div bx
sub word [currentPositionY], ax
mov ax, [bp+16]
mov [currentWidth], ax
div bx
sub word [currentPositionX] ,ax
push drawSquareLoopY
mov ax, [currentHeight]
push ax
call createForLoop
pop ds
pop bx
pop ax
pop bp
ret 8
test :

mov ax, data
mov ds, ax
PRINT_STRING babybel3
pop bx
pop ax
pop bp
ret 8

drawSquareLoopY:
push ax
mov ax, [currentPositionY]
cmp ax, 199
jg cancelDrawSquareLoopY
cmp ax, 0
jl cancelDrawSquareLoopY
push drawSquareLoopX
mov ax, [currentWidth]
push ax
call createForLoop

add word [currentPositionY],1

pop ax
ret

drawSquareLoopX:
push cx
mov cx, [currentPositionX]
add cx, bx
cmp cx, 319
jg cancelDrawSquareLoopX
cmp cx, 0
jl cancelDrawSquareLoopX
DRAW_PIXEL cx, [currentPositionY], [currentColor]
pop cx
ret 

cancelDrawSquareLoopX:
pop cx
ret

cancelDrawSquareLoopY:
add word [currentPositionY],1
pop ax
ret

segment bss
currentPositionX: resw 1
currentPositionY: resw 1
currentColor: resw 1
currentHeight : resw 1
currentWidth : resw 1
segment data
babybel: db "Loop Renderer X", 13, 10, '$'
babybel2: db "Loop Renderer Y", 13, 10, '$'
babybel3: db "fdqjslfkjq", 13, 10, '$'