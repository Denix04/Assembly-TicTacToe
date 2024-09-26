%include "./compile/asm_io.inc"

section .data
    ;plays db 51,50,49,48,55,54,53,52,57,56
    welcome db  "Welcome to the fastest Tic-Tac-Toe.",10,0
    plays times 9 dw 32

section .text
    global CMAIN
    extern _print_board             ;board.asm
    extern _get_position,who_play    ;aux.asm

CMAIN:
    enter 0,0
    pusha

    mov     eax,welcome
    call    print_string

    mov     ecx,0
    xor     edx,edx ; for turn
    xor     eax,eax

Game_loop:
    call    get_position
    call    who_play
    mov     word [plays + eax*2],dx
    call    print_board

    mov     ebx,ecx
    inc     ecx
    inc     edx
    sub     ebx,8
    jl      Game_loop

    popa
    leave
    xor     eax,eax
    ret


; Function print_board

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

; Function

get_position:
    enter   0,0
    push    ecx

    cmp     ecx,0
    je  firs_play

ask_again:
    call    _get_position
    cmp     word [plays + eax*2],32
    jne ask_again
    jmp end

firs_play:
    call    _get_position

end:
    pop     ecx
    leave
    ret
