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

	//port definitions - customize for different bit widths
	input  wire [31:0] X;
	input  wire [31:0] Y;
	output wire [31:0] Z;
	input  wire [3:0] op_code;
	output wire equal, overflow, zero;
	
	wire [31:0] and_out, or_out, xor_out, nor_out, add_out, sub_out, slt_out, srl_out, sll_out, sra_out;
	
	//functional blocks
	
   //YOUR CODE HERE - remember to use a separate file for each module you create
	adder ADD (.X(X), .Y(Y), .Cin(1'b0), .Cout(overflow), .Z(add_out));
	bitwise_nor NOR (.X(X), .Y(Y), .Z(nor_out));
	bitwise_xor XOR (.X(X), .Y(Y), .Z(xor_out));
	bitwise_or OR (.X(X), .Y(Y), .Z(or_out));
	bitwise_and AND (.X(X), .Y(Y), .Z(and_out));
	
	// Mux 16 to 1
	assign Z = op_code[3] ? (op_code[2] ? (op_code[1] ? (op_code[0] ? 0 : 0)
	                                                  : (op_code[0] ? 0 : 0))
								               : (op_code[1] ? (op_code[0] ? 0 : 0/*SRA*/)
	                                                  : (op_code[0] ? 0/*SLL*/ : 0/*SRL*/)))
				             : (op_code[2] ? (op_code[1] ? (op_code[0] ? 0/*SLT*/ : 0/*SUB*/)
	                                                  : (op_code[0] ? add_out : 0))
								               : (op_code[1] ? (op_code[0] ? nor_out : xor_out)
	                                                  : (op_code[0] ? or_out : and_out)));
	assign equal = ~(|(X ^ Y));
	assign zero = ~(|Z);

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
