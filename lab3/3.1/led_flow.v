`timescale 1ns / 1ps

// ѧ���е�8�����ִ洢��һ��32λ�ļĴ���msgArray�У�ÿ4λ���һ��ʮ�������֣�
module led_flow (

);
    // 42024137
    reg [31:0] msgArray;
    initial begin
        msgArray = 32'd42024137;     
    end
   /*
        ��Ƶ��Ϊ3Hz��ʱ�ӿ���7������ѭ����ʾ��
        ��ʱ�ӵ������ؽ�������ѭ���ƶ�4λ������ʾ��
        ע�⣺�ǵ�Ҫ��msgArray�е����ݣ���msgArray [31:28]�������Ƶ�msgArray [3:0]�С� 
   */
   always @(posedge ) begin
		msgArray <= {msgArray[2 : 0], msgArray[3]};
   end 

endmodule
