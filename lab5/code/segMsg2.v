`timescale 1ns / 1ps

module segMsg2(
	input clk190hz,
	input rst,
	input sel,
	input [3:0] dataBus1,
	input [3:0] dataBus2,
	input [3:0] dataBus3,
	input [3:0] dataBus4,
	output reg [3:0] pos,
	output reg [7:0] seg
);

	reg [3:0] dataBus11 = 0, dataBus22 = 0, dataBus33 = 0, dataBus44 = 0;
	reg [1:0] posC;
	reg [3:0] dataP;
	reg [3:0] num;
	reg rst_delay = 0;
	reg sel_delay = 0;

	always @(posedge clk190hz) 
	begin
		if(dataBus1!=dataBus11||dataBus2!=dataBus22||dataBus3!=dataBus33||dataBus4!=dataBus44) begin
			rst_delay = 0;
			sel_delay = 0;
			dataBus11 <= dataBus1;
			dataBus22 <= dataBus2;
			dataBus33 <= dataBus3;
			dataBus44 <= dataBus4;
		end
		if (rst||rst_delay) begin
			if (rst_delay == 0) begin
				num  = 0;
				pos  = 4'b1111;
				posC = 0;
				dataP = 0;
				rst_delay = 1;
			end
		end
		else if(sel||sel_delay) begin
			if (sel_delay == 0) begin
				num = num + 1;
				sel_delay = 1;
			end
			posC = posC + 1;
			case (posC) //根据posC调整数码管位置并调整对应的数据
				0: begin
					pos   <= 4'b0001;
					dataP <= num%10;
				end
				1: begin
					pos   <= 4'b0010;
					dataP <= (num/10)%10;            
				end
				2: begin
					pos   <= 4'b0100;
					dataP <= 4'b1011;
				end
				3: begin
					pos   <= 4'b1000;
					dataP <= 4'b1010;
				end
			endcase
		end
		else begin
			posC = posC + 1;
			case (posC) 
				0: begin
					pos   <= 4'b0001;
					dataP <= dataBus1;
				end
				1: begin
					pos   <= 4'b0010;
					dataP <= dataBus2;            
				end
				2: begin
					pos   <= 4'b0100;
					dataP <= dataBus3;
				end
				3: begin
					pos   <= 4'b1000;
					dataP <= dataBus4;
				end
			endcase
		end
	end
   
	
	always @(posC)
	begin
		case (dataP)
			0: seg = 8'b0011_1111;
			1: seg = 8'b0000_0110;
			2: seg = 8'b0101_1011;
			3: seg = 8'b0100_1111;
			4: seg = 8'b0110_0110;
			5: seg = 8'b0110_1101;
			6: seg = 8'b0111_1101;
			7: seg = 8'b0000_0111;
			8: seg = 8'b0111_1111;
			9: seg = 8'b0110_1111;
			10:seg = 8'b0111_0111;
			11:seg = 8'b0011_1001;
			default: seg = 8'b0000_1000;
		endcase
		
	end
endmodule