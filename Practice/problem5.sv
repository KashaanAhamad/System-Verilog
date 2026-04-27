`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.04.2026 22:14:02
// Design Name: 
// Module Name: problem5
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

//Transition through multi value sequence
module problem5(  );
bit[3:0] a;
class A;

rand bit[3:0] v;
endclass

A obj=new();

covergroup cg;
	coverpoint a{bins seq =(1=>5=>9);}
endgroup

initial begin
	cg c=new();
	
	repeat(300)begin
		obj.randomize();
		a=obj.v;
		c.sample();
		$display("Problem5 -> a=%0d",a);
	end
	$display("Coverage =%0.2f %%",c.get_coverage());
end
endmodule
