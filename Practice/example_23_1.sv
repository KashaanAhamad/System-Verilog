`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.04.2026 13:19:32
// Design Name: 
// Module Name: example_23_1
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


module example_23_1(clock,resetIN);
input wire clock,resetIN;

enum{WAIT,LOAD,STORE}state, nextstate;
always@(posedge clock or negedge resetIN)
	if(!resetIN) state<= WAIT;
else state<=nextstate;

always_comb
case(state)
	WAIT:nextstate=LOAD;
	LOAD:nextstate=STORE;
	STORE:nextstate=WAIT;
endcase
endmodule



module ex23_tb();
reg clock,reset;

ex23_1 ctrl(clock,reset);

initial begin
clock=1;
forever #5 clock=~clock;
end

initial begin
reset=0;
#2 reset=1;
$monitor("Time=%d, clock=%d, reset=%d, state=%d,nextstate=%d",$time,clock,reset,ctrl.state,ctrl.nextstate);//$root.state,$root.nextstate
//$monitor("Time=%d, clock=%d, reset=%d, state=%d,nextstate=%d",$time,clock,reset,$root.ctrl.state,$root.ctrl.nextstate);
end

initial begin
#50 $finish();
end

endmodule
