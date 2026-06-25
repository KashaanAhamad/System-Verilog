`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2026 22:39:44
// Design Name: 
// Module Name: p_208_deep_cpy_2
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
	int i;
endclass

class bar;
 foo a;
	task copy(foo a);
	  this.a= new a;
	endtask
endclass

program p_208_deep_cpy_2;
initial begin
  bar b1,b2;
  
  b1=new();
  b1.a=new();//check here
  b1.a.i=190;
 b2=new b1;
 b2.copy(b1.a);
 
 $display(b1.a.i);
 $display(b2.a.i);
 b1.a.i=091;

	$display(b1.a.i);
 	$display(b2.a.i);
end
endprogram

