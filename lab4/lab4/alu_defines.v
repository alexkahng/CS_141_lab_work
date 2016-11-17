`ifndef ALU_DEFINES
`define ALU_DEFINES
`define ALU_OP_WIDTH 4
`define ALU_OP_AND 4'b0000
`define ALU_OP_OR  4'b0001
`define ALU_OP_XOR 4'b0010
`define ALU_OP_NOR 4'b0011
`define ALU_OP_SLT 4'b0100
`define ALU_OP_SLL 4'b0101
`define ALU_OP_SRL 4'b0110
`define ALU_OP_ADD 4'b0111
`define ALU_OP_SUB 4'b1000
`define ALU_OP_SRA 4'b1011

`define MIPS_AND 6'b100100
`define MIPS_OR  6'b100101
`define MIPS_XOR 6'b100110
`define MIPS_NOR 6'b100111
`define MIPS_SLT 6'b101010
`define MIPS_SLL 6'b000000
`define MIPS_SRL 6'b000010
`define MIPS_ADD 6'b100000
`define MIPS_SUB 6'b100010
`define MIPS_SRA 6'b000011
`define MIPS_JR  6'b001000

`endif
