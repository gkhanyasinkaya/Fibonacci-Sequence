.data
msg:	 .asciiz	"Enter the sequence number: "
msg1:    .asciiz	"Please enter a valid number \n"
msg2:    .asciiz	"F("
msg3:    .asciiz  	") = "
.text

li $t0,0 				# F(0) = 0  / f(x-2)
li $t1,1 				# F(1) = 1 / f(x-1)
li $t2,0 				# Nth term 
li $t3,1 				# Loop counter

main:
    	li $v0,  4
    	la $a0,  msg
    	syscall             
    	li $v0,  5
    	syscall             		# read an int input
	add $a0, $v0, $zero 		# move to $a0
	add $t4, $zero, $a0		# $t4 gets the copy of input for printing
    
	blt $a0,$zero,negative 		# cheks the given input lesser than zero
	bgt $a0,1 loop 			# cheks the given input >1 (else f(input)=output <=> input = output)
	add $t2,$0,$a0			# $t2 gets the copy of value for printing
	j exit

negative:
	li    $v0,4     
	la    $a0, msg1   
	syscall
	li $v0, 10
	syscall
loop:
	bge $t3,$a0 exit
	addu  $t2,$t1,$t0
	addu $t0,$t1,0
	addu $t1,$t2,0
	add $t3,$t3,1
	j loop
exit:
	#printing the output
	li $v0,  4
    	la $a0,  msg2
    	syscall
    	 
	li $v0, 1
	move $a0,$t4				# printing the nth sequence
	syscall 
	
	li $v0,  4
    	la $a0,  msg3
    	syscall
    	
    	li $v0, 1
	move $a0,$t2				# printing the value
	syscall
    	 
	li $v0, 10
	syscall
