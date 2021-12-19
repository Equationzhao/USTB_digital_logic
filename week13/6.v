//  实现如下简单摩尔状态机:

module top_module(
	input clk,
	input areset,    // Asynchronous reset to state B
	input in,
	output out
);
	reg out_reg = 1;
	parameter S0 = 0, S1 = 1;

	reg state;
	always @(posedge clk) begin
		if (areset == 1) begin
			out_reg <= 1;	
			state <= S0;
		end
		else begin
			if (state == S0) begin
				if (in == 1) begin
					state <= S0;
					out_reg <= 1; 
				end
				else begin
					state <= S1;
					out_reg <= 0; 
				end
			end
			else if (state == S1) begin
				
				if (in == 1) begin
					state <= S1;
					out_reg <= 0;
				end
				else begin
					state <= S0;
					out_reg <= 1; 
				end
			end
		end
	end
	assign out = out_reg;

endmodule