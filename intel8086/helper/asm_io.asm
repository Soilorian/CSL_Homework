segment .data
print_int_format: db        "%ld", 0

read_int_format: db         "%ld", 0

segment .text
    global print_int
    global print_char
    global print_string
    global print_nl
    global read_int
    global read_char
    global safe_print_int
    global safe_print_char
    global safe_print_string
    global safe_print_nl
    global safe_read_int
    global safe_read_char
    global quick_sort
    global mod
    global power
    global ceil_root
    global factoriel
    global gcd
    global lcm
    global ceil_lg2
    extern printf
    extern putchar
    extern puts
    extern scanf
    extern getchar

print_int:
    sub rsp, 8

    mov rsi, rdi

    mov rdi, print_int_format
    mov rax, 1 ; setting rax (al) to number of vector inputs
    call printf
    
    add rsp, 8 ; clearing local variables from stack

    ret


print_char:
    sub rsp, 8

    call putchar
    
    add rsp, 8 ; clearing local variables from stack

    ret


print_string:
    sub rsp, 8

    call puts
    
    add rsp, 8 ; clearing local variables from stack

    ret


print_nl:
    sub rsp, 8

    mov rdi, 10
    call putchar
    
    add rsp, 8 ; clearing local variables from stack

    ret


read_int:
    sub rsp, 8

    mov rsi, rsp
    mov rdi, read_int_format
    mov rax, 1 ; setting rax (al) to number of vector inputs
    call scanf

    mov rax, [rsp]

    add rsp, 8 ; clearing local variables from stack

    ret


read_char:
    sub rsp, 8

    call getchar

    add rsp, 8 ; clearing local variables from stack

    ret


safe_print_int:
    push rax
    push rbx
    push rcx
    push rdx
    push rdi
    push rsi
    push rbp
    push rsp
    push r8
    push r9
    push r10
    push r11
    push r12
    push r13
    push r14
    push r15
    call print_int
    pop r15
    pop r14
    pop r13
    pop r12
    pop r11
    pop r10
    pop r9
    pop r8
    pop rsp
    pop rbp
    pop rsi
    pop rdi
    pop rdx
    pop rcx
    pop rbx
    pop rax

    ret

safe_print_string:
    push rax
    push rbx
    push rcx
    push rdx
    push rdi
    push rsi
    push rbp
    push rsp
    push r8
    push r9
    push r10
    push r11
    push r12
    push r13
    push r14
    push r15
    call print_string
    pop r15
    pop r14
    pop r13
    pop r12
    pop r11
    pop r10
    pop r9
    pop r8
    pop rsp
    pop rbp
    pop rsi
    pop rdi
    pop rdx
    pop rcx
    pop rbx
    pop rax

    ret

safe_print_char:
    push rax
    push rbx
    push rcx
    push rdx
    push rdi
    push rsi
    push rbp
    push rsp
    push r8
    push r9
    push r10
    push r11
    push r12
    push r13
    push r14
    push r15
    call print_char
    pop r15
    pop r14
    pop r13
    pop r12
    pop r11
    pop r10
    pop r9
    pop r8
    pop rsp
    pop rbp
    pop rsi
    pop rdi
    pop rdx
    pop rcx
    pop rbx
    pop rax

    ret

safe_print_nl:
    push rax
    push rbx
    push rcx
    push rdx
    push rdi
    push rsi
    push rbp
    push rsp
    push r8
    push r9
    push r10
    push r11
    push r12
    push r13
    push r14
    push r15
    call print_nl
    pop r15
    pop r14
    pop r13
    pop r12
    pop r11
    pop r10
    pop r9
    pop r8
    pop rsp
    pop rbp
    pop rsi
    pop rdi
    pop rdx
    pop rcx
    pop rbx
    pop rax

    ret


safe_read_char:
    push rbx
    push rbx
    push rcx
    push rdx
    push rdi
    push rsi
    push rbp
    push rsp
    push r8
    push r9
    push r10
    push r11
    push r12
    push r13
    push r14
    push r15
    call read_char
    pop r15
    pop r14
    pop r13
    pop r12
    pop r11
    pop r10
    pop r9
    pop r8
    pop rsp
    pop rbp
    pop rsi
    pop rdi
    pop rdx
    pop rcx
    pop rbx
    pop rbx

    ret

    
