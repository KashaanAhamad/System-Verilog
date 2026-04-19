`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.04.2026 22:57:14
// Design Name: 
// Module Name: example_8
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


module example_8();

bit[31:0] src[5],dst[5];
initial begin
//bit [31:0] src[5],dst[5];

	for(int i=0;i<$size(src);i++)begin
		src[i]=i;
		dst[i]=i*2;
		$display("%b %b %b",i,src[i],dst[i]);
	end
end
endmodule