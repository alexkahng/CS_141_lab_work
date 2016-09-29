f = open('sll_code.txt','w')

## Code generation for muxes
# for i in xrange(32):
# 	f.write("\tmux32to1 MUX%d (.X(input%d), .Y(Y), .Z(Z[%d]));\n" % (i,i,i))

## Code generation for inputs
for i in xrange(32):
	f.write("\tassign input%d = {" % (31-i))
	for j in xrange(i):
		f.write("1'b0,")
	for j in xrange(32-i):
		f.write("X[%d]," % (j))
	
	f.write("};\n")

f.close()