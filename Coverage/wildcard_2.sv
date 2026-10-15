`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.10.2026 17:19:03
// Design Name: 
// Module Name: wildcard_2
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


//using wildcard
program wildcard_2;
 reg [0:1] y;
 reg [0:1] values[$]='{2'b00,2'b01,2'b10,2'b11};

 covergroup cg;
 cover_point_y: coverpoint y{
 wildcard bins trans =(2'b0X => 2'b1X);  //instead of X try using Z
 }
endgroup

cg cg_inst=new();

initial
 foreach(values[i])
 begin
   y=values[i];
  cg_inst.sample();
 end
endprogram
