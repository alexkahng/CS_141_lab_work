`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    mux4to1 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module mux4to1(X,Y,S,Z);

	//parameter definitions
	parameter N = 32;

	//port definitions - customize for different bit widths
	input wire [(N-1):0] X, Y;
	input wire [1:0] S;
	output wire [(N-1):0] Z;
	
	//module body
	assign Y = S[1] ? (S[0] ? 0 : 0)
	                : (S[0] ? 0 : 0);
	

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
