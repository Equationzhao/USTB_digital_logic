`timescale 1ns / 1ps

module add32_tb();
	reg [31:0]a;
	reg [31:0]b;
	reg cin;
	reg clk;
	wire [31:0]s0;
	wire cout0;
	initial begin
		a = 4'bxxxx;
		b = 4'bxxxx;
		cin = 1'bx;
		clk = 0;
	end
	always #100 clk = ~clk;
	always@(posedge clk)begin
		a={$random}%2**30;
		b={$random}%2**30;
		cin={$random}%2;
		#150;
		cin=1'bx;
	end

	add32_2 A(a,b,clk,cin,cout0,s0);

endmodule
