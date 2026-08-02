`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.08.2026 23:22:45
// Design Name: 
// Module Name: simple_test2
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


module simple_test2;
 event a,b;
 
initial begin
 $display("forking off");
 fork
  ->a;
  @a;
  ->b;
 join
 $display("Joining");
end
endmodule

//output:forking off
