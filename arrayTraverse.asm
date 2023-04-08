# Joshua Gomez
# CS 2640
# 04/07/23
# Objective: given array = [1, 2, 3, 4, 5]
# - display message to user
# - main label, exit label, and loop lables
# - use $s0 for the address of the array, $t0 for current element
# - use an element loop counter

.data
array: .word 1, 2, 3, 4, 5
message: .asciiz "\nArray elements are: "
space: .asciiz ", "

.text
main: 
	#display message to user
	li $v0, 4
	la $a0, message
	syscall

	#locating address of array into $s0
	la $s0, array

	#initializing $t7 as loop counter
	move $t7, $zero
	
loop:
	#get the current element of the array
	lw $t0, 0($s0)

	#print $t0 to user (current element)
	li $v0, 1
	move $a0, $t0
	syscall
	
	
	#increment the base address by 4 (move to the next element)
	addi $s0, $s0, 4
	
	#increment loop counter
	addi $t7, $t7, 1
	#branch if loop counter is greater than number of array elements
	beq  $t7, 5, exit
	
	#print space between elements
	li $v0, 4
	la $a0, space
	syscall
	
	j loop

exit:
	li $v0, 10
	syscall
