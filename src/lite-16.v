

module lite_16 #(
    parameter FULL_MEM = 0,
    parameter ROM_FILE = "test/roms/romtest.hex"
)(
    input wire clk,
    input wire rst
    );

    // Control Unit signals
    wire ri, cmp, mem, ld, st, jmp, fn;

    // ALU outputs
    wire [15:0] r;
    wire cmp_r;
    
    // PC outputs
    wire [15:0] instruction, pc_out;

    // Data memory output
    wire [15:0] data_out;

    // RFU outputs
    wire [15:0] a, b, s2, rd;

    // ROM output
    wire [15:0] rom_out;

    pc #(.ROM_FILE(ROM_FILE), .FULL_MEM(FULL_MEM))pc_m(clk, rst, jmp, cmp_r, rd, instruction, pc_out);
    control_unit cu(instruction[3:0], ri, cmp, mem, ld, st, jmp, fn);
    register_fetch_unit rfu(clk, rst, instruction[7:4], instruction[11:8], instruction[15:12], r, ri, st, jmp, fn, a, b, s2, rd);
    alu alu_m(instruction[2:0], a, b, rd, pc_out, data_out, ri, ld, jmp, r, cmp_r);
    ram #(.FULL_MEM(FULL_MEM)) data_mem(clk, s2, rd, st, ld, data_out);




endmodule