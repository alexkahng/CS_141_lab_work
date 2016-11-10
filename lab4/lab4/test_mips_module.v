`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:20:58 11/01/2016
// Design Name:   mips_module
// Module Name:   Z:/shared_with_vm_cs141/lab4-start/test_mips_module.v
// Project Name:  lab4-start
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mips_module
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_mips_module;

	// Inputs
	reg clk;
	reg rstb;
	reg [31:0] read_data;

	// Outputs
	wire [31:0] mem_wr_addr;
	wire [31:0] mem_rd_addr;
	wire mem_wr_ena;

	// Instantiate the Unit Under Test (UUT)
	mips_module uut (
		.clk(clk), 
		.rstb(rstb), 
		.read_data(read_data), 
		.mem_wr_addr(mem_wr_addr), 
		.mem_rd_addr(mem_rd_addr), 
		.mem_wr_ena(mem_wr_ena)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rstb = 0;
		read_data = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always #50 clk = ~clk;
      
endmodule

