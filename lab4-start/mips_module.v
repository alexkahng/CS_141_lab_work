`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
`include "mips_memory_space_defines.v"
`include "alu_defines.v"
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
	output wire [N-1:0] mem_wr_addr, mem_rd_addr;
	output wire mem_wr_ena;
	
	reg [N-1:0] pc, ir, regD1, regD2, regW;
	wire [N-1:0] srcA, srcB, aluOut;
	wire aluEqual, aluZero, aluOverflow;
	wire [3:0] aluControl;
	wire [1:0] aluSrcB;
	wire pc_write, ir_write, reg_write, aluSrcA;
	
	// Decoded instruction
	wire [5:0] opcode, funct;
	wire [4:0] rs, rt, rd, shamt;
	wire [15:0] imm;
	wire [25:0] jump_addr;
	
	// Register file data
	wire [4:0] reg_rd_addr0, reg_rd_addr1, reg_wr_addr;
	wire [31:0] reg_rd_data0, reg_rd_data1;
	wire [31:0] reg_wr_data;
	
	// FSM state
	reg [3:0] state;
	
	// Assigning wires
	assign mem_rd_addr = pc;
	assign reg_rd_addr0 = rs;
	assign reg_rd_addr1 = rt;
	assign reg_wr_addr = rd;
	assign reg_wr_data = regW;
	
	//instantiate ALU
	mux2to1 #(.N(N)) srcAmux (.select(aluSrcA), .inA(pc), .inB(regD1), .out(srcA));
	mux4to1 #(.N(N)) srcBmux (.select(aluSrcB), .inA(regD2), .inB(4), .inC(0), .inD(0), .out(srcB));
	alu #(.N(N)) alu (.x(srcA), .y(srcB), .op_code(aluControl), .z(aluOut), .equal(aluEqual), .zero(aluZero), .overflow(aluOverflow));
	
	// instantiate control
	control CONTROL (.state(state), .opcode(opcode), .funct(funct), .pc_write(pc_write), .ir_write(ir_write), .reg_write(reg_write), .aluSrcA(aluSrcA), .aluSrcB(aluSrcB), .aluControl(aluControl), .mem_wr_ena(mem_wr_ena));
	
	// instruction decoder
	instruction_decoder DECODE (.instruction(ir), .opcode(opcode), .rs(rs), .rt(rt), .rd(rd), .shamt(shamt), .funct(funct), .imm(imm), .jump_addr(jump_addr));
	
	// register file
	register_file regs (.clk(clk), .rst(rstb), .rd_addr0(reg_rd_addr0), .rd_addr1(reg_rd_addr1), .wr_addr(reg_wr_addr), .rd_data0(reg_rd_data0), .rd_data1(reg_rd_data1), .wr_data(reg_wr_data), .wr_ena(reg_write));
	
	//module body
	initial begin
		pc <= 'h00400000;
		state <= `FETCH;
		ir <= 0;
		regD1 <= 0;
		regD2 <= 0;
		regW <= 0;
	end
	
	always @(posedge clk) begin
		if (pc_write) begin
			pc <= aluOut;
		end
		if (ir_write) begin
			ir <= read_data;
		end
		
		
		// Alter state
		if (state == `FETCH) begin
			state <= `FETCH_FROM_MEMORY;
		end
		else if (state == `FETCH_FROM_MEMORY) begin
			state <= `READ_FROM_MEMORY;
		end
		else if (state == `READ_FROM_MEMORY) begin
			state <= `DECODE;
		end
		else if (state == `DECODE) begin
			state <= `EXECUTE;
			if (funct == `MIPS_SLL | funct == `MIPS_SRL | funct == `MIPS_SRA) begin
				regD1 <= reg_rd_data1;
				regD2 <= shamt;
			end
			else begin
				regD1 <= reg_rd_data0;
				regD2 <= reg_rd_data1;
			end
		end
		else if (state == `EXECUTE) begin
			state <= `ALU_WRITEBACK;
			regW <= aluOut;
		end
		else if (state == `ALU_WRITEBACK) begin
			state <= `FETCH;
		end
	end

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
