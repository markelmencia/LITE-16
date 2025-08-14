// Program memory testbench
`timescale 1ns/1ps

module rom_tb;
    reg [15:0] address;
    wire [15:0] data_out;

    rom #(.ROM_FILE("test/romtest.hex")) r_tb(address, data_out);

    initial begin
        $dumpfile("rom_tb.vcd");
        $dumpvars(0, r_tb);
        for (integer i = 0; i < 21; i = i + 1) begin
            address = i;
            #10;
        end
        $finish;
    end

endmodule