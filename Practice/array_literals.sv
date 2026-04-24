`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.04.2026 22:55:26
// Design Name: 
// Module Name: array_literals
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


module array_literals();

`timescale 1ns/100ps
//try using timeinits,timeprecision keyword here
//instead of using `timscale


byte a [0:1][0:2] = '{'{0,1,2},'{3{8'h9}}};

initial begin
	$display("a[0][0]=%d",a[0][0]);

	$display("a[0][1]=%d",a[0][1]);

	$display("a[0][2]=%d",a[0][2]);

	$display("a[1][0]=%d",a[1][0]);

	$display("a[1][1]=%d",a[1][1]);

	$display("a[1][2]=%d",a[1][2]);
#1 $finish;
end

endmodule
