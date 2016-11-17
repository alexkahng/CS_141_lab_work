slt $t0 $t0 $t0 		# $t0 = 0
addi $t1 $t0 1			# $t1 = 1
slt $t2 $t0 $t1			# $t2 = 1
sub $t1 $t0 $t1			# $t1 = -1
slt $t2 $t0 $t1			# $t2 = 0