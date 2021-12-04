module mux2(
    input wire [1:0] d,
    input wire a,
    output wire y
);

not(na,a);
and(d0,d[0],na);
and(d1,d[1],a);
or(y,d0,d1);


endmodule