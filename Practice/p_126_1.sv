`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.06.2026 23:44:23
// Design Name: 
// Module Name: p_126_1
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


module p_126_1( );

initial begin
#(10);
	$display("BEFORE fork time=%d",$time);
fork
	begin
	#(20);
		$display("time=%d #20 ",$time);
	end
	
begin
	#(10);
		$display("time=%d #10 ",$time);
end

begin
	#(5);
		$display("time =%d #5",$time);
end

join_any
	$display("time =%d outside the main fork ",$time);
disable fork;
	$display("killed the child processes");
end
initial
	#100 $finish;
endmodule

