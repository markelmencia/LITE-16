// Implementation of a LITE-16 register

module register (
    input wire clk,
    input wire rst,
    input wire en,
    input wire [15:0] data_in,
    output reg [15:0] data_out
    );

    // Only when en is set will the register data
    // be updated, in a rising edge.

    always @(posedge clk) begin
        if (en)
            data_out <= data_in;
    end

    // The LITE-16 reset is asynchronous, meaning
    // that it will update regardless of the clock signal.

    always @(*) begin
        if (rst)
            data_out = 0;
    end
    
endmodule