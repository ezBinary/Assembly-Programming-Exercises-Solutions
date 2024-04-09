TITLE Programming Exercises Chapter 5 : Finding Multiple of K      (Ch5_Ex11_FindingMultiplesofK.asm)

; Program Desscription: Programming Exercises Chapter 5, Exercise 11
; Author: ezBinary
; Creation Date: 9.april.2024 

INCLUDE Irvine32.inc

.data
N = 50
str_display     BYTE        "Multiples of ",0
array	        BYTE		N DUP(0)
.data?
K               DWORD       ?

.code

    ;----------------------------------------------------------                        
    ; PrintMultiples: 
    ; 
    ; Receives:  ESI= offset of array
    ;            EBX= K
    ;            ECX= lengthof array
    ;
    ; Returns:  Nothing
    ; Calls:    WriteDec, Crlf
    ;----------------------------------------------------------
    PrintMultiples PROC USES EAX ESI ECX EBX
        
        mov eax,1
        L1:
            cmp	ebx,eax
            jne F1
            mov	BYTE PTR [esi],1
            add	ebx,K

            call WriteDec
            call Crlf

            F1:
	            inc	eax
	            add	esi,TYPE array
        LOOP L1

        ret
    PrintMultiples ENDP
    
    ;----------------------------------------------------------                        
    ; DisplayMsg: 
    ; 
    ; Receives:       
    ; Returns:  
    ; Calls:    WriteString, WriteDec, Crlf
    ;----------------------------------------------------------
    DisplayMsg PROC USES EDX
        mov edx,OFFSET str_display
        call WriteString

        mov eax,K
        call WriteDec
        call	Crlf

        ret
    DisplayMsg ENDP

    MAIN PROC
        mov esi,OFFSET array
        mov ecx,N
        mov K,2d
        mov ebx,K

        call DisplayMsg
        call PrintMultiples
        call Crlf

        mov K,3d
        mov ebx,K
        

        call DisplayMsg
        call PrintMultiples
        call Crlf

        exit
    MAIN ENDP

end MAIN