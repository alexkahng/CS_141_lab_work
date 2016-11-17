`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
`include "alu_defines.v"
`include "mips_memory_space_defines.v"
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    aluCtrl 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module aluCtrl(aluOp, funct, opcode, aluControl);

	//parameter definitions

	//port definitions - customize for different bit widths
	input wire [2:0] aluOp;
	input wire [5:0] funct, opcode;
	output wire [3:0] aluControl;
	
	assign aluControl = (aluOp == 3'b000) ? `ALU_OP_ADD : (aluOp == 3'b001) ? `ALU_OP_SUB :
								((aluOp == 3'b010 & funct == `MIPS_AND) | (aluOp == 3'b011 & opcode == `OPANDI)) 	? `ALU_OP_AND : 
								((aluOp == 3'b010 & funct == `MIPS_OR)  | (aluOp == 3'b011 & opcode == `OPORI))	 	? `ALU_OP_OR : 
								((aluOp == 3'b010 & funct == `MIPS_XOR) | (aluOp == 3'b011 & opcode == `OPXORI)) 	? `ALU_OP_XOR : 
								(aluOp == 3'b010 & funct == `MIPS_NOR) ? `ALU_OP_NOR : 
								((aluOp == 3'b010 & funct == `MIPS_SLT) | (aluOp == 3'b011 & opcode == `OPSLTI)) 	? `ALU_OP_SLT : 
								(aluOp == 3'b010 & funct == `MIPS_SLL) ? `ALU_OP_SLL : 
								(aluOp == 3'b010 & funct == `MIPS_SRL) ? `ALU_OP_SRL : 
								((aluOp == 3'b010 & funct == `MIPS_ADD) | (aluOp == 3'b011 & opcode == `OPADDI)) 	? `ALU_OP_ADD : 
								(aluOp == 3'b010 & funct == `MIPS_SUB) ? `ALU_OP_SUB : 
								(aluOp == 3'b010 & funct == `MIPS_SRA) ? `ALU_OP_SRA : -1;

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
