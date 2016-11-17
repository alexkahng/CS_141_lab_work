xor $t0 $t0 $t0 			# Zero out $t0
bne $t0 $zero A				# Should not branch
addi $t1 $t1 100			# Set $t1 = 100
A: addi $t0 $t0 1			# Set $t0 = 1
bne $t0 $zero B 			# Should branch to B
addi $t1 $t1 50				# Should be skipped
B: addi $t0 $t0 1			# Set $t0 = 2