`timescale 1ns / 1ps

module add32_2(
	input[31:0] ina,
	input[31:0] inb,
	input clk,
	input cin,
	output reg cout,
	output reg [31:0] sum
);

	reg [15:0] tempa,tempb,firsts;
	reg firstc;

	always@(posedge clk)begin
		{firstc,firsts} = ina[15:0]+inb[15:0]+cin;
		tempa = ina[31:15];
		tempb = inb[31:15];
	end

	always@(posedge clk)begin
		{cout, sum[31:15]} = tempa+tempb+firstc;
		sum[15:0] = firsts;
	end
	
endmodule
