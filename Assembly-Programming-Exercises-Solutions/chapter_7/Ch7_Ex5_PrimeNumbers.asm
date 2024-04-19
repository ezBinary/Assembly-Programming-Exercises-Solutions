TITLE Programming Exercises Chapter 7 : Prime Numbers  (Ch7_Ex5_PrimeNumbers.asm)

; Program Desscription: Programming Exercises Chapter 7, Exercise 5
; Author: ezBinary
; Creation Date: 17.april.2024 

INCLUDE Irvine32.inc

max = 1000
radical_max = 31    
.data
boolArray       BYTE        max DUP(1)
.code


    ;----------------------------------------------------------                       
    ; DisplayPrimeNumbers:  print all prime number using 
    ;                       Sieve of Eratosthenes methods
    ; 
    ; Receives:   Nothing
    ;
    ; Returns:    Nothing
    ; Calls:      WriteDec,Crlf
    ;----------------------------------------------------------
    DisplayPrimeNumbers PROC
        pushad

        mov esi,0
        mov ecx,max
        L1:
            cmp BYTE PTR boolArray[esi],1
            jne GoLoop
            mov eax,esi
            call WriteDec
            call Crlf
            GoLoop:
            inc esi
        LOOP L1

        popad
        ret
    DisplayPrimeNumbers ENDP

    MAIN PROC
        mov	ecx,max
        mov	WORD PTR [boolArray],0              ; index 0 and 1 is false.
        mov esi,0
        L1:
            inc esi
            cmp esi,radical_max

            ja PrimeDone

            cmp	boolArray[esi],1
            jne L1

            mov edi,esi
            imul edi,edi
            L2:
                cmp edi,max
                jae L1                          ; higher than max number (out of range)
                mov boolArray[edi],0            ; clear the byte because it is not prime       
                add edi,esi                     ; i^2+i
                jmp L2
        LOOP L1
        PrimeDone:
        call DisplayPrimeNumbers
        exit
    MAIN ENDP

end MAIN