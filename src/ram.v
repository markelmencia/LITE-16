// Implementation of the LITE-16 data memory (RAM)

module ram #(
    parameter FULL_MEM = 0,
    parameter MEM_SIZE = (FULL_MEM ? 65535 : 127)
    )(
    input wire clk,
    input wire [15:0] address,
    input wire [15:0] data_in,
    input wire store,
    input wire load,

    output reg [15:0] data_out
    );

    reg [15:0] data [0:MEM_SIZE];

    initial begin
        // Initializes data to zero
        for (integer i = 0; i < MEM_SIZE + 1; i = i + 1) begin
            data[i] = 16'h0000;
        end
    end

    always @(posedge clk) begin
        if (store) begin
            data[address] <= data_in;
        end
    end

    always @(*) begin
        if (load) begin
            data_out <= data[address];
        end
    end

endmodule