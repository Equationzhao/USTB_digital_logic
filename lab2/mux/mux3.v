module mux3(
    input wire [1:0] d,
    input wire a,
    output reg y
);
always@(*)
begin
    if(a == 1'b1)
        y = d[0];
    else
        y = d[1];
end
endmodule