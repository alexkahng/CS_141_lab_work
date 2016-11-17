addi $t1 $zero 1		# $t1 = 1
sub $t0 $zero $t1		# $t0 = -1
sra $t1 $t0 2			# $t1 = -1
addi $t0 $zero 96		# $0 = 96
sra $t1 $t0 4			# $t1 = 6