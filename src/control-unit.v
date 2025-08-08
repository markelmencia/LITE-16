// Implementation of the LITE-16 Control Unit

module control_unit(
    input wire [3:0] codeop,
    output reg ri,
    output reg cmp,
    output reg mem,
    output reg ld,
    output reg st,
    output reg jmp,
    output reg fn
    );

    always @(*) begin

        ri = 0;
        cmp = 0;
        mem = 0;
        ld = 0;
        st = 0;
        jmp = 0;
        fn = 0;

        if (codeop[3:1] == 3'b111) begin
            ri = 1;
        end

        if (codeop[1:0] == 2'b11) begin
            cmp = 1;
        end 

        if (codeop[3:1] == 3'b110) begin
            mem = 1;
        end 

        if (mem && !codeop[0]) begin
            ld = 1;
        end 

        if (mem && codeop[0]) begin
            st = 1;
        end

        if (codeop[3:2] == 2'b10) begin
            jmp = 1;
        end

        if (jmp && cmp) begin
            fn = 1;
        end 
    end

endmodule