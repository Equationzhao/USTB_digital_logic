 module top_module(

               input [31:0] a,

               input [31:0] b,

               input sub,

               output [31:0] result

       );


wire x,y;
wire[31:0] sub1 = {32{sub}};
wire[31:0] b1;
assign b1= b^sub1;

add16 A16_1(a[15:0],b1[15:0],sub,result[15:0],x);
add16 A16_2(a[31:16],b1[31:16],x,result[31:16],y);


endmodule

//module add16(input [15:0]a,b,input cin, output [15:0]sum, output cout);