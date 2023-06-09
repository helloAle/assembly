;   transforma o programa para linguagem de maquina
;       nasm -f elf64 hello.nasm
;   linkeditar - transformar o programa em linguagem de maquina para um executavel
;       ld -s -o hello hello.o
;       ./hello

section .data
    msg db 'Hello world!', 0xA
    tam equ $- msg
    msgC db 'Hello world!', 0xA

section .text

global _start

_start>
    mov EAX, 0x4
    mov EBX, 0x1
    mov ECX, msg
    mov EDX, tam
    int 0x80

    mov EAX, 0x1 ; SO estou terminando o programa
    mov EBX, 0x0 ; SO o valor de retorno é 0
    int 0x80

