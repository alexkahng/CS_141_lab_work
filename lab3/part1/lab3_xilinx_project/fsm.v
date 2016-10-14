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
module fsm(clock, switch, led, equal, center, reset, ctr);

	//parameter definitions
	
	//port definitions - customize for different bit widths
	input wire [7:0] switch;
	input wire clock, center, reset;
	input wire [1:0] ctr;
	output reg [7:0] led;
	output reg equal;
	
	reg [2:0] mode, head;
	wire [5:0] out;
	reg [5:0] in;
	reg add;
	reg [1:0] state;
	reg add_mode, out_sum, inc_head, w;
	
	tape #(.SIZE(2)) tape0 (.clk(clock), .mode(mode[0]), .head(head), .reset(reset), .in(in[1:0]), .out(out[1:0]));
	tape #(.SIZE(2)) tape1 (.clk(clock), .mode(mode[1]), .head(head), .reset(reset), .in(in[3:2]), .out(out[3:2]));
	tape #(.SIZE(2)) tape2 (.clk(clock), .mode(mode[2]), .head(head), .reset(reset), .in(in[5:4]), .out(out[5:4]));
	
	initial begin
		head <= 3'b000;
		add <= 0;
		add_mode <= 0;
		state <= 0;
		out_sum <= 0;
		inc_head <= 0;
		w <= 0;
		equal <= 1;
		led <= 0;
	end
	
	always @(posedge clock) begin
		// Make sure we don't accidentally write
		mode <= 0;
		
		// Wait for write to go through
		if (inc_head && !w) begin
			w <= 1;
		end
		else if (inc_head && w) begin
			head <= head + 1;
			inc_head <= 0;
		end
		else if (!inc_head && w) begin
			w <= 0;
		end
		
		// On reset, reset everything
		if (reset) begin
			head <= 3'b000;
			add <= 0;
			add_mode <= 0;
			state <= 0;
			out_sum <= 0;
			inc_head <= 0;
			w <= 0;
			equal <= 1;
			led <= 0;
		end
		
		else begin
			// Initialization
			if (!add && !w) begin
				if (ctr !== 0) begin
					// When center first pressed
					if (center && head === 0) begin
						case (ctr)
							2'b01: begin
								mode[0] <= 1;
								in[1:0] <= switch[head];
							end
							2'b10: begin
								mode[1] <= 1;
								in[3:2] <= switch[head];
							end
							default: begin
								$display("ERROR IN CTR CASE");
							end
						endcase
						inc_head <= 1;
					end
					// After center press, propagate through rest of tape
					if (head < 7 && head > 0) begin
						case (ctr)
							2'b01: begin
								mode[0] <= 1;
								in[1:0] <= switch[head];
							end
							2'b10: begin
								mode[1] <= 1;
								in[3:2] <= switch[head];
							end
							default: begin
								$display("ERROR IN CTR CASE");
							end
						endcase
						inc_head <= 1;
					end
					// End case. End with blank
					else if (head === 7) begin
						case (ctr)
							2'b01: begin
								mode[0] <= 1;
								in[1:0] <= -1;
							end
							2'b10: begin
								mode[1] <= 1;
								in[3:2] <= -1;
							end
							default: begin
								$display("ERROR IN CTR CASE");
							end
						endcase
						// If press is second time, start adding
						if (ctr === 2) begin
							add <= 1;
						end
						inc_head <= 1;
					end
				end	
			end
			
			// Compute sum
			else if (add && !w) begin
				// Reading tapes
				if (!add_mode) begin
					mode[0] <= 0;
					mode[1] <= 0;
					add_mode <= 1;
				end
				// Adding and writing
				else begin
					if (state[1] & !state[0]) begin
						out_sum <= 1;
						add <= 0;
					end
					else if (state[1] & state[0]) begin
						add <= 0;
						$display("REJECT STATE REACHED");
					end
					else begin
						// Checking for equality
						if (out[0] !== out[2]) begin
							equal <= 0;
						end
					
						// Combinational logic for setting in and states
						in[5] <= 0; 
						in[4] <= (state[0] ^ out[0] ^ out[2]) & !state[1];
						mode[2] <= 1;
						
						state[1] <= (out[1] & out[3]) | state[1];
						state[0] <= !state[1] & !(out[1] | out[3]) & ((!state[0] & out[0] & out[2]) | (state[0] & (out[0] | out[2])));
						
						inc_head <= 1;
						add_mode <= 0;
					end
				end
			end
			
			// Read from output tape
			if (out_sum & !w) begin
				mode[2] <= 0;
				inc_head <= 1;
			end
			// Pass through to LED
			else if (out_sum & w & inc_head) begin
				led[head] <= out[4];
				if (head === 7) begin
					out_sum <= 0;
				end
			end
		end
	end


endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
