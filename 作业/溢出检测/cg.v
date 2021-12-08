module top_module (

                input [7:0] a,

                input [7:0] b,

                output [7:0] s,

                output overflow

        ); 

wire x,y,c,d,e,f,g,h;
add1 A1_1(a[0],b[0],0,s[0],x);
add1 A1_2(a[1],b[1],x,s[1],y);
add1 A1_3(a[2],b[2],y,s[2],c);
add1 A1_4(a[3],b[3],c,s[3],d);
add1 A1_5(a[4],b[4],d,s[4],e);
add1 A1_6(a[5],b[5],e,s[5],f);
add1 A1_7(a[6],b[6],f,s[6],g);
add1 A1_8(a[7],b[7],g,s[7],h);
//assign s[7] = g;
reg t;
/*
always @(*)
    begin
        if(a[7]==0&b[7]==0)
            t = 0;
        else if((a[7]==1&b[7]==1))
            t = 1;
        else if((a[7]==1|b[7]==1)&((a[6]==1&b[6]==1)|(a[6]==1&g==1)|(b[6]==1&g==1)))
        t = 1;
    end
    assign overflow = t;
*/

assign x = a[0]&b[0];
assign y = x&a[1]|x&b[1]|a[1]&b[1];
assign c = y&a[2]|y&b[2]|a[2]&b[2];
assign d = c&a[3]|c&b[3]|a[3]&b[3];
assign e = d&a[4]|d&b[4]|a[4]&b[4];
assign f = e&a[5]|e&b[5]|a[5]&b[5];
assign g = f&a[6]|f&b[6]|a[6]&b[6];
//assign h = g&a[7]|g&b[7]|a[7]&b[7];
/*
reg a1;
always @(*)
    begin
        if(a[7]==1&b[7]==1)
            a1 = g;
        else
            a1 = g&~a[7]&~b[7];
    end
assign overflow = a1;
*/
assign overflow = (a[7]&b[7]|a[7]&g|b[7]&g)^g;

endmodule


//基层一位加法器
module add1(
    input a,input b,input cin,output sum,output cout
);
assign sum = (a&b&cin)|(~a&~b&cin)|(a&~b&~cin)|(~a&b&~cin);//1位加法器求和
assign cout = a&b|a&cin|b&cin;//1位加法器进位
endmodule
