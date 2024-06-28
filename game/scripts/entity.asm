%include "../game/scripts/incs/renderUtilities.inc"
segment code
global entityConstructor
entityConstructor:
pusha
mov ax, bss
mov ds, ax
mov bp, sp
mov bx,virtualTable
mov [bp+20], bx   
mov word [bp+22], 5
mov ax, data
mov ds, ax
PRINT_STRING initMessage
mov ax, bss
mov ds, ax
popa
ret 2
updateEntity:
mov ax, data
mov ds, ax
PRINT_STRING updateMessage
mov ax, bss
mov ds, ax
ret
renderEntity:
pusha
mov ax, data
mov ds, ax
PRINT_STRING renderMessage
mov ax, bss
mov ds, ax
popa
ret 2 

handleCollisionEntity:
mov ax, data
mov ds, ax
PRINT_STRING collisionMessage
mov ax, bss
mov ds, ax
ret 
segment data
virtualTable:dw updateEntity,renderEntity, handleCollisionEntity
renderMessage: db "Render", 13, 10, '$'
updateMessage: db "Update", 13, 10, '$'
collisionMessage: db "Collision", 13, 10, '$'
initMessage: db "Init Entity", 13, 10, '$'
testVariableMessage: db "Test Variable Entity", 13, 10, '$'
segment bss