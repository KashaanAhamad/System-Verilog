`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.06.2026 00:06:00
// Design Name: 
// Module Name: p_126
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


module p_126;

initial begin
	$display($time,"--------------------------");

fork 
begin
	$display($time,"\tProcess-1 of fork-2 started");
#4;
	$display($time,"\tProcess-1 of fork-2 ended");
end

begin
	$display($time,"\tProcess-2 of fork-2 Started");
#15;
	$display($time,"\tProcess-2 of fork Fiished");
end
join_none

fork
begin
	$display($time,"\tProcess-1 of fork-1 started");
#5;
	$display($time,"\tProcess-1 of fork- finished");
end

begin
	$display($time,"\tProcess-2 of fork-1 Started");
#20;
	$display($time,"\tProcess-2 of fork-1 ended");
end
join_any
disable fork;

$display("---------------------------------------");
$display($time,"\tAfter disable-fork");
$display("-----------------------------------------");

end
endmodule

