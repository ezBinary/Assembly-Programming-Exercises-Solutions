TITLE Programming Exercises Chapter 4 : Fibonacci Numbers      (Ch4_Ex5_FibonacciNumbers.asm)

; Program Desscription: Programming Exercises Chapter 4, Exercise 5
; Author: ezBinary
; Creation Date: 3.april.2024 

INCLUDE Irvine32.inc

.data
    FiboNumber = 7
    FiboNum1        BYTE        1
    FiboNum2        BYTE        1
    FiboResult      BYTE        0
    FiboArray       BYTE        FiboNumber DUP(0)
.code
    MAIN PROC
        
        mov esi,0
        mov ecx, FiboNumber-2                   ; -2 because we will set 2 value manualy
        mov al, FiboNum1
        mov FiboArray[esi],al                   ; set the first value of the fibonacci number
        inc esi
        mov al, FiboNum2
        mov FiboArray[esi],al                   ; set the 2nd value of the fibonacci number

        L1:                                     ; loop to calculate the first 7 values of fibo. num.
            add al, FiboArray[esi-1]
            inc esi
            mov FiboArray[esi],al
        LOOP L1
        
        movzx eax,FiboArray[FiboNumber-1]
        mov FiboResult, al

        call DumpRegs
        exit

    MAIN ENDP
end MAIN