`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.01.2026 21:34:46
// Design Name: 
// Module Name: functional_coverage
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


//Functional Coverage is a measure of what functionality/features of the design have been 
//exercised by the test.
//This can be useful in constrained random verification to know what features have been 
//covered by a set of tests in a regression.

class myTrans;
	rand bit [3:0] mode;
	rand bit [1:0] key;
	
	function display();
		$display("[%0tns] mode=%h, key =%h",$time, mode,key);
	endfunction 
	
	covergroup CovGrp; 
		coverpoint mode{
					bins featureA ={0};
					bins featureB ={[1:3]};
					bins common[] ={[4:$]};
					bins reserve = default;
					}
					
		coverpoint key;		
	endgroup
	
//Variables are mentioned as coverpoint
//coverpoint are put together in a covergroup block
//Multiple covergroup can be created to sample the same variable with diff set of bins
//Bins are said to be 'hit/covered' when the variable reaches the corresponding values.
//So, the bin featureB is hit when mode takes either 1,2,3 value.
//Bin reserve is a single bin for all values that do not fall under the other bins
//common will have 12 separate bins, one for each value from 0x4 to 0xF. 
endclass


//There are two ways to trigger coverage collection in a covergroup
//1) Use sample() method of a particular covergroup
class myCov;
rand bit [3:0] mode;
rand bit [1:0] key;
covergroup CovGrp;
		coverpoint mode{
					bins featureA ={0};
					bins featureB ={[1:3]};
					bins common[] ={[4:$]};
					bins reserve = default;
					}
					
		coverpoint key;	
	endgroup
	
	function new();
		CovGrp =new;	//Create an instance of the covergroup
	endfunction
endclass

module functional_coverage( );
	myCov myCov0 =new();	//create an instance of the class
	
	initial begin
		myCov0.CovGrp.sample();
	end
endmodule

//covergroup CovGrp @ (posedge clk); 	// Sample coverpoints at posedge clk
//covergroup CovGrp @ (eventA); 			// eventA can be triggered with ->eventA;

//Ways for conditionally enable Coverage
//use of iff construct
/*
covergroup CovGrp;
	coverpoint mode iff (!_if.reset) {
	    // bins for mode
	}
endgroup
*/
//Use of Start and stop function
/*
CovGrp cg = new;

initial begin
	#1 _if.reset = 0;
	cg.stop ();
	#10 _if.reset = 1;
	cg.start();
end
*/