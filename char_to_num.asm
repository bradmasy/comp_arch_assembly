global _start

section .text:


_start:



section .data:
    message: db "enter a character:"
    message_len equ $-message