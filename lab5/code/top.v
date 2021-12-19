`timescale 1ns / 1ps

module top(
    input clk100mhz,
    input rst0,
    input sel0,
    input but1,
    input but2,
    input but3,
    input but4,
    input but5,
    input but6,
    input but7,
    input but8,
    output [3:0] pos1,
    output [7:0] seg1,
    output [3:0] pos2,
    output [7:0] seg2
    );
    wire clk190hz, clk3hz;
    wire rst,sel;
    
    clkDiv     u1(clk100mhz, clk190hz, clk3hz);
    total   u2(clk190hz,rst ,sel , but1,but2,but3,but4,but5,but6,but7,but8, pos2, seg2);
    read   u3(clk190hz,rst ,sel , but1,but2,but3,but4,but5,but6,but7,but8, pos1, seg1);
    
    press c1(clk190hz, rst0, rst);
    press c2(clk190hz, sel0, sel);
endmodule
