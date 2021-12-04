module mux4_1(
        input  wire [1:0] d1,d2,
        input  wire [1:0] a,
        output wire       y
    );
    
    reg[1:0] d;
    always @(*) begin
        if (a[0]) begin
          assign d = d1;
        end else begin
          assign d = d2;
        end 
    end 
    mux1 mux2_inst(.d(d),.a(a[1]),.y(y));
endmodule
