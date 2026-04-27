`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2026 12:28:15
// Design Name: 
// Module Name: problem6
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

//Write a constraint to generate even number in odd location and odd number in even
//location

class constraint_11;
	rand bit [3:0] da[];
	constraint c1{da.size ==10;}
	constraint c2{foreach(da[i])
				if(i%2 ==0)
					da[i] %2 == 1;
				else if(i%2 ==1)
					da[i] %2 ==0;
				}
endclass
constraint_11 cc;
module problem6( );
initial begin
	repeat(5)
		begin
			cc=new;
			assert(c1.randomize());
			$display("da: %p",cc.da);
		end
end
endmodule
