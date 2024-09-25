%include "./compile/asm_io.inc"

section .data
    ;plays db 51,50,49,48,55,54,53,52,57,56
    plays times 9 dw 32

section .text
    global CMAIN
    extern _print_board 

CMAIN:
    enter 0,0
    pusha

    mov     ecx,0
    xor     eax,eax

Game_loop:
    call    read_char
    mov     word [plays + ecx*2],ax
    call    read_char
    call    print_board

    mov     ebx,ecx
    inc     ecx
    sub     ebx,8
    jl      Game_loop

    popa
    leave
    xor     eax,eax
    ret

print_board:
    enter   0,0
    pusha

    mov     ecx,0
push_plays:
    push    word [plays + ecx*2]

    mov     ebx,ecx
    inc     ecx
    sub     ebx,8
    jl push_plays

    call    _print_board

    mov     ecx,0
pop_plays:
    pop     ax

    mov     ebx,ecx
    inc     ecx
    sub     ebx,8
    jl pop_plays

    popa
    leave
    ret

