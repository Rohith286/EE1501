module A1_3(
    input [7:0] data,
    output parity);

    assign parity = ^data; // XOR of all bits gives the even parity bit
endmodule