# LITE-16
A 16-bit Instruction Set Architecture

LITE-16 is a simple 1**6-bit Instruction Set Architecture** inspired by [RISC-V](https://riscv.org/), the open-source ISA by the University of California, Berkeley. For more information about RISC-V, be sure to read the project documentation.

## Objective
The aim of this ISA is to contain the most fundamental instructions a processor needs to function, while also having a **clear and simple structure**. Because of this, LITE-16 is **RISC-based**, meaning that every instruction has the same bit length (**16 bits**). To achieve a more homogeneous structure, I also chose to make every instruction segment the same length (four bits), making each and every instruction have **four different segments**.

## Content
The content in this repository can be divided in three parts:

- **Documentation:** The **technical specification** of the LITE-16 Instruction Set Architecture.

- **Circuit design:** The **electronic architecture design** of LITE-16, designed with [Logisim](http://www.cburch.com/logisim/), an open-source **logic circuit simulator** by Carl Burch. More information on his website.

- **Assembler and Simulator:** A C program that **assembles and executes** LITE-16 instructions.


## Testing
I've left a sample program in the circuit folder that can be loaded into the Program Memory ROM, that tests every instruction type.
