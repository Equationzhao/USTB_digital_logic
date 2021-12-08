module top_module(

                input [31:0] a,

                input [31:0] b,

                output [31:0] sum

        );


wire tempout,sky1;
//add1 A1_1()

add16 A16_2(a[15:0],b[15:0],0,sum[15:0],tempout);
add16 A16_1(a[31:16],b[31:16],tempout,sum[31:16],sky1);
endmodule


        module add1 ( 

                input a, 

                input b, 

                input c,   

                output sum, 

                output cout 

        );

assign sum = (a&b&c)|((~a)&(~b)&c)|((~a)&b&(~c))|(a&(~b)&(~c));
assign cout = (a&b)|(b&c)|(a&c);


endmodule


   //module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );endmodule
   