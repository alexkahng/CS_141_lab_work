xor $t0 $t0 $t0				# Set $t0 to 0
xor $t1 $t1 $t1 			# Set $t1 to 0
addi $t0 $t0 50				# Set $t0 to 50
sw $t0 4($t1)				# Store 50 in memory location 4
lw $t1 4($t1)				# Load 50 into $t1
