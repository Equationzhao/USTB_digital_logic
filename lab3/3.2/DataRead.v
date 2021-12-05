`timescale 1ns / 1ps

module DataReadService(
                input clk190hz,
                input rst,
                input sel,
                input leftMove,
                input rightMove,
                input inc,
                input dec,
                output [3:0] pos,
                output [7:0] seg,
                output [31:0] myID
                );
    
    reg [31:0] msgArray = 0;
    reg [2:0]  cursor   = 7;//7-0��Ӧ���ҵ������
    reg [15:0] dataBus;
    reg LeftMoveDelay   = 0;
    reg RightMoveDelay  = 0;
    reg IncreaseDelay   = 0;
    reg DecreaseDelay   = 0;
    assign myID = msgArray;
    
    always @(posedge clk190hz)
    begin
        if (!rst) begin
            msgArray  = 0;
            cursor    = 7;
            LeftMoveDelay  = 0;
            RightMoveDelay = 0;
            IncreaseDelay  = 0;
            DecreaseDelay  = 0;
        end
        else begin
            if (leftMove == 1 && LeftMoveDelay == 0) begin
                cursor = cursor + 1;// ����
            end
            else if (rightMove == 1 && RightMoveDelay == 0) begin 
                     cursor = cursor - 1;// ����
            end
            else if (inc == 1 && IncreaseDelay == 0) begin  // press increase 
                     msgArray = msgArray + (4'b0001 << (4*cursor));// ��һ
                 if (((msgArray >> (4*cursor)) & 4'b1111) == 10) // ȡ����ǰλ������ ��λ��ȡ����λ �����10 ����0
                       msgArray = msgArray - (4'b1010 << (4*cursor));
            end
            else if (dec == 1 && DecreaseDelay == 0) begin  // press decrease                    
                 if (((msgArray >> (4*cursor)) & 4'b1111) == 0) // ȡ����ǰλ������ ��λ��ȡ����λ �����0 ����9, �����һ
                       msgArray = msgArray + (4'b1001 << (4*cursor));
                 else  msgArray = msgArray - (4'b0001 << (4*cursor));// ��һ
            end

            LeftMoveDelay  = leftMove;
            RightMoveDelay = rightMove;
            IncreaseDelay  = inc;
            DecreaseDelay  = dec;
        end
         
        if (cursor<4) dataBus = msgArray[15:0]; // �ֶ�
        else dataBus = msgArray[31:16];         // ��ʾ
    end
    InputShowDriver u(clk190hz, rst,sel, dataBus, cursor[1:0], pos, seg);
endmodule
