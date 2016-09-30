`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    cla32 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module cla32(X, Y, Cin, Cout, Z);

	//parameter definitions

	//port definitions - customize for different bit widths
	input wire [31:0] X, Y;
	input wire Cin;
	output wire Cout;
	output wire [31:0] Z;
	wire c3, p3, g3, c7, p7, g7, c11, p11, g11, c15, p15, g15,
	     c19, p19, g19, c23, p23, g23, c27, p27, g27, c31, p31, g31,
		  c2, c6, c10, c14, c18, c22, c26, c30;
	
	//module body
	cla4 CLA0 (.X(X[3:0]), .Y(Y[3:0]), .Cin(Cin), .Z(Z[3:0]), .Cout(c3), .PG(p3), .GG(g3), .Cnext(c2));
	cla4 CLA1 (.X(X[7:4]), .Y(Y[7:4]), .Cin(c3), .Z(Z[7:4]), .Cout(c7), .PG(p7), .GG(g7), .Cnext(c6));
	cla4 CLA2 (.X(X[11:8]), .Y(Y[11:8]), .Cin(c7), .Z(Z[11:8]), .Cout(c11), .PG(p11), .GG(g11), .Cnext(c10));
	cla4 CLA3 (.X(X[15:12]), .Y(Y[15:12]), .Cin(c11), .Z(Z[15:12]), .Cout(c15), .PG(p15), .GG(g15), .Cnext(c14));
	cla4 CLA4 (.X(X[19:16]), .Y(Y[19:16]), .Cin(c15), .Z(Z[19:16]), .Cout(c19), .PG(p19), .GG(g19), .Cnext(c18));
	cla4 CLA5 (.X(X[23:20]), .Y(Y[23:20]), .Cin(c19), .Z(Z[23:20]), .Cout(c23), .PG(p23), .GG(g23), .Cnext(c22));
	cla4 CLA6 (.X(X[27:24]), .Y(Y[27:24]), .Cin(c23), .Z(Z[27:24]), .Cout(c27), .PG(p27), .GG(g27), .Cnext(c26));
	cla4 CLA7 (.X(X[31:28]), .Y(Y[31:28]), .Cin(c27), .Z(Z[31:28]), .Cout(c31), .PG(p31), .GG(g31), .Cnext(c30));
	
	//TODO: Fix this.
	assign Cout = c31 ^ c30; 
	
endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
