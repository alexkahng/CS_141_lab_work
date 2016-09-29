`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    mux16to1_switch 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module mux16to1_switch(X, Y, Z, overflow);

	//parameter definitions
	parameter N = 32;

	//port definitions - customize for different bit widths
	input wire [(N-1):0] X, Y;
	input wire [3:0] S;
	output wire [(N-1):0] Z;
	
	wire [(N-1):0] and_out, or_out, xor_out, nor_out, add_out, sub_out, slt_out, srl_out, sll_out, sra_out;
	
	//YOUR CODE HERE - remember to use a separate file for each module you create
	
	// TODO: Parameterize your mux module; ALU can only take 32-bit inputs, but the MUX can take inputs of any size
	adder ADD (.X(X), .Y(Y), .Cin(1'b0), .Cout(overflow), .Z(add_out));
	bitwise_nor NOR (.X(X), .Y(Y), .Z(nor_out));
	bitwise_xor XOR (.X(X), .Y(Y), .Z(xor_out));
	bitwise_or OR (.X(X), .Y(Y), .Z(or_out));
	bitwise_and AND (.X(X), .Y(Y), .Z(and_out));
	
	
	
	//module body
	assign Z = op_code[3] ? (op_code[2] ? (op_code[1] ? (op_code[0] ? 0 : 0)
	                                                  : (op_code[0] ? 0 : 0))
								               : (op_code[1] ? (op_code[0] ? 0 : 0/*SRA*/)
	                                                  : (op_code[0] ? 0/*SLL*/ : 0/*SRL*/)))
				             : (op_code[2] ? (op_code[1] ? (op_code[0] ? 0/*SLT*/ : 0/*SUB*/)
	                                                  : (op_code[0] ? add_out : 0))
								               : (op_code[1] ? (op_code[0] ? nor_out : xor_out)
	                                                  : (op_code[0] ? or_out : and_out)));	




//	always@(S) begin
//		case(S)
//			4'b0000: bitwise_and BW_AND (.X(X), .Y(Y), .Z(Z)); //bitwise and
//			4'b0001: bitwise_or BW_OR (.X(X), .Y(Y), .Z(Z)); //bitwise or
//			4'b0010: bitwise_xor BW_XOR (.X(X), .Y(Y), .Z(Z)); //bitwise xor
//			4'b0011: bitwise_nor BW_NOR (.X(X), .Y(Y), .Z(Z)); //bitwise nor
//			4'b0100: ; //
//			4'b0101: ; //signed addition
//			4'b0110: ; //signed subtraction
//			4'b0111: ; //signed Set Less Than (32'd1 if X is less than Y, 32'd0 otherwise)
//			4'b1000: ; //shift right logical (shift X right by Y places)
//			4'b1001: ; //shift left logical (shift X left by Y places)
//			4'b1010: ; //shift right arithmetic (shift X right by Y places, but maintain the sign of X)
//			4'b1011: ; //
//			4'b1100: ; //
//			4'b1101: ; //
//			4'b1110: ; //
//			4'b1111: ; //
//	end
			
			

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
