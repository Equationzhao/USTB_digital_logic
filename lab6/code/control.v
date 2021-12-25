`timescale 1ns / 1ps
//* control state 
module control(
	input  clk,        // clk12hz
	input  clk2,       // clk12hz
	input  clr,        // clr
	input  liftGoUp,   // liftGoUp
	input  liftGoDown, // liftGoDown
	input  openDoor,   // openDoor
	output reg[1:0]floor,
	output reg direction,
	output run1,
	output [3:0] state1
);
	reg [3:0] present_state=0,next_state=0;

	//*		`run = 2'b01` means the elevator is going down,
	//*		`run = 2'b10` means the elevator is going up 
	//!     `run` SHOULD NOT BE 2'b00||2'b11
	reg [1:0] run=0; 

	assign run1=run[0];
	assign state1=present_state;
	reg [3:0] canrun=4'b0000;
	
	/*       
	*        When state = ?
	*           S0=StopAtFloor1
	*           S1=GoUpToFloor2
	*           S2=StopAtFloor2
	*           S3=GoDownToFloor1
	*           S4=GoUpToFloor3
	*           S5=StopAtFloor3
	*           S6=GoDownToFloor2
	*           S7=GoUpToFloor4
	*           S8=StopAtFloor4
	*           S9=GoDownToFloor
	*/
	parameter   S0=4'b0000,
				S1=4'b0001,
				S2=4'b0010,
				S3=4'b0011,
				S4=4'b0100,
				S5=4'b0101,
				S6=4'b0110,
				S7=4'b0111,
				S8=4'b1000,
				S9=4'b1001;


	always@( negedge clk2 ) begin
		if(run==2'b01) begin
			if(canrun<4'b1110)
				canrun=canrun+1;
			else
				canrun=4'b0000;
		end
		else 
			canrun=4'b0000;
	end
	
	//* clr
	always@(posedge clk or posedge clr) begin
		if(clr==1)
			present_state<=S0;
		else if((1))
			present_state<=next_state;
	end

	//* check fsm.png for detail 
	//* fsm *//
	always@(*) begin
	case(present_state)
		S0: 
		if(openDoor)
			next_state<=S0;
		else if(liftGoUp)
			next_state<=S1;
		else 
			next_state<=S0;
		S1: 
		if(openDoor)
			next_state<=S0;
		else if(run==2'b10)
			next_state<=S2;
		S2: 
		if(openDoor)
			next_state<=S2;
		else if(liftGoUp)
			next_state<=S4;
		else if(liftGoDown)
			next_state<=S3;
		else 
			next_state<=S2;
		S3: 
		if(openDoor)
			next_state<=S2;
		else if(run==2'b10) 
			next_state<=S0;
		S4: 
		if(openDoor)
			next_state<=S2;
		else if(run==2'b10)
			next_state<=S5;
		S5: 
		if(openDoor)
			next_state<=S5;
		else if(liftGoUp)
			next_state<=S7;
		else if(liftGoDown)
			next_state<=S6;
		else 
			next_state<=S5;
		S6: 
		if(openDoor)
			next_state<=S5;
		else if(run==2'b10)
			next_state<=S2;
		S7: 
		if(openDoor)
			next_state<=S5;
		else if(run==2'b10)
			next_state<=S8;
		S8: 
		if(openDoor)
			next_state<=S8;
		else if(liftGoDown)
			next_state<=S9;
		else 
			next_state<=S8;
		S9: 
		if(openDoor)
			next_state<=S8;
		else if(run==2'b10)
			next_state<=S5;
		default:next_state<=S0;
	endcase 
	end


	//* outputs *//
	always@(*) begin
		if(run==1) begin 
			if(canrun==4'b1100)
				run=2'b10;
		end
		else begin
			case(present_state)
				S0:begin
					floor=2'b00;
					direction=0;
					run=0;
				end
				S1: begin
					floor=2'b00;
					direction=0;
					run=1;
				end
				S2: begin
					floor=2'b01;
					direction=0; 
					run=0;
				end
				S3: begin
					floor=2'b01;
					direction=1; 
					run=1;
				end
				S4: begin
					floor=2'b01;
					direction=0;
					run=1;
				end
				S5: begin
					floor=2'b10;
					direction=0; 
					run=0;
				end
				S6: begin
					floor=2'b10;
					direction=1;
					run=1;
				end
				S7: begin
					floor=2'b10;
					direction=0;
					run=1;
				end
				S8: begin
					floor=2'b11;
					direction=0;
					run=0;
				end
				S9: begin
					floor=2'b11;
					direction=0;
					run=1;
				end
			endcase
		end
	end



endmodule
