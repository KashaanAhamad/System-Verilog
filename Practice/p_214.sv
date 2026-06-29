`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2026 23:13:56
// Design Name: 
// Module Name: p_214
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

//Interview Trick question
module p_214;
 class Packet;
	integer i=1;
	function integer get();
	  get=1;
	endfunction
 endclass

 class LinkedPacket extends Packet;
   integer i=2;
   function integer get();
	get=-i;
   endfunction
 endclass

integer j;

initial begin
LinkedPacket lp=new;
Packet p=lp;
j=p.i;	//j=1 not 2

$display(j);
j=p.get();	//j=1 not -1 or -2

$display(j);
j=lp.i;

$display(j);
j=lp.get();

$display(j);
end
endmodule
