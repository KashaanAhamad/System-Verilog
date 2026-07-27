`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.07.2026 23:31:14
// Design Name: 
// Module Name: main_wait
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


module main_wait;
 event e1,e2;
 initial 
   repeat(4)
    begin
  #20;
  ->>e1;
  @(e1) $display("e1 is triggered at %t",$time);
 end

initial repeat(4)
 begin
  #20;
  ->e2;
  wait(e2.triggered);
  $display("e2 is triggered at %t",$time);
end
endmodule

