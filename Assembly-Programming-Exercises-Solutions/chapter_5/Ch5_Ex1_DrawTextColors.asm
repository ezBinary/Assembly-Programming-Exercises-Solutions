TITLE Programming Exercises Chapter 5 : Draw Text Colors    (Ex5_1.asm)

; Program Desscription: Programming Exercises Chapter 5, Exercise 1
; Author: ezBinary
; Creation Date: 5.april.2024 

INCLUDE Irvine32.inc

.data
str_val     BYTE    "hello world",0
DefaultColor = lightgray + (black * 16)      ; default cli color
COUNT = 4d                                   ; number of times to print the string

.code
  
    ;----------------------------------------------------------
    ; DrawTextColor: Display the same string in four different 
    ;                colors using a loop.
    ;
    ; Receives: ECX = number of times to print the string
    ;           ESI = offset of the string
    ; Returns:  Nothing
    ; Calls: SetTextColor, WriteString, RandomRange, Crlf,
    ;        RandomRange
    ;----------------------------------------------------------
    DrawTextColor PROC USES ecx edx eax
        mov edx,esi
        mov eax,DefaultColor
        L1:
            add eax,01h                     ; increment by 1 or any other value to ensure differentiation.
            call SetTextColor               ; set the color
            call WriteString                ; print the string
            call Crlf
        LOOP L1

        mov eax, DefaultColor               
        call SetTextColor                   

        ret
    DrawTextColor ENDP

    MAIN PROC
        call Clrscr

        mov ecx,COUNT                       ; Args for DrawTextColor PROC
        mov esi,OFFSET str_val              ; Args for DrawTextColor PROC
        call DrawTextColor

        exit
    MAIN ENDP

end MAIN
