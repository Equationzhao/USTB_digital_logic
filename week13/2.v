/**
        设计一个具有以下输入输出的Counter:
        1-12循环计数
        高电平有效同步复位信号reset，将计数器输出重置为1；
        当enable为高电平时Counter进行计数工作
        时钟信号上升沿触发
        Q[3:0] 为counter的输出
**/

module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q
);
    reg [3:0] count;
    always @(posedge clk) begin
        if (reset == 1) begin
            count = 1;
        end
        else if (enable == 1) begin
            if (count == 12) begin
                count = 1;
            end
            else begin
                count = count + 1;
            end
        end

    end

    assign Q = count;

endmodule