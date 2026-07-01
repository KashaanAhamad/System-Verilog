`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2026 23:58:52
// Design Name: 
// Module Name: p_224_1
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

class foo;
 local int x;
 task set(int y);
   x=y;
  $display(x);
 endtask
endclass

program p_224_1;
initial
 begin
  foo b=new();
  b.set(123);
 end
endprogram



