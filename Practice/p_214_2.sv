`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2026 23:17:20
// Design Name: 
// Module Name: p_214_2
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


class parent;
  task print_1();
	$display("THIS IS PARENT CLASS");
  endtask
endclass

class subclass extends parent;
	task print_1();
	 $display("THIS IS SUBCLASS");
	 super.print_1();
	endtask
endclass

module p_214_2;
initial begin
	subclass c;
 	c =new();
	c.print_1();
end
endmodule

