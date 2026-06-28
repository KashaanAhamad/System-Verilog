`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2026 23:12:09
// Design Name: 
// Module Name: p_211
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


module p_211;
class PCI_Tran;
  bit[31:0] addr,data;	//use realistic names
  extern function void display();
endclass

function void PCI_Tran::display();
  $display("@%0d: PCI: addr=%h, data=%h",$time,addr,data);
endfunction


typedef PCI_Tran my_class;
initial begin
	my_class me= new();
    	me.display();
end
endmodule