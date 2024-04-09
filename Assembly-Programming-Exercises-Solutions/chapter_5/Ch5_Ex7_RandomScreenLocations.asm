TITLE Programming Exercises Chapter 5 : Random Screen Locations      (Ch5_Ex7_RandomScreenLocations.asm)

; Program Desscription: Programming Exercises Chapter 5, Exercise 7
; Author: ezBinary
; Creation Date: 8.april.2024 

INCLUDE Irvine32.inc
LCOUNT = 100
.data
char    BYTE    'A'

.code

    ;----------------------------------------------------------                        
    ; RandomScreenLocations: 
    ;
    ; Receives: AL = Rows
    ;           DL = Column
    ; Returns:  Nothing
    ; Calls:    RandomRange, Gotoxy, WriteChar
    ;----------------------------------------------------------
    RandomScreenLocations PROC USES edx eax
	    movzx eax,al
	    call RandomRange
	    mov	dh,al               ; set row

	    movzx eax,dl
	    call RandomRange
	    mov	dl,al               ; set column

	    call Gotoxy

	    mov	al,char
	    call WriteChar

	    ret
    RandomScreenLocations ENDP

    MAIN PROC
        call Clrscr
        call GetMaxXY

        mov ecx,LCOUNT
        L1:
	        call RandomScreenLocations
            mov eax,100
            call Delay
        LOOP L1

        call Crlf
        exit
    MAIN ENDP

end MAIN