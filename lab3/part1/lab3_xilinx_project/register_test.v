`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:33:35 10/06/2016
// Design Name:   register
// Module Name:   Z:/CS_141_lab_work/lab3/lab3_start/register_test.v
// Project Name:  lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: register
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module register_test;

	// Inputs
	reg clk;
	reg ena;
	reg rst;
	reg [1:0] in;

	// Outputs
	wire [1:0] out;

	// Instantiate the Unit Under Test (UUT)
	register uut (
		.clk(clk), 
		.ena(ena), 
		.rst(rst), 
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		ena = 1;
		rst = 0;
		in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		// Check if input passes through to output while enable is on
		#10;
		in <= 2'b01;
		#40;
		in <= 2'b11;
		#40;
		
		// Ensure output does not change unless on posedge
		in <= 2'b00;
		#20;
		in <= 2'b01;
		#20;
		
		// Ensure output does not change when enable is off
		ena = 0;
		in <= 2'b00;
		#40;
		in <= 2'b11;
		#40;
		
		// Check that reset sets output to -1
		rst = 1;
		#40;
		rst = 0;
		#40;
	end
      
	// Simulate clock
	always #20 begin
		clk = ~clk;
	end
		
endmodule

