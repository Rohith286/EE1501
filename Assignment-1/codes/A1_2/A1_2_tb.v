module A1_2_tb;

    reg clk;
    reg reset;
    reg enable;
    wire [3:0] count;

    A1_2 uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .count(count)
    );

    // Clock generation: toggles every 5 time units (10 time unit period)
    always #5 clk = ~clk;

    initial begin
        $dumpfile("A1_2/A1_2.vcd");
        $dumpvars(0, A1_2_tb);
        $dumpvars(0, uut);

        // Initialize signals
        clk = 0;
        reset = 1;  // Start with reset asserted
        enable = 0;

        #7 reset = 0;      // Deassert reset at time 7 (not on clock edge)
        #3 enable = 1;     // Start counting at time 10

        #100 enable = 0;    // Stop counting
        
        // Test asynchronous reset - assert reset between clock edges
        #12 reset = 1;      // Assert reset at time 122 (between clock edges)
        #3 reset = 0;       // Deassert reset at time 125
        
        #7 enable = 1;     // Start counting again
        #60;

        $finish;
    end

endmodule