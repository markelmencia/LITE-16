// Implementation of the LITE-16 data memory (RAM)
`timescale 1ns/1ps

module ram_tb;
    reg clk;
    reg [15:0] address;
    reg [15:0] data_in;
    reg store;
    reg load;

    wire [15:0] data_out;

    ram r_tb(clk, address, data_in, store, load, data_out);
    
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("ram_tb.vcd");
        $dumpvars(0, r_tb);

        load = 0;
        address = 16'h0002;
        data_in = 16'h8686;
        store = 1;
        #10;
        
        store = 0;
        #10;

        load = 1;
        #10;

        address = 16'h0000;
        #10;

        $finish;
    end

endmodule