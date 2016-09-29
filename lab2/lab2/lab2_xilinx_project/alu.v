`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2016
// Module Name:    alu 
// Author(s): [[your name here]]
// Description: CS 141 lab 2
//
//
//////////////////////////////////////////////////////////////////////////////////
`include "alu_defines.v"

module alu(X, Y, Z, op_code, equal, overflow, zero);

	//parameters
	parameter WIDTH = 32;

	//port definitions - customize for different bit widths
	input  wire [(WIDTH-1):0] X;
	input  wire [(WIDTH-1):0] Y;
	output wire [(WIDTH-1):0] Z;
	input  wire [3:0] op_code;
	output wire equal, overflow, zero;

	//functional blocks
   //YOUR CODE HERE - remember to use a separate file for each module you create

	mux16to1 #(.N(WIDTH)) MUX (.X(X), .Y(Y), .Z(Z), .op_code(op_code), .overflow(overflow));
	
	assign equal = ~(|(X ^ Y));
	assign zero = ~(|Z);

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
