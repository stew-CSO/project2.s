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

addi $s5, 28

li $v0, 8
la $a0, input 
li $a1, 1001
syscall 

move $s0, $a0  #move userInput into register $s0 
add $t1, $s0, $zero
addi $t0, $t0, 1001


new_Start:	
	lb $t7, ($t1)
	beq $t7, 10, unrecognize
	beq $t7, 9, beginner
	beq $t7, 32, beginner 


beginner: 
	addi $a0, $a0, 1
	move $t1, $a0
	j new_start



lb $t0, 3($s0)








bgt $t2, 4, unrecognize 
j exitfunction	




outOfBounds:
	j unrecognize 


Check_Character:
	beq $t0, 10, unrecognize
	bne $t0, $zero, unrecognize
	jr $ra

check:
	bgt $t0, 0, add_Character
	jr $ra





add_Character:
	bgt $t0, 96, lowerCaseChar
	bgt $t0, 64, upperCaseChar
	bgt $t0, 47, num
	bne $t0, 10, outOfBounds
	jr $ra



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
	jr $ra





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











