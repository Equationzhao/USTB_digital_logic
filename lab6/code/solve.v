`timescale 1ns / 1ps

module solve(
	input  clk100mhz,
	input  clk,
	input  run,
	input  [3:0] up,
	input  [3:0] down,
	input  [3:0] request,
	input  [1:0] floor,
	input  direction,
	input  clr,
	output liftGoUp,
	output liftGoDown,
	output openDoor,
	output [3:0] uw,
	output [3:0] dw,
	output [3:0] rw
);

	reg hasUpRequest=0;
	reg hasDownRequest=0;
	reg open=0;
   
	assign liftGoUp=(!direction & hasUpRequest) | (direction & !hasDownRequest & hasUpRequest);
	assign liftGoDown=(!direction & !hasUpRequest & hasDownRequest) |(direction & hasDownRequest);
	assign openDoor=open;
	
	reg [3:0] u0;
	reg [3:0] d0;
	reg [3:0] r0;
	reg [3:0] us;
	reg [3:0] ds;
	reg [3:0] rs;
	reg [3:0] canopen;

	initial begin
		u0=4'b0000;
		d0=4'b0000;
		r0=4'b0000;
		us=4'b0000;
		ds=4'b0000;
		rs=4'b0000;
		canopen=4'b0000;
	end
	
	assign uw=us;
	assign dw=ds;
	assign rw=rs;
	
	always@(posedge clk)begin
		if(open==1) begin
			if(canopen<8)
				canopen=canopen+1;
			else
				canopen=8;
		end
		else
			canopen=0;
	end
   
	always@(posedge clk100mhz)
		if(clr)
		begin
		   us=0;
		   rs=0;
		   ds=0;
		   open=0;
		end
		else 
		begin 
		if(canopen==4'b1000&&open==1) begin
			open=0;
		end
		if(floor==0) begin
			if((us[0]==1||rs[0]==1)&&!run) begin
				us[0]=0;
				rs[0]=0;
				open=1;
			end
		end
		else if(floor==2'b01) begin
			if(!direction&&us[1]&&!run) begin
				us[1]=0;
				open=1;
			end
		else if(direction&&!hasDownRequest&&us[1]&&!run) begin
				us[1]=0;
				open=1;
			end
		if(!direction&&!hasUpRequest&&ds[1]&&!run) begin
				ds[1]=0;
				open=1;
			end
		else if(direction&&ds[1]&&!run) begin
				ds[1]=0;
				open=1;
			end
		if(rs[1]==1&&!run) begin
				rs[1]=0;
				open=1;
			end
		end
		else if(floor==2'b10) begin
			if(direction==0&&us[2]==1&&!run) begin
				us[2]=0;
				open=1;
			end
			else if(direction&&!hasDownRequest&&us[2]&&!run) begin
				us[2]=0;
				open=1;
			end
			if(!direction&&!hasUpRequest&&ds[2]&&!run) begin
				ds[2]=0;
				open=1;
			end
			else if(direction&&ds[2]&&!run) begin
				ds[2]=0;
				open=1;
			end
			if(rs[2]==1&&!run) begin
				rs[2]=0;
				open=1;
			end
		end
		else if(floor==2'b11) begin
			if((ds[3]==1||rs[3]==1)&&!run) begin
				ds[3]=0;
				rs[3]=0;
				open=1;
			end
		end
		if(down[0]!= d0[0]) begin
			ds[0]=1;
		end
		if(up[0]!= u0[0]) begin
			us[0]=1;
		end
		if(request[0]!= r0[0]) begin
			rs[0]=1;
		end
		if(up[1]!= u0[1]) begin
			us[1]=1;
		end
		if(request[1]!= r0[1]) begin
			rs[1]=1;
		end
		if(down[1]!= d0[1]) begin
			ds[1]=1;
		end  
		if(up[2]!= u0[2]) begin
			us[2]=1;
		end
		if(request[2]!= r0[2]) begin
			rs[2]=1;
		end
		if(down[2]!= d0[2]) begin
			ds[2]=1;
		end  
		if(up[3]!= u0[3]) begin
			us[3]=1;
		end
		if(request[3]!= r0[3]) begin
			rs[3]=1;
		end
		if(down[3]!= d0[3]) begin
			ds[3]=1;
		end  

		u0=up;
		d0=down;
		r0=request;
	end

	always @(*) begin
		if(floor==2'b00) begin 
			hasDownRequest=0;
			if(us[1]||rs[1]||ds[1]||us[2]||rs[2]||ds[2]||us[3]||rs[3])
				hasUpRequest=1;
			else
				hasUpRequest=0;
		end
		else if(floor==2'b01) begin
			if(us[2]||rs[2]||ds[2]||us[3]||rs[3])
				hasUpRequest=1;
			else
				hasUpRequest=0;
			if(us[0]||rs[0])
				hasDownRequest=1;
			else
			 	hasDownRequest=0;
			end
			else if(floor==2'b10) begin
				if(us[3]||rs[3])
					hasUpRequest=1;
				else
					hasUpRequest=0;
				if(us[0]||rs[0]||us[1]||rs[1]||ds[1])
					hasDownRequest=1;
				else
					hasDownRequest=0;
			end
			else if(floor==2'b11) begin
				hasUpRequest=0;
			if(us[0]||rs[0]||us[2]||rs[2]||ds[2]||us[1]||rs[1]||ds[1])
				hasDownRequest=1;
			else  
				hasDownRequest=0;
		end
	end
endmodule
