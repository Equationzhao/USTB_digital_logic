`timescale 1ns / 1ps
/*
*   描述：设计一个4层楼的电梯控制系统，完成电梯向上或向下移动到被请求楼层（假设电梯每移动一层需要1秒）。
*   请求可来自每层楼的呼叫按钮，也可来自电梯内的目的楼层选择。
*   当电梯到达被请求楼层后，打开电梯门10秒（假设该电梯内只有楼层按键，没有开门和关门按键），然后关闭电梯门前往下一个被请求楼层；
*   如果没有请求则停在本层。
*   电梯运行中保持电梯门关闭。
*   当同时有多个请求时，应答的优先原则为尽可能不改变电梯运动方向且距离当前楼层最近。
////////////////////////////////////////////////////////////////////////////////////////////////
*   板级验证参考说明（可自行设计板上资源的使用方案）：
*   用实验板上开关模拟电梯口的向上按钮。开关输入值的改变模拟按钮被按下的信号（不管是0-> 1还是1-> 0都是按下按钮）。
*   当开关输入值改变且电梯没有停在同层，则点亮对应的led灯,当电梯停在同层时，则led不亮。
*   用类似的方法模拟电梯口的向下按钮。
*   用类似的方法模拟电梯内的按钮。
*   用1个数码管显示当前电梯所在的楼层。
*   用1个数码管显示电梯运行状态（向上、向下、停止）。
*   用1个数码管显示电梯控制器状态机的状态值（可用于调试）。
*   用1个数码管显示电梯门开关状态。
*/

module top(
	input  [3:0] up, 
	input  [3:0] down, 
	input  [3:0] request, 
	input  clr, 
	input  clk100mhz, 
	output [3:0] pos, 
	output [7:0] seg, 
	output [3:0] uw, 
	output [3:0] dw, 
	output [3:0] rw, 
	output clrn
);

/*
*	direction 1->down, 0->up
*/


	assign clrn=clr;

	reg  [1:0] floor = 0;
	wire clk190hz, clk12hz, clk1_5hz;
	wire liftGoUp, liftGoDown, openDoor;
	wire [1:0] floor2;
	wire run;
	wire direction;
	reg  [3:0] floor1, status, door;
	wire [3:0] pstate;

	always@(posedge clk100mhz) begin
		floor <= floor2;
		floor1 [1:0] <= floor;
		if(direction == 0 && run == 1)
			status <= 4'b0001;
		else if(direction == 1 && run == 1)
			status <= 4'b0010;
		else
			status <= 4'b0000;
		if(openDoor == 1)
			door <= 4'b0001;
		else 
			door <= 4'b0000;
	end

	clkDiv	U1(clk100mhz, clk190hz, clk12hz, clk1_5hz);

	solve	U2(clk190hz, clk1_5hz, run, up, down, request, floor, direction, clr, liftGoUp, liftGoDown, openDoor, uw, dw, rw);
	control	U3(clk12hz, clk12hz, clr, liftGoUp, liftGoDown, openDoor, floor2, direction, run, pstate);

	segMsg	U4(clk190hz, floor1, status, pstate, door, pos, seg);
endmodule
