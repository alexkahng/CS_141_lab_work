`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:33:58 09/27/2016
// Design Name:   subtractor
// Module Name:   Z:/shared_with_vm_cs141/lab2/lab2_xilinx_project/subtractor_test.v
// Project Name:  lab2_alu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: subtractor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module subtractor_test;

	// Inputs
	reg [31:0] X;
	reg [31:0] Y;
	reg Cin;

	// Outputs
	wire Cout;
	wire [31:0] Z;

	// Instantiate the Unit Under Test (UUT)
	subtractor uut (
		.X(X), 
		.Y(Y), 
		.Cin(Cin), 
		.Cout(Cout), 
		.Z(Z)
	);

	initial begin
		// Initialize Inputs
		X = 0;
		Y = 0;
		Cin = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		

	end
      
endmodule

