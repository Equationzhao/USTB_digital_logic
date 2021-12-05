`timescale 1ns / 1ps
module top(
           input clk100mhz,
           input rst,
           input sel,
           input left_move,
           input right_move,
           input increase,
           input decrease,
           output [3:0] pos1,pos2,
           output [7:0] seg1,seg2
            );
    wire clk190hz, clk3hz;
    wire [31:0] StuId;
    wire [15:0] dataBus;
    wire leftMove, rightMove, inc, dec;
    
    clkDiv            ClkDivision_instance(clk100mhz, clk190hz, clk3hz);
    DataShowService   DataShowService_instance(clk190hz, clk3hz, rst & sel, StuId, pos1, seg1);
    DataReadService   DataReadService_instance(clk190hz, rst, sel, leftMove, rightMove, inc, dec, pos2, seg2, StuId);
    CatchPress        CatchPress_instance1(clk190hz, left_move, leftMove);
    CatchPress        CatchPress_instance2(clk190hz, right_move, rightMove);
    CatchPress        CatchPress_instance3(clk190hz, increase, inc);
    CatchPress        CatchPress_instance4(clk190hz, decrease, dec);
    

endmodule
