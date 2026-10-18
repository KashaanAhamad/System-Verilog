`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.10.2026 23:41:38
// Design Name: 
// Module Name: cov_enum_alpha
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




program cov_enum_alpha;
typedef enum {A,B,C,D} alpha;

alpha y;

alpha value[$]='{A,B,C};

covergroup cg;
	cover_point_y: coverpoint y;
endgroup

cg cg_inst=new();
initial begin
	foreach(value[i])
	begin
		y=value[i];
		cg_inst.sample;
	end
end
endprogram
