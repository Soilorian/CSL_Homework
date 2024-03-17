%include "asm_io.inc"

global asm_main


asm_main:
    
	push rbp
    push rbx
    push r12
    push r13
    push r14
    push r15

    sub rsp, 8

    
    loop:
        call read_char  ; reads input
        mov r13, rax    ; moves the char into r13
        cmp r13, 'q'    ; checks if input is quit flag
        je finish       ; jumps to finish
        call read_int   ; reads the first number
        mov r12, rax    ; moves the first number to r12
        call read_int   ; reads the second number
        xchg rax, r12   ; puts the first number in rax
        cmp r13, '+'    ; checks if input is '+'
        je  plus        ; jumps to plus
        cmp r13, '-'    ; checks if input is '-'
        je minus        ; jumps to minus
        cmp r13, '/'    ; checks if input is '/'
        je divide       ; jumps to divide
        cmp r13, '*'    ; checks if input is '*'
        je multiply     ; jumps to multiply
        jmp unknown     ; if input is none of the above, jump to unknown
        
        plus:
            add rax, r12    ; adds the two number and stores it in rax
            jmp print
        minus:
            sub rax, r12    ; subrtacts r12 from rax
            jmp print
        divide:
            cmp r12, 0      ; checks the second number to not be 0
            je  undefined   ; won't do the division and will print 'u'
            xor r15, r15
            cmp rax, 0
            jge dx_zero
            mov r15, -1
            dx_zero:
            mov rdx, r15
            idiv r12         ; divides r12 from rax
            jmp print
        multiply:
            imul r12         ; multiplies r12 and rax
            jmp print
        unknown:
            mov rax, 'o'
            jmp print_charecter
        undefined:
            mov rax, 'u'
            jmp print_charecter
        print:
            mov rdi, rax    ; getting ready to print the answer
            call print_int  ; prints whatever in rdi
            jmp back
        print_charecter:
            mov rdi, rax    ; getting ready to print the error
            call print_char ; prints the charecter
        back:
            call print_nl
            call read_char  ; to read '\n'  
            jmp loop        ; jumps back to getting input
        finish:

    add rsp, 8

	pop r15
	pop r14
	pop r13
	pop r12
    pop rbx
    pop rbp

	ret