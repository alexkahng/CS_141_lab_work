	xor $t0 $t0 $t0				# Zero out $t0
	addi $t0 $t0 2				# Set $t0 to 2
	j A 						# Jumps to label A
	addi $t1 $t0 4				# Should NOT set $t1 to 6!
A: 	addi $t2 $t0 2				# Sets $t2 to 4