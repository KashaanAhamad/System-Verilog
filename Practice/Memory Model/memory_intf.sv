`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.07.2026 23:26:09
// Design Name: 
// Module Name: memory_intf
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


interface memory_intf #(parameter int unsigned W=1, parameter int unsigned A=1);
 timeunit 1ns;
 timeprecision 1ns;

 wire logic [W-1:0] data;
 logic [A-1:0] addr;
 logic read, write;

 modport DUT(inout data,input addr,read,write);
 modport TB(inout data, output addr,read,write);

endinterface