module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output reg walk_left,
    output reg walk_right,
    output reg aaah,
    output reg digging 
); 
    parameter WL=0,WR=1,FL=2,FR=3,DL=4,DR=5,Splat = 6;
    reg [64:0]counter;
    reg [2:0]state,next;
    always @(*)
        case(state)
            WL: next = ground ? (dig ? DL: (bump_left?WR:WL)) : FL;
            WR: next = ground ? (dig ? DR: (bump_right?WL:WR)) : FR;
            FL: next = ground ? (counter>19? Splat : WL) : FL;
            FR: next = ground ? (counter>19? Splat : WR): FR;
            DL: next = ground ? DL : FL;
            DR: next = ground ? DR : FR;
            Splat:next = Splat;
        endcase
    always @(posedge clk or posedge areset)
        begin
        if(areset) state<=WL;
        else if  ( state==FL || state == FR )             
                          begin
                              state <= next;
                              counter = counter + 1;
                          end
 
        else begin 
            state <= next;  
            counter =0;
        end
        end
            
    always @(*)
        case(state)
            WL : {walk_left,walk_right,aaah,digging} = 4'b1000;
            WR : {walk_left,walk_right,aaah,digging} = 4'b0100;
            FL : {walk_left,walk_right,aaah,digging} = 4'b0010;
            FR : {walk_left,walk_right,aaah,digging} = 4'b0010;
            DL : {walk_left,walk_right,aaah,digging} = 4'b0001;
            DR : {walk_left,walk_right,aaah,digging} = 4'b0001;
            Splat: {walk_left,walk_right,aaah,digging} = 4'b0000;  
        endcase 
    
endmodule