module A1_2 (
    input clk, // Clock signal
    input reset, // Asynchronous reset signal (active high {1 is high})
    input enable, // Control signal to enable counting
    output reg [3:0] count);

    always@(posedge clk or posedge reset) begin
        if (reset)              // Counter is cleared when reset is high
            count <= 4'b0000;   // We use '<=' in place of '=' for "non-blocking assignments" i.e., when we  use "always@(posedge clk)" block.
        else if (enable)        // Counting takes place only when enable is high
            count <= count + 1;
    end
endmodule
