//一位多路选择器
module mux1 (
    input wire [1:0] d,
    input wire a,
    output wire y
);

    
    assign y = a == 1'b0 ? d[0]:d[1];

endmodule
