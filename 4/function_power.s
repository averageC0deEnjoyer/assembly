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
  movl 8(%ebp), %ebx
  movl 12(%ebp), %ecx

  subl $4, %esp
  movl %ebx, %eax 

start_loop:
  #if power 1 then we exit the loop
  cmpl $1, %ecx
  je exit_loop

  imull %ebx, %eax 
  #since eax cant save result, we save it in -4(%ebp)
  movl %eax, -4(%ebp)
  
  decl %ecx
  jmp start_loop

exit_loop:
  movl -4(%ebp), %eax
  movl %ebp, %esp
  popl %ebp
  ret

