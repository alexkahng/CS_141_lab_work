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
module tape(clk, mode, move, reset, in, out);

	//parameter definitions
	parameter SIZE = 2;

	//port definitions -	customize for different bit widths
	// mode = 0 for read; = 1 for write
	// move = 0 for right (toward LSB); = 1 for left (toward MSB)
	input wire clk, mode, move;
	// in and out are 00 for 0, 01 for 1, 10 / 11 for blank (MSB = 1)
	input wire [1:0] in;
	output wire [1:0] out;
	reg [7:0] ena, rst;
	reg [15:0] in_exp, out_exp;
	reg [2:0] head;
	
	register #(.SIZE(SIZE)) reg0 (.clk(clk), .ena(ena[0]), .rst(rst[0]), .in(in_exp[1:0]), .out(out_exp[1:0]));
	register #(.SIZE(SIZE)) reg1 (.clk(clk), .ena(ena[1]), .rst(rst[1]), .in(in_exp[3:2]), .out(out_exp[3:2]));
	register #(.SIZE(SIZE)) reg2 (.clk(clk), .ena(ena[2]), .rst(rst[2]), .in(in_exp[5:4]), .out(out_exp[5:4]));
	register #(.SIZE(SIZE)) reg3 (.clk(clk), .ena(ena[3]), .rst(rst[3]), .in(in_exp[7:6]), .out(out_exp[7:6]));
	register #(.SIZE(SIZE)) reg4 (.clk(clk), .ena(ena[4]), .rst(rst[4]), .in(in_exp[9:8]), .out(out_exp[9:8]));
	register #(.SIZE(SIZE)) reg5 (.clk(clk), .ena(ena[5]), .rst(rst[5]), .in(in_exp[11:10]), .out(out_exp[11:10]));
	register #(.SIZE(SIZE)) reg6 (.clk(clk), .ena(ena[6]), .rst(rst[6]), .in(in_exp[13:12]), .out(out_exp[13:12]));
	register #(.SIZE(SIZE)) reg7 (.clk(clk), .ena(ena[7]), .rst(rst[7]), .in(in_exp[15:14]), .out(out_exp[15:14]));

	assign head = 3'b000;

	always @(posedge clk) begin
		// Write mode
		if (mode) begin
			case (head)
				3'b000: begin
					if (reset) begin
						rst[0] <= 1;
						ena[0] <= 0;
					end
					else begin
						rst[0] <= 0;
						ena[0] <= 1;
						in_exp[1:0] <= in;
					end
				end
				3'b001: begin
					if (reset) begin
						rst[1] <= 1;
						ena[1] <= 0;
					end
					else begin
						rst[1] <= 0;
						ena[1] <= 1;
						in_exp[3:2] <= in;
					end
				end
				3'b010: begin
					if (reset) begin
						rst[2] <= 1;
						ena[2] <= 0;
					end
					else begin
						rst[2] <= 0;
						ena[2] <= 1;
						in_exp[5:4] <= in;
					end
				end
				3'b011: begin
					if (reset) begin
						rst[3] <= 1;
						ena[3] <= 0;
					end
					else begin
						rst[3] <= 0;
						ena[3] <= 1;
						in_exp[7:6] <= in;
					end
				end
				3'b100: begin
					if (reset) begin
						rst[4] <= 1;
						ena[4] <= 0;
					end
					else begin
						rst[4] <= 0;
						ena[4] <= 1;
						in_exp[9:8] <= in;
					end
				end
				3'b101: begin
					if (reset) begin
						rst[5] <= 1;
						ena[5] <= 0;
					end
					else begin
						rst[5] <= 0;
						ena[5] <= 1;
						in_exp[11:10] <= in;
					end
				end
				3'b110: begin
					if (reset) begin
						rst[6] <= 1;
						ena[6] <= 0;
					end
					else begin
						rst[6] <= 0;
						ena[6] <= 1;
						in_exp[13:12] <= in;
					end
				end
				3'b111: begin
					if (reset) begin
						rst[7] <= 1;
						ena[7] <= 0;
					end
					else begin
						rst[7] <= 0;
						ena[7] <= 1;
						in_exp[15:14] <= in;
					end
				end
			endcase
		end
		// Read mode
		else begin
			case (head)
				3'b000: out = out_exp[1:0];
				3'b001: out = out_exp[3:2];
				3'b010: out = out_exp[5:4];
				3'b011: out = out_exp[7:6];
				3'b100: out = out_exp[9:8];
				3'b101: out = out_exp[11:10];
				3'b110: out = out_exp[13:12];
				3'b111: out = out_exp[15:14];
			endcase
		end
		
		// move = 1 moves toward MSB
		if (move) begin
			head = head + 1;
		end 
		else begin
			head = head - 1;
		end
	end

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
