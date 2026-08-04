`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.08.2026 23:27:07
// Design Name: 
// Module Name: simple_test5
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


module simple_test5; //merging
  event E1,E2;
initial
  fork //try using begin end and understand
	#1 E2 =E1;
	#2 @E1 $display("E1 event triggered");
	#2 @E2 $display("E2 event triggered");
	#3 -> E2;	//triggered E2 hence E1 also
  join
endmodule

