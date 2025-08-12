// Implementation of the LITE-16 Register Fetch Unit

// Implements a register file, consisting
// of 16 registers
module register_file #(
    parameter REGISTER_COUNT = 16
)(
    input wire clk,
    input wire [15:0] data_in,
    input wire [REGISTER_COUNT-1:0] en,
    output wire [(16*16)-1:0] data_out
);

    // Generates 16 registers
    genvar i;
    generate
        for (i = 0; i < REGISTER_COUNT; i = i + 1) begin : reg_array
            register reg_u (
                .clk(clk),
                .en(en[i]),
                .data_in(data_in),
                .data_out(data_out[(i*16) + 15 : (i*16)])
            );
        end
    endgenerate

endmodule
