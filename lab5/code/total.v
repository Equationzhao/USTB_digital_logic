`timescale 1ns / 1ps

module calculate(
	input clk190hz,
	input rst,
	input sel,
	input but1,
	input but2,
	input but3,
	input but4,
	input but5,
	input but6,
	input but7,
	input but8,
	output [3:0] pos,
	output [7:0] seg
);
	wire [3:0] mid1;
	wire [3:0] mid2;
	assign mid1 = {but4,but3,but2,but1};
	assign mid2 = {but8,but7,but6,but5};

	segMsg1 u(clk190hz, rst, sel, mid1, mid2, pos, seg);
	
endmodule
