module top_module (

                input [3:0] x,

                input [3:0] y, 

                output [4:0] sum);


wire a,b,c,d;
add1 A1_1(x[0],y[0],0,sum[0],a);
add1 A1_2(x[1],y[1],a,sum[1],b);
add1 A1_3(x[2],y[2],b,sum[2],c);
add1 A1_4(x[3],y[3],c,sum[3],d);
assign sum[4] = d;
endmodule

//基层一位加法器
module add1(
    input a,input b,input cin,output sum,output cout
);
assign sum = (a&b&cin)|(~a&~b&cin)|(a&~b&~cin)|(~a&b&~cin);//1位加法器求和
assign cout = a&b|a&cin|b&cin;//1位加法器进位
endmodule
