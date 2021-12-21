/*
*    除了行走和下落之外,有时还可以告诉旅鼠做一些有用的事情,比如挖洞(dig=1时开始挖洞).
*    如果一只旅鼠正在地面上行走(ground=1),它可以转换成挖掘状态直到到达端点(ground=0).
*    在那一点上,由于没有地面,它会掉下来(aaah!),然后当它再次落地后将继续沿着它原来的方向行走.
*    和坠落一样,在挖掘时被撞击没有效果,在坠落或没有地面时挖掘无效.
*    换言之,一个行尸走肉的旅鼠可能会跌落、dig或改变方向.
*    如果满足这些条件中的一个以上,则跌落的优先级高于dig,dig的优先级高于切换方向.具体时序见波形图.
*    扩展之前的有限状态机来模拟这种行为.
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
    parameter WalkingL=0,WalkingR=1,FallingL=2,FallingR=3,DiggingR=4,DiggingL=5;
    always @(*) begin
        case(state)
            WalkingL: 
                if (ground) begin
                    if (dig) begin
                        next_state <= DiggingL;
                    end
                    else if (bump_left) begin
                        next_state <= WalkingR;
                    end
                    else begin
                        next_state <= WalkingL;
                    end
                end 
                else begin
                    next_state <= FallingL;
                end
            WalkingR: 
                if (ground) begin
                    if (dig) begin
                        next_state <= DiggingR;
                    end
                    else if (bump_right) begin
                        next_state <= WalkingL;
                    end
                    else begin
                        next_state <= WalkingR;
                    end
                end 
                else begin  
                    next_state <= FallingR;
                end
            FallingL: 
                if (ground) begin
                    next_state <= WalkingL;
                end
                else begin
                    next_state <= FallingL; 
                end
            FallingR:
                if (ground) begin
                    next_state <= WalkingR;
                end
                else begin
                    next_state <= FallingR;
                end
            DiggingL: 
                if (!ground) begin
                    next_state <= FallingL;
                end
                else begin
                    next_state <= DiggingL;
                end
            DiggingR: 
                if (!ground) begin
                    next_state <= FallingR;
                end
                else begin
                    next_state <= DiggingR;
                end
        endcase
    end

    always @(posedge clk or posedge areset)begin
        if(areset) state <= WalkingL;
        else state <= next_state;
    end

    always @(*) begin
        case(state)
            WalkingL:  {walk_left,walk_right,aaah,digging}=4'b1000;
            WalkingR:  {walk_left,walk_right,aaah,digging}=4'b0100;
            FallingL:  {walk_left,walk_right,aaah,digging}=4'b0010;
            FallingR:  {walk_left,walk_right,aaah,digging}=4'b0010;
            DiggingL:  {walk_left,walk_right,aaah,digging}=4'b0001;
            DiggingR:  {walk_left,walk_right,aaah,digging}=4'b0001;
        endcase
    end 

endmodule