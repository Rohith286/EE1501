module A1_1_tb;
    reg [3:0] in;
    wire [1:0] out;
    wire valid;

    // DUT instantiation
    A1_1 uut (
        .in(in),
        .out(out),
        .valid(valid)
    );

    initial begin
        $dumpfile("A1_1/A1_1.vcd");
        $dumpvars(0, A1_1_tb);
        $dumpvars(0, uut);

        $display("Time\tin\tout\tvalid");
        $monitor("%0t\t%b\t%b\t%b", $time, in, out, valid);

        // Apply test inputs (16 total)
        in = 4'b0000; #10;
        in = 4'b0001; #10;
        in = 4'b0010; #10;
        in = 4'b0011; #10;
        in = 4'b0100; #10;
        in = 4'b0101; #10;
        in = 4'b0110; #10;
        in = 4'b0111; #10;
        in = 4'b1000; #10;
        in = 4'b1001; #10;
        in = 4'b1010; #10;
        in = 4'b1011; #10;
        in = 4'b1100; #10;
        in = 4'b1101; #10;
        in = 4'b1110; #10;
        in = 4'b1111; #10;

        $finish;
    end
endmodule
