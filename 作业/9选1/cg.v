module top_module( 

                input [15:0] a, b, c, d, e, f, g, h, i,

                input [3:0] sel,

                output [15:0] out );


reg [15:0] tout;
wire [15:0] x = 1;
always @(*)
    if(sel==0)
        tout[15:0]=a[15:0];
    else if(sel==1)
        tout[15:0]=b[15:0];
    else if(sel==2)
        tout[15:0]=c[15:0];
    else if(sel==3)
        tout[15:0]=d[15:0];
    else if(sel==4)
        tout[15:0]=e[15:0];
    else if(sel==5)
        tout[15:0]=f[15:0];
    else if(sel==6)
        tout[15:0]=g[15:0];
    else if(sel==7)
        tout[15:0]=h[15:0];
    else if(sel==8)
        tout[15:0]=i[15:0];
    else
        tout[15:0]=16'hffff;

assign out[15:0] = tout;

endmodule
