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

    call read_int     ; reads n
    mov rcx, rax      ; moves n to rcx
    mov r14, 0        ; sets r14 as index
    input_loop:
        mov r13, rcx        ; saves rcx in r13
        call read_int       ; reads the next number
        push rax
        push rax            ; saves input in stack
        inc r14             ; moves the index forward
        mov rcx, r13        ; loads rcx
        loop input_loop     ; repeats until n == 0
    mov rcx, r14
    output_loop:
        mov r13, rcx        ; saves rcx in r13
        pop rdi
        pop rdi
        call print_int      ; calls print
        call print_nl       ; prints new line
        dec r14             ; decrements r14
        mov rcx, r13        ; loads rcx
        loop output_loop    ; loops to the beginning until we reach the end
    end:

    add rsp, 8

	pop r15
	pop r14
	pop r13
	pop r12
    pop rbx
    pop rbp

	ret

