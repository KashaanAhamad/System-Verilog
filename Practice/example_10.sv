`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.04.2026 22:59:50
// Design Name: 
// Module Name: example_10
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


module example_10();

bit [31:0]src[5]='{0,1,2,3,4},
	dst[5]='{5,4,3,2,1};

bit [31:0] src1[5] ='{5{5}};

bit [3:0][7:0]bytes;

initial begin

if(src==dst)
	$display("Src==dst");
else 
	$display("Src!=dst");

dst=src;
src[0]=5;
	if(src[1:4]==dst[1:4])
		$display("Src==dst");
	else
		$display("Src!=dst");
end

initial begin
$display(src1[0],src1[0][0],src1[2][2:1]);
end


initial begin
	bytes=32'habcd_efab;
	$displayh(bytes,bytes[3],bytes[3][7]);
end



endmodule
