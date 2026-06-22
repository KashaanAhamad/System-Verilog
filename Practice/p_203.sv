`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.06.2026 00:04:03
// Design Name: 
// Module Name: p_203
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

class BusTran;
	bit [31:0] addr,crc,data[8];

function void display;
	$display("BusTran: %h %h",addr,crc);
endfunction:display

endclass:BusTran

class PCITran;
 bit[31:0] addr,data[8];

 function void display;
	$display("PCITran: %h %p",addr,data);
endfunction:display

endclass:PCITran

program p_203;
  BusTran b;
  PCITran pc;
initial begin
  b=new();
  b.display();
  pc=new();
  pc.display();
end
endprogram
