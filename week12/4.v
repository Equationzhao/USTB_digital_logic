module top_module (
    input [3:0] in,
    output reg [1:0] pos  
);
    always @(*) begin
        case (in)
            0: pos <= 0;
            1: pos <= 0;
            2: pos <= 1;
            3: pos <= 0;
            4: pos <= 2;
            5: pos <= 0;
            6: pos <= 1;
            7: pos <= 0;
            8: pos <= 3;
            9: pos <= 0;
            10: pos <= 1;
            11: pos <= 0;
            12: pos <= 2;
            13: pos <= 0;
            14: pos <= 1;
            15: pos <= 0;
        endcase
    end

// 0  0000
// 1  0001
// 2  0010
// 3  0011
// 4  0100
// 5  0101
// 6  0110
// 7  0111
// 8  1000
// 9  1001
// 10 1010
// 11 1011
// 12 1100
// 13 1101
// 14 1110
// 15 1111

endmodule

