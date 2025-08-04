# Instruction Set
As mentioned in the Introduction, the LITE-16 Instruction Set Architecture contains **16 instructions**: 15 of them are dedicated to operations inside the processor, and the remaining one is dedicated to invoke **system calls**. The instructions are distributed in a certain way to **divide them into groups** in function of their opcode. This facilitates the creation of **control bits** in the Control Unit (CU). The groups are **ALU Instructions**, **jump (JMP) instructions**, and **miscellaneous (MISC) instructions**.

## ALU Instructions:
The ALU instructions are the ones that **use the Arithmetic Logic** Unit to load in a register (rd) an output, using two registers (s1 and s2) as their operands. There are a total of 6 ALU instructions and they can be identified by **reading the highest bit of the opcode**. If it’s **0**, it will be an ALU Instruction. The system call instruction also has the last opcode bit unset, but the functionality of syscalls is outside the scope of this project.

## JMP Instructions:
The JMP Instructions **operate with the Program Counter** (PC) to invoke jumps if they fulfill the condition specified. These instructions also use the **CMP** part of the ALU, which determines if s1 is higher, lower or equal than s2. There are three JMP Instructions, one for each CMP flag, and one instruction that invokes a subroutine that jumps unconditionally.

## MISC Instructions:
MISC Instructions are instructions that **operate with the data memory** or **load immediate values** to registers. There are two memory instructions, one for loading and another one for storing. There are also two immediate value instructions, one for loading an 8-bit immediate value to the higher half of the register, and another one to add to the register itself an 8-bit immediate value in the lower half. Here's an specification table for the Instruction Set:

|  Operation  |        Function         |  (3-0) |  (7-4) | (11-8) | (15-12)
| ----------- | ----------------------- | ------ | ------ | ------ | -------
| `add`       | rd<-s1+s2; pc<-pc+1     | 0b0000 |   s1   |   s2   |   rd   |
| `or`        | rd<-s1\|s2; pc<-pc+1    | 0b0001 |   s1   |   s2   |   rd   |
| `xor`       | rd<-s1^s2; pc<-pc+1     | 0b0010 |   s1   |   s2   |   rd   |
| `and`       | rd<-s1&s2; pc<-pc+1     | 0b0011 |   s1   |   s2   |   rd   |
| `sl`        | rd<-s1<<s2; pc<-pc+1    | 0b0100 |   s1   |  dist  |   rd   |
| `srl`       | rd<-s1>>s2; pc<-pc+1    | 0b0101 |   s1   |  dist  |   rd   |
| `sra`       | rd<-s1>>>s2; pc<-pc+1   | 0b0110 |   s1   |  dist  |   rd   |
| `syscall`   | (invokes syscall)       | 0b0111 |   s1   |   s2   |   s3   |
| `je`        | pc<-pc+(A==B)?roff:1    | 0b1000 |   A    |   B    |  roff  |
| `jl`        | pc<-pc+(A<B)?roff:1     | 0b1001 |   A    |   B    |  roff  |
| `jg`        | pc<-pc+(A>B)?roff:1     | 0b1010 |   A    |   B    |  roff  |
| `fn`        | pc<-pc+roff; rd<-pc+1   | 0b1011 |   -    |   rd   |  roff  |
| `ld`        | rd<-(addr); pc<-pc+1    | 0b1100 |   -    |  addr  |   rd   |
| `st`        | (addr)<-rd; pc<-pc+1    | 0b1101 |   -    |  addr  |   s    |
| `mv`        | rd<-(lohi)+rd; pc<-pc+1 | 0b1110 |   lo   |   hi   |   rd   |
| `mvu`       | rd(hi)<-lohi; pc<-pc+1  | 0b1111 |   lo   |   hi   |   rd   |
