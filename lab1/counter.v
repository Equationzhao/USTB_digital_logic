
module counter(
    input clk,
    input rst,
    output clk_bps
);    
    //  定义两个14位的寄存器    
    reg [13:0] count_first,count_second;

     
    always @(posedge clk or posedge rst) 
            if (rst) //reset
                count_first <= 14'd0; //阻塞赋值
            else if (count_first==14'd10000) //计数到10000
                count_first <= 14'd0; //阻塞赋值 进位
            else
                count_first <= count_first + 1'b1; //计数器加1

    always @(posedge clk or posedge rst)
            if (rst) //reset
                count_second <= 14'd0; 
            else if (count_second==14'd10000) //计数到10000
                count_second <= 14'd0; //置零
            else if (count_first==14'd10000) 
                count_second <= count_second + 1'b1; //计数器加1
            assign clk_bps = count_second == 14'd10000 ? 1'b1 : 1'b0; //输出
endmodule
// 1000*1000