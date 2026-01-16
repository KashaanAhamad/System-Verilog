`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.01.2026 01:01:17
// Design Name: 
// Module Name: pre_post_randomize
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

/*When we call randomize() their are couple of callback function taht are automatically called
 by randomize() before and after computing random values*/ 

/*pre_randomize() function is defined within the same class whose obj will 
be randomized and called before randomize() */

/*post_randomize() function is also defined within the same class whose obj will 
be randomized and called after randomize()*/

class bevrage;
	rand bit[7:0] beer_id;
	
	constraint c_beer_id{beer_id >=10;
							beer_id <=50;};
	
	//overriding existing pre and post randomize method	
	/*They are not virtual, but behave as a virtual method
	 on manually making them virtual,we will hit compiler error	*/				
	function void pre_randomize();
		$display("This will be called before randomization");
	endfunction
	
	function void post_randomize();
		$display("This will be called After randomization");
	endfunction
	
	
endclass

/* NOTE: 1)If randomize() fails, then post_randomize() is not called
	     2)randomize() method is built_in and cannot be overriden
	     3)If randomization fails, then the variable retain their original values 
	       and are not modified
*/
module pre_post_randomize( );
bevrage bvg;

initial begin
	bvg=new();
	repeat(5)
		assert(bvg.randomize());
end
endmodule
