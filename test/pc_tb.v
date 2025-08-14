`timescale 1ns/1ps

module pc_tb;

    reg clk;
    reg rst;
    reg jmp;
    reg cmp;
    reg [15:0] rd;

    wire [15:0] instruction;
    wire [15:0] pc_out;

    pc pc_tb(clk, rst, jmp, cmp, rd, instruction, pc_out);

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("pc_tb.vcd");
        $dumpvars(0, pc_tb);

        rst = 1;
        #10;
        rst = 0;
        
        jmp = 0;
        cmp = 0;
        rd = 16'h0708;
        #210;
        rst = 1;
        #50;
        jmp = 1;
        cmp = 1;
        #10;

        $finish;
    end

    
endmodule