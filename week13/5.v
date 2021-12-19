/*
*		构建一个时序电路，实现四位移位寄存器，也可用作递减计数器。
*		题目说明
*		reset为高电平有效的同步复位信号，将输出q复位为0；
*		当shift_ena为1时，输入数据data成为输出q的最低位，同时q从低位向高位移位，详见时序图；
*		当count_ena为1时，移位寄存器q中当前的数字递减计数，详见时序图。
*		假设不会同时使用shift_ena和count_ena，因此你不需要考虑哪种情况优先级最高。 
*/

module top_module (
	input clk,
	input reset,
	input shift_ena,
	input count_ena,
	input data,
	output [3:0] q
);
    reg [3:0] q_reg;
	always @(posedge clk) begin
		if(reset) begin 
			q_reg <= 0;
		end
		else begin
			if (shift_ena == 1) begin
                q_reg =  q_reg << 1;
				q_reg[0] = data;
			end

			if (count_ena == 1) begin
				q_reg = q_reg - 1;
			end
		end
	end

    assign q = q_reg;

endmodule
