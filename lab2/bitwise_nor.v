`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    bitwise_nor 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module bitwise_nor(X, Y, Z, equal, zero);

	//parameter definitions

	//port definitions - customize for different bit widths
	input wire [31:0] X, Y;
	output wire [31:0] Z;
	output wire equal, zero;
	
	//module body
	assign Z = ~(X | Y);
	assign equal = ~(|(X ^ Y));
	assign zero = ~(|Z);


endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
