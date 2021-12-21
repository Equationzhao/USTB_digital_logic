
module top_module(
    input clk,
    input reset,    // 高电平有效
    input in,
    output reg disc,
    output reg flag,
    output reg err
);
    parameter S0=0, S1=1, S2=2, S3=3, S4=4, S5=5, S6=6, S7=7, S8=8, discard=9, err=10, flag=11;
    reg [3:0] state,next_state;
    always @(posedge clk) begin
        if (reset) begin
            {disc,flag,err}=3'b000;
        end
        else begin
            case (state)
                S0:
                if (in==0) begin
                    next_state = S1; 
                end
                else begin
                    next_state = S0; 
                end
                S1:
                    if (in==1) begin
                        next_state = S2; 
                    end
                    else begin
                        next_state = S0;
                    end
                S2:
                    if (in==1) begin
                        next_state = S3;  
                    end
                    else begin
                        next_state = S0;
                    end
                S3:
                    if (in==1) begin
                        next_state = S4; 
                    end
                    else begin
                        next_state = S0;
                    end
                S4:
                    if (in==1) begin
                        next_state = S5;
                    end
                    else begin
                        next_state = S0;
                    end
                S5:
                    if (in==1) begin
                        next_state = S6; 
                    end
                    else begin
                        next_state = S0;
                    end
                S6:
                    if (in==1) begin
                        next_state = S7;
                    end
                    else begin
                        next_state = discard; // discard 0
                    end
                discard:
                    if (in==1) begin
                        next_state = S1;
                    end
                    else begin
                        next_state = S0;
                    end
                S7:
                    if (in==1) begin 
                        next_state = err;    // error
                    end
                    else begin
                        next_state = flag;   // flag 
                    end
                err:
                    if (in==1) begin
                        next_state = err;
                    end
                    else begin
                        next_state = S1;
                    end
                flag:
                    if (in==1) begin
                        next_state = S2;
                    end
                    else begin
                        next_state = S1;
                    end
                S8:
                    if (in==0) begin
                        next_state = S1;     // to S1
                    end
                    else begin
                        next_state = S0;     // to S2                    
                    end
                default: next_state = S0;
            endcase
        end
    end

    always @(*) begin
        state = next_state;
        case (state) begin\
            S0:
                {disc,flag,error}=3'b000;
            S1:
                {disc,flag,error}=3'b000;
            S2:
                {disc,flag,error}=3'b000;
            S3:
                {disc,flag,error}=3'b000;
            S4:
                {disc,flag,error}=3'b000;
            S5:
                {disc,flag,error}=3'b000;
            S6:
                {disc,flag,error}=3'b000;
            discard:
                {disc,flag,error}=3'b100;
            S7:
                {disc,flag,error}=3'b000;
            err:
                {disc,flag,error}=3'b001;
            flag:
                {disc,flag,error}=3'b010;
            S8:
                {disc,flag,error}=3'b000;
        end
    end

endmodule