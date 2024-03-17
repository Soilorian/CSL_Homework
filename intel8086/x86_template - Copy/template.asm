segment .data
    dddd: dd 1.75
    p: db "%ld", 10, 0 

segment .text

extern printf
global main

main:
	push rbp
    push rbx
    push r12
    push r13
    push r14
    push r15

    sub rsp, 8

mov eax, dword[dddd]
shr rax, 31
mov r11, rax
mov eax, dword[dddd]
shl rax, 33
shr rax, 56
mov r12, 1023
mov eax, dword[dddd]
shl rax, 41
shr rax, 41
mov r13, rax
mov rax, r11
shl rax, 11
add rax, r12
shl rax, 23
add rax, r13
shl rax, 29
    mov rdi, p
    mov rsi, rax
    mov rax, 1
    call printf


    add rsp, 8

	pop r15
	pop r14
	pop r13
	pop r12
    pop rbx
    pop rbp

	ret
