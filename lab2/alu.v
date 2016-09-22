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
	
	opcode[3] ? (opcode[2] ? (opcode[1] ? (opcode[0] ? 0 : 0)
	                                    : (opcode[0] ? 0 : 0))
								  : (opcode[1] ? (opcode[0] ? 0 : 0/*SRA*/)
	                                    : (opcode[0] ? 0/*SLL*/ : 0/*SRL*/)))
				 : (opcode[2] ? (opcode[1] ? (opcode[0] ? 0/*SLT*/ : 0/*SUB*/)
	                                    : (opcode[0] ? adder #(.X(X), .Y(Y), .Cin(0), .Cout(overflow), .Z(Z), .equal(equal), .zero(zero)) : 0))
								  : (opcode[1] ? (opcode[0] ? bitwise_nor #(.X(X), .Y(Y), .Z(Z), .equal(equal), .zero(zero)) : bitwise_xor #(.X(X), .Y(Y), .Z(Z), .equal(equal), .zero(zero)))
	                                    : (opcode[0] ? bitwise_or #(.X(X), .Y(Y), .Z(Z), .equal(equal), .zero(zero)) : bitwise_and #(.X(X), .Y(Y), .Z(Z), .equal(equal), .zero(zero)))));


endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
