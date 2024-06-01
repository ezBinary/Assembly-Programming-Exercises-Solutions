TITLE Programming Exercises Chapter 7 : Bitwise Multiplication  (Ch7_Ex7_BitwiseMultiplication.asm)

; Program Desscription: Programming Exercises Chapter 7, Exercise 7
; Author: ezBinary
; Creation Date: 25.april.2024 

INCLUDE Irvine32.inc

.code


    ;----------------------------------------------------------                       
    ; BitwiseMultiply: Multiplies any unsigned 32-bit integers,
    ;                  using only shifting and addition.
    ; 
    ; Receives:   EAX = Multiplicand
    ;             EBX = Multiplier
    ;
    ; Returns:    EAX = Result 
    ; Calls:      Nothing
    ;----------------------------------------------------------
    BitwiseMultiply PROC USES EBX EDX   
        mov edx,eax
        mov eax,0
        LCmp: cmp ebx,0    ; if ebx is negative or zero the result is 0.
        jna L2
        L1:
            test ebx,1     ; check if that ebx is odd or even.
            jz EVEN_NUM
            add eax,edx
            EVEN_NUM:
                shl edx,1
                shr ebx,1
        jmp LCmp            ; repeat until the last bit of ebx is set and do the sum.
        L2:
        ret
    BitwiseMultiply ENDP

    MAIN PROC
	    
        mov eax,15
        mov ebx,3
        call BitwiseMultiply    
        call WriteDec

	    exit
    MAIN ENDP

END main