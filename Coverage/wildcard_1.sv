`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.10.2026 17:18:01
// Design Name: 
// Module Name: wildcard_1
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
program wildcard_1;
 reg [0:3] y;
 reg [0:3] values[$]='{4'b1100,4'b1101,4'b1110,4'b1111};

 covergroup cg;
 cover_point_y: coverpoint y{
 wildcard bins g12_15 ={4'b11??};
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
