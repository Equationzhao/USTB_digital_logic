
`timescale 1ns / 1ps
module test_mux3();
    reg A;
    reg [1:0]d;
    wire a;
    wire y;
    mux3 u0(.d(d),.a(a),.y(y));
    assign a = A;
    initial
    begin
        d=2'b10;A=0;#1000;
        d=2'b10;A=1;#1000;
    end
endmodule