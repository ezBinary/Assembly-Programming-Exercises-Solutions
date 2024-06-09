
TITLE Programming Exercises Chapter 9 : Letter Matrix (Ch9_Ex10_Letter_Matrix.asm)

; Program Desscription: Programming Exercises Chapter 9, Exercise 10

INCLUDE Irvine32.inc

.data
RowSize = 4
ColumnNum = 4

vArray          BYTE    "a", "e", "i", "o", "u",0

cArray          BYTE    "b", "c", "d", "f", "g", 
                        "h", "j", "k", "l", "m", 
                        "n", "p", "q", "r", "s", 
                        "t", "v", "w", "x", "y", 
                        "z",0

.code
    ;----------------------------------------------------------                       
    ; LetterMatrix: generates a four by four matrix of randomly
    ;               chosen capital letters.
    ;
    ; Receives:    vowelArray: PTR BYTE,
    ;              vowelArray_size: DWORD,
    ;              consonantsArray: PTR BYTE,
    ;              consonantsArray_size: DWORD
    ;
    ; Returns:     Nothing
    ; Calls:       Nothing
    ;----------------------------------------------------------
    LetterMatrix PROC,
        vowelArray: PTR BYTE,
        vowelArray_size: DWORD,
        consonantsArray: PTR BYTE,
        consonantsArray_size: DWORD

        pushad
        pushfd

        call Randomize
        mov ecx,ColumnNum
        
        L4:
            push ecx
            mov ecx,4
        L3:
            mov eax,2
            call RandomRange
            cmp eax,0
            jne L1

            mov esi, vowelArray
            mov eax, vowelArray_size
            dec eax
            call RandomRange
            add esi,eax
            mov BYTE PTR al, [esi]
            ;mov matrixArray, [al]
            call WriteChar
            jmp L2

            L1:
                mov edi, consonantsArray
                mov eax, consonantsArray_size
                dec eax
                call RandomRange
                add edi, eax
                mov BYTE PTR al, [edi]
                ;mov matrixArray, [al]
                call WriteChar
            L2:
                mov al, ' '
                call WriteChar
                
        LOOP L3
        call Crlf
        pop ecx
        LOOP L4

        popfd
        popad

        ret
    LetterMatrix ENDP

    MAIN PROC
        
        mov ecx,4
        L1:
            INVOKE LetterMatrix, ADDR vArray, LENGTHOF vArray, ADDR cArray, LENGTHOF cArray
        LOOP L1
	    exit
    MAIN ENDP

END main