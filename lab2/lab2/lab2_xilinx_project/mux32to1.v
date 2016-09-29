`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    mux32to1 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module mux32to1(X, Y, Z);

	//parameter definitions

	//port definitions - customize for different bit widths
	input  wire [31:0] X;
	input  wire [4:0]  Y;
	output wire Z;

	//module body
	assign Z = Y[4] ? (Y[3] ? (Y[2] ? (Y[1] ? (Y[0] ? X[31] : X[30])
	                                        : (Y[0] ? X[29] : X[28]))
								           : (Y[1] ? (Y[0] ? X[27] : X[26])
	                                        : (Y[0] ? X[25] : X[24])))
				               : (Y[2] ? (Y[1] ? (Y[0] ? X[23] : X[22])
	                                        : (Y[0] ? X[21] : X[20]))
								           : (Y[1] ? (Y[0] ? X[19] : X[18])
	                                        : (Y[0] ? X[17] : X[16]))))
						 : (Y[3] ? (Y[2] ? (Y[1] ? (Y[0] ? X[15] : X[14])
	                                        : (Y[0] ? X[13] : X[12]))
								           : (Y[1] ? (Y[0] ? X[11] : X[10])
	                                        : (Y[0] ? X[9] : X[8])))
				               : (Y[2] ? (Y[1] ? (Y[0] ? X[7] : X[6])
	                                        : (Y[0] ? X[5] : X[4]))
								           : (Y[1] ? (Y[0] ? X[3] : X[2])
	                                        : (Y[0] ? X[1] : X[0]))));

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
