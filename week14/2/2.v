/*
*   除了靠左和靠右走,如果地面消失了旅鼠会下落并大喊aaah!.
*   当地面消失时（ground=0）,旅鼠会下坠并说“aaah！”.当地面重新出现(ground=1)时,旅鼠将恢复为坠落前相同的方向行走.下落过程中撞击无效,与地面消失同一周期被撞击(但尚未坠落)、或落地同一周期被撞击,不影响行走方向.
*   具体时序见波形图.
*   建立一个模拟这种行为的有限状态机.
*/

module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output reg walk_right,
    output reg walk_left,
    output reg aaah 
);

    reg [1:0]state,next_state;
    parameter WL=0,WR=1,FL=2,FR=3;
    always @(*) begin
        case(state)
            WL: next_state = ground? ( bump_left ? WR:WL):FL;
            WR: next_state = ground? ( bump_right? WL:WR):FR;
            FL: next_state = ground? WL : FL;
            FR: next_state = ground? WR : FR;
        endcase
    end

    always @(posedge clk or posedge areset)begin
        if(areset) state <= WL;
        else state <= next_state;
    end

    always @(*) begin
        case(state)
            WL:  {walk_left,walk_right,aaah}=3'b100;
            WR:  {walk_left,walk_right,aaah}=3'b010;
            FL:  {walk_left,walk_right,aaah}=3'b001;
            FR:  {walk_left,walk_right,aaah}=3'b001;
        endcase
    end 
            
endmodule