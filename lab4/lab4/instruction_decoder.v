`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    instruction_decoder 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module instruction_decoder(instruction, opcode, rs, rt, rd, shamt, funct, imm, jump_addr);

	//parameter definitions

	//port definitions - customize for different bit widths
	input wire [31:0] instruction;
	output wire [5:0] opcode, funct;
	output wire [4:0] rs, rt, rd, shamt;
	output wire [15:0] imm;
	output wire [25:0] jump_addr;

	assign opcode = instruction[31:26];
	assign rs = instruction[25:21];
	assign rt = instruction[20:16];
	assign rd = instruction[15:11];
	assign shamt = instruction[10:6];
	assign funct = instruction[5:0];
	assign imm = instruction[15:0];
	assign jump_addr = instruction[25:0];

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
