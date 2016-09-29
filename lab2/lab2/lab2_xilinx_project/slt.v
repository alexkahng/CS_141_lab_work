`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    slt 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module slt(X, Y, Z);

	//parameter definitions

	//port definitions - customize for different bit widths
	input  wire [31:0] X, Y;
	output wire [31:0] Z;
	wire overflow;
	wire [31:0] result;
	
	//module body
	subtractor SUB (.X(X), .Y(Y), .Cin(1'b0), .Cout(overflow), .Z(result));
	
	assign Z = (result[31] ^ overflow) ? 32'd1 : 32'd0;


endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
