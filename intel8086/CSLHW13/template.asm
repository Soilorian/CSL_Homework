%include "asm_io.inc"

segment .text

global asm_main

asm_main:
	push rbp
    push rbx
    push r12
    push r13
    push r14
    push r15

    sub rsp, 8

    call read_int   ; gets input
    mov rdi, rax
    xor rdx, rdx    ; rdx = 0
    mov r12, 2          
    div r12             ; rax /= 2
    cmp rdx, 0      ; if remainder is 0
    jne do_nothing  ; jump
    dec rax         ; rax = n/2 + 1
    do_nothing:
    dec rax         ; rax -= 1
    ; now the number of loops is in rax
    mov rcx, rax    ; r13 = rax
    mov r13, 2    ; as i
    lop1:
        add r13, 2          ; r13 += 2
        push rcx            
        push rcx            ; saves rcx in stack
        mov rdi, r13        ; rdi = r13
        call print_int      ; prints the current number
        mov rdi, 32
        call print_char     ; prints ' '
        mov r15, 1          ; rdi = 1
        lop2:
            inc r15         ; rdi += 1
            mov rdi, r15    
            call prime_cal  ; checks if rdi is prime
            cmp rax, 0
            jne move_on     ; if no loop to next iteration
            mov rdi, r13    ; rdi = r13
            sub rdi, r15    ; rdi -= r15
            mov r14, rdi    ; r14 = rdi
            call prime_cal  ; checks if r13 - rdi is prime
            cmp rax, 0      ; if no
            jne move_on     ; goes to the next iteration
            jmp result_ready; else breaks out of the loop
            move_on:
            jmp lop2        ; goes back to lop2
        result_ready:
        mov rdi, r15        ; rdi = r15
        call print_int      ; we have two prime numbers that form r13, print #1 
        mov rdi, 32         ; printing ' '
        call print_char
        mov rdi, r14        ; printing the second one
        call print_int
        call print_nl       ; prints new line
        pop rcx             ; loads rcx
        pop rcx
        loop lop1           ; jumps back to lop1
        

    add rsp, 8

	pop r15
	pop r14
	pop r13
	pop r12
    pop rbx
    pop rbp

	ret

prime_cal:
	push rbp
    push rbx
    push r12
    push r13
    push r14
    push r15

    sub rsp, 8
    
    mov rax, rdi        ; reads input
    xor rdx, rdx        ; rdx = 0
    mov r12, 2          
    div r12             ; rax /= 2
    mov rcx, rax        ; rcx = cell(rax/2)
    lop:
        cmp rcx, 1      ; if rcx == 1
        je res          ; go to res
        xor rdx, rdx    ; rdx = 0
        mov rax, rdi    ; rax = input
        div rcx         ; rdx:rax /= rcx
        cmp rdx, 0      ; if (remainder == 0)
        je end
        loop lop
    res:
    mov rax, 0      ; rax =
    end:


    add rsp, 8

	pop r15
	pop r14
	pop r13
	pop r12
    pop rbx
    pop rbp

	ret



debug:
	push rbp
    push rbx
    push r12
    push r13
    push r14
    push r15
    push rax
    push rcx
    push rdx
    push rdi
    push rsi
    push rsi

    sub rsp, 8


    mov r15, rdi
    mov rdi, '*'
    call print_char
    mov rdi, '*'
    call print_char
    mov rdi, '*'
    call print_char
    mov rdi, r15
    call print_int
    mov rdi, '*'
    call print_char
    mov rdi, '*'
    call print_char
    mov rdi, '*'
    call print_char

    add rsp, 8


    pop rsi
    pop rsi
    pop rdi
    pop rdx
    pop rcx
    pop rax
	pop r15
	pop r14
	pop r13
	pop r12
    pop rbx
    pop rbp

	ret
