#!/usr/bin/env python
#
# Template for MIPS assembler.py
#
# Usage:
#    python assembler_template.py [asm file]
#
# Alex Kahng, George Zhang
# CS141 assignment 6 problem 3
#

import sys, re

def bin_to_hex(x):
    y = hex(int(x,2))[2:]
    if len(y) < 8:
        y = (8-len(y))*"0" + y
    return y

def dec_to_bin(value, nbits):
    value = int(value)
    fill = "0"
    if value < 0:
        value = (abs(value) ^ 0xffffffff) + 1
        fill = "1"

    value = bin(value)[2:]
    if len(value) < nbits:
        value = (nbits-len(value))*fill + value
    if len(value) > nbits:
        value = value[-nbits:]
    return value

# List of all rtype instructions (opcode = 000000)
rtypes = [
    'add', 
    'sub',
    'and', 'or', 'xor', 'nor',
    'sll', 'sra', 'srl',
    'slt',
    'jr',
]

# Opcodes for non-rtype instructions
op_codes = {
    'addi'  : '001000',
    'andi'  : '001100',
    'ori'   : '001101',
    'xori'  : '001110',
    'slti'  : '001010',
    'beq'   : '000100',
    'bne'   : '000101',
    'j'     : '000010', 
    'jal'   : '000011',
    'lw'    : '100011',
    'sw'    : '101011',
    'nop'   : '000000',
}

# Function codes for rtype instructions
function_codes = {
    'add'   : '100000',
    'sub'   : '100010',
    'and'   : '100100',
    'or'    : '100101',
    'xor'   : '100110',
    'nor'   : '100111',
    'sll'   : '000000',
    'sra'   : '000011',
    'srl'   : '000010',
    'slt'   : '101010',
    'jr'    : '001000',
}

registers = {
    '$zero' : dec_to_bin(0, 5),
    '$at'   : dec_to_bin(1, 5),
    '$v0'   : dec_to_bin(2, 5),
    '$v1'   : dec_to_bin(3, 5),
    '$a0'   : dec_to_bin(4, 5),
    '$a1'   : dec_to_bin(5, 5),
    '$a2'   : dec_to_bin(6, 5),
    '$a3'   : dec_to_bin(7, 5),
    '$t0'   : dec_to_bin(8, 5),
    '$t1'   : dec_to_bin(9, 5),
    '$t2'   : dec_to_bin(10, 5),
    '$t3'   : dec_to_bin(11, 5),
    '$t4'   : dec_to_bin(12, 5),
    '$t5'   : dec_to_bin(13, 5),
    '$t6'   : dec_to_bin(14, 5),
    '$t7'   : dec_to_bin(15, 5),
    '$s0'   : dec_to_bin(16, 5),
    '$s1'   : dec_to_bin(17, 5),
    '$s2'   : dec_to_bin(18, 5),
    '$s3'   : dec_to_bin(19, 5),
    '$s4'   : dec_to_bin(20, 5),
    '$s5'   : dec_to_bin(21, 5),
    '$s6'   : dec_to_bin(22, 5),
    '$s7'   : dec_to_bin(23, 5),
    '$t8'   : dec_to_bin(24, 5),
    '$t9'   : dec_to_bin(25, 5),
    '$k0'   : dec_to_bin(26, 5),
    '$k1'   : dec_to_bin(27, 5),
    '$gp'   : dec_to_bin(28, 5),
    '$sp'   : dec_to_bin(29, 5),
    '$fp'   : dec_to_bin(30, 5),
    '$ra'   : dec_to_bin(31, 5),
    '$r0'   : dec_to_bin(0, 5),
    '$r1'   : dec_to_bin(1, 5),
    '$r2'   : dec_to_bin(2, 5),
    '$r3'   : dec_to_bin(3, 5),
    '$r4'   : dec_to_bin(4, 5),
    '$r5'   : dec_to_bin(5, 5),
    '$r6'   : dec_to_bin(6, 5),
    '$r7'   : dec_to_bin(7, 5),
    '$r8'   : dec_to_bin(8, 5),
    '$r9'   : dec_to_bin(9, 5),
    '$r10'  : dec_to_bin(10, 5),
    '$r11'  : dec_to_bin(11, 5),
    '$r12'  : dec_to_bin(12, 5),
    '$r13'  : dec_to_bin(13, 5),
    '$r14'  : dec_to_bin(14, 5),
    '$r15'  : dec_to_bin(15, 5),
    '$r16'  : dec_to_bin(16, 5),
    '$r17'  : dec_to_bin(17, 5),
    '$r18'  : dec_to_bin(18, 5),
    '$r19'  : dec_to_bin(19, 5),
    '$r20'  : dec_to_bin(20, 5),
    '$r21'  : dec_to_bin(21, 5),
    '$r22'  : dec_to_bin(22, 5),
    '$r23'  : dec_to_bin(23, 5),
    '$r24'  : dec_to_bin(24, 5),
    '$r25'  : dec_to_bin(25, 5),
    '$r26'  : dec_to_bin(26, 5),
    '$r27'  : dec_to_bin(27, 5),
    '$r28'  : dec_to_bin(28, 5),
    '$r29'  : dec_to_bin(29, 5),
    '$r30'  : dec_to_bin(30, 5),
    '$r31'  : dec_to_bin(31, 5),
}

