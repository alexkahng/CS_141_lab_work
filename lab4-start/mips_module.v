`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
`include "alu_defines.v"
`include "mips_memory_space_defines.v"

//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    mips_module 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module mips_module(clk, rstb, read_data, mem_wr_addr, mem_rd_addr, mem_wr_ena);

	//parameter definitions
	parameter N = 32;
	
	//port definitions - customize for different bit widths
	input wire clk, rstb;
	input wire [N-1:0] read_data;
	output reg [N-1:0] mem_wr_addr, mem_rd_addr;
	output reg mem_wr_ena;
	
	reg [N-1:0] pc, ir, regD1, regD2, regW;
	wire [N-1:0] srcA, srcB, aluOut;
	wire aluEqual, aluZero, aluOverflow;
	reg [3:0] aluControl;
	reg [1:0] aluSrcB;
	reg pc_write, ir_write, aluSrcA;
	
	//instantiate ALU
	mux2to1 #(.N(N)) srcAmux (.select(aluSrcA), .inA(pc), .inB(regD1), .out(srcA));
	mux4to1 #(.N(N)) srcBmux (.select(aluSrcB), .inA(regD2), .inB(4), .inC(0), .inD(0), .out(srcB));
	alu #(.N(N)) alu (.x(srcA), .y(srcB), .op_code(aluControl), .z(aluOut), .equal(aluEqual), .zero(aluZero), .overflow(aluOverflow));
	
	
	//module body
	initial begin
		pc <= 'h00400000;
		pc_write <= 1;
		ir_write <= 1;
		aluSrcA <= 0;
		aluSrcB <= 2'b01;
		
		// Clearing uninitialized registers
		ir <= 0;
		regD1 <= 0;
		regD2 <= 0;
		regW <= 0;
		aluControl <= `ALU_OP_ADD;
	end
	
	always @(posedge clk) begin
		pc_write = ~pc_write;
	
		if (pc_write) begin
			pc <= aluOut;
		end
	end
	
	

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
