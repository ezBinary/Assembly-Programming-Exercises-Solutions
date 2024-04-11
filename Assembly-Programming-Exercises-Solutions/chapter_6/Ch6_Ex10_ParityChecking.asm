TITLE Programming Exercises Chapter 6 : Parity Checking     (Ch6_Ex10_ParityChecking.asm)

; Program Desscription: Programming Exercises Chapter 6, Exercise 10
; Author: ezBinary
; Creation Date: 11.april.2024 

INCLUDE Irvine32.inc

.data
array1	BYTE	5,5,5,5,5,5,5,5,5,5,5,5 ; even
array2	BYTE	1,5,5,5,5,5,5,5,5,5,5,5 ; odd
.code
    ;----------------------------------------------------------                       
    ; CheckParity: Calculates the parity of the bytes 
    ;              in an array
    ;
    ; Receives:  ESI = Offset to the array
    ;            ECX = Length of the array
    ;
    ; Returns:   EAX = True -> if the parity is even
    ;            EAX = False-> if the parity is odd
    ; Calls:     Nothing
    ;----------------------------------------------------------
    CheckParity PROC USES ECX ESI
        mov al,[esi]
        dec		ecx
        L1:
            inc esi
            xor al,[esi]
        LOOP L1


        jnp NoParity
		
        mov eax,TRUE
        jmp return
		
        NoParity: mov eax,FALSE
        return:  
            ret
    CheckParity ENDP

    MAIN PROC
        call ClrScr
        xor eax,eax

        mov esi,OFFSET array1
        mov ecx,LENGTHOF array1
        call CheckParity   
        
        call DumpRegs

        mov esi,OFFSET array2
        mov ecx,LENGTHOF array2
        call CheckParity

        call DumpRegs

        exit
    MAIN ENDP

end MAIN