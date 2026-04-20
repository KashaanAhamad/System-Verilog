`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.04.2026 23:01:07
// Design Name: 
// Module Name: example_11
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


module example_11();

bit [7:0] up_array[3];
//bit [31:0] ABC[5]='{5,6,7,5,5};

initial begin
	up_array[0]='0;
	up_array[1]='1;
	up_array[2]='0;
	up_array[2][3]='1;
end

initial begin
	$display("%b %b %b", up_array[0],up_array[1],up_array[2]);
	//$display(abc[1],abc[3][0],abc[2][3:1]);

end
endmodule
