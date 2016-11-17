xor $t0 $t0 $t0 		# Reset $t0
addi $t0 $t0 1			# Set $t0 = 1
jal N					# Sets $ra = 0x0040000c
addi $t0 $t0 2			# Should be skipped
addi $t0 $t0 3			# Should be skipped
N: addi $t1 $ra 0		# Sets $t1 = 0x0040000c
jr $ra					# Goes back to line 4