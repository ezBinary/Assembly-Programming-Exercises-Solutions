TITLE Programming Exercises Chapter 7 : Packed Decimal Conversion  (Ch7_Ex3_PackedDecimalConversion.asm)

; Program Desscription: Programming Exercises Chapter 7, Exercise 3
; Author: ezBinary
; Creation Date: 17.april.2024 

INCLUDE Irvine32.inc
STRSIZE = 8
.data
PacDec1      DWORD       00000012h                  ; decimal 00000012
PacDec2      DWORD       34123098h                  ; decimal 34123098
PacDec3      DWORD       10000000h                  ; decimal 10000000
PacDec4      DWORD       03030303h                  ; decimal 03030303
PacDec5      DWORD       02000000h                  ; decimal 02000000


AscDec1      BYTE        TYPE DWORD*2 DUP(0),0      ; each dec = 1 byte ascii
AscDec2      BYTE        TYPE DWORD*2 DUP(0),0      
AscDec3      BYTE        TYPE DWORD*2 DUP(0),0      
AscDec4      BYTE        TYPE DWORD*2 DUP(0),0     
AscDec5      BYTE        TYPE DWORD*2 DUP(0),0 

.code

    ;----------------------------------------------------------                       
    ; PacketToAsc:get packed decimal, print ASCII
    ;             decimal digits.
    ;
    ; Receives:   EBX = Pakced deicmal integers.
    ;             EDX = Offset to string array
    ;             ECX = Length of string array - 1
    ;
    ; Returns:    EDX = Offset of ASCII decimal digits
    ; Calls:      Nothing
    ;----------------------------------------------------------
    PacketToAsc PROC USES EAX EDX EBX ECX
        xor eax,eax

        L1:
            mov al,bl
            and al,0Fh
            or  al,30h
            mov [edx + ecx - 1],al
            shr ebx,4                   ; shift 1 hex size

        LOOP L1

        ret
    PacketToAsc ENDP

    MAIN PROC
        call Clrscr

        mov ebx,PacDec1
        mov edx,OFFSET AscDec1
        mov ecx,STRSIZE
        call PacketToAsc
        call WriteString
        call Crlf

        mov ebx,PacDec2
        mov edx,OFFSET AscDec2
        mov ecx,STRSIZE
        call PacketToAsc
        call WriteString
        call Crlf

        mov ebx,PacDec3
        mov edx,OFFSET AscDec3
        mov ecx,STRSIZE
        call PacketToAsc
        call WriteString
        call Crlf

        mov ebx,PacDec4
        mov edx,OFFSET AscDec4
        mov ecx,STRSIZE
        call PacketToAsc
        call WriteString
        call Crlf

        mov ebx,PacDec5
        mov edx,OFFSET AscDec5
        mov ecx,STRSIZE
        call PacketToAsc
        call WriteString
        call Crlf

        exit
    MAIN ENDP

end MAIN