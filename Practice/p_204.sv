`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2026 22:31:32
// Design Name: 
// Module Name: p_204
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


class abc;
 int x;
 int y;
	task print_1();
	 $display(x,y);
	endtask
endclass

program p_204;
initial begin
   abc ob1,ob2;
   ob1=new();
   ob2=new();
   ob1.x=2;
   ob2.y=4;
   ob1.print_1();
   ob2.print_1();
end
endprogram
