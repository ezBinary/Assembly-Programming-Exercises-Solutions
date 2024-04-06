TITLE Programming Exercises Chapter 5 : Simple Addition     (Ch5_Ex3_SimpleAddition(1).asm)

; Program Desscription: Programming Exercises Chapter 5, Exercise 3
; Author: ezBinary
; Creation Date: 6.april.2024 

INCLUDE Irvine32.inc
      
.data
prompt     BYTE    "Enter two 32-bit signed integers: ",0
mid        WORD     1235d
.code

    ;----------------------------------------------------------
    ; PromtTwoIntegers: 
    ;
    ; Receives: Nothing
    ; Returns:  EAX = integer value nr.1
    ;           EBX = integer value nr.2
    ; Calls: WriteString, ReadInt
    ;----------------------------------------------------------
    PromtTwoIntegers PROC USES edx
        
        mov	dh,12
	    mov	dl,35
        call GotoXY

        mov edx, OFFSET prompt
        
        call WriteString

        mov	dh,13
	    mov	dl,35
        call GotoXY

        call ReadInt
        mov ebx,eax

        inc dh      ; dh = 14
        call GotoXY

        call ReadInt

        ret
    PromtTwoIntegers ENDP

    ;----------------------------------------------------------
    ; Sum: Adding two integers
    ;
    ; Receives: EAX = integer value nr.1
    ;           EBX = integer value nr.2
    ; Returns:  EAX = EAX + EBX
    ; Calls:    Nothing
    ;----------------------------------------------------------
    Sum PROC
        add eax,ebx
        ret
    Sum ENDP

    MAIN PROC
        call Clrscr
        call PromtTwoIntegers   
        call Sum
        
        mov	dh,15
	    mov	dl,35
        call GotoXY

        call WriteInt

        exit
    MAIN ENDP

end MAIN