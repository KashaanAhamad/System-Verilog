`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2026 22:35:02
// Design Name: 
// Module Name: p_210_2
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


program p_210_2;

 class A;
   static int a_count =0;
   int tr;
  function new;
    tr=a_count++;
  endfunction
 endclass

A a1,a2;
  initial begin
     a1=new;
     a2=new;
     $display("tr=%d, a_count=%d",a2.tr,a2.a_count);
   end
endprogram

