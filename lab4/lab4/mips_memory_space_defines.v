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

`define FETCH 					4'b0000
`define FETCH_FROM_MEMORY 	4'b1111
`define READ_FROM_MEMORY 	4'b1110
`define DECODE 				4'b0001
`define MEMADDR				4'b0010
`define MEMREAD				4'b0011
`define MEMREAD_WAIT			4'b1101
`define MEM_WRITEBACK		4'b0100
`define MEMWRITE				4'b0101
`define EXECUTE 				4'b0110
`define ALU_WRITEBACK 		4'b0111
`define EXECUTE_IMM			4'b1001
`endif
