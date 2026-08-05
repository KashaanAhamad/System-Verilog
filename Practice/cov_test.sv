`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.07.2026 23:25:00
// Design Name: 
// Module Name: cov_test
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


program automatic cov_test();
 class Transaction;
  rand bit [31:0] data;
  rand bit [2:0] port;
endclass

covergroup CovPort;
   coverpoint tr.port;
endgroup

Transaction tr=new;

initial begin
 CovPort ck=new;
 repeat(32) begin
  tr.randomize;
  $display(tr.port,tr.data);
  ck.sample();
 end
end
endprogram