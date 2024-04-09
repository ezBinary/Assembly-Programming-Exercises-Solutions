TITLE Programming Exercises Chapter 5 : Fibonacci Generator      (Ch5_Ex10_FibonacciGenerator.asm)

; Program Desscription: Programming Exercises Chapter 5, Exercise 10
; Author: ezBinary
; Creation Date: 9.april.2024 

INCLUDE Irvine32.inc
.data
    FiboNumber = 47
    FiboNum1        DWORD        1
    FiboNum2        DWORD        1
    FiboResult      DWORD        0

.data?
    FiboArray      DWORD        FiboNumber DUP(?)

.code

    ;----------------------------------------------------------                        
    ; FibonacciGenerator: Recursive procedure using loop instruction to
    ;            control it
    ;
    ; Receives: ESI = Offset array
    ;           ECX = Fibinacci number series
    ; Returns:  EAX = last number of array
    ; Calls:    Nothing
    ;----------------------------------------------------------
    FibonacciGenerator PROC USES ESI ECX EBX EDI

        sub ecx,2
        mov edi,esi
        mov eax,FiboNum1
        mov [esi], eax

        add esi,TYPE FiboArray

        mov eax,FiboNum2
        mov [esi],eax

        L1:
            add eax,[edi]
            add esi,TYPE FiboArray
            add edi,TYPE FiboArray
            mov [esi],eax
        LOOP L1

        mov FiboResult, eax

	    ret
    FibonacciGenerator ENDP

    ;----------------------------------------------------------                        
    ; PrintDecimalArray: Print an Array values
    ;
    ; Receives: ESI = Offset array
    ;           EBX = type of array
    ;           ECX = length of array
    ; Returns:  Nothing
    ; Calls:    WriteDec, Crlf
    ;----------------------------------------------------------
    PrintDecimalArray PROC USES EAX ESI ECX EBX
        L1:
            mov eax, [esi]
            call WriteDec
            call Crlf
            add esi, ebx 
        LOOP L1
        ret
    PrintDecimalArray ENDP

    MAIN PROC
        mov esi, OFFSET FiboArray
        mov ebx, TYPE FiboArray
        mov ecx, FiboNumber
        call FibonacciGenerator

        call PrintDecimalArray

        exit
    MAIN ENDP

end MAIN