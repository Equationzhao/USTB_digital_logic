`timescale 1ns / 1ps
module top_tb();
//  test_bench of top
    initial begin
        rst = 1;
           
    end

    parameter clk_period = 10000000000;  // 10ns
    reg clk;  
    initial  
    clk = 0;  
    always #(clk_period/2) clk = ~clk;  


    top top_instance(
        .clk(clk),
        .rst(rst),
        .led(led),
        .key(key)
    );

endmodule