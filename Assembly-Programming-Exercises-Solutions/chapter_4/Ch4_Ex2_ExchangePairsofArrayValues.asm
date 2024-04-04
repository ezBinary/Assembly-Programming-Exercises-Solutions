TITLE Programming Exercises Chapter 4 : Exchange Pairs of Array Values     (Ch4_Ex2_ExchangePairsofArrayValues.asm)

; Program Desscription: Programming Exercises Chapter 4, Exercise 2
; Author: ezBinary
; Creation Date: 3.april.2024 

INCLUDE Irvine32.inc

.data
    EArray  BYTE    10h,20h,30h,40h,50h,60h ; --exchange--> 20h,10h,40h,30h,60h,50h
.code
    MAIN PROC
        
        mov esi,OFFSET EArray
        mov ecx,(LENGTHOF EArray)/2
        L1:
            mov al,[esi]
            xchg al,[esi+1]
            mov [esi],al
            add esi,2
        LOOP L1


        call DumpRegs
        exit
    MAIN ENDP
end MAIN