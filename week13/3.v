/*
    构建一个0-15的四位二进制计数器,reset是高电平有效的同步复位,将计数器输出复位为0。
*/

module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output [3:0] q
);
    reg [3:0] count;
    always @(posedge clk) begin
        if (reset) begin
            count <= 0;
        end 
        else begin
            if (count < 15) begin
                count <= count + 1;
            end 
            else begin
                count <= 0;
            end
        end    
    end

    assign q = count;

endmodule
