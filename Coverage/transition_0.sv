`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.10.2026 17:33:41
// Design Name: 
// Module Name: transition_0
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


//capturing transition
program transition0;
 bit [0:3] y;
 bit [0:2] values[$]='{3,5,6};
covergroup cg;

cover_point_y: coverpoint y{
bins tran_34 =(3=>4);
bins tran_56 = (5=>6);
}
endgroup

cg cg_inst=new();
initial foreach(values[i])
begin
y=values[i];

cg_inst.sample();
end

endprogram