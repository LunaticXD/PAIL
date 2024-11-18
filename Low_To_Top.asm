section .data
    string db "Advait", 10   
    len equ $ - string            

section .text
    global _start

_start:
    mov ecx, string              
    call toUpper               
    call print                 

    mov eax, 1                 
    xor ebx, ebx               
    int 0x80                   

toUpper:
    mov al, [ecx]              
    cmp al, 0                  
    je done                    
    cmp al, 'a'                
    jb next_char               
    cmp al, 'z'                
    ja next_char               
    sub al, 0x20                
    mov [ecx], al               

next_char:
    inc ecx                     
    jmp toUpper                 

done:
     mov eax,1
	 mov ebx,0
	 int 0x80                          

print:
    mov eax, 4                   
    mov ebx, 1                   
    mov edx, len                 
    mov ecx, string              
    int 0x80                     

    mov eax,1
	 mov ebx,0
	 int 0x80
