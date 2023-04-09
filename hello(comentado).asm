;   transforma o programa para linguagem de maquina
;       nasm -f elf64 hello.nasm
;   linkeditar - transformar o programa em linguagem de maquina para um executavel
;       ld -s -o hello hello.o
;       ./hello

section .data
    msg db 'Hello world!', 0xA ; define a mensagem a ser impressa
    msgC db 'Hello world!', 0xA ; define outra mensagem (não utilizada no código)
    tam equ $- msg ; calcula o tamanho da mensagem subtraindo o endereço da mensagem do endereço atual

section .text

global _start

_start:
    mov EAX, 0x4 ; coloca o valor 4 em EAX para indicar que é uma chamada ao sistema para imprimir
    mov EBX, 0x1 ; coloca o valor 1 em EBX para indicar que a saída padrão (stdout) deve ser usada
    mov ECX, msg ; coloca o endereço da mensagem em ECX para que seja impressa
    mov EDX, tam ; coloca o tamanho da mensagem em EDX
    int 0x80 ; faz a chamada ao sistema para imprimir a mensagem

    mov EAX, 0x1 ; coloca o valor 1 em EAX para indicar que é uma chamada ao sistema para terminar o programa
    mov EBX, 0x0 ; coloca o valor 0 em EBX para indicar que o valor de retorno é 0
    int 0x80 ; faz a chamada ao sistema para terminar o programa
