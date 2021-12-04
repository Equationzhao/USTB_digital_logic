module top_module (

    input in1,

    input in2,

    input in3,

    output out
);

// in1 同或 in2
// 异或 in3

assign temp = in1 ^ in2;
assign out = temp ~^ in3;

endmodule

