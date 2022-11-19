#Project2

#(03045858 % 11) 
#26+2 = 28 = N
#M = 28-10 = 18

.data ##data section

user_input: .asciiz ""

result: .asciiz "Unrecognized input" 
input: .space 1001

.text
	.globl main
  
main: # Start of code section

addi $s4, 4


addi $s5, 28

li $v0, 8
la $a0, input 
li $a1, 1001
syscall 

move $s0, $a0  #move userInput into register $s0 
add $t1, $s0, $zero
addi $s0, $s0, 1001


new_Start:	
	lb $t7, ($t1)
	beq $t7, 10, unrecognize
	beq $t7, 9, beginner
	beq $t7, 32, beginner 



beginning_loop:
	add $t0, $t0, -1
	lb $t7, ($t0)
	jal Check_Character


beginner: 
	addi $a0, $a0, 1
	move $t1, $a0
	j new_Start







lb $t0, 3($s0)




bgt $t2, 4, unrecognize 
j exitfunction	




outOfBounds:
	j unrecognize 


Check_Character:
	bge $t1, 1, add_Character
	jal beginning_loop




add_Character:
	bgt $t7, 96, lowerCaseChar
	bgt $t7, 64, upperCaseChar
	bgt $t7, 47, num
	beq $t0, 9, trailing 
	beq $t0, 32, trailing 
	bne $t0, 10, outOfBounds
	jal beginning_loop

trailing:
	bne $t3, 0, unrecognize
	jal beginning_loop



#convert base number to decimal
base28:
	beq $t2, $t3, addsLoop
	multu $t0, $s5
	mflo $t4
	mfhi $t5
	add $t0, $t4, $t5
	addi $t2, 1
	bne $t2, $t3, base28
	


addsLoop:
	sub $t2, $t2, $t2
	add $t9, $t0, $t9
	addi $t3, 1
	bgt $t3, $s4, unrecognize
	beq $t7, $t1, exitfunction 
	jal beginning_loop




exitfunction:
	li $v0, 1
	add $a0, $t3, $zero
	syscall
	
	li $v0, 11
	la $a0, 44
	syscall
	
	li $v0, 1
	move $a0, $t9
	syscall
	
	li $v0, 10
	syscall



#LowerCase loop 

lowerCaseChar:
	bgt $t0, 114, outOfBounds
	sub $t0, $t0, 87
	j base28
 

upperCaseChar: 
	bgt $t0, 82, outOfBounds 
	sub $t0, $t0, 55
	j base28


num:
	bgt $t0, 57, outOfBounds  
	sub $t0, $t0, 48
	j base28 




unrecognize: 
	la $a0, result
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall











