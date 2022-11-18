#Project2

#(03045858 % 11) 
#26+2 = 28 = N
#M = 28-10 = 18

.data ##data section

result: .asciiz "Unrecognized Input" 
input: .space 1000

.text
	.globl main
  
main: # Start of code section

li $v0, 8
la $a0, result 
li $a1, 1000
