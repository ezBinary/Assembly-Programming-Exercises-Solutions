TITLE Programming Exercises Chapter 7 : Display ASCII Decimal     (Ch7_Ex1_DisplayASCIIDecimal.asm)

; Program Desscription: Programming Exercises Chapter 7, Exercise 1
; Author: ezBinary
; Creation Date: 15.april.2024 

INCLUDE Irvine32.inc

DECIMAL_OFFSET = 5
.data
decimal_one     BYTE    "100123456789765"

.code
    ;----------------------------------------------------------                       
    ; WriteScaled:Outputs the decimal array with a decimal point
    ; 
    ; Receives:   ECX = Length of decimal array
    ;             ESI = Offset of decimal array
    ;             EBX = DECIMAL_OFFSET
    ;           
    ; Returns:    Nothing
    ; Calls:      WriteChar
    ;----------------------------------------------------------
    WriteScaled PROC
        pushad
        
        push ecx
        sub ecx,ebx             ; decimal_one lenghth - DECIMAL_OFFSET
        mov ebx,ecx
        pop ecx

        mov edi,-1

        inc ecx

        L1:
            inc edi
            cmp edi,ebx
            je DOT

            mov al,[esi]
            call WriteChar
            jmp R

            DOT:
	            mov	al,'.'
	            call WriteChar
                jmp G
            R:    
                inc esi
            G:
        LOOP L1

        popad
        ret
    WriteScaled ENDP

    MAIN PROC
        call Clrscr

        mov esi,OFFSET decimal_one
        mov ecx,LENGTHOF decimal_one
        mov ebx,DECIMAL_OFFSET

        call WriteScaled
        call Crlf

        exit
    MAIN ENDP

end MAIN
