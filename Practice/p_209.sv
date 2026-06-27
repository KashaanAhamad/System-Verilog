`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2026 22:28:13
// Design Name: 
// Module Name: p_209
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


program p_209;
class Thing;
	int data;
endclass
Thing t1,t2,t3;	//Two handles
initial begin
  t1=new();	//construct first thing
  t1.data=1;
  t2=new();	//constructor second
  t2.data =2;
  t3=t2;
  t2=t1;	//second thing is lost
  t2.data=5;	//modifies first thing
  $display(t1.data); //display 5
  $display(t3.data); //display 2
end
endprogram

