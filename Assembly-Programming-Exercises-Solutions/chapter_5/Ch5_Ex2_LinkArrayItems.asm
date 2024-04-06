TITLE Programming Exercises Chapter 5 : Link Array Items      (Ch5_Ex2_LinkArrayItems.asm)

; Program Desscription: Programming Exercises Chapter 5, Exercise 2
; Author: ezBinary
; Creation Date: 6.april.2024 

INCLUDE Irvine32.inc
      
.data
start       DWORD   1d
chars       BYTE    'H','A','C','E','B','D','F','G'
links       DWORD   0,4,5,6,2,3,7,0

.data?
outputArray BYTE    SIZEOF chars DUP(0)

.code

    ;----------------------------------------------------------
    ; CopyChar: Copy a char to outputArray
    ;
    ; Receives: DL = a char from chars array
    ;           ESI= location of outputArray
    ;           EAX= start value
    ; Returns:  Nothing
    ; Calls:    Nothing
    ;----------------------------------------------------------
    CopyChar PROC USES edx ;esi eax
        mov dl, chars[eax]
        mov outputArray[esi],dl

        ret
    CopyChar ENDP

    ;----------------------------------------------------------
    ; SetStart: Set the start value from links array
    ;
    ; Receives: EAX= current start value 
    ; Returns:  Nothing
    ; Calls:    Nothing
    ;----------------------------------------------------------
    SetStart PROC USES edx eax
        mov edx,TYPE links
        mul edx                 ; eax*=edx
        mov eax,links[eax]
        mov start, eax

        ret
    SetStart ENDP

    MAIN PROC
        mov ecx, SIZEOF chars
        mov esi,0

        L1:
            mov eax,start
            call CopyChar
            call SetStart
            inc esi
        LOOP L1

        mov edx, OFFSET outputArray
        call WriteString
        exit
    MAIN ENDP

end MAIN