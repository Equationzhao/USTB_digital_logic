`timescale 1ns / 1ps
// 分频
module clkDiv(
    input clk100mhz,
    output clk190hz,
    output clk12hz,
    output clk1_5hz
);

    reg [26:0]count=0;
    always@(posedge clk100mhz) begin
        count<=count+1; 
    end

    assign clk190hz = count[18];
    assign clk12hz  = count[22];
    assign clk1_5hz = count[25];
    //TODO is it clk1_5hz or clk3hz ? // or just change to count[26] ?
endmodule
