module top_module (

        input [3:0] a,

        input [3:0] b,

        input [3:0] c,

        input [3:0] d,

        input [3:0] e,

        output [3:0] q );

reg [3:0] t;

always @(*)
    case(c)
        0:t=b;
        1:t=e;
        2:t=a;
        3:t=d;
    default:t=15;
    endcase

assign q[3:0] = t[3:0];

endmodule