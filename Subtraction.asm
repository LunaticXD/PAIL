section .data
    prompt1 db 'Enter first number: ', 0
    prompt2 db 'Enter second number: ', 0
    result_msg db 'The result of subtraction is: ', 0

section .bss
    num1 resb 4
    num2 resb 4
    result resb 4

section .text
    global _start

_start:
    ; Print first prompt
    mov eax, 4          ; system call for sys_write
    mov ebx, 1          ; file descriptor 1 (stdout)
    mov ecx, prompt1    ; pointer to the prompt1 message
    mov edx, 20         ; message length
    int 0x80            ; make the system call

    ; Read first number from user
    mov eax, 3          ; sys_read system call
    mov ebx, 0          ; file descriptor 0 (stdin)
    mov ecx, num1       ; buffer to store input
    mov edx, 4          ; number of bytes to read
    int 0x80            ; make the system call

    ; Print second prompt
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, prompt2    ; pointer to the prompt2 message
    mov edx, 21         ; message length
    int 0x80            ; make the system call

    ; Read second number from user
    mov eax, 3          ; sys_read system call
    mov ebx, 0          ; stdin
    mov ecx, num2       ; buffer to store input
    mov edx, 4          ; number of bytes to read
    int 0x80            ; make the system call

    ; Convert input to integer (assuming input is a valid integer)
    mov eax, [num1]     ; load first number into eax
    sub eax, [num2]     ; subtract second number from eax

    ; Store result in memory
    mov [result], eax

    ; Print result message
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, result_msg ; result message
    mov edx, 29         ; message length
    int 0x80            ; make the system call

    ; Print the result
    mov eax, [result]   ; load result into eax
    add eax, '0'        ; convert result to ASCII (basic assumption)
    mov [result], eax   ; store back in result

    ; Write result to stdout
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, result     ; result
    mov edx, 1          ; print 1 byte (single result digit)
    int 0x80            ; make the system call

    ; Exit program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; return 0 status
    int 0x80            ; make the system call

