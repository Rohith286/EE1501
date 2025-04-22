module A2_1(
    input [3:0] x [0:7], 
    input [3:0] h [0:7],            // vector containing 8 [7:0] elements with each element being a 4-bit [3:0] unsigned number
    output reg [3:0] y [0:15]       // 16 elements, each 4-bits
    );

    always @(*) begin
        for (int i = 0; i < 16; i++) begin    // discrete convolution y[i] = summation { x[j] * h[i-j] } where j belongs to {0, 1, 2, . . . , 7} 
            y[i] = 0;                         // initialising each element in the result to 0 to add the product.
            for (int j = 0; j < 8; j++) begin
                if ((i - j) >= 0 && (i - j) < 8)
                    y[i] += (x[j] * h[i - j]);
            end
        end
    end
endmodule