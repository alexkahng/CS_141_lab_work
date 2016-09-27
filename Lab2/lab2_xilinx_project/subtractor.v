`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    subtractor 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module subtractor(X, Y, Cin, Cout, Z);

	//parameter definitions
	

	//port definitions - customize for different bit widths
	input wire [31:0] X, Y;
	input wire Cin;
	wire [31:0] Carrybits;
	output wire [31:0] Z;
	output wire Cout;
	
	//module body
	adder SUB (.X(X), .Y(~Y), .Cin(1'b1), .Cout(Cout), .Z(Z));


endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
