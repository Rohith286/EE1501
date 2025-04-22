module A2_1_tb;
    reg [3:0] x [0:7];
    reg [3:0] h [0:7];
    wire [3:0] y [0:15];

    reg [3:0] y1 [0:15]; // for better displaying of the outputs for each testcase
    reg [3:0] y2 [0:15];
    reg [3:0] y3 [0:15];

    A2_1 dut (
        .x(x),
        .h(h),
        .y(y)
    );

    integer i;

    initial begin
        $dumpfile("A2_1/A2_1.vcd");
        $dumpvars(0, A2_1_tb);
        $dumpvars(0, dut);

        // dumping input and output arrays to obtain the waveform in gtkwave
        for (i = 0; i < 8; i++) begin
            $dumpvars(0, x[i]);
            $dumpvars(0, h[i]);
        end
        for (i = 0; i < 16; i++)
            $dumpvars(0, y[i]);

        // Testcase - 1
        x[0] = 4'd1; x[1] = 4'd2; x[2] = 4'd3; x[3] = 4'd4; x[4] = 4'd0; x[5] = 4'd0; x[6] = 4'd0; x[7] = 4'd0; // x = 12340000
        h[0] = 4'd1; h[1] = 4'd1; h[2] = 4'd1; h[3] = 4'd1; h[4] = 4'd0; h[5] = 4'd0; h[6] = 4'd0; h[7] = 4'd0; // h = 11110000

        #1;
        for (i = 0; i < 16; i++)
            y1[i] = y[i]; // Outputs for TC1

        // Testcase - 2
        #10;
        x[0] = 4'd1; x[1] = 4'd0; x[2] = 4'd0; x[3] = 4'd0; x[4] = 4'd0; x[5] = 4'd0; x[6] = 4'd0; x[7] = 4'd0; // x = 10000000
        h[0] = 4'd9; h[1] = 4'd8; h[2] = 4'd7; h[3] = 4'd6; h[4] = 4'd0; h[5] = 4'd0; h[6] = 4'd0; h[7] = 4'd0; // h = 98760000

        #1;
        for (i = 0; i < 16; i++)
            y2[i] = y[i]; // Outputs for TC2

        // Testcase - 3
        #10;
        x[0] = 4'd1; x[1] = 4'd1; x[2] = 4'd1; x[3] = 4'd1; x[4] = 4'd1; x[5] = 4'd1; x[6] = 4'd1; x[7] = 4'd1; // x = 11111111
        h[0] = 4'd1; h[1] = 4'd1; h[2] = 4'd1; h[3] = 4'd1; h[4] = 4'd1; h[5] = 4'd1; h[6] = 4'd1; h[7] = 4'd1; // h = 11111111

        #1;
        for (i = 0; i < 16; i++)
            y3[i] = y[i]; // Outputs for TC3

        // Printing all outputs
        $display("Index\tTC1\tTC2\tTC3");
        for (i = 0; i < 16; i++) begin
            $display("y[%0d] =\t%0d\t%0d\t%0d", i, y1[i], y2[i], y3[i]);
        end

        #10;
        $finish;
    end
endmodule
