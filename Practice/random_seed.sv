`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.07.2026 23:48:51
// Design Name: 
// Module Name: random_seed
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


module random_seed();
 integer num,seed,i,j;
 
initial begin
 for(j=0;j<4;j=j+1)
  begin
   num={$random(seed)} %10;
   $write("num=%d",num);
  end
 $display(" ");
 end
endmodule
