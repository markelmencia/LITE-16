# Control Unit
The Control Unit is an essential part to control the actions of the processor. By the use of **seven 1-bit signals**, the processor knows what and where to do a specific operation. This is achieved by connecting the appropriate signals to some specific multiplexers all around the processor.

The way these signals are set or unset is by **checking the codeop bits**. The instructions are ordered in a way that facilitates obtaining the signals. For instance, as mentioned in the Instruction Set chapter, if the third bit of the codeop is zero, it means that the instruction is an ALU instruction. If the third bit is set but the second one is not, the instruction is a JMP instruction. Using this method, these are the signals the processor needs:

- **R'/I:** If 0, the instruction requires two registers as operands. If 1, it requires the immediate values.
- **CMP:** This signal is used as an operand to check if the instruction is a FN instruction.
- **JMP:** If 1, the instruction is a JMP instruction.
- **FN:** If 1, the instruction is a FN instruction.
- **MEM:** If 1, the instruction requires access to the data memory.
- **LD:** If 1, the instruction is a LD instruction. This is connected to the “ld” input
of the data memory, which enables memory reading.
- **ST:** If 1, the instruction is a ST instruction. This is connected to the “st” input of the data memory, which enables memory writing.

This is a representation of the circuitry of the Control Unit:

![Control Unit](images/control-unit.png)

In this example, the codeop is **1011**, meaning that it’s a FN instruction, so the **CMP**, **JMP** and **FN** signals turn on.