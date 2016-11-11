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
	input wire [1:0] aluOp;
	input wire [5:0] funct, opcode;
	output wire [3:0] aluControl;
	
	assign aluControl = (aluOp == 2'b00) ? `ALU_OP_ADD : (aluOp == 2'b01) ? `ALU_OP_SUB :
								(funct == `MIPS_AND | opcode == `OPANDI) 	? `ALU_OP_AND : 
								(funct == `MIPS_OR  | opcode == `OPORI) 	? `ALU_OP_OR : 
								(funct == `MIPS_XOR | opcode == `OPXORI) 	? `ALU_OP_XOR : 
								(funct == `MIPS_NOR) ? `ALU_OP_NOR : 
								(funct == `MIPS_SLT | opcode == `OPSLTI) 	? `ALU_OP_SLT : 
								(funct == `MIPS_SLL) ? `ALU_OP_SLL : 
								(funct == `MIPS_SRL) ? `ALU_OP_SRL : 
								(funct == `MIPS_ADD | opcode == `OPADDI) 	? `ALU_OP_ADD : 
								(funct == `MIPS_SUB) ? `ALU_OP_SUB : 
								(funct == `MIPS_SRA) ? `ALU_OP_SRA : -1;

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
