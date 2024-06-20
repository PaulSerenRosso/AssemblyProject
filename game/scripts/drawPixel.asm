
%define PIXELX 10
%define PIXELY 150
segment code
 global draw_pixel
draw_pixel:
    ; Set up video memory segment
mov ax, 0A000h      ; Segment of video memory (0xA000)
mov es, ax          ; Set ES to video memory segment

    mov ax, 320         ; Width of the screen in pixels
    mov bx, PIXELY      ; Y coordinate
    mul bx              ; AX = 320*y
    add ax, PIXELX      ; AX = 320*y + x
    mov di, ax          ; DI = offset into video memory


mov dl, 2           ; Color index (assuming 256-color mode)
mov [es:di], dx     ; Store color index at ES:DI (video memory)

int 10h             ; Call BIOS video services to display pixel
ret