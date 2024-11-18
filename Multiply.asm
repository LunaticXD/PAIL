section .data
    num1 dw 6                ; First number
    num2 dw 4                ; Second number
    result_mul dw 0          ; To store multiplication result

section .text
    global _start

_start:
    ; Load numbers into registers for multiplication
    mov ax, [num1]           ; Load num1 into AX
    mov bx, [num2]           ; Load num2 into BX
    imul bx                  ; Multiply AX (num1) with BX (num2)
    mov [result_mul], ax     ; Store the result in result_mul

    ; Exit the program
    mov eax, 1               ; sys_exit system call
    xor ebx, ebx             ; Exit code 0
    int 0x80

