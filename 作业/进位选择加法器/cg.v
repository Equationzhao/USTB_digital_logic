module top_module(

                input [31:0] a,

                input [31:0] b,

                output [31:0] sum

        );

wire out1,out2,out3;
wire[15:0] tout1,tout2;
add16 A16_1(a[15:0],b[15:0],0,sum[15:0],out1);
add16 A16_2(a[31:16],b[31:16],0,tout1[15:0],out2);
add16 A16_3(a[31:16],b[31:16],1,tout2[15:0],out3);
assign sum[31:16] = (out1<1)?(tout1):(tout2);


endmodule



//module add16(input [15:0]a,b,input cin, output [15:0]sum, output cout);
