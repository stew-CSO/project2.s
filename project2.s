#Project2

#(03045858 % 11) 
#26+2 = 28 = N
#M = 28-10 = 18

.data ##data section

result: .asciiz "Unrecognized Input" 
input: .space 1001

.text
	.globl main
  
main: # Start of code section

li $v0, 8
la $a0, user_input 
li $a1, 1001
syscall 

move $t0, $a0  #move userInput into register $t0 
lbu $s0, ($t0) #take the contents of memory, load it, and sign extend the result to 32 (or 64) bits.

