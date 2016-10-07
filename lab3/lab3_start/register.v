`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    register 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module register(clk, ena, rst, in, out);

	//parameter definitions
	parameter SIZE = 2;

	//port definitions - customize for different bit widths
	input wire clk, ena, rst;
	// Let input / output = 00 if 0, 01 if 1, 11 OR 10 if blank (B) (i.e. leading 1 = blank)
	input wire [SIZE - 1:0] in;
	output reg [SIZE - 1:0] out;
	
	//module body
	always @(posedge clk) begin
		if (rst) begin
			out <= 2'b11;
		end
		else if (ena) begin
			out <= in;
		end
	end

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
