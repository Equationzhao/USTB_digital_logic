module top_module( 

                input [99:0] a, b,

                input sel,

                output [99:0] out);

assign out[99:0] = sel>0 ? b[99:0]:a[99:0];
endmodule