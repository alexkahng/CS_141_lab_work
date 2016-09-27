`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    adder 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module adder(X, Y, Cin, Cout, Z);

	//parameter definitions
	
	//port definitions - customize for different bit widths
	input wire [31:0] X, Y;
	input wire Cin;
	wire [31:0] Carrybits;
	output wire [31:0] Z;
	output wire Cout;
	
	//module body
	bit_adder BA_0 (.X(X[0]), .Y(Y[0]), .Cin(Cin), .Cout(Carrybits[0]), .Z(Z[0]));
	bit_adder BA_1 (.X(X[1]), .Y(Y[1]), .Cin(Carrybits[0]), .Cout(Carrybits[1]), .Z(Z[1]));
	bit_adder BA_2 (.X(X[2]), .Y(Y[2]), .Cin(Carrybits[1]), .Cout(Carrybits[2]), .Z(Z[2]));
	bit_adder BA_3 (.X(X[3]), .Y(Y[3]), .Cin(Carrybits[2]), .Cout(Carrybits[3]), .Z(Z[3]));
	bit_adder BA_4 (.X(X[4]), .Y(Y[4]), .Cin(Carrybits[3]), .Cout(Carrybits[4]), .Z(Z[4]));
	bit_adder BA_5 (.X(X[5]), .Y(Y[5]), .Cin(Carrybits[4]), .Cout(Carrybits[5]), .Z(Z[5]));
	bit_adder BA_6 (.X(X[6]), .Y(Y[6]), .Cin(Carrybits[5]), .Cout(Carrybits[6]), .Z(Z[6]));
	bit_adder BA_7 (.X(X[7]), .Y(Y[7]), .Cin(Carrybits[6]), .Cout(Carrybits[7]), .Z(Z[7]));
	bit_adder BA_8 (.X(X[8]), .Y(Y[8]), .Cin(Carrybits[7]), .Cout(Carrybits[8]), .Z(Z[8]));
	bit_adder BA_9 (.X(X[9]), .Y(Y[9]), .Cin(Carrybits[8]), .Cout(Carrybits[9]), .Z(Z[9]));
	bit_adder BA_10 (.X(X[10]), .Y(Y[10]), .Cin(Carrybits[9]), .Cout(Carrybits[10]), .Z(Z[10]));
	bit_adder BA_11 (.X(X[11]), .Y(Y[11]), .Cin(Carrybits[10]), .Cout(Carrybits[11]), .Z(Z[11]));
	bit_adder BA_12 (.X(X[12]), .Y(Y[12]), .Cin(Carrybits[11]), .Cout(Carrybits[12]), .Z(Z[12]));
	bit_adder BA_13 (.X(X[13]), .Y(Y[13]), .Cin(Carrybits[12]), .Cout(Carrybits[13]), .Z(Z[13]));
	bit_adder BA_14 (.X(X[14]), .Y(Y[14]), .Cin(Carrybits[13]), .Cout(Carrybits[14]), .Z(Z[14]));
	bit_adder BA_15 (.X(X[15]), .Y(Y[15]), .Cin(Carrybits[14]), .Cout(Carrybits[15]), .Z(Z[15]));
	bit_adder BA_16 (.X(X[16]), .Y(Y[16]), .Cin(Carrybits[15]), .Cout(Carrybits[16]), .Z(Z[16]));
	bit_adder BA_17 (.X(X[17]), .Y(Y[17]), .Cin(Carrybits[16]), .Cout(Carrybits[17]), .Z(Z[17]));
	bit_adder BA_18 (.X(X[18]), .Y(Y[18]), .Cin(Carrybits[17]), .Cout(Carrybits[18]), .Z(Z[18]));
	bit_adder BA_19 (.X(X[19]), .Y(Y[19]), .Cin(Carrybits[18]), .Cout(Carrybits[19]), .Z(Z[19]));
	bit_adder BA_20 (.X(X[20]), .Y(Y[20]), .Cin(Carrybits[19]), .Cout(Carrybits[20]), .Z(Z[20]));
	bit_adder BA_21 (.X(X[21]), .Y(Y[21]), .Cin(Carrybits[20]), .Cout(Carrybits[21]), .Z(Z[21]));
	bit_adder BA_22 (.X(X[22]), .Y(Y[22]), .Cin(Carrybits[21]), .Cout(Carrybits[22]), .Z(Z[22]));
	bit_adder BA_23 (.X(X[23]), .Y(Y[23]), .Cin(Carrybits[22]), .Cout(Carrybits[23]), .Z(Z[23]));
	bit_adder BA_24 (.X(X[24]), .Y(Y[24]), .Cin(Carrybits[23]), .Cout(Carrybits[24]), .Z(Z[24]));
	bit_adder BA_25 (.X(X[25]), .Y(Y[25]), .Cin(Carrybits[24]), .Cout(Carrybits[25]), .Z(Z[25]));
	bit_adder BA_26 (.X(X[26]), .Y(Y[26]), .Cin(Carrybits[25]), .Cout(Carrybits[26]), .Z(Z[26]));
	bit_adder BA_27 (.X(X[27]), .Y(Y[27]), .Cin(Carrybits[26]), .Cout(Carrybits[27]), .Z(Z[27]));
	bit_adder BA_28 (.X(X[28]), .Y(Y[28]), .Cin(Carrybits[27]), .Cout(Carrybits[28]), .Z(Z[28]));
	bit_adder BA_29 (.X(X[29]), .Y(Y[29]), .Cin(Carrybits[28]), .Cout(Carrybits[29]), .Z(Z[29]));
	bit_adder BA_30 (.X(X[30]), .Y(Y[30]), .Cin(Carrybits[29]), .Cout(Carrybits[30]), .Z(Z[30]));
	bit_adder BA_31 (.X(X[31]), .Y(Y[31]), .Cin(Carrybits[30]), .Cout(Carrybits[31]), .Z(Z[31]));
	
	assign Cout = Carrybits[31] ^ Carrybits[30];
	
endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
