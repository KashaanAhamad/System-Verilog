`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.04.2026 13:00:49
// Design Name: 
// Module Name: example_16
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


module example_16();

int j=1, b[$]={3,4}, q[$]={0,2,5}, c[]={10,15,20};

initial begin

		q.insert(1,j);
		q.insert(2,b[1]);//this is not going to work? why? then how we do it
	$display("Check here",q);
		q={q,b};
	$display(q);
		q={q,c};
	
		q.delete(1);
	$display(q);
		q.push_front(6);
	$display(q);
		j=q.pop_back;
	$display(q);
		q.push_back(8);
	$display(q);
		j=q.pop_front;
	$display(q);

end
endmodule
