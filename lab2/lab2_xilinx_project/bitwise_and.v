`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    bitwise_and 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module bitwise_and(X, Y, Z);

	//parameter definitions

	//port definitions - customize for different bit widths
	input wire [31:0] X, Y;
	output wire [31:0] Z;
	
	//module body
	assign Z = X & Y;

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
