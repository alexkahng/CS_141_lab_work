xor $t0 $t0 $t0 		# Reset $t0
addi $t0 $t0 1			# Set $t0 = 1
sll $t0 $t0 22			# Set $t0 to be 0x00400000 (start)
jr $t0					# Jump to start