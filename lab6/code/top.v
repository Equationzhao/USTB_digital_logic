`timescale 1ns / 1ps
module top(
    input  [3:0] u, 
    input  [3:0] d, 
    input  [3:0] r, 
    input  clr, 
    input  clk100mhz, 
    output [3:0] pos, 
    output [7:0] seg, 
    output [3:0] uw, 
    output [3:0] dw, 
    output [3:0] rw, 
    output clrn
);

    assign clrn=clr;

    reg [1:0] floor = 0;
    wire clk190hz, clk12hz, clk1_5hz;
    wire liftGoUp, liftGoDown, openDoor;
    wire [1:0] floor2;
    wire run;
    wire direction;
    reg [3:0] floor1, status, door;
    wire [3:0] pstate;
    
    always@(posedge clk100mhz) begin
        floor = floor2;
        floor1 [1:0] = floor;
        if(direction == 0 && run == 1)
            status = 4'b0001;
        else if(direction == 1 && run == 1)
            status = 4'b0010;
        else
            status = 4'b0000;
        if(openDoor == 1)
            door = 4'b0001;
        else door = 4'b0000;
    end

    clkDiv  U1(clk100mhz, clk190hz, clk12hz, clk1_5hz);

    solve   U2(clk190hz, clk1_5hz, run, u, d, r, floor, direction, clr, liftGoUp, liftGoDown, openDoor, uw, dw, rw);
    control U3(clk12hz, clk12hz, clr, liftGoUp, liftGoDown, openDoor, floor2, direction, run, pstate);

    segMsg  U4(clk190hz, floor1, status, pstate, door, pos, seg);
endmodule
