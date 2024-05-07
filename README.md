# Basic Processor 
- 12 bit instruction with distinct 4 operations(ADD, NEG, MOV, JZ).
- 4 bit data bus.
- 8 instruction program ROM.
![Blank diagram - Page 3 (3)](https://github.com/YutharsanS/CODD-Nano-Processor/assets/155819060/ee8379c9-f891-47ec-8fb2-099c95955f1c)
# Advanced Processor Design
As a way of fixing the concerns of the basic processor design, we built an advanced processor with these specifications 
- The processor operates under 15-bit instructions and is capable of executing 16 different operations.
- The registers can hold integers in the range of -16 to 15.
- The program ROM can store up to 32 instructions.
- The processor can represent boolean values.

![Frame 1](https://github.com/YutharsanS/CODD-Nano-Processor/assets/155819060/9c9a80e7-4715-480c-8142-c3815d856892)

The instruction decoder of the advanced processor
![Frame 2](https://github.com/YutharsanS/CODD-Nano-Processor/assets/155819060/7ba57b88-69b6-4732-bc36-018096c6c5cd)

## OP codes for the advanced processor

![image](https://github.com/YutharsanS/CODD-Nano-Processor/assets/155819060/955019fe-f148-4551-bcca-ce5baf8b805e)

There is a 4-bit opcode in this design. As a result, it can identify sixteen distinct kinds of instructions. The following opcodes are utilized in this design:.

| **Instruction Type** | **OPCODE** |
| --- | --- |
| 0000 | ADD |
| 0001 | SUB |
| 0010 | MUL |
| 0011 | NEG |
| 0100 | AND |
| 0101 | OR  |
| 0110 | NOT |
| 0111 | CMP |
| 1000 | MOVI |
| 1001 | CP  |
| 1010 | END |
| 1011 | NOP |
| 1100 | JMP |
| 1101 | JZR |
| 1110 | JZ  |
| 1111 | JN  |

\* Registers with the addresses indicated by register 1 and register 2 bits of the instruction, respectively, are indicated in the below table by “registers 1” and “register 2.”

| **Instruction Type** | **Description** |
| --- | --- |
| ADD | Add the register 2 value to the register 1 value, and store the result in register 1. Indicates whether the result overflows by the O flag, zero by the Z flag, and negative by the N flag. |
| SUB | Subtract the register 2 value from the register 1 value, and store the result in register 1. Indicates whether the result overflows by the O flag, zero by the Z flag, and negative by the N flag. |
| MUL | Multiply the register 2 value by the register 1 value, and store the result in register 1. Indicates whether the result is overflowing by the O flag, zero by the Z flag, and negative by the flag. |
| NEG | Negate the register 1 value and store the result in register 1. Indicates whether the result by O flag, zero by Z flag and negative by N flag. |
| AND | Perform the bitwise AND operation between register 1 value and register 2 value and store the result in register 1. (Optionally, it does the logical AND operation and indicates the result using Z flag (0-True, 1-False.) |
| OR  | Perform the bitwise OR operation between register 1 value and register 2 value and store the result in register 1. (Optionally, it does the logical OR operation and indicates the result using Z flag (0-True, 1-False). |
| NOT | Perform the bitwise NOT operation between register 1 value and register 2 value and store the result in register 1. (Optionally, it does the logical NOT operation and indicates the result using Z flag (0-True, 1-False). |
| CMP | Compare the register 1 value with the register 2 value. If reg 1 value = reg 2 value, turn on the Z flag. If reg 1 value < reg 2 value, turn on the N flag. Otherwise, turn off both Z and N flags. |
| MOVI | Move the immediate value to register 1. |
| CP  | Copy the value from register 2 into register 1. (This action can be used to prevent losing the prior value due to overwriting in ALU operations.) |
| END | End the program. (Perform by disabling the program counter.) |
| NOP | Waste a clock cycle without doing any operation. |
| JMP | Jump to the memory address indicated by the jump address of the instruction. |
| JZR | Jump to the memory address indicated by the jump address of the instruction if the value in register 1 is zero (00000). |
| JZ  | Jump to the memory address indicated by the jump address of the instruction if the Z flag is turned on. |
| JN  | Jump to the memory address indicated by the jump address of the instruction if the N flag is turned on. |
