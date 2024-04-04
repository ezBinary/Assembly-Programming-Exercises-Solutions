TITLE Programming Exercises Chapter 4 : Copying a Word Array to a DoubleWord Array     (Ch4_Ex4_CopyingaWordArraytoaDoubleWordArray.asm)

; Program Desscription: Programming Exercises Chapter 4, Exercise 4
; Author: ezBinary
; Creation Date: 3.april.2024 

INCLUDE Irvine32.inc

.data
    SrcArray     WORD    10h,20h,30h,40h,50h,60h
    srcArrayLen = LENGTHOF SrcArray
    DstArray     DWORD   srcArrayLen DUP(0)
.code
    MAIN PROC
        mov esi,0
        mov edi,0
        mov eax,0
        mov ecx,srcArrayLen

        L1:
            mov ax,SrcArray[esi]
            mov DstArray[edi],eax

            add esi,TYPE SrcArray
            add edi,TYPE DstArray
        LOOP L1


        call DumpRegs
        exit
    MAIN ENDP
end MAIN