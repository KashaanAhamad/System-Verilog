`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.06.2026 23:37:38
// Design Name: 
// Module Name: p_125
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


module p_125();

task sub_process;
	$display($time,"\tSub-process Started");
#10;
	$display($time,"\tSub-Process Finished");
endtask

initial begin
	$display("----------------------------");
fork
	begin
		$display($time,"\tProcess-1 of fork-1 started");
	#5;
		$display($time,"\tProcess-1 of fork-1 Finished");
	end
	begin
		sub_process();
	end
join_any
disable fork;

	$display("---------------------------------");
	$display($time,"\t After disable-fork");
	$display("-----------------------------------");
end
endmodule

