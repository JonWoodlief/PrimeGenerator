# this program prints out the maximum of two numbers 
# The two numbers are read through the keyboard 
.text
.globl main

main:
# Display primpt1
li $v0, 4
la $a0, prompt1
syscall

li $v0, 5 # read keyboard into $v0 (number x is number to test)
syscall

move $t0,$v0 # move the first number from $v0 in $t0

li $t2, 2

#if input is less than 2, exit
slt $t1, $t0, $t2
beq $t1, 1, end

#initialize counter to 1
li $s0, 1

Loop1:
addi $s0, $s0, 1 #increment first counter
beq $s0, $t0, end #if first counter equals user input, exit

li $s1, 1 #set second counter to 1
Loop2:
addi $s1, $s1, 1 #increment second counter
beq $s0, $s1, IsPrime #if second counter = first counter, go to outer loop
remu $t1, $s0, $s1 #set t1 to the remainder of s0 by s1
beq $t1, $zero, Loop1 #if t1 is zero, not prime, so go back to outer loop

j Loop2 #if no exit conditions are met, loop again

IsPrime: #isPrime
#print inner counter
li $v0, 1
move $a0, $s0
syscall

#print a space so numbers are seperated
li $v0, 4
la $a0, space
syscall

#exit to outer loop
j Loop1

#exit
end: li $v0, 10 
syscall 
 
.data
prompt1:
 .asciiz "Enter a positive number: "
space:
 .asciiz " "
