segment code
 global init_timer
 global timer_loop
 extern print_message

init_timer:
  mov ah, 0x2C         ; Get system time function
    int 0x21             ; Call DOS interrupt
  cmp ch, 16
  je timer_success
    ret
 timer_loop:


    ret
timer_success:
push timerSuccess
call print_message
ret
segment data
timerSuccess: db "Timer success", 13, 10, '$'
timerInit : db "Timer init", 13, 10, '$'
segment bss
old_ticks resw 1 ; Reserve word for old tick count