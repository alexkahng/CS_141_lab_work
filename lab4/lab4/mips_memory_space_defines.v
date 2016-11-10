`ifndef MEMORY_SPACE_DEFINES
`define MEMORY_SPACE_DEFINES
`define I_START_ADDRESS 4'h4
`define D_START_ADDRESS 4'h0

`define FETCH 					4'b0000
`define FETCH_FROM_MEMORY 	4'b1111
`define READ_FROM_MEMORY 	4'b1110
`define DECODE 				4'b0001
`define EXECUTE 				4'b0110
`define ALU_WRITEBACK 		4'b0111
`endif
