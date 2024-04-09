TITLE Programming Exercises Chapter 5 : Color Matrix      (Ch5_Ex8_ColorMatrix.asm)

; Program Desscription: Programming Exercises Chapter 5, Exercise 8
; Author: ezBinary
; Creation Date: 8.april.2024 

INCLUDE Irvine32.inc

X_len = 16
Y_len = 16

.data
char    BYTE   'A'

.code

    ;----------------------------------------------------------                        
    ; RandomScreenLocations: Print a char Color Matrix 16*16 
    ;
    ; Receives: Nothing
    ;           
    ; Returns:  Nothing
    ; Calls:    SetTextColor, WriteChar, Delay, Crlf
    ;----------------------------------------------------------
    PrintCallerMatrix PROC
        mov ecx,Y_len
        mov eax,0
        L1:
            push ecx

            mov ecx,X_len

            L2:
                push eax
                call SetTextColor

                mov al,[char]
                call WriteChar

                mov eax,100
                call Delay

                pop eax
                inc eax
            LOOP L2

            add	eax,16
            pop ecx

            call Crlf
        LOOP L1

        call Crlf
        mov	eax,lightGray + (black * 16)
        call SetTextColor

	    ret
    PrintCallerMatrix ENDP

    MAIN PROC
        call Clrscr
        call PrintCallerMatrix
        exit
    MAIN ENDP

end MAIN