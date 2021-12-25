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

    wire [3:0] mid1, mid2;
    reg  [3:0] dataBus1, dataBus2;  // weight and unit price
    reg  [3:0] dataBus3, dataBus4;  // weight and unit price

    assign mid1 = {but4,but3,but2,but1};
    assign mid2 = {but8,but7,but6,but5};

    //* convert `buts` to weight and unit price
    always @(posedge clk190hz)  begin
        case(mid1)
            4'b0000: begin
                dataBus1 = 4'b0000;
                dataBus2 = 4'b0000;
            end
            4'b0001: begin
                dataBus1 = 4'b0001;
                dataBus2 = 4'b0000;
            end
            4'b0010: begin
                dataBus1 = 4'b0010;
                dataBus2 = 4'b0000;
            end
            4'b0011: begin
                dataBus1 = 4'b0011;
                dataBus2 = 4'b0000;
            end
            4'b0100: begin
                dataBus1 = 4'b0100;
                dataBus2 = 4'b0000;
            end
            4'b0101: begin
                dataBus1 = 4'b0101;
                dataBus2 = 4'b0000;
            end
            4'b0110: begin
                dataBus1 = 4'b0110;
                dataBus2 = 4'b0000;
            end
            4'b0111: begin
                dataBus1 = 4'b0111;
                dataBus2 = 4'b0000;
            end
            4'b1000: begin
                dataBus1 = 4'b1000;
                dataBus2 = 4'b0000;
            end
            4'b1001: begin
                dataBus1 = 4'b1001;
                dataBus2 = 4'b0000;
            end
            4'b1010: begin
                dataBus1 = 4'b0000;
                dataBus2 = 4'b0001;
            end
            4'b1011: begin
                dataBus1 = 4'b0001;
                dataBus2 = 4'b0001;
            end
            4'b1100: begin
                dataBus1 = 4'b0010;
                dataBus2 = 4'b0001;
            end
            4'b1101: begin
                dataBus1 = 4'b0011;
                dataBus2 = 4'b0001;
            end
            4'b1110: begin
                dataBus1 = 4'b0100;
                dataBus2 = 4'b0001;
            end
            4'b1111: begin
                dataBus1 = 4'b0101;
                dataBus2 = 4'b0001;
            end
        endcase
        case(mid2)
            4'b0000: begin
                dataBus3 = 4'b0000;
                dataBus4 = 4'b0000;
            end
            4'b0001: begin
                dataBus3 = 4'b0001;
                dataBus4 = 4'b0000;
            end
            4'b0010: begin
                dataBus3 = 4'b0010;
                dataBus4 = 4'b0000;
            end
            4'b0011: begin
                dataBus3 = 4'b0011;
                dataBus4 = 4'b0000;
            end
            4'b0100: begin
                dataBus3 = 4'b0100;
                dataBus4 = 4'b0000;
            end
            4'b0101: begin
                dataBus3 = 4'b0101;
                dataBus4 = 4'b0000;
            end
            4'b0110: begin
                dataBus3 = 4'b0110;
                dataBus4 = 4'b0000;
            end
            4'b0111: begin
                dataBus3 = 4'b0111;
                dataBus4 = 4'b0000;
            end
            4'b1000: begin
                dataBus3 = 4'b1000;
                dataBus4 = 4'b0000;
            end
            4'b1001: begin
                dataBus3 = 4'b1001;
                dataBus4 = 4'b0000;
            end
            4'b1010: begin
                dataBus3 = 4'b0000;
                dataBus4 = 4'b0001;
            end
            4'b1011: begin
                dataBus3 = 4'b0001;
                dataBus4 = 4'b0001;
            end
            4'b1100: begin
                dataBus3 = 4'b0010;
                dataBus4 = 4'b0001;
            end
            4'b1101: begin
                dataBus3 = 4'b0011;
                dataBus4 = 4'b0001;
            end
            4'b1110: begin
                dataBus3 = 4'b0100;
                dataBus4 = 4'b0001;
            end
            4'b1111: begin
                dataBus3 = 4'b0101;
                dataBus4 = 4'b0001;
            end
        endcase
    end
   
    segMsg2 u(clk190hz, rst, sel, dataBus1, dataBus2, dataBus3, dataBus4, pos, seg);
endmodule
