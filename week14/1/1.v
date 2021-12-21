/*
*    旅鼠是一种头脑简单的动物，非常简单,这里将用一个有限状态机对它进行建模.
*    在旅鼠的二维世界中,旅鼠可以处于两种状态之一：靠左行走或靠右行走.如果碰到障碍物,它会改变方向.
*    比如：如果一只旅鼠在左边撞了墙,它就会靠右走.如果它撞到右边的石头,它就会靠左走.如果它在两侧同时发生碰撞,它仍然会改变当前方向.
*    实现一个摩尔状态机来模拟旅鼠的行为：
*        异步复位（高电平有效）到靠左走，
*        左右是否发生碰撞为状态机的输入(bump_left,bump_right)，
*        靠左走或靠右走为状态机的输出(walk_left,walk_right).
*/

module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right
);

    reg walk_left_reg=1, walk_right_reg=0;
    always @(posedge clk) begin
        if (areset) begin
            walk_left_reg  <= 1'b1;
            walk_right_reg <= 1'b0;
        end else begin
            if (bump_left + bump_right == 1)begin
                    if (bump_left == 1) begin
                        walk_left_reg  = 0;
                        walk_right_reg = 1;
                    end
                    else begin
                        walk_left_reg  = 1;
                        walk_right_reg = 0;
                    end
            end
            else if (bump_left+bump_right == 2)begin
                    if (walk_left_reg == 1) begin
                        walk_left_reg = 0;
                        walk_right_reg = 1;
                    end
                    else begin
                        walk_left_reg = 1;
                        walk_right_reg = 0;
                    end
            end
        end
    end

    assign walk_left  = walk_left_reg;
    assign walk_right = walk_right_reg;

endmodule