section .data
    first db "Advait", 0         
    middle db "Akshay", 0      
    last db "Nagar", 0      
    fullname db 30 dup(0)     

section .text
    global _start

_start:
    ; Concatenate first name
    mov esi, first
    mov edi, fullname
concatenate_first:
    mov al, [esi]
    cmp al, 0                
    je middle_name
    mov [edi], al
    inc esi
    inc edi
    jmp concatenate_first

middle_name:
    ; Concatenate middle name
    mov esi, middle
concatenate_middle:
    mov al, [esi]
    cmp al, 0                
    je last_name
    mov [edi], al
    inc esi
    inc edi
    jmp concatenate_middle

last_name:
    ; Concatenate last name
    mov esi, last
concatenate_last:
    mov al, [esi]
    cmp al, 0     
    je done
    mov [edi], al
    inc esi
    inc edi
    jmp concatenate_last

done:
    ; Print the full name
    mov eax, 4               ; sys_write
    mov ebx, 1               ; stdout
    mov edx, 30              ; length of the string
    mov ecx, fullname       
    int 0x80                 ; make the system call

    ; Exit program
    mov eax, 1               ; sys_exit
    xor ebx, ebx             ; return 0 status
    int 0x80                 ; make the system call
