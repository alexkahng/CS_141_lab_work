`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:13:33 09/20/2016
// Design Name:   bit_adder
// Module Name:   Z:/shared_with_vm_cs141/lab2/bit_adder_test.v
// Project Name:  lab2_alu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bit_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bit_adder_test;

	// Inputs
	reg X;
	reg Y;
	reg Cin;

	// Outputs
	wire Cout;
	wire Z;

	// Instantiate the Unit Under Test (UUT)
	bit_adder uut (
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
		X = 0;
		Y = 0;
		Cin = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		//simulate all of the possible switch inputs
	
	
		//set the switch to be one of every possible value
		for(i = 0; i <= 7; i = i + 1) begin
			X = i[2];
			Y = i[1];
			Cin = i[0];
			#10;
		end
		$finish;
	end
	
	always @(X or Y or Cin) begin
		// Wait step to make sure we're checking output
		#1;
		
		assign sum = X + Y + Cin;
		
		// Checking Z term
		if (Z !== sum[0]) begin
			$display("Error: Z (%d) is not equal to sum[0] (%d)", Z, sum[0]);
			$stop;
		end
		// Checking carry out (Cout) term
		if (Cout !== sum[1]) begin
			$display("Error: Cout (%d) is not equal to sum[1] (%d)", Cout, sum[1]);
			$stop;
		end
		
	end
      
endmodule