def main():
    me, fname = sys.argv

    f = open(fname, "r")
    labels = {}                 # Map from label to its address.
    parsed_lines = []           # List of parsed instructions.
    address = 0x00400000        # Track the current address of the instruction.
    line_count = 0              # Number of lines.
    for line in f:
        line_count = line_count + 1

        # Stores attributes about the current line of code, like its label, line
        # number, instruction, and arguments.
        line_attr = {}

        if line:
            # Get pieces of line
            pieces = line[:line.find("#")].strip().replace(',', '').split()

            # We'll get you started here with line_count.
            line_attr['line_number'] = line_count
            line_attr['address'] = address

            # Extract label if exists
            if pieces[0][-1] == ":":
                line_attr['label'] = pieces[0][:-1]
                labels[pieces[0][:-1]] = address
                del pieces[0]

            # Extract instruction
            line_attr['insn'] = pieces[0]

            # Extract arguments
            for (i, arg) in enumerate(pieces[1:]):
                line_attr['arg' + str(i)] = arg

            # Finally, add this dict to the complete list of instructions.
            parsed_lines.append(line_attr)

            # Increment address
            address += 4
    f.close()

    # Clearing file if exists
    with open("results.machine", "w") as f:
        pass

    for line in parsed_lines:
        machine = ""  # Current machine code word.

        if line['insn'] == 'nop':
            machine = 8 * '0'
        # Encode an R-type instruction.
        elif line['insn'] in rtypes:
            machine += '000000'
            if line['insn'] in ['add', 'sub', 'and', 'or', 'xor', 'nor']:
                machine += registers[line['arg1']] + registers[line['arg2']] + registers[line['arg0']]
                machine += 5 * '0'
            elif line['insn'] in ['sll', 'sra', 'srl']:
                machine += '000000' + registers[line['arg1']] + registers[line['arg0']]
                machine += dec_to_bin(int(line['arg2']), 5)
            elif line['insn'] == 'slt':
                machine += registers[line['arg1']] + registers[line['arg2']] + registers[line['arg0']]
                machine += 5 * '0'
            elif line['insn'] == 'jr':
                machine += registers[line['arg0']] + 10 * '0'
                machine += 5 * '0'
            else:
                raise ValueError('Unknown instruction')
            machine += function_codes[line['insn']]
        # Encode a non-R-type instruction.
        else:
            machine += op_codes[line['insn']]
            # I-type
            if line['insn'] in ['addi', 'andi', 'ori' , 'xori', 'slti']:
                machine += registers[line['arg1']] + registers[line['arg0']]
                machine += dec_to_bin(int(line['arg2']), 16)
            elif line['insn'] in ['beq', 'bne']:
                machine += registers[line['arg0']] + registers[line['arg1']]
                # Determine branching address
                try:
                    shift = int(line['arg2'])
                except ValueError:
                    shift = (labels[line['arg2']] - (line['address'] + 4)) / 4
                machine += dec_to_bin(shift, 16)
            elif line['insn'] in ['j', 'jal']:
                # Determine jump address
                try:
                    target = int(line['arg0'])
                except ValueError:
                    target = labels[line['arg0']] % (2 ** 26) / 4
                machine += dec_to_bin(target, 26)
            elif line['insn'] in ['lw', 'sw']:
                imm, reg = line['arg1'].replace(')', '').split('(')
                machine += registers[reg] + registers[line['arg0']]
                machine += dec_to_bin(int(imm), 16)
            else:
                raise ValueError('Unknown instruction')

        # Write line to file
        with open("results.machine", "a") as f:
            f.write(bin_to_hex(machine) + "\n")

if __name__ == "__main__":
    main()
