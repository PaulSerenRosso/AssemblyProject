%include "../game/scripts/incs/renderUtilities.inc"
segment code
global playerConstructor
extern entityConstructor
extern renderEntity 
playerConstructor:
pusha
push [bp+20]
call entityConstructor
mov ax, bss
mov ds, ax
mov bp, sp
mov bx,virtualTable
mov [bp+20], bx   
mov word [bp+22], 5
mov word [bp+24], 10
mov ax, data
mov ds, ax
PRINT_STRING initMessage
mov ax, bss
mov ds, ax
popa
ret 2
update:
mov ax, data
mov ds, ax
PRINT_STRING updateMessage
mov ax, bss
mov ds, ax
ret
render:
pusha
mov bp, sp
mov ax, bss
mov ds, ax
mov bx, [bp+22]
cmp bx, 5
je testVariable
mov ax, data
mov ds, ax
PRINT_STRING renderMessage
mov ax, bss
mov ds, ax
popa
ret  

testVariable:
mov ax, data
mov ds, ax
PRINT_STRING testVariableMessage
mov ax, bss
mov ds, ax
popa
ret 2 
segment data
virtualTable:dw update,render,handleCollisionEntity
renderMessage: db "Render Player", 13, 10, '$'
updateMessage: db "Update Player", 13, 10, '$'
initMessage: db "Init Player", 13, 10, '$'
testVariableMessage: db "Test Variable Player", 13, 10, '$'
segment bss