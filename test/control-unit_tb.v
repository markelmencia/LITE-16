// Control Unit testbench
`timescale 1ns/1ps

module control_unit_tb;

    reg [3:0] codeop;
    wire ri;
    wire cmp;
    wire mem;
    wire ld;
    wire st;
    wire jmp;
    wire fn;

    control_unit cu_tb(codeop, ri, cmp, mem, ld, st, jmp, fn);

    initial begin
        $dumpfile("control-unit_tb.vcd");
        $dumpvars(0, cu_tb);

        codeop = 4'b0000;
        #10;
        codeop = 4'b0001;
        #10;
        codeop = 4'b0010;
        #10;
        codeop = 4'b0011;
        #10;
        codeop = 4'b0100;
        #10;
        codeop = 4'b0101;
        #10;
        codeop = 4'b0110;
        #10;
        codeop = 4'b0111;
        #10;
        codeop = 4'b1000;
        #10;
        codeop = 4'b1001;
        #10;
        codeop = 4'b1010;
        #10;
        codeop = 4'b1011;
        #10;
        codeop = 4'b1100;
        #10;
        codeop = 4'b1101;
        #10;
        codeop = 4'b1110;
        #10;
        codeop = 4'b1111;
        #10;

        $finish;
    end

endmodule