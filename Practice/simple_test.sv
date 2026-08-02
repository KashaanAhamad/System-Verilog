`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.07.2026 23:20:07
// Design Name: 
// Module Name: simple_test
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


module simple_test0();
 event a;
 integer me=0;

always @a
	$display("me is %d",me);

 initial begin
   me<=1; 
   ->a;
 end
endmodule



