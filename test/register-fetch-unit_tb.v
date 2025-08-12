// Implementation of the LITE-16 Register Fetch Unit
`timescale 1ns/1ps

module register_file_tb;

    reg clk;
    reg [15:0] data_in;
    reg [16-1:0] en;
    wire [(16*16)-1:0] data_out;

    register_file rf(clk, data_in, en, data_out);

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("register_file_tb.vcd");
        $dumpvars(0, rf);
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
