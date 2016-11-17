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
module mips_module(clk, rstb, read_data, write_data, mem_wr_addr, mem_rd_addr, mem_wr_ena);

	//parameter definitions
	parameter N = 32;
	
	//port definitions - customize for different bit widths
	input wire clk, rstb;
	input wire [N-1:0] read_data;
	output wire [N-1:0] mem_wr_addr, mem_rd_addr, write_data;
	output wire mem_wr_ena;
	
	// Flip-flops
	reg [N-1:0] pc, ir, regD1, regD2, regW, regLD;
	
	// Needed wires
	wire [N-1:0] srcA, srcB, aluOut, pcNext, jAddr;
	wire aluEqual, aluZero, aluOverflow;
	wire [3:0] aluControl;
	wire [1:0] aluSrcB, pcSrc, regDst, memToReg;
	wire pc_write, ir_write, reg_write, aluSrcA, IorD, pc_en, branch, branchNE;
	
	// Decoded instruction
	wire [5:0] opcode, funct;
	wire [4:0] rs, rt, rd, shamt;
	wire [15:0] imm;
	wire [31:0] imm_ext;
	wire [25:0] jump_addr;
	wire [31:0] branch_addr;
	
	// Register file data
	wire [4:0] reg_rd_addr0, reg_rd_addr1, reg_wr_addr;
	wire [31:0] reg_rd_data0, reg_rd_data1;
	wire [31:0] reg_wr_data;
	
	// FSM state
	reg [4:0] state;
	
	// Assigning wires
	assign reg_rd_addr0 = rs;
	assign reg_rd_addr1 = rt;
	assign write_data = regD2;
	assign mem_wr_addr = regW;
	assign pc_en = pc_write | (branch & aluZero) | (branchNE & ~aluZero);
	
	// Instantiate muxes
	mux2to1 #(.N(N)) srcAmux (.select(aluSrcA), .inA(pc), .inB(regD1), .out(srcA));
	mux4to1 #(.N(N)) srcBmux (.select(aluSrcB), .inA(regD2), .inB(4), .inC(imm_ext), .inD(branch_addr), .out(srcB));
	mux2to1 #(.N(N)) IorDmux (.select(IorD), .inA(pc), .inB(regW), .out(mem_rd_addr));
	mux4to1 #(.N(N)) regDstmux (.select(regDst), .inA(rt), .inB(rd), .inC(31), .inD(0), .out(reg_wr_addr));
	mux4to1 #(.N(N)) memToRegmux (.select(memToReg), .inA(regW), .inB(regLD), .inC(pc), .inD(0), .out(reg_wr_data));
	mux4to1 #(.N(N)) pcmux (.select(pcSrc), .inA(aluOut), .inB(regW), .inC(jAddr), .inD(regD1), .out(pcNext));
	
	// Instantiate ALU
	alu #(.N(N)) alu (.x(srcA), .y(srcB), .op_code(aluControl), .z(aluOut), .equal(aluEqual), .zero(aluZero), .overflow(aluOverflow));
	
	// Instantiate control
	control CONTROL (.state(state), .opcode(opcode), .funct(funct), .pc_write(pc_write), .ir_write(ir_write), .reg_write(reg_write), .aluSrcA(aluSrcA), .aluSrcB(aluSrcB), .aluControl(aluControl), .mem_wr_ena(mem_wr_ena), .IorD(IorD), .regDst(regDst), .memToReg(memToReg), .pcSrc(pcSrc), .branch(branch), .branchNE(branchNE));
	
	// Instruction decoder
	instruction_decoder DECODE (.instruction(ir), .opcode(opcode), .rs(rs), .rt(rt), .rd(rd), .shamt(shamt), .funct(funct), .imm(imm), .jump_addr(jump_addr));
	
	// register file
	register_file regs (.clk(clk), .rst(rstb), .rd_addr0(reg_rd_addr0), .rd_addr1(reg_rd_addr1), .wr_addr(reg_wr_addr), .rd_data0(reg_rd_data0), .rd_data1(reg_rd_data1), .wr_data(reg_wr_data), .wr_ena(reg_write));
	
	// sign extend
	sign_extend ext (.in(imm), .out(imm_ext));
	
	// Jump address
	jumpAddr jumpAddr (.addr(jump_addr), .instr(pc[N-1:N-4]), .out(jAddr));
	
	// Branch address
	shiftLeftTwo branchAddr (.in(imm_ext), .out(branch_addr));
	
	//module body
	initial begin
		pc <= 'h00400000;
		state <= `FETCH;
		ir <= 0;
		regD1 <= 0;
		regD2 <= 0;
		regW <= 0;
		regLD <= 0;
	end
	
	always @(posedge clk) begin
		if (pc_en) begin
			pc <= pcNext;
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
			if (opcode == `OPRTYPE & funct == `MIPS_JR) begin
				state <= `JR;
			end
			else if (opcode == `OPRTYPE) begin     // All R type except JR
				state <= `EXECUTE;
			end
			else if (opcode == `OPADDI | opcode == `OPANDI | opcode == `OPORI | opcode == `OPXORI | opcode == `OPSLTI) begin
				state <= `EXECUTE_IMM;
			end
			else if (opcode == `OPSW | opcode == `OPLW) begin
				state <= `MEMADDR;
			end
			else if (opcode == `OPJUMP) begin
				state <= `JUMP;
			end
			else if (opcode == `OPJAL) begin
				state <= `JAL;
			end
			else if (opcode == `OPBEQ) begin
				state <= `BEQ;
			end
			else if (opcode == `OPBNE) begin
				state <= `BNE;
			end
			
			if (opcode == `OPRTYPE & (funct == `MIPS_SLL | funct == `MIPS_SRL | funct == `MIPS_SRA)) begin
				regD1 <= reg_rd_data1;
				regD2 <= shamt;
			end
			else begin
				regD1 <= reg_rd_data0;
				regD2 <= reg_rd_data1;
			end
			
			// Branch address calculation
			regW <= aluOut;
		end
		else if (state == `EXECUTE) begin
			state <= `ALU_WRITEBACK;
			regW <= aluOut;
		end
		else if (state == `EXECUTE_IMM) begin
			state <= `ALU_WRITEBACK;
			regW <= aluOut;
		end
		else if (state == `ALU_WRITEBACK) begin
			state <= `FETCH;
		end
		else if (state == `MEMADDR) begin
			if (opcode == `OPLW) begin
				state <= `MEMREAD;
			end
			else if (opcode == `OPSW) begin
				state <= `MEMWRITE;
			end
			
			regW <= aluOut;
		end
		else if (state == `MEMREAD) begin
			state <= `MEMREAD_WAIT;
		end
		else if (state == `MEMREAD_WAIT) begin
			state <= `MEM_WRITEBACK;
			regLD <= read_data;
		end
		else if (state == `MEM_WRITEBACK) begin
			state <= `FETCH;
		end
		else if (state == `MEMWRITE) begin
			state <= `FETCH;
		end
		else if (state == `JUMP) begin
			state <= `FETCH;
		end
		else if (state == `JR) begin
			state <= `FETCH;
		end
		else if (state == `JAL) begin
			state <= `FETCH;
		end
		else if (state == `BEQ) begin
			state <= `FETCH;
		end
		else if (state == `BNE) begin
			state <= `FETCH;
		end
	end

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
