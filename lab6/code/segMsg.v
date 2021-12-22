`timescale 1ns / 1ps

module segMsg(
        input clk190hz,
        input[3:0] floor,
        input[3:0] status,
        input[3:0] pstate,
        input[3:0] door,
        output reg [3:0]pos,
        output reg[7:0]seg
);

    reg [1:0]posc;
    reg [3:0]data;
    
    initial begin
        posc=0;
        data=0;
    end

    always@(posedge clk190hz) begin
        case(posc)
            0:
                begin
                pos<=4'b1000;
                data<=floor[3:0];
                end
            1:
                begin
                pos<=4'b0100;
                data<=status[3:0];
                end
            2:
                begin
                pos<=4'b0010;
                data<=pstate[3:0];
                end
            3:
                begin
                pos<=4'b0001;
                data<=door[3:0];
                end
        endcase
        posc<=posc+1;
    end

    always@(data) begin
        case(data)
            0 :seg=8'b0011_1111;
            1 :seg=8'b0000_0110;
            2 :seg=8'b0101_1011;
            3 :seg=8'b0100_1111;
            4 :seg=8'b0110_0110;
            5 :seg=8'b0110_1101;
            6 :seg=8'b0111_1101;
            7 :seg=8'b0000_0111;
            8 :seg=8'b0111_1111;
            9 :seg=8'b0110_1111;
            10:seg=8'b0000_0001;
            11:seg=8'b0000_1000;
            default: seg=8'b0100_0000;
        endcase
    end
endmodule
