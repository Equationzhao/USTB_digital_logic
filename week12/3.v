module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire cout1,cout2,cout3;
    wire [15:0] sumbuff1,sumbuff2;
    add16 instance1(a[15:0],b[15:0],0,sum[15:0],cout1);
    add16 instance2(a[31:16],b[31:16],0,sumbuff1,cout2);
    add16 instance3(a[31:16],b[31:16],1,sumbuff2,cout3);
    assign sum[31:16] = cout1 ? sumbuff2:sumbuff1;
endmodule
