`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.10.2026 17:20:04
// Design Name: 
// Module Name: transition_2
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


//capturing tansition
program transition2;
bit [0:3] y;
bit [0:2] values[$]='{3,5,6};

covergroup cg;

cover_point_y : coverpoint y{
 bins trans[]= (3,4=>5,6);

}
endgroup

cg cg_inst=new();
initial foreach(values[i])
begin
y=values[i];
cg_inst.sample();
end
endprogram
