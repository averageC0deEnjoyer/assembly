#modified to end if the index pointing to ending address 
  .section .data

  data_items:
  .long 3,67,34,222,45,75,54,34,44,33,22,11,66


  .section .text

  .globl _start
_start:
  movl $0, %esi 
  movl data_items(,%esi,4), %eax
  movl %eax, %ebx

  movl $13, %edi
  movl %edi, %ecx

start_loop:
  cmpl %esi, %ecx
  je loop_exit
  incl %esi
  movl data_items(,%esi,4), %eax
  cmpl %ebx, %eax
  jle start_loop

  movl %eax, %ebx
  jmp start_loop

loop_exit:
  movl $1, %eax
  int $0x80
