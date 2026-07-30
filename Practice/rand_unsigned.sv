`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.07.2026 23:47:06
// Design Name: 
// Module Name: rand_unsigned
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


module rand_unsigned();

integer unsigned add_1;
 
initial begin
 repeat(10)
  begin
   #1;
    add_1=$random & 15;
    $display("add_1 =%d",add_1);
  end
end
endmodule




