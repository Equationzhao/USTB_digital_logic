module top_module(
    input in,
    input [1:0] state,
    output [1:0] next_state,
    output out
);
    /*
    *        When State = A, output =0
    *            if in = 1, next state = A
    *            if in = 0, next_state = B
    *        When State = B, output = 0
    *            if in = 1, next state = C
    *            if in = 0, next state = B
    *        When State = C, output = 0
    *            if in = 1, next state = A
    *            if in = 0, next state = D
    *        When State = D, output = 1
    *            if in = 1, next state = C
    *            if in = 0, next state = B
    */

    reg out_reg = 0;

    parameter A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;

    always @(in or state) begin
        case (state)
            A: out_reg = 0;
            B: out_reg = 0;
            C: out_reg = 0;
            D: out_reg = 1;
        endcase
    end

    reg[1:0] next_state_reg = 2'b00;
    always @(in or state) begin
        case (state)
            A: if(in==0)begin
                next_state_reg <= A; 
            end
            else begin
                next_state_reg <= B;
            end
            B: if(in==0)begin
                next_state_reg <= C; 
            end
            else begin
                next_state_reg <= B;
            end
            C: if(in==0)begin
                next_state_reg <= A; 
            end
            else begin
                next_state_reg <= D;
            end
            D: if(in==0)begin
                next_state_reg <= C;
            end
            else begin
                next_state_reg <= B; 
            end
        endcase
    end

    assign out = out_reg;
    assign next_state = next_state_reg;

endmodule