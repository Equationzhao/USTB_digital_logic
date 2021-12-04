module mux4bit2to1(
    input [3:0] a,
    input [3:0] b,
    input s,
    output [3:0]y 
);
   
    reg [3:0] o;
    always @(*)begin
        if (s)begin
            o = a;
        end else begin
            o = b;
        end
    end
    assign y = o;
 

endmodule