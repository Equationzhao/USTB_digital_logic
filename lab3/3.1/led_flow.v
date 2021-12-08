`timescale 1ns / 1ps

// 学号中的8个数字存储在一个32位的寄存器msgArray中，每4位存放一个十进制数字；
module led_flow (

);
    // 42024137
    reg [31:0] msgArray;
    initial begin
        msgArray = 32'd42024137;     
    end
   /*
        用频率为3Hz的时钟控制7段数码循环显示：
        在时钟的上升沿进行向左循环移动4位，并显示。
        注意：记得要把msgArray中的内容，即msgArray [31:28]的内容移到msgArray [3:0]中。 
   */
   always @(posedge ) begin
		msgArray <= {msgArray[2 : 0], msgArray[3]};
   end 

endmodule
