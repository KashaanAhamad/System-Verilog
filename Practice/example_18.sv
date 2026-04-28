`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.04.2026 13:03:42
// Design Name: 
// Module Name: example_18
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


module example_18();
int q[$] = {2,4,8};
int p[$],pos;
int e[] = {1,3,5};
integer i;

initial begin
	q= {q,6}; //insert 6 at he end
	q={e,q}; //insert e at the beginning
	q= q[1:$];	//delete the first(left most)item
	q[0]=e[0];	//write the first item
	p=q;//read and write entire queue(copy)
	i=q[0];//e=q[0]; //read the first (left most)item
	i=q[$];//e=q[$]; //read the last item
	q=q[0:$-1]; //delete the last item
	q=q[1:$-1]; //delete the first an dlast item
	q={};//clear the queue(delete all the items)
	//pops needs to be initialize by you
	q={q[0:pos-1],e,q[pos:$]}; //insert e at position pos

	q={q[0:pos],e,q[pos+1:$]};	//inset e after position pos
end
endmodule
