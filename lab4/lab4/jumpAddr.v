`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    jumpAddr 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module jumpAddr(addr, instr, out);

	//parameter definitions

	//port definitions - customize for different bit widths
	input wire [25:0] addr;
	input wire [3:0] instr;
	output wire [31:0] out;
	
	wire [31:0] shiftIn;
	wire [31:0] shiftOut;
	
   assign shiftIn[0] = addr[0];
   assign shiftIn[1] = addr[1];
   assign shiftIn[2] = addr[2];
   assign shiftIn[3] = addr[3];
   assign shiftIn[4] = addr[4];
   assign shiftIn[5] = addr[5];
   assign shiftIn[6] = addr[6];
   assign shiftIn[7] = addr[7];
   assign shiftIn[8] = addr[8];
   assign shiftIn[9] = addr[9];
   assign shiftIn[10] = addr[10];
   assign shiftIn[11] = addr[11];
   assign shiftIn[12] = addr[12];
   assign shiftIn[13] = addr[13];
   assign shiftIn[14] = addr[14];
   assign shiftIn[15] = addr[15];
   assign shiftIn[16] = addr[16];
   assign shiftIn[17] = addr[17];
   assign shiftIn[18] = addr[18];
   assign shiftIn[19] = addr[19];
   assign shiftIn[20] = addr[20];
   assign shiftIn[21] = addr[21];
   assign shiftIn[22] = addr[22];
   assign shiftIn[23] = addr[23];
   assign shiftIn[24] = addr[24];
   assign shiftIn[25] = addr[25];
	assign shiftIn[26] = 0;
	assign shiftIn[27] = 0;
	assign shiftIn[28] = 0;
	assign shiftIn[29] = 0;
	assign shiftIn[30] = 0;
	assign shiftIn[31] = 0;
	
	shiftLeftTwo shifter (.in(shiftIn), .out(shiftOut));
	
   assign out[0] = shiftOut[0];
   assign out[1] = shiftOut[1];
   assign out[2] = shiftOut[2];
   assign out[3] = shiftOut[3];
   assign out[4] = shiftOut[4];
   assign out[5] = shiftOut[5];
   assign out[6] = shiftOut[6];
   assign out[7] = shiftOut[7];
   assign out[8] = shiftOut[8];
   assign out[9] = shiftOut[9];
   assign out[10] = shiftOut[10];
   assign out[11] = shiftOut[11];
   assign out[12] = shiftOut[12];
   assign out[13] = shiftOut[13];
   assign out[14] = shiftOut[14];
   assign out[15] = shiftOut[15];
   assign out[16] = shiftOut[16];
   assign out[17] = shiftOut[17];
   assign out[18] = shiftOut[18];
   assign out[19] = shiftOut[19];
   assign out[20] = shiftOut[20];
   assign out[21] = shiftOut[21];
   assign out[22] = shiftOut[22];
   assign out[23] = shiftOut[23];
   assign out[24] = shiftOut[24];
   assign out[25] = shiftOut[25];
   assign out[26] = shiftOut[26];
   assign out[27] = shiftOut[27];
	assign out[28] = instr[0];
	assign out[29] = instr[1];
	assign out[30] = instr[2];
	assign out[31] = instr[3];

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
