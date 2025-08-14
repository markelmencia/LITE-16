// Implementation of the LITE-16 Arithmetic Logic Unit

module alu(
    input wire [2:0] codeop,
    input wire [15:0] a,
    input wire [15:0] b,
    input wire [15:0] rd,
    input wire [15:0] pc,
    input wire ri,
    input wire jmp,
    
    output reg [15:0] r,
    output reg cmp
    );

    reg [15:0] r0;
    reg [15:0] r1;

    always @(*) begin
        /* R */
        case (codeop)
            3'b000: r0 = a + b;
            3'b001: r0 = a | b;
            3'b010: r0 = a ^ b;
            3'b011: r0 = a & b;
            3'b100: r0 = a << b;
            3'b101: r0 = a >> b;
            3'b110: r0 = a >>> b;
            3'b111: r0 = a + b; // will concatenate
        endcase

        if (codeop[0]) begin
            r1 = (a + b) + rd; // mv
        end else begin
            r1 = (a + b) << 8; // mvu
        end

        if (ri) begin
            r = r1;
        end else begin
            r = r0;
        end

        if (jmp) begin
            r = pc + 1;
        end

        /* CMP */
        case(codeop[1:0])
            2'b00: cmp = a == b;
            2'b01: cmp = a < b;
            2'b10: cmp = a > b;
            2'b11: cmp = 1; // inconditional
        endcase    
    end

endmodule