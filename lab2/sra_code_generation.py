f = open('sra_code.txt','w')

## Code generation for muxes
# for i in xrange(32):
# 	f.write("\tmux32to1 MUX%d (.X(input%d), .Y(Y), .Z(Z[%d]));\n" % (i,i,i))

## Code generation for inputs
for i in xrange(32):
	f.write("\tassign input%d = {" % i)
	for j in xrange(i):
		f.write("X[31],")
	for j in reversed(xrange(32-i)):
		f.write("X[%d]," % (j+i))
	f.write("};\n")

f.close()