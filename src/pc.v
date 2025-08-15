// Implementation of the LITE-16 Program Counter, clock and memory

module pc (
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
    rom pm(pc_out, instruction);

    always @(*) begin
        if (cmp && jmp) begin
            pc_in = pc_out + rd;
        end else begin
            pc_in = pc_out + 1;
        end
    end
    
endmodule