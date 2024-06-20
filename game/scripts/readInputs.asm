segment code
 global read_inputs
extern draw_pixel
extern print_message
 read_inputs:
mov ah, 01h         ; Check for key press function
    int 16h             ; Call interrupt to check for key press
    jz end_inputs     ; If zero (no key pressed), loop back

    ; Read the character
    mov ah, 00h         ; Read character from stdin
    int 16h             ; Call interrupt to read character
    mov [buffer], al    ; Store the character in buffer
    
    push inputReaded
    call print_message
  
    ; Print the character back
    mov ah, 02h         ; Function to print character
    mov dl, [buffer]    ; Load character to print
    int 16h             ; Call interrupt to print character
    
    ; Check if the character was a carriage return
    cmp byte [buffer],  0x61
    jne test_another_inputs  ; If not CR, continue reading characters
    push inputSuccessA
    call print_message
    call draw_pixel
    ret
end_inputs:
ret

test_another_inputs:
  cmp byte [buffer],  0x64
  jne end_inputs
      push inputSuccessD
    call print_message
  ret
segment bss 
buffer : resb 1
segment data
inputSuccessA: db "Get the right input A", 13, 10, '$'
inputSuccessD: db "Get the right input D", 13, 10, '$'
inputReaded: db "Read input", 13, 10, '$'
inputTry: db "Try input", 13, 10, '$'



