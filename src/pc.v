// Implementation of the LITE-16 Program Counter, clock and memory

module pc #(
    parameter ROM_FILE = "test/roms/romtest.hex",
    parameter FULL_MEM = 0
    )(
    input wire clk,
    input wire rst,
    input wire jmp,
    input wire cmp,
    input wire [15:0] rd,

    output wire [15:0] instruction,
    output wire [15:0] pc_out
);

    reg [15:0] pc_in;

    register pc(clk, rst, clk, pc_in, pc_out);
    rom #(ROM_FILE, FULL_MEM) pm(pc_out, instruction);

    always @(*) begin
        if (cmp && jmp) begin
            pc_in = pc_out + rd;
        end else begin
            pc_in = pc_out + 1;
        end
    end
    
endmodule