
global _start ; setting the starting point of the program, the program will start on this label
section .text: ; this identifies where all the code will be found, ie after this line.
_start: ; encountering the start of the program.
    mov eax, 0x4 ; use the write system call, system calls are in hexadecimal 0x defines its hex, this is system call 4, system call 4 is a system write.

    ; in the line above we tell the system we are going to do a write/print.
    ; to perform a system write we need 3 things: int fileDescriptor, const void *buffer, size_t bytesNeeded
    ; there are 3 file descriptors: stdin(standard input), stdout(standard output), stderr(standard error).

    mov ebx, 1 ; 1 signifies this is standard output                               |
    mov ecx, message ; message is the buffer                                       | this section must be provided to the exact registers in order to perform this system call
    mov edx, message_len ; and supply len, register edx as part of system write    |
                                                                             
    int 0x80  ; int is interrupt, this interruption executes the system call previous aka the print

    mov eax, 0x1 ; 0x1 = 1, this is the system exit call
    mov ebx, 0 ; 0 error free code, like in c, return 0;
    int 0x80 ; invoking
section .data: ; defines variables
    message: db "Hello World!", 0xA ; 0xA new line character, db = data byte, allocates space to fill string
    message_len equ $-message ; equ means equal to "$-" means length of variable