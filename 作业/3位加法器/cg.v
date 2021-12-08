module top_module( 

                input [2:0] a, b,

                input cin,

                output [2:0] cout,

                output [2:0] sum );

assign sum = a+b+cin;
assign cout = (a&b)|(b&cin)|(a&cin);
endmodule