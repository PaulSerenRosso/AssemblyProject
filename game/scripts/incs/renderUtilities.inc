
%macro PRINT_STRING 1
    pusha
    mov dx, %1
    mov ah,9 
    int 0x21
    popa
%endmacro

%macro SET_CURSOR 2
    mov ah, 0x02
    mov bh, 0x00
    mov dh, %1
    mov dl, %2
    int 0x10
%endmacro

%macro PRINT_DEBUG_STRING 1
SET_CURSOR 0, 0
PRINT_STRING %1
%endmacro


%macro DRAW_PIXEL 3
    pusha
    mov ax, 0A000h      ; Segment of video memory (0xA000)
    mov es, ax          ; Set ES to video memory segment
    mov ax, 320         ; Width of the screen in pixels
    mov bx, %2      ; Y coordinate
    mul bx              ; AX = 320*y
    add ax, %1     ; AX = 320*y + x
    
    mov di, ax          ; DI = offset into video memory
    mov dl, %3           ; Color index (assuming 256-color mode)
    mov [es:di], dx     ; Store color index at ES:DI (video memory)
    int 10h             ; Call BIOS video services to display pixel
    popa
%endmacro
