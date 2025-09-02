# LITE-16
A 16-bit Instruction Set Architecture

LITE-16 is a simple **16-bit Instruction Set Architecture** inspired in part by the **RV32I** variant of the **[RISC-V](https://riscv.org/) Instruction Set Architecture**.

## Objective
The aim of this ISA is to contain the most fundamental instructions a processor needs to function, while also having a **clear and simple structure** to read and understand. Because of this, I chose to design a **RISC-based** architecture, meaning that every instruction has the same bit length (**16 bits**). To achieve a more homogeneous structure, I also chose to make every instruction segment the same length (four bits), making each and every instruction have **four different segments**.

## Content
The content in this repository can be divided in four parts:

- **Documentation:** The **technical specification** of the LITE-16 Instruction Set Architecture, located inside the `documentation/` directory.

- **Verilog architecture:** The main part of the project: the **LITE-16 architecture programmed in Verilog**, allowing FPGA (and similar) simulation, located in `src/`. The repository also contains pre-built testbenches and other testing resources located in `test/`.

- **Circuit design:** The **electronic architecture design** of LITE-16, designed with [Logisim](http://www.cburch.com/logisim/), an open-source **logic circuit simulator** by Carl Burch. This serves as a visual guide to the logic of the architecture, located in `design/`.

- **Assembler and Simulator:** A C program that **assembles and executes** LITE-16 instructions, located in `simulator/`.

## Verilog architecture
The Verilog codebase is divided in different files, located in `src/`. The files contain **modules** (e.g. the ALU, the register file... see `documentation/` for an specification of each module) that are then put together in `lite-16.v`. the main module of the architecture. In `test/`, some testbenches can be found, that test each and every module in the architecture, including the whole LITE-16 architecture, in `lite-16_tb.v`.

LITE-16 can be synthesized to an FPGA using the desired tool the user may want to use. This repository, however, focuses on simulation via testbenches.

### Requirements
In order to be able to run the architecture, you need certain packages:

- **make:** To run the scripts required to compile the sources. Not strictly necessary, but highly recommended.

- **iverlog:** An open-source Verilog compiler.

- **vvp:** The verilog runtime engine. This is the program the executes the compiled Verilog code.

- **gtkwave** (or similar software): To allow the user to see the waveforms in the module variables, essentially giving visual aid of what happens inside the architecture.

### Build
In order to compile the LITE-16 main module and its testbench, you may run:

```bash
make ROM_FILE=<path>
```

`<path>` being the file containing the Program Memory ROM dump. This dump should contain the desired instructions you want the simulator to run. If no path is specified (by just typing `make`), a default ROM dump will be dumped into the memory: `test/roms/romtest.hex`. There are other test ROM dumps in the `roms/` directory. 

To run the simulation you may execute:

```bash
make run
```

This will generate a `.vcd` file, containing the waveform of different variables in the module that can be opened to analyse with **gtkwave**:

```bash
gtkwave lite-16_tb.vcd
```

> [!WARNING]
> Compilation and simulation time with iverlog and vvp can be **quite slow** if the compiled modules contain **big arrays**. That is the case with LITE-16, as it contains a **16-bit memory address bus** that allows memory access to up to **65536 memory addresses**. That's why, by default, the architecture will compile with only 128 addresses, which should be sufficient for the average LITE-16 program. If you want to compile the sources with full memory capacity, run `make FULL_MEM=1`. Do keep in mind, however, that the compilation and simulation time will be **much longer**.

You can remove the files created by the build with the following command:

```bash
make clean
```

This will remove every `.vcd` and `.vvp` file in the root directory, so be sure to move to a different directory the files you want saved.

## License
This repository follows the GNU General Public License (GPLv3). Everyone is permitted to copy and distribute verbatim copies of this license document, but changing it is not allowed. For more information, refer to the [Free Software Foundation website](https://www.fsf.org/) or [read the license](LICENSE).