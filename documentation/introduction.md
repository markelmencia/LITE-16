# Introduction
LITE-16 is a RISC-type, Harvard-based 16-bit architecture, mainly inspired by **RISC-V**, the open-source Instruction Set Architecture by the University of California, Berkeley. It contains a total of **16 instructions** and it works with sixteen **16-bit registers**, along with a **16-bit program and data memory**. The aim of LITE-16 is to be a **simple and easy-to-use architecture** with just enough resources to be a fully-functioning ISA.

The architecture is divided into five segments: 
- The **program memory and counter**
- The **Register Fetch Unit** (RFU)
- The **Arithmetic Logic Unit** (ALU)
- The **data memory**
- The **Control Unit** (CU)

Each of the segments will be described in their specific chapter.

Every instruction can be divided into **four equal length segments of 4 bits**, usually having the same purpose between instructions. These characteristics were intentionally implemented to ensure **more simplicity in both the architecture design and in the use of the instructions**, and perhaps to potentially extend its bit design with more ease. Every instruction contains an **operation code** (opcode) segment to identify the instruction to be executed. This segment is located in the lowest 4 bits of every instruction. The other three segments left are mainly used to **fetch registers** but also to define immediate 8-bit values. More on the instructions in their chapter.

The software used to design the digital architecture is **Logisim**, an open-source, cross-platform graphical tool programmed in Java by Carl Burch. The fully-functioning circuit project can be found in the LITE-16 repository, and it can be simulated with the same software. More on the software and its download can be found in Logisim’s official page.