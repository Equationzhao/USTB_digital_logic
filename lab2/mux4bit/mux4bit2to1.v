module mux4bit2to1(
    input [3:0] a,
    input [3:0] b,
    input s,
    output [3:0]y 
);

    
    assign y = s==1 ? a : b;
   

    

endmodule