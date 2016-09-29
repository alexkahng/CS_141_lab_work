`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    sll 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module sll(X, Y, Z);

	//parameter definitions

	//port definitions - customize for different bit widths
	input  wire [31:0] X;
	input  wire [31:0]  Y;
	output wire [31:0] Z;
	wire [31:0] input0, input1, input2, input3, input4, input5, input6, input7,
	            input8,input9, input10, input11, input12, input13, input14, input15,
					input16, input17, input18, input19, input20, input21, input22, input23,
					input24, input25, input26, input27, input28, input29, input30, input31, result;
	
	//module body
	assign input31 = {X[0],X[1],X[2],X[3],X[4],X[5],X[6],X[7],X[8],X[9],X[10],X[11],X[12],X[13],X[14],X[15],X[16],X[17],X[18],X[19],X[20],X[21],X[22],X[23],X[24],X[25],X[26],X[27],X[28],X[29],X[30],X[31]};
	assign input30 = {1'b0,X[0],X[1],X[2],X[3],X[4],X[5],X[6],X[7],X[8],X[9],X[10],X[11],X[12],X[13],X[14],X[15],X[16],X[17],X[18],X[19],X[20],X[21],X[22],X[23],X[24],X[25],X[26],X[27],X[28],X[29],X[30]};
	assign input29 = {1'b0,1'b0,X[0],X[1],X[2],X[3],X[4],X[5],X[6],X[7],X[8],X[9],X[10],X[11],X[12],X[13],X[14],X[15],X[16],X[17],X[18],X[19],X[20],X[21],X[22],X[23],X[24],X[25],X[26],X[27],X[28],X[29]};
	assign input28 = {1'b0,1'b0,1'b0,X[0],X[1],X[2],X[3],X[4],X[5],X[6],X[7],X[8],X[9],X[10],X[11],X[12],X[13],X[14],X[15],X[16],X[17],X[18],X[19],X[20],X[21],X[22],X[23],X[24],X[25],X[26],X[27],X[28]};
	assign input27 = {1'b0,1'b0,1'b0,1'b0,X[0],X[1],X[2],X[3],X[4],X[5],X[6],X[7],X[8],X[9],X[10],X[11],X[12],X[13],X[14],X[15],X[16],X[17],X[18],X[19],X[20],X[21],X[22],X[23],X[24],X[25],X[26],X[27]};
	assign input26 = {1'b0,1'b0,1'b0,1'b0,1'b0,X[0],X[1],X[2],X[3],X[4],X[5],X[6],X[7],X[8],X[9],X[10],X[11],X[12],X[13],X[14],X[15],X[16],X[17],X[18],X[19],X[20],X[21],X[22],X[23],X[24],X[25],X[26]};
	assign input25 = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,X[0],X[1],X[2],X[3],X[4],X[5],X[6],X[7],X[8],X[9],X[10],X[11],X[12],X[13],X[14],X[15],X[16],X[17],X[18],X[19],X[20],X[21],X[22],X[23],X[24],X[25]};
	assign input24 = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,X[0],X[1],X[2],X[3],X[4],X[5],X[6],X[7],X[8],X[9],X[10],X[11],X[12],X[13],X[14],X[15],X[16],X[17],X[18],X[19],X[20],X[21],X[22],X[23],X[24]};
	assign input23 = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,X[0],X[1],X[2],X[3],X[4],X[5],X[6],X[7],X[8],X[9],X[10],X[11],X[12],X[13],X[14],X[15],X[16],X[17],X[18],X[19],X[20],X[21],X[22],X[23]};
	assign input22 = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,X[0],X[1],X[2],X[3],X[4],X[5],X[6],X[7],X[8],X[9],X[10],X[11],X[12],X[13],X[14],X[15],X[16],X[17],X[18],X[19],X[20],X[21],X[22]};
	assign input21 = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,X[0],X[1],X[2],X[3],X[4],X[5],X[6],X[7],X[8],X[9],X[10],X[11],X[12],X[13],X[14],X[15],X[16],X[17],X[18],X[19],X[20],X[21]};
	assign input20 = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,X[0],X[1],X[2],X[3],X[4],X[5],X[6],X[7],X[8],X[9],X[10],X[11],X[12],X[13],X[14],X[15],X[16],X[17],X[18],X[19],X[20]};
	assign input19 = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,X[0],X[1],X[2],X[3],X[4],X[5],X[6],X[7],X[8],X[9],X[10],X[11],X[12],X[13],X[14],X[15],X[16],X[17],X[18],X[19]};
	assign input18 = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,X[0],X[1],X[2],X[3],X[4],X[5],X[6],X[7],X[8],X[9],X[10],X[11],X[12],X[13],X[14],X[15],X[16],X[17],X[18]};
	assign input17 = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,X[0],X[1],X[2],X[3],X[4],X[5],X[6],X[7],X[8],X[9],X[10],X[11],X[12],X[13],X[14],X[15],X[16],X[17]};
	assign input16 = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,X[0],X[1],X[2],X[3],X[4],X[5],X[6],X[7],X[8],X[9],X[10],X[11],X[12],X[13],X[14],X[15],X[16]};
	assign input15 = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,X[0],X[1],X[2],X[3],X[4],X[5],X[6],X[7],X[8],X[9],X[10],X[11],X[12],X[13],X[14],X[15]};
	assign input14 = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,X[0],X[1],X[2],X[3],X[4],X[5],X[6],X[7],X[8],X[9],X[10],X[11],X[12],X[13],X[14]};
	assign input13 = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,X[0],X[1],X[2],X[3],X[4],X[5],X[6],X[7],X[8],X[9],X[10],X[11],X[12],X[13]};
	assign input12 = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,X[0],X[1],X[2],X[3],X[4],X[5],X[6],X[7],X[8],X[9],X[10],X[11],X[12]};
	assign input11 = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,X[0],X[1],X[2],X[3],X[4],X[5],X[6],X[7],X[8],X[9],X[10],X[11]};
	assign input10 = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,X[0],X[1],X[2],X[3],X[4],X[5],X[6],X[7],X[8],X[9],X[10]};
	assign input9 = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,X[0],X[1],X[2],X[3],X[4],X[5],X[6],X[7],X[8],X[9]};
	assign input8 = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,X[0],X[1],X[2],X[3],X[4],X[5],X[6],X[7],X[8]};
	assign input7 = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,X[0],X[1],X[2],X[3],X[4],X[5],X[6],X[7]};
	assign input6 = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,X[0],X[1],X[2],X[3],X[4],X[5],X[6]};
	assign input5 = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,X[0],X[1],X[2],X[3],X[4],X[5]};
	assign input4 = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,X[0],X[1],X[2],X[3],X[4]};
	assign input3 = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,X[0],X[1],X[2],X[3]};
	assign input2 = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,X[0],X[1],X[2]};
	assign input1 = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,X[0],X[1]};
	assign input0 = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,X[0]};

	//create mux32to1 for each digit
	mux32to1 MUX0 (.X(input0), .Y(Y[4:0]), .Z(result[0]));
	mux32to1 MUX1 (.X(input1), .Y(Y[4:0]), .Z(result[1]));
	mux32to1 MUX2 (.X(input2), .Y(Y[4:0]), .Z(result[2]));
	mux32to1 MUX3 (.X(input3), .Y(Y[4:0]), .Z(result[3]));
	mux32to1 MUX4 (.X(input4), .Y(Y[4:0]), .Z(result[4]));
	mux32to1 MUX5 (.X(input5), .Y(Y[4:0]), .Z(result[5]));
	mux32to1 MUX6 (.X(input6), .Y(Y[4:0]), .Z(result[6]));
	mux32to1 MUX7 (.X(input7), .Y(Y[4:0]), .Z(result[7]));
	mux32to1 MUX8 (.X(input8), .Y(Y[4:0]), .Z(result[8]));
	mux32to1 MUX9 (.X(input9), .Y(Y[4:0]), .Z(result[9]));
	mux32to1 MUX10 (.X(input10), .Y(Y[4:0]), .Z(result[10]));
	mux32to1 MUX11 (.X(input11), .Y(Y[4:0]), .Z(result[11]));
	mux32to1 MUX12 (.X(input12), .Y(Y[4:0]), .Z(result[12]));
	mux32to1 MUX13 (.X(input13), .Y(Y[4:0]), .Z(result[13]));
	mux32to1 MUX14 (.X(input14), .Y(Y[4:0]), .Z(result[14]));
	mux32to1 MUX15 (.X(input15), .Y(Y[4:0]), .Z(result[15]));
	mux32to1 MUX16 (.X(input16), .Y(Y[4:0]), .Z(result[16]));
	mux32to1 MUX17 (.X(input17), .Y(Y[4:0]), .Z(result[17]));
	mux32to1 MUX18 (.X(input18), .Y(Y[4:0]), .Z(result[18]));
	mux32to1 MUX19 (.X(input19), .Y(Y[4:0]), .Z(result[19]));
	mux32to1 MUX20 (.X(input20), .Y(Y[4:0]), .Z(result[20]));
	mux32to1 MUX21 (.X(input21), .Y(Y[4:0]), .Z(result[21]));
	mux32to1 MUX22 (.X(input22), .Y(Y[4:0]), .Z(result[22]));
	mux32to1 MUX23 (.X(input23), .Y(Y[4:0]), .Z(result[23]));
	mux32to1 MUX24 (.X(input24), .Y(Y[4:0]), .Z(result[24]));
	mux32to1 MUX25 (.X(input25), .Y(Y[4:0]), .Z(result[25]));
	mux32to1 MUX26 (.X(input26), .Y(Y[4:0]), .Z(result[26]));
	mux32to1 MUX27 (.X(input27), .Y(Y[4:0]), .Z(result[27]));
	mux32to1 MUX28 (.X(input28), .Y(Y[4:0]), .Z(result[28]));
	mux32to1 MUX29 (.X(input29), .Y(Y[4:0]), .Z(result[29]));
	mux32to1 MUX30 (.X(input30), .Y(Y[4:0]), .Z(result[30]));
	mux32to1 MUX31 (.X(input31), .Y(Y[4:0]), .Z(result[31]));
	
	assign Z = |(Y[31:5]) ? 32'b0 : result;

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
