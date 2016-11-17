				addi $sp,  $zero, 128			# set stack pointer to 128
				addi $t0,  $zero, 4				# set $t0 to 4
				sw   $t0,  0($sp)				# store value of 4 at top of stack
				jal  RecursiveAdd				# jump and link RecursiveAdd
				beq  $zero, $zero, End			# branch to end
RecursiveAdd:	lw   $t0,  0($sp)				# take input from top of stack into register
				beq  $t0,  $zero, ReturnZero	# if base case, Return 0
				addi $t0,  $t0, -1				# else, recursive call
				addi $sp,  $sp, -12				# allocate stack frame
				sw   $t0,  0($sp)				# store $t0 at top of stack
				sw   $ra,  8($sp)				# store return address
				jal  RecursiveAdd 				# recursive call, sets $ra
				lw   $ra,  8($sp)				# load return address
				lw   $t1,  4($sp)				# load child's return value into $t1
				lw   $t2,  12($sp)				# load parent's start value into $t2
				add  $t3,  $t1, $t2				# add the two values and store into $t3
				sw   $t3,  16($sp)				# store in parent's return value
				addi $sp,  $sp, 12				# move stack pointer back
				jr   $ra 						# jump to parent call
ReturnZero:		add  $t0,  $zero, $zero			# set $t0 to 0
				sw   $t0,  4($sp)				# store in parent's return value
				jr   $ra 						# jump to parent call
End:			addi $t0,  $zero, 100			# set register to 100