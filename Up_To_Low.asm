section .data
    s1 db 'ADVAIT'       
    len equ $ - s1      

section .bss
    s2 resb 20          

section .text
    global _start

_start:
    mov ecx, len        
    mov esi, s1         
    mov edi, s2         

UpptoLow:
    lodsb               
    or al, 20h          
    stosb               
    loop UpptoLow       

    mov eax, 4          
    mov ebx, 1          
    mov edx, 20         
    mov ecx, s2         
    int 0x80            

    mov eax, 1          
    xor ebx, ebx        
    int 0x80
