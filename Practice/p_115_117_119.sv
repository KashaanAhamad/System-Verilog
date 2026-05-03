`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.04.2026 13:21:02
// Design Name: 
// Module Name: p_115_117_119
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


module p_115_117_119();
initial begin

$display("%d: Start fork..join example",$time);
#10 $display("%d: Seq after #10",$time);

fork
	$display("%d: Parallel start",$time);
	#50 $display("%d: Parallel after #50",$time);
	#10 $display("%d: Parallel after #10",$time); 
begin
	#30 $display("%d: Seq after #30",$time);
	#10 $display("%d: Seq after #10",$time);
end
join
	$display("%d: After join",$time);
	#80 $display("%d: Final after #80",$time);
end

endmodule