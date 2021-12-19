/*
*		构建一个64位算术移位寄存器（shifter）,具有同步load数据功能.这个shifter根据amount信号选择,可左右移1位或8位.
*		! 在算术右移时,若符号位(q[63])为1则需要复制位,而并非简单的逻辑右移.
*		算术左移与逻辑左移没有区别.
*		load: 寄存器载入数据(优先级最高)
*		ena: 决定是否发生位移
*		amount: 决定位移的方向
*		2'b00: 算术左移1位
*		2'b01: 算术左移8位
*		2'b10: 算术右移1位
*		2'b11: 算术右移8位
*		q: shifter的内容
*/

module top_module(
	input clk,
	input load,
	input ena,
	input [1:0] amount,
	input [63:0] data,
	output reg [63:0] q
);
	always @(posedge clk) begin
		if(load) 
        	q <= data;
        else begin
            if(ena)
                case(amount) 
                    2'b00:	q <= {q[62:0],1'b0};
                    2'b01:	q <= {q[55:0],8'b0};
                    2'b10:	q <= {q[63],q[63:1]};
                    2'b11:	q <= {{8{q[63]}},q[63:8]};
                    default:;
                endcase
            else
                q <= q;
        end
	end
	
endmodule