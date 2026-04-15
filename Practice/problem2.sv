`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.04.2026 01:09:41
// Design Name: 
// Module Name: problem2
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


//Write a constraint to generate a pattern 0101010101
class constraint_5;
 rand int da[];
 
 constraint c1{da.size==10;}
 constraint c2{foreach(da[i])
 	da[i] ==i%2;
 	}
 	
endclass

constraint_5 c1;
module problem2(   );

 initial begin
 	c1=new;
 	assert(c1.randomize());
 	$display("da: %p",c1.da);
 end
endmodule
