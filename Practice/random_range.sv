`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2026 23:12:42
// Design Name: 
// Module Name: random_range
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


module random_range();
 integer add_1;
 
initial
 begin
  repeat(10)
  begin
  #1;
   add_1=$urandom_range(55,50);
   $display("add_1=%d",add_1);
  end
end
endmodule


module Tb();
 integer add_1;
  initial begin
  repeat(10)
   begin
  #1;
  add_1=$unsigned($random)%10;
 $display("add_1=%d",add_1);
  end
end

endmodule
