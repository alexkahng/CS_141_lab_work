f = open('adder_code.txt','w')


for i in xrange(1,32):
	f.write('bit_adder BA_%d (.X(X[%d]), .Y(Y[%d]), .Cin(Carrybits[%d]), .Cout(Carrybits[%d]), .Z(Z[%d]))\n' %( i, i, i, i-1, i, i))





f.close()

# for i in xrange(31):



