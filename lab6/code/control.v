`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 

// Module Name: control
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description:  
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module control(
input clk,
input clk2,
input clr,
input liftGoUp,
input liftGoDown,
input openDoor,
output  reg[1:0]floor,
output reg direction,
output run1,
output [3:0] state1
    );
 
    reg [3:0] present_state=0,next_state=0;
    reg [1:0]run=0;
    assign run1=run[0];
    assign state1=present_state;
    reg [3:0] canrun=4'b0000;
    parameter S0=4'b0000,S1=4'b0001,S2=4'b0010,S3=4'b0011,S4=4'b0100,S5=4'b0101,S6=4'b0110,S7=4'b0111,S8=4'b1000,S9=4'b1001;
    always@( negedge clk2 )
    begin
    if(run==2'b01)
    begin
    if(canrun<4'b1110)
      canrun=canrun+1;
    else 
      canrun=4'b0000;
    end
    else 
    canrun=4'b0000;
    end
     always@(posedge clk or posedge clr)
       begin
        if(clr==1)
        present_state<=S0;
        else  if((1))
        present_state<=next_state;
        end
    always@(*)
    //if(openDoor==0)
    begin
    case(present_state)
    S0:if(openDoor)
        next_state<=S0;
        else  if(liftGoUp)
        next_state<=S1;
        else 
        next_state<=S0;
    S1: if(openDoor)
        next_state<=S0;
        else
        if(run==2'b10)
        next_state<=S2;
    S2:if(openDoor)
        next_state<=S2;
        else
       if(liftGoUp)
        next_state<=S4;
        else if(liftGoDown)
        next_state<=S3;
        else next_state<=S2;
    S3:if(openDoor)
                next_state<=S2;
                else if(run==2'b10) next_state<=S0;
    S4:if(openDoor)
                                next_state<=S2;
                                else if(run==2'b10)next_state<=S5;
    S5:
    if(openDoor)
                                    next_state<=S5;
                                    else if(liftGoUp)
       next_state<=S7;
    else if(liftGoDown)
       next_state<=S6;
    else next_state<=S5;
    S6:if(openDoor)
                                    next_state<=S5;
                                    else
    if(run==2'b10)next_state<=S2;
    S7:if(openDoor)
                                    next_state<=S5;
                                    else
    if(run==2'b10)next_state<=S8;
    S8:if(openDoor)
                                    next_state<=S8;
                                    else 
    if(liftGoDown)
         next_state<=S9;
     else next_state<=S8;
    S9:if(openDoor)
                                     next_state<=S8;
                                     else
    if(run==2'b10)next_state<=S5;
    default:next_state<=S0;
    endcase 
    end
    always@(*)
    begin
    if(run==1)
    begin
    if(canrun==4'b1100)
    run=2'b10;
    end
    else
    if(1)//&&(run==0||run==2'b10))
    begin
    case(present_state)
    S0:
    begin
    floor=2'b00;
    direction=0;
    run=0;
    end
    S1:
    begin
    run=1;
    direction=0;
    floor=2'b00;
    end
    S2:
    begin
    floor=2'b01;
    run=0;
    end
    S3:
    begin
    run=1;
    direction=1; 
    floor=2'b01;
    end
    S4:
    begin
    run=1;
    direction=0;
     floor=2'b01;
    end
    S5:
    begin
    run=0;
    floor=2'b10;
    end
    S6:
    begin
    run=1;
    direction=1;
     floor=2'b10;
    end
    S7:
    begin
    run=1;
    direction=0;
     floor=2'b10;
    end
    S8:
    begin
    run=0;
    floor=2'b11;
    direction=0;
    end
    S9:
    begin
    run=1;
    direction=0;
     floor=2'b11;
    end
    endcase
    end
    end
endmodule
