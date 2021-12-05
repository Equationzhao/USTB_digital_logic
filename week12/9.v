module top_module (
    input clk,
    input w, R, E, L,
    output reg Q
);
    reg out1,out2;
    always @(posedge clk) begin
        case (E)
            1'b0: begin
                out1 = Q;
            end
            1'b1: begin
                out1 = w;
            end
        endcase
        case (L)
            1'b0: begin
                Q = out1;
            end
            1'b1: begin
                Q = R;
            end
        endcase
    end
endmodule