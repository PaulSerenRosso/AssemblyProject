segment code
 global print_message
 print_message:
 push bp
 push dx
 mov bp, sp
mov dx, [bp+6]
 mov ah,9 
 int 0x21
 pop dx
 pop bp
 ret 2
  segment data
