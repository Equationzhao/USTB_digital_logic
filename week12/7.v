module top_module (
    input clk,
    input d, 
    input ar,   // asynchronous reset
    output reg q
);
    wire out1,out2;
    always @(posedge clk or posedge ar) begin
        if(ar == 1) begin
            q <= 0;
        end
        else if(!ar) begin
            q <= d;
        end
    end
endmodule