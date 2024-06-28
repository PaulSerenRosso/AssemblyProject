%include "../game/scripts/incs/renderUtilities.inc"
%include "../game/scripts/incs/classUtilities.inc"
segment code
global initGame
extern entityConstructor
initGame:
PRINT_DEBUG_STRING initMessage
mov ax, bss
mov ds, ax
push entityInstance
call entityConstructor
mov bx, [entityInstance] 
add bx, 2
mov si, bx 
push entityInstance            
mov ax, data
mov ds, ax   
mov ax, [si]           
call ax 
mov ax, data
mov ds, ax                  
PRINT_STRING initMessage
jmp gameLoop
gameLoop:
call handleInput
call updateEntities
call checkTimers
call moveEntities
call render
jmp gameLoop

handleInput:
ret 
updateEntities:
ret
moveEntities:
ret
checkTimers:
ret
render:
ret
segment data
initMessage: db "Init Game", 13, 10, '$'

segment bss
entityInstance: resb ENTITY_SIZE  


; inputs
; update
; update timerManager
; update movementManager
; render 
; faire que le render ne se déclenche que lorsqu'il y a un changement