TITLE Programming Exercises Chapter 4 : Converting from Big Endian to Little Endian     (Ch4_Ex1_ConvertingFromBigEndianToLittleEndian.asm)

; Program Desscription: Programming Exercises Chapter 4, Exercise 1
; Author: ezBinary
; Creation Date: 3.april.2024 

INCLUDE Irvine32.inc

.data
    bigEndian       BYTE    12h,34h,56h,78h     ; 12h 34h 56h 78h --DWORD--> 78563412h
    littleEndian    DWORD   ?                   ; 78h 56h 34h 12h --DWORD--> 12345678h
.code
    MAIN PROC
        mov esi,0
        mov eax,0
        mov ecx,LENGTHOF bigEndian                  ; ecx = 4
        
        L1:                                         ;ecx = 4 3 2 1
            mov al, BYTE PTR bigEndian[ecx-1]       ;bE  = 3 2 1 0
            mov BYTE PTR littleEndian[esi],al       ;lE  = 0 1 3 4
            inc esi                                 
        LOOP L1
        
        mov eax, DWORD PTR [littleEndian]           ;littleEndian on eax
        mov ebx, DWORD PTR [bigEndian]              ;bigEndian on ebx
        call DumpRegs                               ;check the results

    MAIN ENDP
end MAIN
