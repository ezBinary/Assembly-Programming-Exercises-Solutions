TITLE Programming Exercises Chapter 5 : Simple Addition 2 (Ch5_Ex4_SimpleAddition(2).asm)

; Program Desscription: Programming Exercises Chapter 5, Exercise 4
; Author: ezBinary
; Creation Date: 6.april.2024 

INCLUDE Irvine32.inc
      
.data
COUNT = 3d
DEFAULT_ROW = 12
DEFAULT_COLUMN = 35

prompt      BYTE    "Enter two 32-bit signed integers: ",0
row_val     BYTE    DEFAULT_ROW
column_val  BYTE    DEFAULT_COLUMN
.code

    ;----------------------------------------------------------
    ; PromtTwoIntegers: 
    ;
    ; Receives: Nothing
    ; Returns:  EAX = integer value nr.1
    ;           EBX = integer value nr.2
    ; Calls: WriteString, ReadInt,GotoXY
    ;----------------------------------------------------------
    PromtTwoIntegers PROC USES edx
        
        mov	dh,DEFAULT_ROW
	    mov	dl,DEFAULT_COLUMN

        mov row_val, dh
        mov column_val, dl
        call GotoXY
        inc row_val

        mov edx, OFFSET prompt
        
        call WriteString

        mov	dh,row_val
	    mov	dl,35
        call GotoXY
        inc row_val

        call ReadInt
        mov ebx,eax

        mov dh,row_val
        call GotoXY

        call ReadInt

        inc row_val

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
    ;----------------------------------------------------------
    ; PrintSum: Calling the PROCs to prompt and print the result
    ;
    ; Receives: Nothing
    ;           
    ; Returns:  Nothing
    ; Calls:    Clrscr, PromtTwoIntegers, GotoXY, WriteInt
    ;           WaitMsg
    ;----------------------------------------------------------
    PrintSum PROC USES edx
        call Clrscr
        call PromtTwoIntegers   
        call Sum
        
        mov	dh,row_val
	    mov	dl,column_val
        call GotoXY
        inc row_val

        call WriteInt

        mov	dh,row_val
        call GotoXY
        inc row_val

        call WaitMsg

        ret
    PrintSum ENDP
    MAIN PROC
        mov ecx,COUNT
        L1:
            call PrintSum
        LOOP L1
        exit
    MAIN ENDP

end MAIN