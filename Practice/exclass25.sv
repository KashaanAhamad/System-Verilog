`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.07.2026 23:24:23
// Design Name: 
// Module Name: exclass25
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


module exclass25;
 class Packet;
  local integer i;
  function integer compare (Packet other);
	compare=(this.i ==other.i);
  endfunction
  function set(integer i);
	this.i=i;
  endfunction
endclass

integer retval;

initial begin
  Packet p1,p2;
  p1=new();
  p1.set(3);
  p2=new();
  p2.set(4);
  retval=p2.compare(p1);
  $display(retval);
  p2.set(3);
  retval=p2.compare(p1);
  $display(retval);
end
endmodule
