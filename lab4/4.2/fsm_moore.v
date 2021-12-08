module seqdetea(
    input wire clk,
    input wire clr,
    input wire din,
    output reg dout
);
    reg [2:0] present_state, next_state;
    parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100;

    always @(posedge clk or posedge clr) begin
        if (clr == 1) begin
            present_state <= S0;
        end    
        else begin
            present_state <= next_state;
        end
    end

    always @(*) begin
        case (present_state)
            S0: if (din==1) begin
                next_state <= S1;
            end
            else begin
                next_state <= S0;
            end

            S1: if (din==1) begin
                next_state <= S2;
            end
            else begin
                next_state <= S0;
            end

            S2: if (din==0) begin
                next_state <= S3;
            end
            else begin
                next_state <= S2;
            end

            S3: if (din==1) begin
                next_state <= S4;
            end
            else begin
                next_state <= S0;
            end

            S4: if (din==0) begin
                next_state <= S0;
            end
            else begin
                next_state <= S2;
            end
        endcase
    end


    always @(*) begin
        if (present_state == S4) begin
           dout = 1;
        end 
        else begin
              dout = 0;
        end
    end

endmodule