section .data
section .data
msg db 'Enter number1: ',10
msglen: equ $-msg
msg1 db 'Enter number2: ',10
msg1len: equ $-msg1
msg2 db 'Result after addition is: '
msg2len: equ $-msg2

section .bss
num1 resb 2
num2 resb 2
res resb 2

section .text
global _start
_start:
%macro RW 4
mov eax, %1
mov ebx, %2
mov ecx, %3
mov edx, %4
int 80h
%endmacro

section .text 
global _start
_start:
RW 4,1,msg,msglen
RW 3,0,num1,2
RW 4,1,msg1,msg1len
RW 3,0,num2,2

mov eax,[num1]
sub eax,'0'
mov ebx,[num2]
sub ebx,'0'
add al,bl

add eax,'0'
mov [res],eax

RW 4,1,msg2,msg2len
RW 4,1,res,2

mov eax,1
mov ebx,0
int 80h
