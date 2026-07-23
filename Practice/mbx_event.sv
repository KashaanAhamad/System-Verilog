`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.07.2026 23:54:56
// Design Name: 
// Module Name: mbx_event
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


program automatic mbx_evt;
 event handshake;
 class Producer;
   task run;
	for(int i=1;i<4;i++) begin
 	$display("Producer: before put(%0d)",i);
	mbx.put(i);
	@handshake;
	$display("Producer: after  put(%0d)",i);
   end
 endtask
endclass

class Consumer;
  task run;
	int i;
     repeat(3)begin
	mbx.get(i);
	$display("Consumer:after get(%0d)",i);
	-> handshake;
    end
endtask
endclass;

mailbox mbx;
Producer p;
Consumer c;
initial begin
 mbx=new;
 p=new;
 c=new;
	fork 
	   p.run;
	   c.run;
	join
end
endprogram