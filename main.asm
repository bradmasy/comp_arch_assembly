section    .text        ; this means the code is following,
   global _start        ; must be declared for using gcc
    
_start:                    ; tell linker entry point, the entry point of the program
   mov ecx, 10              ; mov = move register // this is the end point of the loop. stopping just before ie: 1 < 10 this register contains the loop count
   mov eax, '1'            ; first column is called labels, second column registers 
    
l1:
   mov [num], eax  ; move eax to [num] // thought is square brackets "[]" defines a variable , accesses memory? we are storing the value of "eax" at memory location [num]
   mov eax, 4      ; move 4 to eax, 4 is the bytesize for an int

    ; in the two lines above, we are declaring a variable name [num] and the byte size is 4 bytes for an integer

   mov ebx, 1      ; move 1 to ebx
   push ecx        ; stores ecx on the stack?
    
   mov ecx, num       ; move num to ecx register
   mov edx, 1         ; 
   int 0x80           ; makes a system
    
   mov eax, [num]     ; move num into eax
   sub eax, '0'       ; subtract 0 from eax
   inc eax            ; increment eax, add 1 
   add eax, '0'       ; add 0 to eax
   pop ecx            ; decrementing the ecx register which holds the loop count( 10 -> 9 -> 8 -> 7 ... 1)
   loop l1            ; continue....
    
   mov eax,1             ;system call number (sys_exit)
   int 0x80              ;call kernel
section    .bss
num resb 1