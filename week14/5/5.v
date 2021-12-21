/*
*    同步HDLC成帧涉及解码连续的数据流，用来寻找指示帧的开始和结束的比特流模式。
*    若看到6个连续的1（即，01111110）是指示帧边界的“标志”。
*    为避免数据流意外地包含“标志”，发送方在数据中每5个连续1之后插入一个0，接收方在接收的数据中会检测到这个0并丢弃。
*    因此，如果有7个或更多连续的1，说明是错误，需给出出错信号。
*
*    创建一个有限状态机来识别这三个序列：
*    0111110：需要丢弃一个0（disc=1）。
*    01111110：标记帧的开始/结束（flag=1）。
*    01111111 ...：错误（7或更多个1）（err_=1）。
*    当FSM复位时，它应处于前一个输入为0时的状态。
*/

module top_module(
    input clk,
    input reset,    // 高电平有效
    input in,
    output reg disc,
    output reg flag,
    output reg err
);
    parameter S0=0, S1=1, S2=2, S3=3, S4=4, S5=5, S6=6, discard=7, err_=8, flag_=9;
    reg [3:0] state,next_state;
    always @(posedge clk) begin
        if (reset) begin
            {disc,flag,err}=3'b000;
        end
        else begin
            case (state)
                S0:
                begin
                    if (in==1) begin
                        next_state = S1; 
                    end
                    else begin
                        next_state = S0; 
                end
            end
                S1:
                begin
                    if (in==1) begin
                        next_state = S2; 
                    end
                    else begin
                        next_state = S0;
                    end
                end
                S2:
                begin
                    if (in==1) begin
                        next_state = S3;  
                    end
                    else begin
                        next_state = S0;
                    end
                end
                S3:
                begin
                    if (in==1) begin
                        next_state = S4; 
                    end
                    else begin
                        next_state = S0;
                    end
                end
                S4:
                begin
                    if (in==1) begin
                        next_state = S5;
                    end
                    else begin
                        next_state = S0;
                    end
                end
                S5:
                begin
                    if (in==1) begin
                        next_state = S6; 
                    end
                    else begin
                        next_state = discard;  // discard 0
                    end
                end
                S6:
                begin
                    if (in==1) begin
                        next_state = err_;
                    end
                    else begin
                        next_state = flag_; 
                    end
                end
                discard:
                begin
                    if (in==1) begin
                        next_state = S1;
                    end
                    else begin
                        next_state = S0;
                    end
                end
                err_:
                begin
                    if (in==1) begin
                        next_state = err_;
                    end
                    else begin
                        next_state = S1;
                    end
                end
                flag_:
                begin
                    if (in==1) begin
                        next_state = S1;
                    end
                    else begin
                        next_state = S0;
                    end
                end
                default: next_state = S0;
            endcase
        end
    end

    always @(*) begin
        state <= next_state;
        case (state)
            S0:
                {disc,flag,err}=3'b000;
            S1:
                {disc,flag,err}=3'b000;
            S2:
                {disc,flag,err}=3'b000;
            S3:
                {disc,flag,err}=3'b000;
            S4:
                {disc,flag,err}=3'b000;
            S5:
                {disc,flag,err}=3'b000;
            S6:
                {disc,flag,err}=3'b000;
            discard:
                {disc,flag,err}=3'b100;
            err_:
                {disc,flag,err}=3'b001;
            flag_:
                {disc,flag,err}=3'b010;
        endcase
    end

endmodule
