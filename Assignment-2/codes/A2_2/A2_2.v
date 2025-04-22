module A2_2(
    input [7:0] a,
    input [7:0] b,
    input cin,
    output reg [7:0] sum,
    output reg cout
    );

    always@(*) begin
        sum[0] = a[0] ^ b[0] ^ cin; // initialising the sum vector
        cout = (a[0] & b[0]) | (cin & (a[0] ^ b[0])); // this cout is the cin for the next 

        for(integer i = 1; i < 8;i++) begin
            sum[i] = a[i] ^ b[i] ^ cout;
            cout = (a[i] & b[i]) | (cout & (a[i] ^ b[i]));
        end
    end
endmodule