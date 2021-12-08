`timescale 1ns / 1ps

module CatchPress(input clk190hz, input press, output signal);
    reg[5:0] delay;
    
    always @(posedge clk190hz)
    begin
        delay[5] <= delay[4];
        delay[4] <= delay[3];
        delay[3] <= delay[2];
        delay[2] <= delay[1]; 
        delay[1] <= delay[0];  
        delay[0] <= press;
    end
    
    assign signal = delay[0] & delay[1] & delay[2] & delay[3] & delay[4] & delay[5];
endmodule
