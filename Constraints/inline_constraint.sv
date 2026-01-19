`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.01.2026 21:51:28
// Design Name: 
// Module Name: inline_constr
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

/*If we have well written constraint and there is a need to randomize the class variable with
a set of different constraint decided by the user.
By using the 'with' construct, user can declare in-line constraint ath the point where the
randomize() method is called. */

class item;
rand bit [7:0] id;

constraint c_id{ id<25; }

endclass

//conflicting constraint class
class Item2;
  rand bit [7:0] id2;

  constraint c_id { id2 == 25; }
endclass

module inline_constr( );
item itm;
Item2 it;
	initial begin
		itm=new();
		it=new();
		itm.randomize() with{id ==10;};		// In-line constraint using with construct
		$display("Item id=%d",itm.id);
		
		if (! it.randomize() with { id2 < 10; })	//Conflicting constraint
    	$display ("Randomization failed");
    $display ("Item Id2 = %0d", itm.id);
		
	end
endmodule

/*If the original constraint c_id is fixed to 25 as follows and we provide a conflicting 
in-line value, then the randomization will fail.

The takeaway here is that constraints provided should not conflict with each other and 
in-line method of providing constraints does not override but instead is also considered 
along with the original by the solver.*/