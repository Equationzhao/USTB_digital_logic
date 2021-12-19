module top_module (
    input clk,
    input reset,
    output [3:0] q
);
    reg [3:0] count;

    always @(posedge clk )
            if (reset) //reset
                count <= 4'd1; 
            else if (count==4'd10) 
                count <= 4'd0; //置零 
            else 
                count <= count + 4'd1; //计数器加1

    assign q = count;  

endmodule