TITLE Programming Exercises Chapter 7 : Greatest Common Divisor (GCD)  (Ch7_Ex6_GreatestCommonDivisor(GCD).asm)

; Program Desscription: Programming Exercises Chapter 7, Exercise 6
; Author: ezBinary
; Creation Date: 24.april.2024 

INCLUDE Irvine32.inc

.data
x       DWORD   ?
y       DWORD   ?
.code


    ;----------------------------------------------------------                       
    ; abs:  Calculates the absolute value
    ; 
    ; Receives:   esi = Offset of var
    ;
    ; Returns:    Nothing
    ; Calls:      Nothing
    ;----------------------------------------------------------
    abs PROC
        push eax

        mov eax,[esi]

        test eax, eax
        jge return
        NEG eax
        mov [esi],eax

        return:
        pop eax
        ret
    abs ENDP

    ;----------------------------------------------------------                       
    ; GCD:  Calculates the GCD of two integers.
    ; 
    ; Receives:   Nothing
    ;
    ; Returns:    EAX = GCD of two int.
    ; Calls:      Nothing
    ;----------------------------------------------------------
    GCD PROC USES ESI EBX EDX
        mov esi,OFFSET x
        call abs
        mov eax,[esi]

        mov esi,OFFSET y
        call abs
        mov ebx,[esi]

        dowhile:
            xor edx,edx
            div ebx

            mov eax,ebx
            mov ebx,edx

            cmp ebx,0
        ja dowhile
        return:
        ret
    GCD ENDP


main PROC
	
    mov [x],256
    mov [y],16
    call GCD
    call WriteDec
    call Crlf

    mov [x],60000
    mov [y],60
    call GCD
    call WriteDec
    call Crlf

    mov [x],402
    mov [y],-201
    call GCD
    call WriteDec
    call Crlf

    mov [x],-72
    mov [y],12
    call GCD
    call WriteDec
    call Crlf

	exit
main ENDP

END main