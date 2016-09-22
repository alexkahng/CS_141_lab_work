`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:10:34 09/20/2016
// Design Name:   adder
// Module Name:   Z:/shared_with_vm_cs141/lab2/adder_test.v
// Project Name:  lab2_alu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module adder_test;

	// Inputs
	reg [31:0] X;
	reg [31:0] Y;
	reg Cin;
	reg Cout;

	// Outputs
	wire [31:0] Z;

	// Instantiate the Unit Under Test (UUT)
	adder uut (
		.X(X), 
		.Y(Y), 
		.Cin(Cin), 
		.Cout(Cout), 
		.Z(Z)
	);

	integer i;
	integer sum;

	initial begin
		// Initialize Inputs
		X = 1;
		Y = 1;
		Cin = 0;
		Cout = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		for (i = 0; i <= 31; i = i + 1) begin
			X = X << 1;
			Y = Y << 1;
			#10;
		end
		
		
	end
	
	
	always @(X or Y) begin
		// Wait step to make sure we're checking output
		#1;
		
		assign sum = X + Y;
		
		// Checking Z
		if (Z !== sum) begin
			$display("Error: Z (%d) is not equal to sum (%d)", Z, sum);
			$stop;
		end
		
	end
      
endmodule

