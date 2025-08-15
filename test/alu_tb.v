// ALU testbench
`timescale 1ns/1ps

module alu_tb;

    reg [2:0] codeop;
    reg [15:0] a;
    reg [15:0] b;
    reg [15:0] rd;
    reg [15:0] pc;
    reg [15:0] data_mem_out;
    reg ri;
    reg ld;
    reg fn;
    wire [15:0] r;
    wire cmp;

    alu alu_tb(codeop, a, b, rd, ri, ld, fn, r, cmp);

    initial begin
        $dumpfile("alu_tb.vcd");
        $dumpvars(0, alu_tb);

        a = 16'h0007;
        b = 16'h0006;
        rd = 16'h0005;

        ri = 0;
        codeop = 3'b000;
        #10;
        codeop = 3'b001;
        #10;
        codeop = 3'b010;
        #10;
        codeop = 3'b011;
        #10;
        codeop = 3'b100;
        #10;
        codeop = 3'b101;
        #10;
        codeop = 3'b110;
        #10;
        codeop = 3'b111;
        #10;

        ri = 1;
        codeop = 3'b000;
        #10;
        codeop = 3'b001;
        #10;
        codeop = 3'b010;
        #10;
        codeop = 3'b011;
        #10;
        codeop = 3'b100;
        #10;
        codeop = 3'b101;
        #10;
        codeop = 3'b110;
        #10;
        codeop = 3'b111;
        #10;
    end

endmodule