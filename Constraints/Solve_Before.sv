`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.01.2026 23:26:59
// Design Name: 
// Module Name: Solve_Before
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
//without solve_before
class AB;
	rand bit a;
	rand bit[1:0] b;
	
	constraint c_ab{	a-> b ==3'h3;
						
                  	}
endclass

class AC;
	rand bit a;
	rand bit [1:0] b;
	
	constraint c_ab{	a-> b ==3'h3;
						
				  // Tells the solver that "a" has
  				  // to be solved before attempting "b"
  				  // Hence value of "a" determines value
  				  // of "b" here
                  	solve a before b;
                  	}
endclass


module Solve_Before( );
AB abc;
AC ac;
initial begin
	 abc=new();
	 ac=new();
	/*when a=0 ,b can take any of the 4 values. Next when a is 1,b can take only one value*/
	for(int i=0;i<10;i++)begin
		abc.randomize();	//Here the 'a' and 'b' are determined together and not one after other
		$display("a=%d, b=%d",abc.a,abc.b);
	end
	
	for(int j=0;j<10;j++)begin
		ac.randomize();	//Here, a is solved first and based on what it gets b is solved next
		$display("a=%d, b=%d",ac.a,ac.b);
	end

end
endmodule

/*Note that the probability of b is almost 0% before and after using solve - before, 
it has become a little more than 50%.

--> RESTRICTION in the use of solve Before
1) randc variable are not allowed since they are always solved first.
2) Variable should be integral value.
3) There Should not be circular dependency in the ordering such as Solve a before b combined
	with solve b before a.
*/
