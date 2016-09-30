`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    cla4 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module cla4(X, Y, Cin, Z, Cout, PG, GG, Cnext);

	//parameter definitions
	
	//port definitions
	input wire [3:0] X, Y;
	input wire Cin;
	output wire [3:0] Z;
	output wire Cout, PG, GG, Cnext;
	wire [3:0] G, P, C;
	
	//module body
	assign G = X & Y; //Generate bits
	assign P = X ^ Y; //Propagate bits
   assign C[0] = Cin; //Carry bits
	assign C[1] = G[0] | (P[0] & C[0]);
	assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0]);
	assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C[0]);
	assign Cout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) |(P[3] & P[2] & P[1] & P[0] & C[0]);
	assign Z = P ^ C;
	assign PG = P[3] & P[2] & P[1] & P[0];
	assign GG = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]);
	assign Cnext = C[3];

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
