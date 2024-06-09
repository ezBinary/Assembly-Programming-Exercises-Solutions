
TITLE Programming Exercises Chapter 9 : Binary Search (Ch9_Ex9_Binary_Search.asm)

; Program Desscription: Programming Exercises Chapter 9, Exercise 9
; Author: ezBinary
; Creation Date: 7.june.2024

INCLUDE Irvine32.inc

.data
Array1      DWORD    4,3,2,1,5,6,7,8,9

.code
    ;----------------------------------------------------------                       
    ; BinarySearch: Binary Search
    ; 
    ; Receives:    pArray:PTR DWORD,
    ;              Count: DWORD,
    ;              searchVal: DWORD
    ;
    ; Returns:     EAX = element number (if eax == -1 -> not founded)
    ; Calls:       Nothing
    ;----------------------------------------------------------
    BinarySearch PROC USES ebx edx esi edi ecx,
        pArray:PTR DWORD,
        Count: DWORD,
        searchVal: DWORD

        pushfd

        mov ebx,0           ; first
        mov edx,Count
        dec edx             ; last
        mov edi,searchVal
        mov esi,pArray
        
        L1:

            cmp ebx,edx
            jg notFounded
            mov eax,edx
            add eax,ebx
            shr eax,1       ; mid

            mov ecx,eax
            shl ecx,2
            mov ecx,[esi + ecx]
            cmp ecx,edi
            jge greaterOrequal

            mov ebx,eax
            inc ebx
            jmp again

            greaterOrequal:
                cmp ecx,edi
                jle lowerOrequal

            mov edx,eax
            dec edx
                jmp again
            lowerOrequal:
                jmp return
            notFounded:
                mov eax,-1
                jmp return
            again:
                jmp L1
         
        return:
            popfd
            ret
    BinarySearch ENDP

    MAIN PROC
        
        INVOKE BinarySearch, ADDR Array1, Lengthof Array1, 8

        call DumpRegs
        shl eax,2
        add eax,OFFSET Array1
        mov eax,[eax]
        call WriteDec

	    exit
    MAIN ENDP

END main