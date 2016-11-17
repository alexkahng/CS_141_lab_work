`ifndef MEMORY_SPACE_DEFINES
`define MEMORY_SPACE_DEFINES
`define I_START_ADDRESS 4'h4
`define D_START_ADDRESS 4'h0

`define OPRTYPE				6'b000000
`define OPADDI					6'b001000
`define OPANDI					6'b001100
`define OPORI					6'b001101
`define OPXORI					6'b001110
`define OPSLTI					6'b001010
`define OPSW					6'b101011
`define OPLW					6'b100011
`define OPJUMP					6'b000010
`define OPJAL					6'b000011
`define OPBEQ					6'b000100
`define OPBNE					6'b000101

`define FETCH 					5'b00000
`define DECODE 				5'b00001
`define MEMADDR				5'b00010
`define MEMREAD				5'b00011
`define MEM_WRITEBACK		5'b00100
`define MEMWRITE				5'b00101
`define EXECUTE 				5'b00110
`define ALU_WRITEBACK 		5'b00111
`define BEQ						5'b01000
`define EXECUTE_IMM			5'b01001
`define JUMP					5'b01011
`define JR						5'b01100
`define JAL						5'b01101
`define BNE						5'b01110
`define MEMREAD_WAIT			5'b11101
`define READ_FROM_MEMORY 	5'b11110
`define FETCH_FROM_MEMORY 	5'b11111
`endif
