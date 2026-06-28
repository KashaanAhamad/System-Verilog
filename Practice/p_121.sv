`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.06.2026 23:34:52
// Design Name: 
// Module Name: p_121
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


module p_121();

task automatic  print_val;
	input [7:0] val;
	input [7:0] delay;
begin
	#(delay) $display("@%g Passed value %d delay %d",$time,val,delay);
end
endtask

initial
fork
	//#1 print_val(4,2);
#1 print_val(10,7);
#1 print_val(8,5);

#1 print_val(4,2);

join //Check the output using join,join_anymjoin_none
initial
	$display("@%g Came out of fork-join",$time);

endmodule

