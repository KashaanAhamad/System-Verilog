`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.04.2026 23:02:07
// Design Name: 
// Module Name: example_12
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


module example_12();

bit [16:1] b_unpack[1:3];
int i;
logic j;

initial begin

	b_unpack[0]='0;
	b_unpack[1]='0;
	b_unpack[2]='0;
	b_unpack[3]='1;
	b_unpack[1][1]=b_unpack[2][3];
	b_unpack[3][15]=1;
	i=b_unpack[3][0];
$display(i);
	j=b_unpack[3][0];
$display(j);
end

endmodule