safe_read_int:
    push rbx
    push rbx
    push rcx
    push rdx
    push rdi
    push rsi
    push rbp
    push rsp
    push r8
    push r9
    push r10
    push r11
    push r12
    push r13
    push r14
    push r15
    call read_int
    pop r15
    pop r14
    pop r13
    pop r12
    pop r11
    pop r10
    pop r9
    pop r8
    pop rsp
    pop rbp
    pop rsi
    pop rdi
    pop rdx
    pop rcx
    pop rbx
    pop rbx

    ret

mod:
    push rbp
    push rbx
    push r12
    push r13
    push r14
    push r15

    sub rsp, 8

    mov rax, rdi
    xor rdx, rdx
    div rsi
    mov rax, rdx

    add rsp, 8

	pop r15
	pop r14
	pop r13
	pop r12
    pop rbx
    pop rbp

	ret

gcd:
	push rbp
    push rbx
    push r12
    push r13
    push r14
    push r15

    sub rsp, 8

    mov r15, rdi    ; moves a to r15
    mov r14, rsi    ; moves b to r14
    cmp r15, r14    
    jg do_nothing
    xchg r14, r15   ; puts the bigger number in r15
    do_nothing:
    cmp r14, 0      ; base condition for end of recurcive
    je ans_r15      ; jumps to return the result
    mov rdi, r15
    mov rsi, r14
    call mod        ; calculates the r15 % r14
    mov rdi, r14
    mov rsi, rax
    call gcd        ; gives r14, r15 % r14 to gcd in a revercive form
    mov r15, rax
    ans_r15:
    mov rax, r15

    add rsp, 8

	pop r15
	pop r14
	pop r13
	pop r12
    pop rbx
    pop rbp

	ret



lcm:
	push rbp
    push rbx
    push r12
    push r13
    push r14
    push r15

    sub rsp, 8

    mov rax, rdi    ; moves a to rax
    mul rsi         ; rax *= b
    mov r13, rax    ; saves rax in r12
    call gcd        ; calls gcd on a and b
    xchg r13, rax   ; puts the result in r13 and puts a*b in rax
    xor rdx, rdx    ; rdx = 0 for the division
    div r13         ; divides rax with r13

    add rsp, 8

	pop r15
	pop r14
	pop r13
	pop r12
    pop rbx
    pop rbp

	ret


power:
    push rbp
    push rbx
    push r12
    push r13
    push r14
    push r15

    sub rsp, 8

    mov rax, rdi
    mov rcx, rsi
    lop1:
        imul rdi
        loop lop1

    add rsp, 8

	pop r15
	pop r14
	pop r13
	pop r12
    pop rbx
    pop rbp

	ret

factoriel:
    push rbp
    push rbx
    push r12
    push r13
    push r14
    push r15

    sub rsp, 8

    mov rax, rdi
    mov rcx, rsi
    lop2:
        dec rdi
        imul rdi
        loop lop2

    add rsp, 8

	pop r15
	pop r14
	pop r13
	pop r12
    pop rbx
    pop rbp

	ret

ceil_root:
    push rbp
    push rbx
    push r12
    push r13
    push r14
    push r15

    sub rsp, 8

    mov rcx, rsi
    xor r13, r13
    outer:
        inc r13
        mov rax, r13
        inner:
            imul r13
            loop inner
        cmp rax, rdi
        jge end1
        jmp outer
    end1:


    add rsp, 8

	pop r15
	pop r14
	pop r13
	pop r12
    pop rbx
    pop rbp

	ret


ceil_lg2:
    push rbp
    push rbx
    push r12
    push r13
    push r14
    push r15

    sub rsp, 8

    xor rax, rax
    shift:
        inc rax
        sar rdi, 1
        cmp rdi, 0
        je end2
        jmp shift
    end2:

    add rsp, 8

	pop r15
	pop r14
	pop r13
	pop r12
    pop rbx
    pop rbp

	ret
