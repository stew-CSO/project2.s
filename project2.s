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
	add $s0, $s0, -1
	lb $t7, ($s0)
	jal Check_Character
	


beginner: 
	addi $a0, $a0, 1
	move $t1, $a0
	j new_Start
	


outOfBounds:
	j unrecognize 
	


Check_Character:
	bgt $t7, 0, add_Character
	j beginning_loop
	


trailing:
	bne $t3, 0, unrecognize
	jal beginning_loop
	

add_Character:
	bgt $t7, 96, lowerCaseChar
	bgt $t7, 64, upperCaseChar
	bgt $t7, 47, num
	beq $t7, 9, trailing 
	beq $t7, 32, trailing 
	bne $t7, 10, outOfBounds
	j beginning_loop
	


#convert base number to decimal
base28:
	beq $t2, $t3, addsLoop
	multu $t7, $s5
	mflo $t4
	mfhi $t5
	add $t7, $t4, $t5
	addi $t2, 1
	bne $t2, $t3, base28
	


addsLoop:
	sub $t2, $t2, $t2
	add $t9, $t7, $t9
	addi $t3, 1
	bgt $t3, $s4, unrecognize
	beq $s0, $t1, exitfunction 
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
	bgt $t7, 114, outOfBounds
	sub $t7, $t7, 87
	j base28
 

upperCaseChar: 
	bgt $t7, 82, outOfBounds 
	sub $t7, $t7, 55
	j base28


num:
	bgt $t0, 57, outOfBounds  
	sub $t7, $t7, 48
	j base28 




unrecognize: 
	la $a0, result
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall











