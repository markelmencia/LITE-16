// Implementation of the LITE-16 program memory (ROM)

module rom #(
    parameter ROM_FILE = "test/roms/romtest.hex",
    parameter FULL_MEM = 0,
    parameter MEM_SIZE = (FULL_MEM ? 65535 : 127)
)(
    input wire [15:0] address,
    output reg [15:0] data_out
);

    reg [15:0] data [0:MEM_SIZE];

    initial begin
        // Initializes data to zero
        for (integer i = 0; i < MEM_SIZE + 1; i = i + 1) begin
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