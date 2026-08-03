`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.08.2026 23:23:50
// Design Name: 
// Module Name: simple_test3
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


module simple_test3();
 event a,b;
initial begin
	$display("forking off");
  fork
	->> a;
	@a;
	->b;
	wait(b.triggered); //try @b; also 
  join
  $display("Joining");
end
endmodule

// Output : forking off
// joining
