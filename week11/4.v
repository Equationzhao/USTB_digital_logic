module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min
);
    wire [7:0] result1,result2;
	assign result1 = a < b ? a : b;
    assign result2 = c < d ? c : d;
    assign min     = result1 < result2 ? result1 : result2;
endmodule

