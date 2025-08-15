`timescale 1ns/1ps

module lite_16_tb #(
        parameter ROM_FILE = "test/roms/romtest.hex",
        parameter FULL_MEM = 0
    );

    reg clk;
    reg rst;

    lite_16 #(.ROM_FILE(ROM_FILE), .FULL_MEM(FULL_MEM)) l16(clk, rst);

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("lite-16_tb.vcd");
        $dumpvars(0, l16);

        rst = 1;
        #5;
        rst = 0;
        #500;
        $finish;
    end

endmodule