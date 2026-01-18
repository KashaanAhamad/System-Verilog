`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.01.2026 21:07:26
// Design Name: 
// Module Name: Rand_case
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

/* randcase introduces a case stmt that randomly selects one of its branches. 
   The case item expression are positive integer value that represent the weight
   associated with each item. Probability of selecting an item is derived by the 
   division of that item's weight divided by the sum of all weights. */
   
/* SYNTAX: randcase
				item: stmt;
				...
			endcase
*/

module Rand_case();
	initial begin
		for (int i=0;i<10;i++)
			randcase	
				1 : $display ("Wt 1");
				5 : $display ("Wt 5");
				3 : $display ("Wt 3");
				0 : $display ("Wt 0");
			endcase
	end
	
	/* sum of all weight =9,	prob. of taking 1st branch 1/9, 
	prob. of taking 2md branch 5/9, prob. of taking 3rd branch 3/9
	*/
	/*NOTE:If a branch specifies 0 weight , then the branch is not taken */	
endmodule
