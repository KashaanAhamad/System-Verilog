`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.04.2026 22:50:21
// Design Name: 
// Module Name: example_6
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


module example_6();

string words[2] = {"hello", "world"};
int prod[1:8][1:3];

initial begin
foreach(words[j])
	$display(j,words[j]);

foreach(prod[k,m])
begin
	prod[k][m] =k*m;
	$display(k,m,prod[k][m]);
end
end
endmodule
