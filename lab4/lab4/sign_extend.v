`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    sign_extend 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module sign_extend(in, out);

	//parameter definitions
	
	//port definitions - customize for different bit widths
	input wire [15:0] in;
	output wire [31:0] out;
	
   assign out[0] = in[0];
   assign out[1] = in[1];
   assign out[2] = in[2];
   assign out[3] = in[3];
   assign out[4] = in[4];
   assign out[5] = in[5];
   assign out[6] = in[6];
   assign out[7] = in[7];
   assign out[8] = in[8];
   assign out[9] = in[9];
   assign out[10] = in[10];
   assign out[11] = in[11];
   assign out[12] = in[12];
   assign out[13] = in[13];
   assign out[14] = in[14];
   assign out[15] = in[15];
   assign out[16] = in[15];
   assign out[17] = in[15];
   assign out[18] = in[15];
   assign out[19] = in[15];
   assign out[20] = in[15];
   assign out[21] = in[15];
   assign out[22] = in[15];
   assign out[23] = in[15];
   assign out[24] = in[15];
   assign out[25] = in[15];
   assign out[26] = in[15];
   assign out[27] = in[15];
   assign out[28] = in[15];
   assign out[29] = in[15];
   assign out[30] = in[15];
   assign out[31] = in[15];

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
