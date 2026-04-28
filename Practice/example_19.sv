`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.04.2026 13:05:02
// Design Name: 
// Module Name: example_19
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


module example_19();

logic [63:0] asso_spar[*];
logic [63:0] idx=1;
//logic idx=1;
//int idx=1;
//change idx frm logic to int and see the result

initial begin
	repeat(64)begin
	asso_spar[idx]=idx;
	$display("asso_spar[idx]",idx);
	idx=idx<<1;
end
//foreach, do-while, for loop-you have to tell which one of them is best

//foreach(asso_spar[i])//will not work with foreach
//	$display("asso_spar[%h]=%h",i,asso_spar[i]);

if(asso_spar.first(idx))
begin
	do
	$display("asso_spar[%h]=%h",idx,asso_spar[idx]);
while (asso_spar.next(idx));
end
asso_spar.first(idx);asso_spar.delete(idx);
end
//you need to write the for loop partfor(int)
endmodule
