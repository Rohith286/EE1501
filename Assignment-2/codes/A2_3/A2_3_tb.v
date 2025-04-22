`timescale 1ns/1ps;

module A2_3_tb;
    reg [3:0] A, B;
    reg CIN;
    wire [3:0] SUM;
    wire COUT;

    A2_3 dut(
        .A(A),
        .B(B),
        .CIN(CIN),
        .SUM(SUM),
        .COUT(COUT)
    );

    initial begin
        $dumpfile("A2_3/A2_3.vcd");
        $dumpvars(0, A2_3_tb);
        $monitor("Time=%0t : A = %04b B = %04b CIN = %b \t SUM = %04b COUT = %b", $time, A, B, CIN, SUM, COUT);

        // Testcase - 1
        $display("----------Testcase - 1----------");
        A = 4'b0110; // A = 6
        B = 4'b0011; // B = 3
        CIN = 0; // SUM = 6 + 3 + 0 = 9

        #100; 
        $display("\nA = %0d\tB = %0d\tCIN = %0d\tSUM = %0d\tCOUT = %0d", A, B, CIN, SUM, COUT);

        // Testcase - 2
        $display("\n----------Testcase - 2----------");
        A = 4'b0011; // A = 3
        B = 4'b1000; // B = 8
        CIN = 1; // SUM = 3 + 8 + 1 = 12

        #100;
        $display("\nA = %0d\tB = %0d\tCIN = %0d\tSUM = %0d\tCOUT = %0d", A, B, CIN, SUM, COUT);

        //Testcase - 3
        $display("\n----------Testcase - 3----------");
        A = 4'b1010; // A = 10
        B = 4'b0101; // B = 5
        CIN = 0; // SUM = 10 + 5 + 0 = 15

        #100;   
        $display("\nA = %0d\tB = %0d\tCIN = %0d\tSUM = %0d\tCOUT = %0d", A, B, CIN, SUM, COUT);

        // Testcase - 4
        $display("\n----------Testcase - 4----------");
        A = 4'b0111; // A = 7
        B = 4'b0001; // B = 1
        CIN = 0; // SUM = 7 + 1 + 0 = 8 (Worst case propagation delay because carry is propagated through all the bit positions)

        #100;
        $display("\nA = %0d\tB = %0d\tCIN = %0d\tSUM = %0d\tCOUT = %0d", A, B, CIN, SUM, COUT);
        
        // Testcase - 5
        $display("\n----------Testcase - 5----------");
        A = 4'b0010; // A = 2
        B = 4'b1101; // B = 13
        CIN = 1; // SUM = 2 + 13 + 1 = 16 (overflow)

        #100;
        $display("\nA = %0d\tB = %0d\tCIN = %0d\tSUM = %0d\tCOUT = %0d", A, B, CIN, SUM, COUT);
        $finish;
    end
endmodule