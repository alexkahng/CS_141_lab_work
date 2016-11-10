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
module mux4to1(select, inA, inB, inC, inD, out);

	//parameter definitions
	parameter N = 32;
	//port definitions - customize for different bit widths
	input wire [N-1:0] inA, inB, inC, inD;
	input wire [1:0] select;
	output wire [N-1:0] out;
	wire [N-1:0] out1, out2;
	
	//module body
	mux2to1 #(.N(N)) mux1 (.select(select[0]), .inA(inA), .inB(inB), .out(out1));
	mux2to1 #(.N(N)) mux2 (.select(select[0]), .inA(inC), .inB(inD), .out(out2));
	mux2to1 #(.N(N)) mux3 (.select(select[1]), .inA(out1), .inB(out2), .out(out));

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
