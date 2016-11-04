`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
`include "alu_defines.v"
`include "mips_memory_space_defines.v"
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    control 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module control(state, opcode, funct, pc_write, ir_write, reg_write, aluSrcA, aluSrcB, aluControl, mem_wr_ena);

	//parameter definitions

	//port definitions - customize for different bit widths
	input wire [3:0] state;
	input wire [5:0] opcode, funct;
	output wire pc_write, ir_write, reg_write, aluSrcA, mem_wr_ena;
	output wire [1:0] aluSrcB;
	output wire [3:0] aluControl;
	
	wire [1:0] aluOp;

	assign pc_write = (state == `FETCH) ? 1 : 0;
	assign ir_write = (state == `READ_FROM_MEMORY) ? 1 : 0;
	assign reg_write = (state == `ALU_WRITEBACK) ? 1 : 0;
	assign aluSrcA = (state == `FETCH) ? 0 : 1;
	assign mem_wr_ena = (state == 100) ? 1 : 0;   				// change constant when dealing with writing memory
	assign aluSrcB = (state == `FETCH) ? 2'b01 : (state == `EXECUTE) ? 2'b00 : -1;
	assign aluOp = (state == `FETCH) ? 2'b00 :(opcode == 6'b000000) ? 2'b10 : 2'b11;

	aluCtrl aluctrl (.aluOp(aluOp), .funct(funct), .aluControl(aluControl));

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
