module A2_2_tb;
    reg [7:0] a;
    reg [7:0] b;
    reg cin;
    wire [7:0] sum;
    wire cout;

    A2_2 dut(
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        $dumpfile("A2_2/A2_2.vcd");
        $dumpvars(0, A2_2_tb);
        $dumpvars(0, dut);

        // Testcase - 1
        a = 8'b00011011; // a = 27
        b = 8'b00000111; // b = 7
        cin = 0;         // sum = 27 + 7 + 0 = 34

        #1;
        $display("Testcase - 1");
        $display("a = %0d\nb = %0d\ncin = %0d\nsum = %0d", a, b, cin, sum);

        // Testcase - 2
        #10;
        a = 8'b00100110; // a = 38
        b = 8'b00001011; // b = 11
        cin = 1;         // sum = 38 + 11 + 1 = 50

        #1;
        $display("\nTestcase - 2");
        $display("a = %0d\nb = %0d\ncin = %0d\nsum = %0d", a, b, cin, sum);

        // Testcase - 3
        #10;
        a = 8'b11000000; // a = 192
        b = 8'b00111111; // b = 63
        cin = 0;         // sum = 192 + 63 + 0 = 255 (maximum possible result to store in sum)

        #1;
        $display("\nTestcase - 3");
        $display("a = %0d\nb = %0d\ncin = %0d\nsum = %0d", a, b, cin, sum);

        // Testcase - 4
        #10;
        a = 8'b11000000; // a = 192
        b = 8'b00111111; // b = 63
        cin = 1;        // sum = 192 + 63 + 1 = 256 (overflow)

        #1;
        $display("\nTestcase - 4");
        $display("a = %0d\nb = %0d\ncin = %0d\nsum = %0d", a, b, cin, sum);

        #10; 
        $finish;
        
    end
endmodule