
global _start
section .text:
_start:
    mov eax, 0x4 ; use the write system call
    mov ebx, 1 ; ise td out as the file desctriptor
    mov ecx, message ; message is the buffer
    mov edx, message_len ; and supply len
    int 0x80  ; int is interrupt
    mov eax, 0x1 
    mov ebx, 0 
    int 0x80
section .data:
    message: db "Hello World!", 0xA ; 0xA new line character
    message_len equ $-message ; equ means equal to "$-" means length of variable