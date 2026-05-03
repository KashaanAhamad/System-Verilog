`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.04.2026 13:18:00
// Design Name: 
// Module Name: example_23
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


module example_23(clock,resetIN);
input wire clock,resetIN;

enum{WAIT,LOAD,STORE}state, nextstate;
always@(posedge clock or negedge resetIN)
	if(!resetIN) state<= WAIT;
else state<=nextstate;

always@(state)
case(state)
	WAIT:nextstate=LOAD;
	LOAD:nextstate=STORE;
	STORE:nextstate=WAIT;
endcase
endmodule


module ex23_tb();

reg clock,reset;

ex23 ctrl_1(clock,reset);

initial begin
clock=1;
forever #5 clock=~clock;
end

initial begin
$monitor("Time=%d, clock=%d, reset=%d, state=%d,nextstate=%d",$time,clock,reset,ctrl_1.state,ctrl_1.nextstate);//$root.state,$root.nextstate
//$monitor("Time=%d, clock=%d, reset=%d, state=%d,nextstate=%d",$time,clock,reset,$root.ctrl.state,$root.ctrl.nextstate);
end

initial begin
#50 $finish();
end

endmodule



