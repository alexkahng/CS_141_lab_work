`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    mux16to1 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module mux16to1(X, Y, Z, op_code, overflow);

	//parameter definitions
	parameter N = 32;

	//port definitions - customize for different bit widths
	input wire [(N-1):0] X, Y;
	input wire [3:0] op_code;
	output wire [(N-1):0] Z;
	wire overflow_add, overflow_sub;
	output wire overflow;
	wire [(N-1):0] and_out, or_out, xor_out, nor_out, add_out, sub_out, slt_out, srl_out, sll_out, sra_out;
	

	//YOUR CODE HERE - remember to use a separate file for each module you create
	bitwise_nor NOR (.X(X), .Y(Y), .Z(nor_out));
	bitwise_xor XOR (.X(X), .Y(Y), .Z(xor_out));
	bitwise_or OR (.X(X), .Y(Y), .Z(or_out));
	bitwise_and AND (.X(X), .Y(Y), .Z(and_out));
	adder ADD (.X(X), .Y(Y), .Cin(1'b0), .Cout(overflow_add), .Z(add_out));
	subtractor SUB (.X(X), .Y(Y), .Cin(1'b0), .Cout(overflow_sub), .Z(sub_out));
	
	
	
	//module body
	assign Z = op_code[3] ? (op_code[2] ? (op_code[1] ? (op_code[0] ? 0 : 0)
	                                                  : (op_code[0] ? 0 : 0))
								               : (op_code[1] ? (op_code[0] ? 0 : 0/*SRA*/)
	                                                  : (op_code[0] ? 0/*SLL*/ : 0/*SRL*/)))
				             : (op_code[2] ? (op_code[1] ? (op_code[0] ? 0/*SLT*/ : sub_out)
	                                                  : (op_code[0] ? add_out : 0))
								               : (op_code[1] ? (op_code[0] ? nor_out : xor_out)
	                                                  : (op_code[0] ? or_out : and_out)));
																	  
	assign overflow = ~(|(op_code ^ 4'b0101)) ? overflow_add :
							~(|(op_code ^ 4'b0110)) ? overflow_sub : 0;

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
