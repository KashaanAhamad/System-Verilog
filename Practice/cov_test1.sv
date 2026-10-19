`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2026 23:53:14
// Design Name: 
// Module Name: cov_test1
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


program automatic cov_test1();
 
 class Transaction;
	rand bit [31:0]data;
	rand bit [2:0]port;
 endclass

covergroup CovPort;
  coverpoint tr.port
  { option.auto_bin_max=2;}
endgroup

Transaction tr=new;
initial begin
 CovPort ck=new;
 repeat (32) begin
  tr.randomize;
  $display(tr.port,tr.data);
  ck.sample();
 end
end
endprogram
