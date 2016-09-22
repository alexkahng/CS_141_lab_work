`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:   CS141
// Engineer:  Avinash Uttamchandani
//
////////////////////////////////////////////////////////////////////////////////

`include "alu_defines.v"

module test_alu;

	// Inputs
	reg [31:0] X;
	reg [31:0] Y;
	reg [3:0] op_code;

	// Outputs
	wire [31:0] Z;
	wire equal;
	wire overflow;
	wire zero;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.X(X), 
		.Y(Y), 
		.Z(Z), 
		.op_code(op_code), 
		.equal(equal), 
		.overflow(overflow), 
		.zero(zero)
	);

	// HINT: 'integer' variables might be useful
	integer i;
	initial begin
		// Initialize Inputs
		X = 0;
		Y = 0;
		op_code = 0;
		
		#100;
		
		// YOUR CODE HERE
		// loop through all important test vectors
		// this triggers the always block
		
		// Testing OR / NOR / XOR / AND
		for (i = 0; i < 4; i = i + 1) begin
			op_code = i;
			X = 32'h00000000;
			Y = 32'h00000000;
			#10;
			X = 32'hFFFFFFFF;
			#10;
			Y = 32'hFFFFFFFF;
			#10;
			X = 32'h00000000;
			#10;
		end
		
		// Testing ADD
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
		
		
		
		$finish;
	
	end
	
	//a checker
	always @(X,Y,op_code) begin
		#1;
		if (X === Y && !equal || X !== Y && equal) begin
			$display("ERROR: EQUAL flag error: op_code = %b, X = %h, Y = %h, Z = %h", op_code, X, Y, Z);
			error = error + 1;
		end
		if (Z === 0 && !zero || Z !== 0 && zero) begin
			$display("ERROR: ZERO flag error: op_code = %b, X = %h, Y = %h, Z = %h", op_code, X, Y, Z);
			error = error + 1;
		end
		case (op_code)
			`ALU_OP_AND : begin
				//only executes when the op code is 0000 (AND)
				if( Z !== (X & Y) ) begin
					$display("ERROR: AND:  op_code = %b, X = %h, Y = %h, Z = %h", op_code, X, Y, Z);
					error = error + 1;
				end
			end
			// ADD IN YOUR OWN OP CODE CHECKERS HERE!!!
			`ALU_OP_XOR : begin
				//only executes when the op code is 0010 (XOR)
				if( Z !== (X ^ Y) ) begin
					$display("ERROR: AND:  op_code = %b, X = %h, Y = %h, Z = %h", op_code, X, Y, Z);
					error = error + 1;
				end
			end
			`ALU_OP_OR : begin
				//only executes when the op code is 0001 (OR)
				if( Z !== (X | Y) ) begin
					$display("ERROR: AND:  op_code = %b, X = %h, Y = %h, Z = %h", op_code, X, Y, Z);
					error = error + 1;
				end
			end
			`ALU_OP_NOR: begin
				//only executes when the op code is 0011 (NOR)
				if( Z !== ~(X | Y) ) begin
					$display("ERROR: AND:  op_code = %b, X = %h, Y = %h, Z = %h", op_code, X, Y, Z);
					error = error + 1;
				end
			end
			`ALU_OP_ADD: begin
				if (Z !== X + Y) begin
					$display("ERROR: ADD:  op_code = %b, X = %h, Y = %h, Z = %h", op_code, X, Y, Z);
					error = error + 1;
				end
				if ((X[31] == 1 && Y[31] == 1 && Z[31] == 0 || X[31] == 0 && Y[31] == 0 && Z[31] == 1) && !overflow) begin
					$display("ERROR: ADD: overflow error: op_code = %b, X = %h, Y = %h, Z = %h", op_code, X, Y, Z);
					error = error + 1;
				end
				if (!(X[31] == 1 && Y[31] == 1 && Z[31] == 0 || X[31] == 0 && Y[31] == 0 && Z[31] == 1) && overflow) begin
					$display("ERROR: ADD: overflow error: op_code = %b, X = %h, Y = %h, Z = %h", op_code, X, Y, Z);
					error = error + 1;
				end
			end
			`ALU_OP_SUB: begin
			end
			`ALU_OP_SLT: begin
			end
			`ALU_OP_SRL: begin
			end
			`ALU_OP_SLL: begin
			end
			`ALU_OP_SRA: begin
			end
			default : begin
				//executes at default
				if (Z !== 32'd0) begin
					$display("ERROR HAPPENED! invalid op code, Z was not zero, op_code = %b, X = %h, Y = %h, Z = %h", op_code, X, Y, Z);
				end
			end
		endcase
		
	end
	
endmodule

