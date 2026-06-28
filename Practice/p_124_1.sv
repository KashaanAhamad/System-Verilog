`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2026 23:16:19
// Design Name: 
// Module Name: p_124_1
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
   endtask
endclass

module p_124_1;
initial begin
	parent d;
	subclass c;
	d = new();
	c= new();
	d.print_1();
	c.print_1();
end
endmodule
