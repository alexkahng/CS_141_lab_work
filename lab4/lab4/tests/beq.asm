xor $t0 $t0 $t0 			# Zero out $t0
beq $t0 $zero A				# Should branch to A
addi $t1 $t1 100			# Should be skipped
A: addi $t0 $t0 1			# Set $t0 = 1
beq $t0 $zero B 			# Should not branch
addi $t1 $t1 50				# Set $t1 = 50
B: addi $t0 $t0 1			# Set $t0 = 2