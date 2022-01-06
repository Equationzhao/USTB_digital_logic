`timescale 1ns / 1ps

module segMsg1(
    input clk190hz,
    input rst,
    input sel,
    input [3:0] mid1,
    input [3:0] mid2,
    output reg [3:0] pos,
    output reg [7:0] seg
);

    wire [15:0] dataBus;
    reg [1:0] posC;
    reg [3:0] dataP;
    reg [15:0] totalNum;

    reg rst_delay = 0;
    reg sel_delay = 0;

    //* flag (isChanged)
    reg [3:0] mid1_previous, mid2_previous;

    assign dataBus = mid1 * mid2; //* calculate

    always @(posedge clk190hz) begin
        if(mid1!=mid1_previous||mid2!=mid2_previous) begin
            rst_delay = 0;
            sel_delay = 0;
            mid1_previous<=mid1;
            mid2_previous<=mid2;
        end
        if (rst||rst_delay) begin
            totalNum=0;
            pos   = 4'b1111;
            posC  = 0;
            dataP = 0;
            rst_delay=1;
        end
        else if(sel||sel_delay) begin
            if (sel_delay == 0) begin
                totalNum = totalNum + dataBus;
                sel_delay = 1;
            end
            case (posC)
                0: begin
                    pos   <= 4'b0001;
                    dataP <= totalNum%10;
                end
                1: begin
                    pos   <= 4'b0010;
                    dataP <= (totalNum/10)%10;   
                end
                2: begin
                    pos   <= 4'b0100;
                    dataP <= (totalNum/100)%10;
                end
                3: begin
                    pos   <= 4'b1000;
                    dataP <= (totalNum/1000)%10;
                end
            endcase
            posC = posC + 1;
        end
        else begin
            case (posC)
                0: begin
                    pos   <= 4'b0001;
                    dataP <= dataBus%10;
                end
                1: begin
                    pos   <= 4'b0010;
                    dataP <= (dataBus/10)%10;   
                end
                2: begin
                    pos   <= 4'b0100;
                    dataP <= (dataBus/100)%10;
                end
                3: begin
                    pos   <= 4'b1000;
                    dataP <= (dataBus/1000)%10;
                end
            endcase
            posC = posC + 1;
        end
    end
    

    // Drive display
    always @(dataP)
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
            10:seg = 8'b0100_0000;
            11:seg = 8'b0000_0000;
            default: seg = 8'b0000_1000;
        endcase
endmodule
