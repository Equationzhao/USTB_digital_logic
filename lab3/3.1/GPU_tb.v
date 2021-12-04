`timescale 1ns / 1ps
module GPU_tb();
    reg clk;
    reg clr;
    wire [15:0] dataBus;
        initial begin
            clk = 0;
            clr = 0;
            #100 clk = 1;
        end
    always #5 clk = ~clk;


    GPU tb1(clk, clr, dataBus);
endmodule
