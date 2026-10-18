`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.10.2026 23:44:42
// Design Name: 
// Module Name: cov_explicit_bins
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


program cov_explicit_bins;
 bit [0:2] y;
 bit [0:2] values[$] ='{3,5,6};

covergroup cg;
 cover_point_y : coverpoint y{
 bins a={0,1};
 bins b={2,3};
 bins c={4,5};
 bins d={6,7};
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
