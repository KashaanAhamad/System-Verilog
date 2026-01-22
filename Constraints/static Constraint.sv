`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.01.2026 23:48:21
// Design Name: 
// Module Name: static_constr
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

/*Just like static variable in a class, constraint can be declared
 as static. A static constr is shared across all the class instances
 
 Constraint are affected by the static keyword only if they are turned on and 
 off using constraint.mode() method.
 When Non-static constr. is turned off using this method, the constraint
 is turned off and on using this method, the constraint is turned off and on in all the 
 instance os the class.*/
 
 class SC;
 rand bit [3:0] a;
 
 constraint c1{	a>5;}
 static constraint c2{	a<12;}
 
 endclass
module static_constr( );
SC obj1,obj2;

	initial begin
		obj1=new;
		obj2=new;
		//turning off nonstatic constraint
		obj1.c1.constraint_mode(0);
		
		//Turn of static constraint
		//obj1.c2.constraint_mode(0);
		
		
		for(int i=0;i<5;i++)begin
			obj1.randomize();
			obj2.randomize();
			$display ("obj1.a = %0d, obj2.a = %0d", obj1.a, obj2.a);
		end
	end 

endmodule
