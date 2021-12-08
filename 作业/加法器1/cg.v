module top_module(

                input [31:0] a,

                input [31:0] b,

                output [31:0] sum

        );


wire x,y;
add16 A(a[15:0],b[15:0],0,sum[15:0],x);
add16 B(a[31:16],b[31:16],x,sum[31:16],y);


endmodule
/*
   module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );
   endmodule
   */