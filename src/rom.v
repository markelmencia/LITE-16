// Implementation of the LITE-16 program memory (ROM)

module rom #(
    parameter ROM_FILE = "test/romtest.hex"
)(
    input wire [15:0] address,
    output reg [15:0] data_out
);

    reg [15:0] data [0:65535];

    initial begin
        // Initializes data to zero
        for (integer i = 0; i < 65536; i = i + 1) begin
            data[i] = 16'h0000;
        end

        // The content of the specified file is dumped 
        // into the ROM data
        $readmemh(ROM_FILE, data);
    end

    always @(*) begin
        data_out = data[address];
    end

endmodule