`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    fsm 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module fsm(clock, switch, led, center, reset, ctr);

	//parameter definitions
	
	//port definitions - customize for different bit widths
	input wire [7:0] switch;
	input wire clock, center, reset;
	input reg [2:0] ctr;
	output wire [7:0] led;
	
	wire [2:0] move;
	reg [2:0] mode, in, out, head;
	
	tape #(.SIZE(2)) tape0 (.clk(clock), .mode(mode[0]), .move(move[0]), .reset(reset), .in(in[0]), .out(out[0]));
	tape #(.SIZE(2)) tape1 (.clk(clock), .mode(mode[1]), .move(move[1]), .reset(reset), .in(in[1]), .out(out[1]));
	tape #(.SIZE(2)) tape2 (.clk(clock), .mode(mode[2]), .move(move[2]), .reset(reset), .in(in[2]), .out(out[2]));
	
	initial begin
		head <= 3'b000;
	end
	
	always @(posedge clock) begin
		if (center) begin
			mode[ctr - 1] <= 1;
			in[ctr - 1] <= switch[0];
			head <= head + 1;
		end
		
		if (head !== 0) begin
			in[ctr - 1] <= switch[head];
			head <= head + 1;
		end
		
		
	end

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
