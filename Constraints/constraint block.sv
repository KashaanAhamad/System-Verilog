`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.01.2026 21:39:03
// Design Name: 
// Module Name: constraint_block
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

/* Constraint are put on a random variable declared with Keyword rand, they
	are used to limit the values of random variable within certain values*/
	
/*1--> Constraint Block are class member just like variable, method and task*/
/*Syntax: constraint [constraint name] { [expression 1];
										  [expression 2];}
*/

/*2-->It is not necessary to have a single constraint for every variable nor is it 
  	required to restrict a constraint block to have conditions pertaining only to a 
  	single variable
  3--> However you cannot have conflicting constraints spread out in multiple blocks,
  	unless they are turned off using constraint_mode() method */
										  
class pkt;

	rand bit [7:0] addr;
	rand bit [7:0] data;
	
	rand int burst,len,size;
	
	constraint addr_limit{ addr <= 8'hB;}
	
	constraint valid_addr{ addr [1:0] == 2'b0;
						   addr <= 32'hfaceface;
						   addr >= 32'h00000000;};
						   
	constraint fast_burst{ burst >= 3;
						   len	>=64;
						   size >=128;} 
	
	//Error	- valid_addr already declared
	//constraint valid_addr{ ...}
	
	//Runtime Error- error solver fails due to conflict on addr
	constraint valid{ addr >=32'hfaceffff;}
	
	// Valid because solver can find an address that satisfies all conditions
	// eg :-  f200_0000 is below f400_0000 and face_face; and above f000_0000
	constraint valid2 { addr <= 32'hf4000000; }  
	
	// An empty constraint - does not affect randomization
	constraint c_empty;
endclass


/*Constraint can be placed either inside the class body definition or outside it.
When a constrain are defined outside a 	class's body , they are called external constraint
and are accessed by using the scope resolution operator ::*/

//External constraint
class ABC;
 rand bit [3:0] mode;
 
 constraint c_implicit;			// An empty constraint without "extern" is implicit
 extern constraint c_explicit;	// An empty constraint with "extern" is explicit
 
endclass

// This is an external constraint because it is outside
// the class-endclass body of the class. The constraint
// is reference using ::

constraint ABC::c_implicit {mode >2;}
constraint ABC::c_explicit {mode<=6;}

module constraint_block(  );

pkt Pack;	
ABC abc;
	initial begin
	Pack=new();
	abc=new();
	
	for (int i = 0; i < 5; i++) begin
			Pack.randomize();
			abc.randomize();
          $display ("PKT Class");
          $display ("addr = 0x%0h, data = %h , burst =%d, len =%d, size=%d",
          		 Pack.addr,Pack.data,Pack.burst,Pack.len,Pack.size);
          $display ("ABC Class");
          $display ("mode = 0x%0h", abc.mode);
		end
	
	end
	
endmodule
