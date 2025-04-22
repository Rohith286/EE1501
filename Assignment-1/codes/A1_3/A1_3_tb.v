module A1_3_tb;

    // Inputs
    reg [7:0] data;

    // Output
    wire parity;

    // Instantiate the Unit Under Test (UUT)
    A1_3 uut (
        .data(data),
        .parity(parity)
    );

    initial begin
        // Setup waveform dump
        $dumpfile("A1_3/A1_3.vcd");     // Name of the waveform file
        $dumpvars(0, A1_3_tb);     // Dump all variables in this module
        $dumpvars(0, uut);         // Dump all signals inside the instantiated module

        // Display header
        $display("Time\tData\t\tParity");
        $monitor("%0t\t%b\t%b", $time, data, parity);

        // Apply test vectors
        data = 8'b00000000; #10;  // 0 ones → parity = 0
        data = 8'b00000001; #10;  // 1 one  → parity = 1
        data = 8'b00000011; #10;  // 2 ones → parity = 0
        data = 8'b00000111; #10;  // 3 ones → parity = 1
        data = 8'b11111111; #10;  // 8 ones → parity = 0
        data = 8'b10101010; #10;  // 4 ones → parity = 0
        data = 8'b11111110; #10;  // 7 ones → parity = 1

        // End simulation
        $finish;
    end

endmodule
