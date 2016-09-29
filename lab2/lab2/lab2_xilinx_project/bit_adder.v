`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    bit_adder 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module bit_adder(X, Y, Cin, Cout, Z);

	//parameter definitions

	//port definitions - customize for different bit widths
	input wire X, Y, Cin;
	output wire Cout, Z;
	
	//method body
	assign Z = X ^ Y ^ Cin;
	assign Cout = (X & Y) | (X & Cin) | (Y & Cin);

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
