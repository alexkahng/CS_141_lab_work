`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:02:47 09/21/2016
// Design Name:   mux16to1_switch
// Module Name:   Z:/shared_with_vm_cs141/lab2/mux_16to1_switch_test.v
// Project Name:  lab2_alu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux16to1_switch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mux_16to1_switch_test;

	// Inputs
	reg [31:0] X;
	reg [31:0] Y;
	reg [3:0] S;

	// Outputs
	wire [31:0] Z;

	// Instantiate the Unit Under Test (UUT)
	mux16to1_switch uut (
		.X(X), 
		.Y(Y), 
		.S(S), 
		.Z(Z)
	);
	
	integer i;
	
	initial begin
		// Initialize Inputs
		X = 4;
		Y = 7;
		S = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		for(i = 0; i <= 15; i = i + 1) begin
			S = i[3:0];
			#10;
		end
		
	end
      
endmodule

