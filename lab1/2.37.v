
//多路选择器 2位
module f (
    x1,
    x2,
    s,
    f
);

input x1,x2,s;
output f;

not(k,s);
and(g,k,x1);
and(h,s,x2);
or(f,g,h);


endmodule
