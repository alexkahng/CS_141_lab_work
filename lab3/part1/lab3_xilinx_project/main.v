`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2016
// Module Name:    main 
// Author(s): [[your names here]]
// Description: CS141 Lab 3
//
//
//////////////////////////////////////////////////////////////////////////////////

module main(switch, led, rstb_button, unbuf_clk, button_center);

	//port definitions
	input wire [7:0] switch;
	input wire rstb_button, unbuf_clk, button_center;
	output wire [7:0] led;
	
	wire cclk, rstb, rst, button_center_db;
	wire equal;
	wire [7:0] out;
	
	wire [1:0] ctr;
	
	clock_generator CLOCK_GEN (.clk_100M_raw(unbuf_clk),.clk_100M(cclk));
	
	// debounce any changes lasting less than 100ms
	debouncer #(.CYCLES(10_000_000),.RESET_VALUE(1'b0),.COUNTER_WIDTH(32)) DEBOUNCE_RSTB (
		.clk(cclk),.rst(1'b0),.bouncy(rstb_button),.debounced(rstb));
	debouncer #(.CYCLES(10_000_000),.RESET_VALUE(1'b0),.COUNTER_WIDTH(32)) DEBOUNCE_CENTB (
		.clk(cclk),.rst(1'b0),.bouncy(button_center),.debounced(button_center_db));
	
	assign rst = ~rstb;
	
	led_switch_driver LS_DRIVER (.button_center_db(button_center_db), .rst(rst), .ctr(ctr));
	
	// FSM
	fsm FSM (.clock(cclk), .switch(switch), .led(out), .equal(equal), .center(button_center_db), .reset(rst), .ctr(ctr));
	
	assign led = switch[7] ? (equal ? 8'b11111111 : 8'b00000000) : out;
	
endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
