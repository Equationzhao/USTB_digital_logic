`timescale 1ns / 1ps

module read(
    input clk190hz,
    input rst,
    input sel,
////////////////////////////////////////////////////////////////
    input but1,
    input but2,
    input but3,
    input but4,
////////////////////////////////////////////////////////////////
    input but5,
    input but6,
    input but7,
    input but8,
////////////////////////////////////////////////////////////////
    output [3:0] pos,
    output [7:0] seg
);

    wire [3:0] mid1,mid2;
    reg  [3:0] dataBus1, dataBus2, dataBus3, dataBus4;

    assign mid1 = {but4,but3,but2,but1};
    assign mid2 = {but8,but7,but6,but5};

    always @(posedge clk190hz) begin
        case(mid1)
            4'b0000:
                dataBus1 = 4'b0000;
                dataBus2 = 4'b0000;
            4'b0001:
                dataBus1 = 4'b0001;
                dataBus2 = 4'b0000;
            4'b0010:
                dataBus1 = 4'b0010;
                dataBus2 = 4'b0000;
            4'b0011:
                dataBus1 = 4'b0011;
                dataBus2 = 4'b0000;
            4'b0100:
                dataBus1 = 4'b0100;
                dataBus2 = 4'b0000;
            4'b0101:
                dataBus1 = 4'b0101;
                dataBus2 = 4'b0000;
            4'b0110:
                dataBus1 = 4'b0110;
                dataBus2 = 4'b0000;
            4'b0111:
                dataBus1 = 4'b0111;
                dataBus2 = 4'b0000;
            4'b1000:
                dataBus1 = 4'b1000;
                dataBus2 = 4'b0000;
            4'b1001:
                dataBus1 = 4'b1001;
                dataBus2 = 4'b0000;
            4'b1010:
                dataBus1 = 4'b0000;
                dataBus2 = 4'b0001;
            4'b1011:
                dataBus1 = 4'b0001;
                dataBus2 = 4'b0001;
            4'b1100:
                dataBus1 = 4'b0010;
                dataBus2 = 4'b0001;
            4'b1101:
                dataBus1 = 4'b0011;
                dataBus2 = 4'b0001;
            4'b1110:
                dataBus1 = 4'b0100;
                dataBus2 = 4'b0001;
            4'b1111:
                dataBus1 = 4'b0101;
                dataBus2 = 4'b0001;
        endcase
        case(mid2)
            4'b0000:
                dataBus3 = 4'b0000;
                dataBus4 = 4'b0000;
            4'b0001:
                dataBus3 = 4'b0001;
                dataBus4 = 4'b0000;
            4'b0010:
                dataBus3 = 4'b0010;
                dataBus4 = 4'b0000;
            4'b0011:
                dataBus3 = 4'b0011;
                dataBus4 = 4'b0000;
            4'b0100:
                dataBus3 = 4'b0100;
                dataBus4 = 4'b0000;
            4'b0101:
                dataBus3 = 4'b0101;
                dataBus4 = 4'b0000;
            4'b0110:
                dataBus3 = 4'b0110;
                dataBus4 = 4'b0000;
            4'b0111:
                dataBus3 = 4'b0111;
                dataBus4 = 4'b0000;
            4'b1000:
                dataBus3 = 4'b1000;
                dataBus4 = 4'b0000;
            4'b1001:
                dataBus3 = 4'b1001;
                dataBus4 = 4'b0000;
            4'b1010:
                dataBus3 = 4'b0000;
                dataBus4 = 4'b0001;
            4'b1011:
                dataBus3 = 4'b0001;
                dataBus4 = 4'b0001;
            4'b1100:
                dataBus3 = 4'b0010;
                dataBus4 = 4'b0001;
            4'b1101:
                dataBus3 = 4'b0011;
                dataBus4 = 4'b0001;
            4'b1110:
                dataBus3 = 4'b0100;
                dataBus4 = 4'b0001;
            4'b1111:
                dataBus3 = 4'b0101;
                dataBus4 = 4'b0001;
        endcase
    end
   
    segMsg2 u(clk190hz, rst, sel, dataBus1, dataBus2, dataBus3, dataBus4, pos, seg);
endmodule
