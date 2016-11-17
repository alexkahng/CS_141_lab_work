xor $t0 $t0 $t0         # Zero out $t0
addi $t0 $t0 50			# Set $t0 to be 50
slti $t0 $t0 0			# Set $t0 to be 0
slti $t0 $t0 10			# Set $t0 to be 1
ori $t0 $t0 2			# Set $t0 to be 3
xori $t0 $t0 6			# Set $t0 to be 5
andi $t0 $t0 4			# Set $t0 to be 4
xor $t1 $t1 $t1 		# Set $t1 to 0
addi $t0 $t0 50			# Set $t0 to 54
sw $t0 4($t1)			# Store 54 in memory location 4
lw $t1 4($t1)			# Load 54 into $t1
