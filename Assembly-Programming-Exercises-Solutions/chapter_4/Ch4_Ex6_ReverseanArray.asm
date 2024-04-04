TITLE Programming Exercises Chapter 4 : Reverse an Array     (Ch4_Ex6_ReverseanArray.asm)

; Program Desscription: Programming Exercises Chapter 4, Exercise 6
; Author: ezBinary
; Creation Date: 3.april.2024 

INCLUDE Irvine32.inc

.data
    ;Array   BYTE    10h,20h,30h                            ; array size and type is flexible in this code
    ;Array   WORD    10h,20h,30h,40h,50h,60h
    ;Array   DWORD   10h,20h,30h,40h,50h,60,70h,80h,90h
    Array   QWORD    10h,20h,30h,40h,50h,60h,70h

    ArraySize = LENGTHOF Array
.code
    MAIN PROC
        mov eax,0
        mov esi,eax
        mov edi,ArraySize-1
        mov ecx,ArraySize/2
        L1:
            
            mov al, BYTE PTR Array[esi]
            xchg al,BYTE PTR Array[edi*TYPE Array]
            mov BYTE PTR Array[esi],al
            ADD  esi,TYPE Array
            dec edi

        LOOP L1

        call DumpRegs
        exit

    MAIN ENDP
end MAIN