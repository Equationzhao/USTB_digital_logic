`timescale 1ns / 1ps
//* 消抖
module press(
    input clk190hz,
    input press, 
    output signal
);

    reg[5:0] de;
    
    always @(posedge clk190hz)
    begin
        de[5] <= de[4];
        de[4] <= de[3];
        de[3] <= de[2];
        de[2] <= de[1]; 
        de[1] <= de[0];  
        de[0] <= press;
    end
    
    assign signal = de[0] & de[1] & de[2] & de[3] & de[4] & de[5];
endmodule
