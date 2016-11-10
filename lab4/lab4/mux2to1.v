`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    mux2to1 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module mux2to1(select, inA, inB, out);

	//parameter definitions
	parameter N = 32;

	//port definitions - customize for different bit widths
	input wire [N-1:0] inA, inB;
	input wire select;
	output wire [N-1:0] out;
	
	assign out = (select == 0) ? inA : inB;

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
