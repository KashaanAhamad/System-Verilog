`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.08.2026 23:26:07
// Design Name: 
// Module Name: simple_test4
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


module simple_test4; //rclaiming
event E1;
initial
 fork //try using begin end and understand
  #1 @E1;  $display("e1 EVENT TRIGGERED");
  #2 -> E1;
  #3 E1 =null;
  #4 @E1; $display("E1 event triggered");
  #5 ->E1; $display(E1.triggered); //what happens-nothing
 join
endmodule