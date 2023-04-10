section .data
  prompt1 db "Digite o primeiro número: ", 0
  prompt2 db "Digite o segundo número: ", 0
  result db "O resultado da soma é: %d", 10, 0
  
section .bss
  num1 resd 1
  num2 resd 1
  
section .text
  global _start
  
_start:
  ; Escreve o prompt1 na tela
  mov eax, 4
  mov ebx, 1
  mov ecx, prompt1
  mov edx, 24
  int 0x80
  
  ; Lê o primeiro número digitado pelo usuário
  mov eax, 3
  mov ebx, 0
  mov ecx, num1
  mov edx, 4
  int 0x80
  
  ; Escreve o prompt2 na tela
  mov eax, 4
  mov ebx, 1
  mov ecx, prompt2
  mov edx, 25
  int 0x80
  
  ; Lê o segundo número digitado pelo usuário
  mov eax, 3
  mov ebx, 0
  mov ecx, num2
  mov edx, 4
  int 0x80
  
  ; Soma os dois números e armazena em num1
  mov eax, [num1]
  add eax, [num2]
  mov [num1], eax
  
  ; Escreve o resultado na tela
  mov eax, 1
  mov ebx, 1
  mov ecx, result
  mov edx, 22
  push dword [num1]
  call printf
  add esp, 4
  
  ; Termina o programa
  mov eax, 1
  xor ebx, ebx
  int 0x80
