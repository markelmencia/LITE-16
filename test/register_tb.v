// Implementation of a LITE-16 register
`timescale 1ns/1ps

module register_tb;

    reg clk;
    reg en;
    reg [15:0] data_in;
    wire [15:0] data_out;

    register r_tb(clk, en, data_in, data_out);

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("register_tb.vcd");
        $dumpvars(0, r_tb);

        en = 0;
        data_in = 16'hFFFF;
        #10;

        en = 1;
        #10;

        data_in = 16'hAABB;
        #10;

        en = 0;
        data_in = 16'hAA00;
        #10;

        $finish;
    end

endmodule