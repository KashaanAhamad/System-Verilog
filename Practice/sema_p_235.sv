`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.07.2026 23:26:04
// Design Name: 
// Module Name: sema_p_235
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


program sema_p_235;
 semaphore semBus=new(1);
 initial begin
  fork
	agent("AGENT 0",5);
	agent("AGENT 1",10);
	agent("AGENT 2",15);
	agent("AGENT 3",20);
  join
end

task automatic agent(string name, integer nwait);
  integer i=0;
  for(i=0;i<4;i++)begin
 	semBus.get(1);
	$display("[%0d] Lock SemBus for %s",$time,name);
	#(nwait);
	$display("[%0d] relaease semBus for %s",$time,name);
	semBus.put(1);
	#(nwait);
	end
endtask
endprogram