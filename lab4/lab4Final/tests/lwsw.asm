addi $t0 $zero 40			# set $t0 = 40
sw $t0 4($zero)				# store $t0 at address 4
lw $t1 4($zero)				# $t1 = 40
addi $t2 $zero 12			# $t2 = 12
sw $t2 140($zero)			# store $t2 at address 140
lw $t3 140($zero)			# $t3 = 12