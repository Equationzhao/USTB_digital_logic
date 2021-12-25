`timescale 1ns / 1ps

module top(
    input clk100mhz,
    input rst,
    input sel,
////////////////////////////////////////
    input but1, // input number
    input but2, // input number
    input but3, // input number
    input but4, // input number
////////////////////////////////////////
    input but5, // input unit price
    input but6, // input unit price
    input but7, // input unit price
    input but8, // input unit price
////////////////////////////////////////
    output [3:0] pos1, // First LED display
    output [7:0] seg1, // First LED display
////////////////////////////////////////
    output [3:0] pos2, // Second LED display
    output [7:0] seg2  // Second LED display
);
    wire clk190hz, clk3hz;
    wire rst_, sel_;
    
    clkDiv u1(clk100mhz, clk190hz, clk3hz);

    //* read AND display `number & unit price` AND calculate the price
    read   u2(clk190hz, rst_, sel_, but1, but2, but3, but4, but5, but6, but7, but8, pos1, seg1); 
    
    //* add to `total price` AND display
    calculate  u3(clk190hz, rst_, sel_, but1, but2, but3, but4, but5, but6, but7, but8, pos2, seg2);
    
    press  c1(clk190hz, rst, rst_);
    press  c2(clk190hz, sel, sel_);
endmodule
