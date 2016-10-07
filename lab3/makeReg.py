for i in xrange(8):
	print "register #(.SIZE(SIZE)) reg{0} (.clk(clk), .ena(ena[{0}]), .rst(rst[{0}]), .in(in_exp[{1}:{2}]), .out(out_exp[{1}:{2}]));".format(i, 2 * i + 1, 2 * i)