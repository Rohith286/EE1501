module A1_1 (
    input [3:0] in,
    output reg [1:0] out, 
    output reg valid);

    // We are using 'reg' for both "out" and "valid" because we are doing Procedural Assignment (always block)

    always@(*) begin
        valid = 1'b1;
        casez(in)
            4'b1zzz: out = 2'b11; 
            4'b01zz: out = 2'b10;
            4'b001z: out = 2'b01;
            4'b0001: out = 2'b00;
            default: begin
                out = 2'b00;
                valid = 1'b0;
            end
        endcase
    end

endmodule