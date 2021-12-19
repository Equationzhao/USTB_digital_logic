`timescale 1ns / 1ps
module top(
           input clk100mhz,
           input rst,
           input sel,
           input leftMove,
           input rightMove,
           input increase,
           input decrease,
           output [3:0] pos1,pos2,
           output [7:0] seg1,seg2
            );
    wire clk190hz, clk3hz;
    wire [31:0] StuId;
    wire [15:0] dataBus;
    
    clkDiv            ClkDivision_instance(clk100mhz, clk190hz, clk3hz);
    DataShowService   DataShowService_instance(clk190hz, clk3hz, rst & sel, StuId, pos1, seg1);
    DataReadService   DataReadService_instance(clk190hz, rst, sel, leftMove, rightMove, increase, decrease, pos2, seg2, StuId);
    
endmodule
