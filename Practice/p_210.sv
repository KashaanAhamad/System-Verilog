`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2026 22:30:03
// Design Name: 
// Module Name: p_210
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


program p_210;

class B;
   static int count=0;
   function new();
	count++;
   endfunction
endclass

B b1,b2;
initial begin
  b1=new;
  $display("First count is =%d", b1.count);
  b2=new;
  $display("Second count =%d",b2.count);
  b2 =null;
  $display("First count is =%d",b1.count);
  $display("Second count=%d",b2.count);
end
endprogram
