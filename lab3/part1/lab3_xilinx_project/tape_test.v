`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:11:55 10/06/2016
// Design Name:   tape
// Module Name:   Z:/shared_with_vm_cs141/lab3/lab3_start/tape_test.v
// Project Name:  lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: tape
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tape_test;

	// Inputs
	reg clk;
	reg mode;
	reg move;
	reg reset;
	reg [1:0] in;

	// Outputs
	wire [1:0] out;

	// Instantiate the Unit Under Test (UUT)
	tape uut (
		.clk(clk), 
		.mode(mode), 
		.move(move), 
		.reset(reset), 
		.in(in), 
		.out(out)
	);

	integer i;
	
	initial begin
		// Initialize Inputs
		clk = 0;
		mode = 1;
		move = 1;
		reset = 0;
		in = 0;

		// Wait 100 ns for global reset to finish
		#100;
		#10;
		
		// Add stimulus here
		// Write, move back, and read
		for (i = 0; i < 8; i = i + 1) begin
			mode <= 1;
			if (i % 2 === 0) begin
				in <= 2'b01;
			end
			else begin
				in <= 2'b00;
			end
			#40;
			move <= 0;
			#40;
			mode <= 0;
			move <= 1;
			#40;
		end
		
		
		// Reset all bits in tape
		mode <= 1;
		for (i = 0; i < 8; i = i + 1) begin
			reset <= 1;
			#40;
		end
		
		// Read all bits in tape
		mode <= 0;
		for (i = 0; i < 8; i = i + 1) begin
			#40;
		end
		
		for (i = 0; i <= 150; i = i + 1) begin
			mode <= $random;
			move <= $random;
			reset <= $random;
			in <= $random;
			#100;
		end
	end
	
	
	// Simulate clock
	always #20 begin
		clk = ~clk;
	end
      
endmodule

