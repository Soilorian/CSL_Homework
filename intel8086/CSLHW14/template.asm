segment .text

global gcd
global lcm

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
