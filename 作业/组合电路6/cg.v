module top_module (

        input [2:0] a,

        output [15:0] q ); 

reg [15:0] t;
always @(*)
    case(a)
        0:t=16'h1232;
        1:t=16'haee0;
        2:t=16'h27d4;
        3:t=16'h5a0e;
        4:t=16'h2066;
        5:t=16'h64ce;
        6:t=16'hc526;
        7:t=16'h2f19;
    endcase
assign q = t;
endmodule