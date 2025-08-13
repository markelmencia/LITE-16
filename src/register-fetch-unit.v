// Implementation of the LITE-16 Register Fetch Unit


module register_fetch_unit(
    input wire clk,
    input wire rst,
    input wire [3:0] i4_7, // Instruction bits 4 to 7
    input wire [3:0] i8_11, // Instruction bits 8 to 11
    input wire [3:0] i12_15, // Instruction bits 12 to 15
    input wire [15:0] r,
    input wire ri,
    input wire st,
    input wire jmp,
    input wire fn,

    output reg [15:0] a,
    output reg [15:0] b,
    output reg [15:0] rd
    );

    // Bound to en, is set if the current instruction should store
    // a value in a register
    reg is_en;
    // Enable bus. Each bit is bound to a register. If said bit is set,
    // the value of that register will be set to r.
    reg [15:0] en;
    // The output of the register file.
    wire [(16*16)-1:0] rf_out;
    
    register_file rf (clk, rst, r, en, rf_out);
    

    // Generates an 16-register array, which is essentially
    // the register bank.
    reg [15:0] rf_array [0:15];
    genvar i;
    generate
    for (i = 0; i < 16; i = i + 1) begin : array
        always @(*) rf_array[i] = rf_out[i*16 +: 16];
    end
    endgenerate

    always @(*) begin
        /* R */
        en = 0;

        if (st || (jmp && !fn)) begin
            is_en = 0;
        end else begin
            is_en = 1;
        end

        if (fn) begin
            en[i8_11] = is_en;
        end else begin
            en[i12_15] = is_en;
        end

        /* A AND B OUTPUTS */
        if (ri) begin
            a = {12'b0, i4_7};
            b = {i8_11, 12'b0};
        end else begin
            a = rf_array[i4_7];
            b = rf_array[i8_11];
        end

        /* rd */
        rd = rf_array[i12_15];
    end

endmodule


// Implements a register file, consisting
// of 16 registers
module register_file(
    input wire clk,
    input wire rst,
    input wire [15:0] data_in,
    input wire [15:0] en,
    output wire [(16*16)-1:0] data_out
    );

    // Generates 16 registers
    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : reg_array
            register reg_u (
                .clk(clk),
                .rst(rst),
                .en(en[i]),
                .data_in(data_in),
                .data_out(data_out[(i*16) + 15 : (i*16)])
            );
        end
    endgenerate

endmodule
