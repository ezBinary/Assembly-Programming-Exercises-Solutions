
TITLE Programming Exercises Chapter 8 : Greatest Common Divisor (Ch8_Ex7_GreatestCommonDivisor.asm)

; Program Desscription: Programming Exercises Chapter 8, Exercise 7
; Author: ezBinary
; Creation Date: 31.may.2024 

INCLUDE Irvine32.inc

.data


.code
    
    ;----------------------------------------------------------                       
    ; GCD:  Find the GCD of two integers using Euclid s algorithm.
    ; 
    ; Receives:     value1:DWORD
    ;               value2:DWORD
    ;
    ; Returns:      EAX = GCD
    ; Calls:        recursive
    ;----------------------------------------------------------
    GCD PROC USES ebx edx,
        value1: DWORD,
        value2: DWORD
        
        mov eax,value1
        mov ebx,value2

        cmp eax,ebx
        jnl go
        xchg eax,ebx
        go:
        sub eax,ebx
        cmp eax,ebx
        je return
        ja L2
        xchg ebx,eax
        L2:
        INVOKE GCD,eax,ebx
        return:
        ret
    GCD ENDP

    MAIN PROC

        INVOKE GCD,5,20
        call WriteDec
        call Crlf

        INVOKE GCD,24,18
        call WriteDec
        call Crlf

        INVOKE GCD,11,7
        call WriteDec
        call Crlf

        INVOKE GCD,432,226
        call WriteDec
        call Crlf

        INVOKE GCD,26,13
        call WriteDec
        call Crlf

	    exit
    MAIN ENDP
END main
