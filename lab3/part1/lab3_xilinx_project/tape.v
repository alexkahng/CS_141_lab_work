`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    tape 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module tape(clk, mode, head, reset, in, out);

	//parameter definitions
	parameter SIZE = 2;

	//port definitions -	customize for different bit widths
	// mode = 0 for read; = 1 for write
	input wire clk, reset;
	input wire mode;
	// in and out are 00 for 0, 01 for 1, 10 / 11 for blank (MSB = 1)
	input wire [1:0] in;
	input wire [2:0] head;
	output reg [1:0] out;
	reg [15:0] in_exp;
	wire [15:0] out_exp;
	
	register #(.SIZE(SIZE)) reg0 (.clk(clk), .ena((mode === 1 && head === 3'b000)), .rst(reset), .in(in), .out(out_exp[1:0]));
	register #(.SIZE(SIZE)) reg1 (.clk(clk), .ena((mode === 1 && head === 3'b001)), .rst(reset), .in(in), .out(out_exp[3:2]));
	register #(.SIZE(SIZE)) reg2 (.clk(clk), .ena((mode === 1 && head === 3'b010)), .rst(reset), .in(in), .out(out_exp[5:4]));
	register #(.SIZE(SIZE)) reg3 (.clk(clk), .ena((mode === 1 && head === 3'b011)), .rst(reset), .in(in), .out(out_exp[7:6]));
	register #(.SIZE(SIZE)) reg4 (.clk(clk), .ena((mode === 1 && head === 3'b100)), .rst(reset), .in(in), .out(out_exp[9:8]));
	register #(.SIZE(SIZE)) reg5 (.clk(clk), .ena((mode === 1 && head === 3'b101)), .rst(reset), .in(in), .out(out_exp[11:10]));
	register #(.SIZE(SIZE)) reg6 (.clk(clk), .ena((mode === 1 && head === 3'b110)), .rst(reset), .in(in), .out(out_exp[13:12]));
	register #(.SIZE(SIZE)) reg7 (.clk(clk), .ena((mode === 1 && head === 3'b111)), .rst(reset), .in(in), .out(out_exp[15:14]));

	always @(posedge clk) begin
		// Read mode
		if (mode === 0) begin
			case (head)
				3'b000: out <= out_exp[1:0];
				3'b001: out <= out_exp[3:2];
				3'b010: out <= out_exp[5:4];
				3'b011: out <= out_exp[7:6];
				3'b100: out <= out_exp[9:8];
				3'b101: out <= out_exp[11:10];
				3'b110: out <= out_exp[13:12];
				3'b111: out <= out_exp[15:14];
			endcase
		end
	end

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
