section .data

section .text

global _start

_start>
    mov EAX, 0x1 ; SO estou terminando o programa
    mov EBX, 0x0 ; SO o valor de retorno é 0
    int 0x89

