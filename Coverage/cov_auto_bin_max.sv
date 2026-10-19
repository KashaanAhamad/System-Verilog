`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2026 23:51:53
// Design Name: 
// Module Name: cov_auto_bin_max
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

module cov_auto_bin_max;
 bit [0:2]y;
 bit [0:2] values[$] ='{3,5,6};

covergroup cg;
 cover_point_y : coverpoint y
 {option.auto_bin_max =4;}
endgroup

cg cg_inst=new();
initial foreach(values[i])
begin
 y=values[i];
 cg_inst.sample();
end
endmodule