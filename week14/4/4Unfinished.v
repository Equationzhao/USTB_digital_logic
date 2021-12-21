/*
*    虽然旅鼠可以走路，坠落和挖掘，但旅鼠并不是无懈可击的。
*    如果一个旅鼠下降太久（大于等于20个时钟周期）然后击中地面，它会飞溅，并永远停止行走、下降或挖掘（即所有4个输出变为0）直到状态机被复位。
*    (注意旅鼠只会在击中地面时飞溅，不会在半空中飞溅)
*    扩展前面的有限状态机以模拟此行为
*    下降正好20个周期落地时，是可以存活的
*/

module top_module(
    input  clk,
    input  areset,    // FallingReshly brainwashed Lemmings walk left.
    input  bump_left,
    input  bump_right,
    input  ground,
    input  dig,
    output reg walk_left,
    output reg walk_right,
    output reg aaah, 
    output reg digging 
);

    reg [2:0]state,next_state;
    reg [64:0]count;
    parameter WalkingL=0,WalkingR=1,FallingL=2,FallingR=3,DiggingR=4,DiggingL=5,Dead=6;
    always @(*) begin
            case(state)
                WalkingL: 
                    if (ground) begin
                        if (dig) begin
                            next_state = DiggingL;
                        end
                        else if (bump_left) begin
                            next_state = WalkingR;
                        end
                        else begin
                            next_state = WalkingL;
                        end
                    end
                    else begin
                        next_state = FallingL;
                    end
                WalkingR: 
                    if (ground) begin
                        if (dig) begin
                            next_state = DiggingR;
                        end
                        else if (bump_right) begin
                            next_state = WalkingL;
                        end
                        else begin
                            next_state = WalkingR;
                        end
                    end 
                    else begin  
                        next_state = FallingR;
                    end
                FallingL: 
                    if (ground) begin
                        next_state = WalkingL;
                    end
                    else begin
                        if (count>20) begin
                            next_state = Dead;
                        end
                        else begin
                            next_state = FallingL; 
                        end
                    end
                FallingR:
                    if (ground) begin
                        next_state = WalkingR;
                    end
                    else begin
                        if (count>20) begin
                            next_state = Dead;
                        end
                        else begin
                            next_state = FallingR; 
                        end
                    end
                DiggingL: 
                    if (!ground) begin
                        next_state = FallingL;
                    end
                    else begin
                        next_state = DiggingL;
                    end
                DiggingR: 
                    if (!ground) begin
                        next_state = FallingR;
                    end
                    else begin
                        next_state = DiggingR;
                    end
                Dead:
                    next_state = Dead;
            endcase
    end

    always @(posedge clk or posedge areset)begin
        if(areset) begin
            state = WalkingL;
        end
        else begin
            if (state == FallingR || state == FallingL) begin
                state = next_state;
                count = count + 1; 
            end
            else begin
                state = next_state;
                count = 0;
            end
        end
    end



    always @(*) begin
        begin
            case(state)
                WalkingL:  {walk_left,walk_right,aaah,digging}=4'b1000;
                WalkingR:  {walk_left,walk_right,aaah,digging}=4'b0100;
                FallingL:  {walk_left,walk_right,aaah,digging}=4'b0010;
                FallingR:  {walk_left,walk_right,aaah,digging}=4'b0010;
                DiggingL:  {walk_left,walk_right,aaah,digging}=4'b0001;
                DiggingR:  {walk_left,walk_right,aaah,digging}=4'b0001;
                Dead:      {walk_left,walk_right,aaah,digging}=4'b0000;
            endcase
        end
    end 

endmodule
                
