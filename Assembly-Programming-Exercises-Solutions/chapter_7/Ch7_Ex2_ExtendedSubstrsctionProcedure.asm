TITLE Programming Exercises Chapter 7 : Extended Substrsction Procedure     (Ch7_Ex2_ExtendedSubstrsctionProcedure.asm)

; Program Desscription: Programming Exercises Chapter 7, Exercise 2
; Author: ezBinary
; Creation Date: 16.april.2024 

INCLUDE Irvine32.inc

.data
val1   BYTE    0AAh,0BBh,0CCh,0DDh,0FFh,0AAh,0BBh,0CCh,0DDh,0FFh
val2   BYTE    11h,11h,11h,11h,11h,11h,11h,11h,11h,11h
res    BYTE    11 DUP(?)    ; 10 + 1 -> res<0

.code
    ;----------------------------------------------------------                       
    ; Extended_Sub: Subtracts two extended integers.
    ; 
    ; Receives:   ECX = Length of the biggest(size) array
    ;             ESI = Offset of first array
    ;             EDI = Offset of second array
    ;             EDX = Offset of result array
    ;           
    ; Returns:    Nothing
    ; Calls:      Nothing
    ;----------------------------------------------------------
    Extended_Sub PROC
        pushad
        clc                 ; CF = 0
        L1:
            mov al,[esi]
            sbb al,[edi]    ; sub and sub with carry flag

            pushfd          ; save flags on stack
            mov [edx],al    ; save first byte sub
            inc esi
            inc edi
            inc edx

            popfd
        LOOP L1
        mov BYTE PTR[edx],0
        sbb BYTE PTR[edx],0 ; sub the last byte of result with carry 

        popad
        ret
    Extended_Sub ENDP

    ;----------------------------------------------------------                       
    ; PrintResults: Print the result.
    ; 
    ; Receives:   ECX = Length of result array
    ;             ESI = Offset of result array
    ;           
    ; Returns:    Nothing
    ; Calls:      WriteHexB
    ;----------------------------------------------------------
    PrintResults PROC USES esi ecx ebx eax
        add esi,ecx
        sub esi,TYPE BYTE   ; point to the last number of array 
        mov ebx,TYPE BYTE

        L1:
            mov al,[esi]
            call WriteHexB
            sub esi,TYPE BYTE
        LOOP L1
        ret
    PrintResults ENDP

    MAIN PROC
        call Clrscr
        
        mov esi,OFFSET val1
        mov edi,OFFSET val2
        mov edx,OFFSET res
        mov ecx,LENGTHOF val1
        call Extended_Sub

        mov esi,OFFSET res
        mov ecx,LENGTHOF res
        call PrintResults

        exit
    MAIN ENDP

end MAIN