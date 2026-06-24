`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.06.2026 23:36:24
// Design Name: 
// Module Name: p_123
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


module p_123();
	initial begin
$display("------------------------------");

fork 
//process-1
begin
	$display($time,"\tProcess-1 started");
#5;
	$display($time,"\tProcess-1 Finished");
end
//Process-2

begin
	$display($time,"\tProcess -2 Started");
#20;
	$display($time,"\tProcess-2 Finished");
end
join_any
	$display($time, "--------------------------");

wait fork;
	$finish;
end
endmodule

