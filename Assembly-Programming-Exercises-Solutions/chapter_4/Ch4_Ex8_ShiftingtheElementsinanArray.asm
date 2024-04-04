TITLE Programming Exercises Chapter 4 : Shifting the Elements in an Array     (Ch4_Ex8_ShiftingtheElementsinanArray.asm)

; Program Desscription: Programming Exercises Chapter 4, Exercise 8
; Author: ezBinary
; Creation Date: 3.april.2024 

INCLUDE Irvine32.inc

.data
Array   DWORD   10h,20h,30h,40h
.code
    MAIN PROC
        
        mov esi,SIZEOF Array - TYPE Array
        mov eax,Array[esi]
        mov ecx,LENGTHOF Array - 1

        L1:
            sub esi, TYPE Array
            xchg eax, Array[esi]
            mov Array[esi + TYPE Array],eax
            mov eax,Array[esi]
        LOOP L1
            
        call DumpRegs
        exit

    MAIN ENDP
end MAIN