section .data
STR1 DB "hello$"		
STR2 DB "hello$"

equal_msg db "The strings are equal.", 10
equal_msglen: equ $-equal_msg

not_equal_msg db "The strings are not equal.", 10
not_equal_msglen: equ $-not_equal_msg

%macro rw 4
mov eax,%1
mov ebx,%2
mov ecx,%3
mov edx,%4
int 80h
%endmacro

section .text
global _start
_start:
mov ESI, STR1		
mov EDI, STR2
mov CL, 05H
CLD			
REPE CMPSB		
JZ XX			
rw 4,0,not_equal_msg,not_equal_msglen
JMP exit		
XX:rw 4,0,equal_msg,equal_msglen		
exit: mov eax,1
mov ebx,0
int 80h
