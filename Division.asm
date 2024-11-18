section .data
    num1 dw 20               ; Dividend
    num2 dw 3                ; Divisor
    quotient dw 0            ; To store the quotient
    remainder dw 0           ; To store the remainder

section .text
    global _start

_start:
    ; Load dividend (num1) into AX register
    mov ax, [num1]
    ; Clear DX to avoid garbage as DX:AX is the 32-bit dividend
    xor dx, dx
    ; Load divisor (num2) into BX register
    mov bx, [num2]
    ; Perform division
    div bx                   ; AX / BX; Quotient in AX, Remainder in DX

    ; Store the quotient and remainder
    mov [quotient], ax       ; Save quotient to memory
    mov [remainder], dx      ; Save remainder to memory

    ; Exit the program
    mov eax, 1               ; sys_exit system call
    xor ebx, ebx             ; Exit code 0
    int 0x80
