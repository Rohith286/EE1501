`timescale 1ns/1ps

// 2-input NAND gate with 1ns delay
module nand2 (
    input wire a, b,
    output wire y
);
    assign #1 y = ~(a & b);  
endmodule

// full adder
module fa (
    input wire x, y, cin,
    output wire sum, cout
);
    
    wire i1, i2, i3, i5, i6, i7; //intermediate outputs
    wire xy; // xy => x ^ y

    // first XOR => x ^ y = (x NAND (x NAND y)) NAND (y NAND (x NAND y))
    nand2 u1 (x, y, i1); // i1 = x NAND y
    nand2 u2 (x, i1, i2);
    nand2 u3 (y, i1, i3);
    nand2 u4 (i2, i3, xy);
    
    // sum = (x ^ y) ^ cin
    nand2 u5 (xy, cin, i5); // i5 = cin NAND ((x NAND (x NAND y)) NAND (y NAND (x NAND y)))
    nand2 u6 (xy, i5, i6);
    nand2 u7 (cin, i5, i7);
    nand2 u8 (i6, i7, sum);
    
    // cout = (x & y) | (cin & (x ^ y))
    nand2 u9 (i1, i5, cout); 
endmodule

// 4-bit ripple carry adder
module A2_3 #(parameter WIDTH = 4) (
    input wire [WIDTH-1:0] A, B, 
    input wire CIN,
    output wire [WIDTH-1:0] SUM,
    output wire COUT
);
    wire [WIDTH:0] carry; // intermediate cout
    assign carry[0] = CIN; // first carry is the cin

    genvar i;
    generate
        for (i = 0; i < WIDTH; i++) begin : fa
            // fa[i].fa_inst is the full adder for bit i
            fa fa_inst (
                .x(A[i]),
                .y(B[i]),
                .cin(carry[i]),
                .sum(SUM[i]),
                .cout(carry[i+1])
            );
        end
    endgenerate

    assign COUT = carry[WIDTH]; // final cout
endmodule


