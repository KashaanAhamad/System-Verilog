
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.06.2026 23:58:56
// Design Name: 
// Module Name: memory
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



module memory #(parameter int unsigned W=1,  parameter int unsigned A= 1)
	(   inout logic [W-1:0] data,
		input logic [A-1:0] addr,
		input logic read,write
	);

timeunit 1ns;
timeprecision 1ns;

logic [W-1:0] mem [2**A]; //A=5,W=8=>[7:0]mem[32];

assign data=read? mem[addr]:'z;

always @(posedge write)
	mem[addr] <=data;
endmodule:memory

