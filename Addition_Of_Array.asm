section .data
    x dw 1, 2, 3, 0
    msg db "Sum of the array is: $"

section .bss
    sum resd 1

section .text
    global _start

_start:
    mov ax, 0
    mov bx, 0
    mov si, 0
    mov cx, 4

add_loop:
    mov ax, [x + si*2]
    add bx, ax
    inc si
    loop add_loop

    mov [sum], bx
    mov [sum+2], ax

    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, 24
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, sum
    mov edx, 4
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80
