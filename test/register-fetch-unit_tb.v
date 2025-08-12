// Implementation of the LITE-16 Register Fetch Unit
`timescale 1ns/1ps


module register_fetch_unit_tb;

    reg clk;
    reg rst;
    reg [3:0] i4_7; // Instruction bits 4 to 7
    reg [3:0] i8_11; // Instruction bits 8 to 11
    reg [3:0] i12_15; // Instruction bits 12 to 15
    reg [15:0] r;
    reg ri;
    reg st;
    reg jmp;
    reg fn;

    wire [15:0] a;
    wire [15:0] b;

    register_fetch_unit rfu(clk, rst, i4_7, i8_11, i12_15, r, ri, st, jmp, fn, a, b);

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("register_fetch_unit_tb.vcd");
        $dumpvars(0, rfu);

        rst = 0;

        fn = 0;
        jmp = 0;
        ri = 0;
        st = 1;

        i4_7 = 1;
        i8_11 = 2;
        i12_15 = 1;
        r = 16'h2222;
        #5;

        // No register changes
        st = 0;
        jmp = 1;
        fn = 0;
        #10;

        // reg[2] should change to 0x2222
        jmp = 0;
        fn = 1;
        #10;

        fn = 0;
        #10;

        // reg[1] should change to 0x1111
        r = 16'h1111;
        #10;

        ri = 1;
        #10;
        $finish;
    end

endmodule

module register_file_tb;

    reg clk;
    reg rst;
    reg [15:0] data_in;
    reg [16-1:0] en;
    wire [(16*16)-1:0] data_out;

    register_file rf(clk, rst, data_in, en, data_out);

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("register_file_tb.vcd");
        $dumpvars(0, rf);
        rst = 0;

        en = 16'hFFFF;
        data_in = 16'h0000;
        #15
        en = 0;
        data_in = 16'h0123;
        en[3] = 1;
        #10;
        en = 0;
        en[7] = 1;
        data_in = 16'h4545;
        #10;
         en = 0;
        en[15] = 1;
        data_in = 16'hAEAE;
        #10;
        $finish;
    end

endmodule
