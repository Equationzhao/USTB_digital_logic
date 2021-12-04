module segMsg (
    input ke1,key2,key3,key4,
    output reg [7:0] seg,
    output reg [3:0] pos
);
    
    wire [3:0] data = {key4,key3,key2,key1};

    always @(data)begin
        pos = 4'b0001;
        case (data)
            4'b0000: seg = 8'b0011_1111;
            4'b0001: seg = 8'b0000_0110;
            4'b0010: seg = 8'b0101_1011;
            4'b0011: seg = 8'b0100_1111;
            4'b0100: seg = 8'b0110_0110;
            4'b0101: seg = 8'b0110_1101;
            4'b0110: seg = 8'b0111_1101;
            4'b0111: seg = 8'b0000_0111;
            4'b1000: seg = 8'b0111_1111;
            4'b1001: seg = 8'b0110_1111;
            default: seg = 8'b0000_0000;
        endcase
    end

endmodule