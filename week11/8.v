module top_module();
wire out;
reg [1:0] in;

initial begin
    in = 2'b00; #10;
    in = 2'b01; #10;
    in = 2'b10; #10;
    in = 2'b11; #10;
end

andgate a(.in(in), .out(out));

endmodule