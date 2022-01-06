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
	
	reg [3:0] upInit;
	reg [3:0] downInit;
	reg [3:0] requestInit;
	reg [3:0] upStash;
	reg [3:0] downStash;
	reg [3:0] requestStash;
	reg [3:0] canopen;

	initial begin
		upInit=4'b0000;
		downInit=4'b0000;
		requestInit=4'b0000;
		upStash=4'b0000;
		downStash=4'b0000;
		requestStash=4'b0000;
		canopen=4'b0000;
	end
	
	assign uw=upStash;
	assign dw=downStash;
	assign rw=requestStash;
	
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
	
	//如果该楼层没有需求，而其他楼层有需求，则到达那一楼层
	always @(*) begin
		if(floor==2'b00) begin // 检查是否需要上升
			hasDownRequest=0;
			if(upStash[1]||requestStash[1]||downStash[1]||upStash[2]||requestStash[2]||downStash[2]||upStash[3]||requestStash[3]) // any request
				hasUpRequest=1;
			else
				hasUpRequest=0;
		end
		else if(floor==2'b01) begin // 检查上升/下降
			if(upStash[2]||requestStash[2]||downStash[2]||upStash[3]||requestStash[3])
				hasUpRequest=1;
			else
				hasUpRequest=0;
			if(upStash[0]||requestStash[0])
				hasDownRequest=1;
			else
			 	hasDownRequest=0;
			end
			else if(floor==2'b10) begin  // 检查上升/下降
				if(upStash[3]||requestStash[3])
					hasUpRequest=1;
				else
					hasUpRequest=0;
				if(upStash[0]||requestStash[0]||upStash[1]||requestStash[1]||downStash[1])
					hasDownRequest=1;
				else
					hasDownRequest=0;
			end
			else if(floor==2'b11) begin // 检查下降
				hasUpRequest=0;
			if(upStash[0]||requestStash[0]||upStash[2]||requestStash[2]||downStash[2]||upStash[1]||requestStash[1]||downStash[1])
				hasDownRequest=1;
			else  
				hasDownRequest=0;
		end
	end
	
	always@(posedge clk100mhz)
			if(clr) begin
				upStash=0;
				requestStash=0;
				downStash=0;
				open=0;
			end
			else begin 
			if(canopen==4'b1000&&open==1) begin
				open=0;
			end
			else begin
				
			end
			if(floor==0) begin // 第一层
				if((upStash[0]==1||requestStash[0]==1)&&!run) begin //开门
					upStash[0]=0;
					requestStash[0]=0;
					open=1;
				end
				else begin
					
				end
			end
			else if(floor==2'b01) begin //第二层
				if(!direction&&upStash[1]&&!run) begin 
					upStash[1]=0;
					open=1;
				end
				else if(direction&&!hasDownRequest&&upStash[1]&&!run) begin
					upStash[1]=0;
					open=1;
				end
				else begin
				
				end
				if(!direction&&!hasUpRequest&&downStash[1]&&!run) begin
					downStash[1]=0;
					open=1;
				end
				else if(direction&&downStash[1]&&!run) begin
					downStash[1]=0;
					open=1;
				end
				else begin

				end
				if(requestStash[1]==1&&!run) begin
					requestStash[1]=0;
					open=1;
				end
				else begin
					
				end
			end
			else if(floor==2'b10) begin //第三层
				if(direction==0&&upStash[2]==1&&!run) begin
					upStash[2]=0;
					open=1;
				end
				else if(direction&&!hasDownRequest&&upStash[2]&&!run) begin
					upStash[2]=0;
					open=1;
				end
				else begin
					
				end
				if(!direction&&!hasUpRequest&&downStash[2]&&!run) begin
					downStash[2]=0;
					open=1;
				end
				else if(direction&&downStash[2]&&!run) begin
					downStash[2]=0;
					open=1;
				end
				else begin
					
				end
				if(requestStash[2]==1&&!run) begin
					requestStash[2]=0;
					open=1;
				end
				else begin
					
				end
			end
			else if(floor==2'b11) begin
				if((downStash[3]==1||requestStash[3]==1)&&!run) begin
					downStash[3]=0;
					requestStash[3]=0;
					open=1;
				end
				else begin
					
				end
			end
			if(down[0]!= downInit[0]) begin
				downStash[0]=1;
			end
			else begin
					
			end
			if(up[0]!= upInit[0]) begin
				upStash[0]=1;
			end
			else begin
					
			end
			if(request[0]!= requestInit[0]) begin
				requestStash[0]=1;
			end
			else begin
					
			end
			if(up[1]!= upInit[1]) begin
				upStash[1]=1;
			end
			else begin
					
			end
			if(request[1]!= requestInit[1]) begin
				requestStash[1]=1;
			end
			else begin
					
			end
			if(down[1]!= downInit[1]) begin
				downStash[1]=1;
			end
			else begin
					
			end  
			if(up[2]!= upInit[2]) begin
				upStash[2]=1;
			end
			else begin
					
			end
			if(request[2]!= requestInit[2]) begin
				requestStash[2]=1;
			end
			else begin
					
			end
			if(down[2]!= downInit[2]) begin
				downStash[2]=1;
			end
			else begin
					
			end  
			if(up[3]!= upInit[3]) begin
				upStash[3]=1;
			end
			else begin
					
			end
			if(request[3]!= requestInit[3]) begin
				requestStash[3]=1;
			end
			else begin
					
			end
			if(down[3]!= downInit[3]) begin
				downStash[3]=1;
			end
			else begin
					
			end  

			upInit=up;
			downInit=down;
			requestInit=request;
	end
	
	
endmodule
