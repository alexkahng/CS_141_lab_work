xori $t0 $zero 1		# $t0 = 1
xori $t1 $t0 1			# $t1 = 0
xor $t2 $t0 $t1			# $t2 = 1
xori $t2 $t1 0			# $t2 = 0