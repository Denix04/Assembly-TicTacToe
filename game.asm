%include "./compile/asm_io.inc"

section .text
    global _win_play

_win_play:
    enter   0,0
    pusha

    popa
    leave
    ret
