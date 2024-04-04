TITLE Programming Exercises Chapter 4 : Summing the Gaps between Array Values     (Ch4_Ex3_SummingtheGapsbetweenArrayValues.asm)

; Program Desscription: Programming Exercises Chapter 4, Exercise 3
; Author: ezBinary
; Creation Date: 3.april.2024 

INCLUDE Irvine32.inc

.data
    _Array  DWORD   0,2d,5d,9d,10d
    GapSum  DWORD    0
.code
    MAIN PROC
        
        mov esi,1       
        mov edi,0
        mov ecx, (LENGTHOF _Array)-1       
        L1:
            mov eax, DWORD PTR _Array[esi*TYPE _Array]  
            sub eax, DWORD PTR _Array[edi*TYPE _Array] 
            add GapSum,eax
            inc esi
            inc edi
        LOOP L1
        mov eax,DWORD PTR [GapSum]
        call DumpRegs
        exit
    MAIN ENDP
end MAIN