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
module sll();

	//parameter definitions

	//port definitions - customize for different bit widths
	input  wire [31:0] X;
	//TODO: Y is initially 32 bits, so have to somehow break it down to five bits!
	input  wire [4:0]  Y;
	output wire [31:0] Z;
	wire [31:0] input0, input1, input2, input3, input4, input5, input6, input7,
	            input8,input9, input10, input11, input12, input13, input14, input15,
					input16, input17, input18, input19, input20, input21, input22, input23,
					input24, input25, input26, input27, input28, input29, input30, input31;
	
	//module body
	assign input0 = {X[31],X[30],X[29],X[28],X[27],X[26],X[25],X[24],X[23],X[22],X[21],X[20],X[19],X[18],X[17],X[16],X[15],X[14],X[13],X[12],X[11],X[10],X[9],X[8],X[7],X[6],X[5],X[4],X[3],X[2],X[1],X[0]};
	assign input1 = {X[30],X[29],X[28],X[27],X[26],X[25],X[24],X[23],X[22],X[21],X[20],X[19],X[18],X[17],X[16],X[15],X[14],X[13],X[12],X[11],X[10],X[9],X[8],X[7],X[6],X[5],X[4],X[3],X[2],X[1],X[0],1'b0};
	assign input2 = {X[29],X[28],X[27],X[26],X[25],X[24],X[23],X[22],X[21],X[20],X[19],X[18],X[17],X[16],X[15],X[14],X[13],X[12],X[11],X[10],X[9],X[8],X[7],X[6],X[5],X[4],X[3],X[2],X[1],X[0],1'b0,1'b0};
	assign input3 = {X[28],X[27],X[26],X[25],X[24],X[23],X[22],X[21],X[20],X[19],X[18],X[17],X[16],X[15],X[14],X[13],X[12],X[11],X[10],X[9],X[8],X[7],X[6],X[5],X[4],X[3],X[2],X[1],X[0],1'b0,1'b0,1'b0};
	assign input4 = {X[27],X[26],X[25],X[24],X[23],X[22],X[21],X[20],X[19],X[18],X[17],X[16],X[15],X[14],X[13],X[12],X[11],X[10],X[9],X[8],X[7],X[6],X[5],X[4],X[3],X[2],X[1],X[0],1'b0,1'b0,1'b0,1'b0};
	assign input5 = {X[26],X[25],X[24],X[23],X[22],X[21],X[20],X[19],X[18],X[17],X[16],X[15],X[14],X[13],X[12],X[11],X[10],X[9],X[8],X[7],X[6],X[5],X[4],X[3],X[2],X[1],X[0],1'b0,1'b0,1'b0,1'b0,1'b0};
	assign input6 = {X[25],X[24],X[23],X[22],X[21],X[20],X[19],X[18],X[17],X[16],X[15],X[14],X[13],X[12],X[11],X[10],X[9],X[8],X[7],X[6],X[5],X[4],X[3],X[2],X[1],X[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};
	assign input7 = {X[24],X[23],X[22],X[21],X[20],X[19],X[18],X[17],X[16],X[15],X[14],X[13],X[12],X[11],X[10],X[9],X[8],X[7],X[6],X[5],X[4],X[3],X[2],X[1],X[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};
	assign input8 = {X[23],X[22],X[21],X[20],X[19],X[18],X[17],X[16],X[15],X[14],X[13],X[12],X[11],X[10],X[9],X[8],X[7],X[6],X[5],X[4],X[3],X[2],X[1],X[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};
	assign input9 = {X[22],X[21],X[20],X[19],X[18],X[17],X[16],X[15],X[14],X[13],X[12],X[11],X[10],X[9],X[8],X[7],X[6],X[5],X[4],X[3],X[2],X[1],X[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};
	assign input10 = {X[21],X[20],X[19],X[18],X[17],X[16],X[15],X[14],X[13],X[12],X[11],X[10],X[9],X[8],X[7],X[6],X[5],X[4],X[3],X[2],X[1],X[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};
	assign input11 = {X[20],X[19],X[18],X[17],X[16],X[15],X[14],X[13],X[12],X[11],X[10],X[9],X[8],X[7],X[6],X[5],X[4],X[3],X[2],X[1],X[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};
	assign input12 = {X[19],X[18],X[17],X[16],X[15],X[14],X[13],X[12],X[11],X[10],X[9],X[8],X[7],X[6],X[5],X[4],X[3],X[2],X[1],X[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};
	assign input13 = {X[18],X[17],X[16],X[15],X[14],X[13],X[12],X[11],X[10],X[9],X[8],X[7],X[6],X[5],X[4],X[3],X[2],X[1],X[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};
	assign input14 = {X[17],X[16],X[15],X[14],X[13],X[12],X[11],X[10],X[9],X[8],X[7],X[6],X[5],X[4],X[3],X[2],X[1],X[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};
	assign input15 = {X[16],X[15],X[14],X[13],X[12],X[11],X[10],X[9],X[8],X[7],X[6],X[5],X[4],X[3],X[2],X[1],X[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};
	assign input16 = {X[15],X[14],X[13],X[12],X[11],X[10],X[9],X[8],X[7],X[6],X[5],X[4],X[3],X[2],X[1],X[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};
	assign input17 = {X[14],X[13],X[12],X[11],X[10],X[9],X[8],X[7],X[6],X[5],X[4],X[3],X[2],X[1],X[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};
	assign input18 = {X[13],X[12],X[11],X[10],X[9],X[8],X[7],X[6],X[5],X[4],X[3],X[2],X[1],X[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};
	assign input19 = {X[12],X[11],X[10],X[9],X[8],X[7],X[6],X[5],X[4],X[3],X[2],X[1],X[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};
	assign input20 = {X[11],X[10],X[9],X[8],X[7],X[6],X[5],X[4],X[3],X[2],X[1],X[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};
	assign input21 = {X[10],X[9],X[8],X[7],X[6],X[5],X[4],X[3],X[2],X[1],X[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};
	assign input22 = {X[9],X[8],X[7],X[6],X[5],X[4],X[3],X[2],X[1],X[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};
	assign input23 = {X[8],X[7],X[6],X[5],X[4],X[3],X[2],X[1],X[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};
	assign input24 = {X[7],X[6],X[5],X[4],X[3],X[2],X[1],X[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};
	assign input25 = {X[6],X[5],X[4],X[3],X[2],X[1],X[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};
	assign input26 = {X[5],X[4],X[3],X[2],X[1],X[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};
	assign input27 = {X[4],X[3],X[2],X[1],X[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};
	assign input28 = {X[3],X[2],X[1],X[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};
	assign input29 = {X[2],X[1],X[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};
	assign input30 = {X[1],X[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};
	assign input31 = {X[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};

	//create mux32to1 for each digit
	mux32to1 MUX0 (.X(input0), .Y(Y), .Z(Z[0]));
	mux32to1 MUX1 (.X(input1), .Y(Y), .Z(Z[1]));
	mux32to1 MUX2 (.X(input2), .Y(Y), .Z(Z[2]));
	mux32to1 MUX3 (.X(input3), .Y(Y), .Z(Z[3]));
	mux32to1 MUX4 (.X(input4), .Y(Y), .Z(Z[4]));
	mux32to1 MUX5 (.X(input5), .Y(Y), .Z(Z[5]));
	mux32to1 MUX6 (.X(input6), .Y(Y), .Z(Z[6]));
	mux32to1 MUX7 (.X(input7), .Y(Y), .Z(Z[7]));
	mux32to1 MUX8 (.X(input8), .Y(Y), .Z(Z[8]));
	mux32to1 MUX9 (.X(input9), .Y(Y), .Z(Z[9]));
	mux32to1 MUX10 (.X(input10), .Y(Y), .Z(Z[10]));
	mux32to1 MUX11 (.X(input11), .Y(Y), .Z(Z[11]));
	mux32to1 MUX12 (.X(input12), .Y(Y), .Z(Z[12]));
	mux32to1 MUX13 (.X(input13), .Y(Y), .Z(Z[13]));
	mux32to1 MUX14 (.X(input14), .Y(Y), .Z(Z[14]));
	mux32to1 MUX15 (.X(input15), .Y(Y), .Z(Z[15]));
	mux32to1 MUX16 (.X(input16), .Y(Y), .Z(Z[16]));
	mux32to1 MUX17 (.X(input17), .Y(Y), .Z(Z[17]));
	mux32to1 MUX18 (.X(input18), .Y(Y), .Z(Z[18]));
	mux32to1 MUX19 (.X(input19), .Y(Y), .Z(Z[19]));
	mux32to1 MUX20 (.X(input20), .Y(Y), .Z(Z[20]));
	mux32to1 MUX21 (.X(input21), .Y(Y), .Z(Z[21]));
	mux32to1 MUX22 (.X(input22), .Y(Y), .Z(Z[22]));
	mux32to1 MUX23 (.X(input23), .Y(Y), .Z(Z[23]));
	mux32to1 MUX24 (.X(input24), .Y(Y), .Z(Z[24]));
	mux32to1 MUX25 (.X(input25), .Y(Y), .Z(Z[25]));
	mux32to1 MUX26 (.X(input26), .Y(Y), .Z(Z[26]));
	mux32to1 MUX27 (.X(input27), .Y(Y), .Z(Z[27]));
	mux32to1 MUX28 (.X(input28), .Y(Y), .Z(Z[28]));
	mux32to1 MUX29 (.X(input29), .Y(Y), .Z(Z[29]));
	mux32to1 MUX30 (.X(input30), .Y(Y), .Z(Z[30]));
	mux32to1 MUX31 (.X(input31), .Y(Y), .Z(Z[31]));

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
