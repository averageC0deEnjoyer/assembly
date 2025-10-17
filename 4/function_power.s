.section .data

.section .text

.globl _start
_start:
  pushl $3
  pushl $2
  call power
  addl $8, %esp

  movl %eax, %ebx
  movl $1, %eax
  int $0x80

#use ebx for base, ecx for power
#want to use eax for the result
.type power, @function
power:
  pushl %ebp
  movl %esp, %ebp
  movl -8(%ebp), %ebx
  movl -12(%ebp), %ecx

  subl 4, %esp
  movl $1, -4(%ebp)
  movl $1, %eax

start_loop:
  cmpl $1, %ecx
  je exit_loop

  imull %ebx, %eax 
  
  decl %ecx
  jmp start_loop

exit_loop:
  movl %ebp, %esp
  popl %ebp
  ret

