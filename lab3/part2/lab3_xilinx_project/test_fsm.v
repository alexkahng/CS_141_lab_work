`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:38:29 10/13/2016
// Design Name:   fsm
// Module Name:   Z:/shared_with_vm_cs141/lab3/part1/lab3_xilinx_project/test_fsm.v
// Project Name:  lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fsm
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_fsm;

	// Inputs
	reg clock;
	reg [7:0] switch;
	reg center;
	reg reset;
	reg [1:0] ctr;

	// Outputs
	wire [7:0] led;
	wire equal;

	// Instantiate the Unit Under Test (UUT)
	fsm uut (
		.clock(clock), 
		.switch(switch), 
		.led(led), 
		.center(center), 
		.reset(reset), 
		.ctr(ctr),
		.equal(equal)
	);

	initial begin
		// Initialize Inputs
		clock = 0;
		switch = 0;
		center = 0;
		reset = 0;
		ctr = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		switch <= 8'b00001111;
		ctr <= 1;
		center <= 1;
		#10;
		center <= 0;
		#390;
		switch <= 8'b00101010;
		ctr <= 2;
		center <= 1;
		#10;
		center <= 0;
		#990;
		reset <= 1;
		#10;
		reset <= 0;
		#10;
		switch <= 8'b00001111;
		ctr <= 1;
		center <= 1;
		#10;
		center <= 0;
		#390;
		switch <= 8'b00101010;
		ctr <= 2;
		center <= 1;
		#10;
		center <= 0;
		#990;
		
		
		

	end
	
	always #5 begin
		clock = ~clock;
	end
      
endmodule

