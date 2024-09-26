%include "./compile/asm_io.inc"

section .data
    xcord db    10,"    A   B   C  ",0
    ycord db   "210"
    HBoard db   10,"   --- --- --- ",10,0
    middleSeparator db   " | ",0
    separator db   "| ",0

section .text
    global _print_board

_print_board:
    enter 0,0
    pusha

    mov     eax,xcord
    call    print_string

    mov     ecx,3
    mov     ebx,12
for1:
    mov     eax,HBoard
    call    print_string
    mov     al,[ycord+ ecx-1]
    call    print_char
    mov     al,32
    call    print_char
    mov     eax,separator
    call    print_string

    push    ecx
    mov     ecx,3
for2:
    xor     eax,eax
    mov     ax,[ebp + ebx*2]
    dec     ebx
    call    print_char
    mov     eax,middleSeparator
    call    print_string

    loop for2

    pop     ecx
    loop for1

    mov     eax,HBoard
    call    print_string

    popa
    leave
    ret
