%include "./compile/asm_io.inc"

section .data
    positionMsj db 10,"Give me a position (ej: b1): ",0
    O db 79
    X db 88

section .text
    global get_position
    global who_play

who_play:
    enter   0,0
    push    ecx

    and     ecx,1
    jz  even
    mov     edx,[O]
    jmp end

even:
    mov     edx,[X]

end:
    pop     ecx
    leave
    ret

get_position:
    enter   2,0
    push    ebx
    push    ecx
    push    edx

    xor     ebx,ebx
    xor     ecx,ecx
    xor     edx,edx

get_again:
    mov     eax,positionMsj
    call    print_string
    call    read_char
    mov     [ebp-2],ax
    call    read_int
    push    eax
    call    read_char
    pop     eax

    mov     bx,99
    sub     bx,[ebp-2]
    jl      get_again

    mov     cx,2
    sub     cx,bx
    mov     edx,3
    mul     edx
    add     eax,ecx

    pop     edx
    pop     ecx
    pop     ebx
    leave
    ret
