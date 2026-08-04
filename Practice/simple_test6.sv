`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.08.2026 23:28:23
// Design Name: 
// Module Name: simple_test6
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


module simple_test6; //simple event comparison
event E1,E2;
initial
  fork	
   //E1=null;
  @E1;
  wait(E1.triggered);
  ->E1;
  $display("E1 event trigger happend");
  if(E1) //same as if (E1 !=null)
	E2=E1;
  if(E1 ==E2)
	$display("E1 and E2 are the same event");
  join
endmodule
