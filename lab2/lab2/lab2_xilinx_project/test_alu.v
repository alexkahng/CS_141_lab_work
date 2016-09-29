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
	reg Cin;
	reg Cout;
	reg error;

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
	integer i, j, k;
	
	initial begin
		// Initialize Inputs
		X = 0;
		Y = 0;
		op_code = 0;
		
		#100;
		
		// Testing OR / NOR / XOR / AND
		for (i = 0; i <= 3; i = i + 1) begin
			op_code = i;
			X = 32'b00000000000000000000000000000000;
			Y = 32'b00000000000000000000000000000000;
			#10;
			X = 32'b11111111111111111111111111111111;
			#10;
			Y = 32'b11111111111111111111111111111111;
			#10;
			X = 32'b00000000000000000000000000000000;
			#10;
//			// Random input
//			for (j = 0; j <= 63; j = j + 1) begin
//				X = $random%(2**31);
//				Y = $random%(2**31);
//				#10;
//			end
		end
		
		// Testing ADD
		op_code = 4'b0101;
		X = 1;
		Y = 1;
		Cin = 0;
		Cout = 0;

		#100;
        
		// Testing all connections in ripple-carry adder
		for (i = 0; i <= 31; i = i + 1) begin
			X = X << 1;
			Y = Y << 1;
			#10;
		end
		
//		// Random input
//		for (i = 0; i <= 1023; i = i + 1) begin
//			X = $random%(2**31);
//			Y = $random%(2**31);
//			#10;
//		end
		
		// Testing SUB
		op_code = 4'b0110;
		
		// Overflow cases
		X = 32'b10000000000000000000000000000000;
		Y = 32'b01111111111111111111111111111111;
		Cin = 0;
		Cout = 0;

		#100;
		
		Y = 32'b10000000000000000000000000000000;
		X = 32'b01111111111111111111111111111111;

		#100;
		
//		// Random input
//		for (i = 0; i <= 10; i = i + 1) begin
//			X = $random%(2**31);
//			Y = $random%(2**31);
//			#10;
//		end

		// Testing SLT
		op_code = 4'b0111;
		X = 32'b00000000000000000000000000000000;
		Y = 32'b00000000000000000000000000000001;
		#10;
		Y = 32'b00000000000000000000000000000000;
		X = 32'b00000000000000000000000000000001;
		#10;
		X = 32'b01111111111111111111111111111111;
		Y = 32'b10000000000000000000000000000000;
		#10;
		Y = 32'b01111111111111111111111111111111;
		X = 32'b10000000000000000000000000000000;
		#10;
		
		
		// Testing SRL / SLL / SRA
		for (i = 8; i <= 10; i = i + 1) begin
			op_code = i;
			for (j = 0; j <= 1; j = j + 1) begin
				X = $random%(2**31);
				for (k = -1; k <= 33; k = k + 1) begin
					Y = k;
					#10;
				end
			end
		end		
		
		
		// Testing all other op_codes
		X = $random%(2**31);
		Y = $random%(2**31);
		for (i = 0; i <= 15; i = i + 1) begin
			op_code = i[3:0];
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
				if (Z !== X - Y) begin
					$display("ERROR: SUB:  op_code = %b, X = %h, Y = %h, Z = %h", op_code, X, Y, Z);
					error = error + 1;
				end
				if ((X[31] == 1 && Y[31] == 0 && Z[31] == 0 || X[31] == 0 && Y[31] == 1 && Z[31] == 1) && !overflow) begin
					$display("ERROR: SUB: overflow error: op_code = %b, X = %h, Y = %h, Z = %h", op_code, X, Y, Z);
					error = error + 1;
				end
				if (!(X[31] == 1 && Y[31] == 0 && Z[31] == 0 || X[31] == 0 && Y[31] == 1 && Z[31] == 1) && overflow) begin
					$display("ERROR: SUB: overflow error: op_code = %b, X = %h, Y = %h, Z = %h", op_code, X, Y, Z);
					error = error + 1;
				end			
			end
			`ALU_OP_SLT: begin
				if ($signed(X) < $signed(Y) && Z !== 32'd1) begin
					$display("ERROR: SLT: X = %h, Y = %h. Expected 1 but got 0", X, Y);
					error = error + 1;
				end
				if ($signed(X) >= $signed(Y) && Z !== 32'd0) begin
					$display("ERROR: SLT: X = %h, Y = %h. Expected 0 but got 1", X, Y);
					error = error + 1;
				end
			end
			`ALU_OP_SRL: begin
				if ((Y >= 32 || Y < 0) && Z !== 32'd0) begin
					$display("ERROR: SRL: Expected 0 but got something else");
					error = error + 1;
				end
				if ((0 <= Y && Y <= 31) && Z !== X >> Y) begin
					$display("ERROR: SRL: op_code = %b, X = %h, Y = %h, Z = %h", op_code, X, Y, Z);
					error = error + 1;
				end
			end
			`ALU_OP_SLL: begin
				if ((Y >= 32 || Y < 0) && Z !== 32'd0) begin
					$display("ERROR: SLL: Expected 0 but got something else");
					error = error + 1;
				end
				if ((0 <= Y && Y <= 31) && Z !== X << Y) begin
					$display("ERROR: SLL: op_code = %b, X = %h, Y = %h, Z = %h", op_code, X, Y, Z);
					error = error + 1;
				end
			end
			`ALU_OP_SRA: begin
			if ((Y >= 32 || Y < 0) && Z !== 32'd0) begin
					$display("ERROR: SRA: Expected 0 but got something else");
					error = error + 1;
				end
				if ((0 <= Y && Y <= 31) && Z !== X >>> Y) begin
					$display("ERROR: SRA: op_code = %b, X = %h, Y = %h, Z = %h", op_code, X, Y, Z);
					error = error + 1;
				end
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

