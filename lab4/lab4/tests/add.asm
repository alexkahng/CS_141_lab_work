add $t0 $zero $zero			# $t0 = 0
addi $t0 $t0 1				# $t0 = 1
add $t1 $t0 $zero			# $t1 = 1
sub $t0 $zero $t0 			# $t0 = -1
add $t2 $t0 $t1				# $t2 = 0