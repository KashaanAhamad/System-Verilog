`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.07.2026 23:31:13
// Design Name: 
// Module Name: memory_new
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


module memory_new #(parameter int unsigned W=1, parameter int unsigned A=1)(memory_intf.DUT m1);

 timeunit 1ns;
 timeprecision 1ns;

 logic [W-1:0] mem[2**A];
 assign m1.data=m1.read?mem[m1.addr]:'z;
 
 always @(posedge m1.write)
  mem[m1.addr]<=m1.data;

endmodule:memory_new
