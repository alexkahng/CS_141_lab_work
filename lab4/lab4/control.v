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
module control(state, opcode, funct, pc_write, ir_write, reg_write, aluSrcA, aluSrcB, aluControl, mem_wr_ena, IorD, regDst, memToReg, pcSrc, branch, branchNE);

	//parameter definitions

	//port definitions - customize for different bit widths
	input wire [4:0] state;
	input wire [5:0] opcode, funct;
	output wire pc_write, ir_write, reg_write, aluSrcA, mem_wr_ena, IorD, branch, branchNE;
	output wire [1:0] aluSrcB, pcSrc, regDst, memToReg;
	output wire [3:0] aluControl;
	
	wire [2:0] aluOp;

	assign pc_write = (state == `FETCH | state == `JUMP | state == `JR | state == `JAL) ? 1 : 0;
	assign ir_write = (state == `READ_FROM_MEMORY) ? 1 : 0;
	assign reg_write = (state == `ALU_WRITEBACK | state == `MEM_WRITEBACK | state == `JAL) ? 1 : 0;
	assign aluSrcA = (state == `FETCH | state == `DECODE) ? 0 : 1;
	assign mem_wr_ena = (state == `MEMWRITE) ? 1 : 0;
	assign aluSrcB = (state == `FETCH) ? 2'b01 : 
						  (state == `EXECUTE | state == `BEQ | state == `BNE) ? 2'b00 : 
						  (state == `EXECUTE_IMM | state == `MEMADDR) ? 2'b10 : 
						  (state == `DECODE) ? 2'b11 : -1;
	assign aluOp = (state == `FETCH | state == `MEMADDR | state == `DECODE) ? 3'b000 :
						(state == `BEQ | state == `BNE) ? 3'b001 : 
						(opcode == `OPRTYPE) ? 3'b010 : 
						(state == `EXECUTE_IMM) ? 3'b011 : 3'b111;
	assign IorD = (state == `MEMREAD | state == `MEMWRITE) ? 1 : 0;
	assign regDst = (opcode == `OPRTYPE) ? 2'b01 : 
						 (state == `JAL) ? 2'b10 : 2'b00;
	assign memToReg = (state == `MEM_WRITEBACK) ? 2'b01 : 
							(state == `JAL) ? 2'b10 : 2'b00;
	assign pcSrc = (state == `FETCH | state == `FETCH_FROM_MEMORY | state == `READ_FROM_MEMORY) ? 2'b00 : 
						(state == `BEQ | state == `BNE) ? 2'b01 : 
						(state == `JUMP | state == `JAL) ? 2'b10 : 
						(state == `JR) ? 2'b11 : 2'b11;
	assign branch = (state == `BEQ) ? 1 : 0;
	assign branchNE = (state == `BNE) ? 1 : 0;
	

	aluCtrl aluctrl (.aluOp(aluOp), .funct(funct), .opcode(opcode), .aluControl(aluControl));

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
