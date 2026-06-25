`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2026 22:36:21
// Design Name: 
// Module Name: p_208_deep_copy
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


class base;
  int i;
endclass

program p_208_deep_copy;

initial begin
  base b1,b2;

b1=new();
b1.i=190;
b2=new b1;
b2.i =091;
 
 $display(b1.i);
 $display(b2.i);
end
endprogram

