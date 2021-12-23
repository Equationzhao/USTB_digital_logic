`timescale 1ns / 1ps

module top(
    input clk100mhz,
    input rst0,
    input sel0,
    ////////////////////////////////////////
    input but1,     // input weight
    input but2,     // input weight
    input but3,     // input weight
    input but4,     // input weight
    ////////////////////////////////////////
    input but5,     // input unit price
    input but6,     // input unit price
    input but7,     // input unit price
    input but8,     // input unit price
    ////////////////////////////////////////
    output [3:0] pos1,
    output [7:0] seg1,
    ////////////////////////////////////////
    output [3:0] pos2,
    output [7:0] seg2
);
    wire clk190hz, clk3hz;
    wire rst, sel;
    
    clkDiv u1(clk100mhz, clk190hz, clk3hz);

    //* read weight and unit price & display
    read       u2(clk190hz, rst, sel, but1, but2, but3, but4, but5, but6, but7, but8, pos1, seg1);
    //* calculate total price & display
    calculate  u3(clk190hz, rst, sel, but1, but2, but3, but4, but5, but6, but7, but8, pos2, seg2);
    
    press  c1(clk190hz, rst0, rst);
    press  c2(clk190hz, sel0, sel);
endmodule
