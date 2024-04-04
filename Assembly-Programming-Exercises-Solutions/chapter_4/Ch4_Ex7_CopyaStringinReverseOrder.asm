TITLE Programming Exercises Chapter 4 : Copy a String in Reverse Order     (Ch4_Ex7_CopyaStringinReverseOrder.asm)

; Program Desscription: Programming Exercises Chapter 4, Exercise 7
; Author: ezBinary
; Creation Date: 3.april.2024 

INCLUDE Irvine32.inc

.data
source  BYTE    "This is the source string",0
target  BYTE    SIZEOF source DUP('#')
.code
    MAIN PROC
        
        mov esi,OFFSET source + SIZEOF source - 1
        mov edi,OFFSET target

        mov ecx, SIZEOF source
        L1:
            mov al,[esi]
            mov [edi],al

            inc edi
            dec esi
        LOOP L1

        call DumpRegs
        exit

    MAIN ENDP
end MAIN