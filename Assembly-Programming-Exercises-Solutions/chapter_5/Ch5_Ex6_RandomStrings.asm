TITLE Programming Exercises Chapter 5 : Random Strings      (Ch5_Ex6_RandomStrings.asm)

; Program Desscription: Programming Exercises Chapter 5, Exercise 6
; Author: ezBinary
; Creation Date: 8.april.2024 

INCLUDE Irvine32.inc

LCOUNT = 20
LEN_STR = 10

.data?
Gen_Str     BYTE    LEN_STR DUP(0)

.code

    ;----------------------------------------------------------                        
    ; GenRandomString: Generate random string
    ;
    ; Receives: ECX = String length
    ;           ESI = Pointer to an array of byte that will
    ;                 hold the random string.
    ; Returns:  EDX offset of generated string
    ; Calls:    RandomRange
    ;----------------------------------------------------------
    GenRandomString PROC USES ECX ESI EAX
    mov ecx,LEN_STR
    mov esi,OFFSET Gen_Str

    L1:
        mov eax,26
        call RandomRange
        add al,65
        mov [esi],al
        inc esi
    LOOP L1

    mov al,0
    mov BYTE PTR[esi],al
    mov edx, OFFSET Gen_Str
    ret
    GenRandomString ENDP

    MAIN PROC
        call Clrscr
        mov ecx,LCOUNT
        mov esi,OFFSET Gen_Str
        L1:
            call GenRandomString
            call WriteString
            call Crlf
        LOOP L1
        exit
    MAIN ENDP

end MAIN