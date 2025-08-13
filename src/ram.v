// Implementation of the LITE-16 data memory (RAM)

module ram(
    input wire clk,
    input wire [15:0] address,
    input wire [15:0] data_in,
    input wire store,
    input wire load,

    output reg [15:0] data_out
    );

    reg [15:0] data [0:65535];

    initial begin
        // Initializes data to zero
        for (integer i = 0; i < 65536; i = i + 1) begin
            data[i] = 16'h0000;
        end
    end

    always @(clk) begin
        if (store) begin
            data[address] <= data_in;
        end

        if (load) begin
            data_out <= data[address];
        end
    end

endmodule