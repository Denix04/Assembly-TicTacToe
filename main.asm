%include "./compile/asm_io.inc"

section .data
    ;plays db 51,50,49,48,55,54,53,52,57,56
    plays db 32,32,32,0,32,32,32,32,32,32

section .text
    global CMAIN
    extern _print_board 

CMAIN:
    enter 0,0
    pusha

    mov     ecx,9

Game_loop:
    call    read_char
    mov     [plays + ecx],al    
    call    read_char
    call    print_board

    loop Game_loop

    popa
    leave
    xor     eax,eax
    ret

print_board:
    enter   0,0
    pusha

    push    dword [plays]
    push    dword [plays + 4]
    push    word  [plays + 8]

    call    _print_board

    pop     eax
    pop     eax
    pop     ax

    popa
    leave
    ret

