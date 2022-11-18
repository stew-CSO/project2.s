#Project2

#(03045858 % 11) 
#26+2 = 28 = N
#M = 28-10 = 18

.data ##data section

user_input: .asciiz ""

result: .asciiz "Unrecognized Input" 
input: .space 1001

.text
	.globl main
  
main: # Start of code section

li $v0, 8
la $a0, input 
li $a1, 1001
syscall 

move $s0, $a0  #move userInput into register $s0 
#lbu $s0, ($t0) #take the contents of memory, load it, and sign extend the result to 32 (or 64) bits.


lb $t0, 0($s0)
beq $t0, 10, unrecognize


lb $t0, 5($s0)
jal Check_Character



Check_Character:
beq $t0, 10, unrecognize
bne $t0, $zero, unrecognize
jr $ra



lb $t0, 3($s0)
jal check
lb $t0, 2($s0)
jal check
lb $t0, 1($s0)
jal check
lb $t0, 0($s0)
jal check
	


check:
bgt $t1, 0, add_Character
jr $ra





#LowerCase loop 

lowerCaseChar:
bgt $s1, 115, outOfBounds
sub $s1, $s1, 87
j addsloop

outOfBounds:
jr $ra  

upperCaseChar: 
bgt $s1, 82, outOfBounds 
sub $s1, $s1, 55
j addsloop


num:
bgt $s1, 59, outOfBounds  
sub $s1, $s1, 48
j addsloop 

#loop to remove blanks spaces 

blank:

lb $a0, 0($s0)
addi $s0, $s0, 1
beq $a0, 32, blank
beq $a0, $zero, done 
li $v0, 11
syscall 
j blank


done:
jr $ra 
.data 



unrecognize: 
la $a0, unrecognize
li $v0, 4
syscall
	
li $v0, 10
syscall











