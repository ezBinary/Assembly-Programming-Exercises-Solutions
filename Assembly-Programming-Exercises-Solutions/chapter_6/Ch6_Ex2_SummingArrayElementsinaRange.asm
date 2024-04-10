TITLE Programming Exercises Chapter 6 : Summing Array Elements in a Range      (Ch6_Ex2_SummingArrayElementsinaRange.asm)

; Program Desscription: Programming Exercises Chapter 6, Exercise 2
; Author: ezBinary
; Creation Date: 10.april.2024 

INCLUDE Irvine32.inc

.data
arrayDW     DWORD       10000h,20000h,30000h,40000h,50000h

.data?
J		    DWORD	    ?
K		    DWORD	    ?
.code

    ;----------------------------------------------------------                       
    ; SumArrayElementsInRange: The sum of all array elements
    ;                          falling within the range;
    ;                          J < vakye < K
    ;
    ; Receives:  ESI = Offset to a array
    ;            ECX = Length of the array
    ;            EBX = J (min value)
    ;            EDX = K (max value)
    ;
    ; Returns:  EAX = The sum of array element in range
    ; Calls:    Nothing
    ;----------------------------------------------------------
    SumArrayElementsInRange PROC USES esi ecx
    .data?
    sum     DWORD   ?

    .code
        xor eax,eax
        mov sum,0
        L1: 
            mov eax, [esi]

            cmp eax, ebx
            jle OutOfRange
            cmp eax, edx
            jge OutOfRange
            add sum,eax
            
        OutOfRange:
            mov eax,sum
            add esi, TYPE DWORD

        LOOP L1

        ret
    SumArrayElementsInRange ENDP

    MAIN PROC
        
        mov esi, OFFSET arrayDW
        mov ecx, LENGTHOF arrayDW
        mov [J], 20000h
        mov [K], 50000h
        mov ebx,J
        mov edx,K

        call SumArrayElementsInRange
        call WriteHex
        call Crlf

        mov [J],10000h
        mov [K],40000h
        mov ebx,J
        mov edx,K

        call SumArrayElementsInRange
        call WriteHex
        call Crlf

        exit
    MAIN ENDP

end MAIN