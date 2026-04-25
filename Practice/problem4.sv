`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.04.2026 22:00:58
// Design Name: 
// Module Name: problem4
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

//Write a constraint to generate prime number between 1 to 100

class constraint_21;
int prime_num[$];
rand int da[];

constraint c1{da.size ==100;}
constraint c2{foreach(da[i])
		da[i] ==prime_fun(i); 
	}
	
function int prime_fun(input int i);
if(i>1 && (!((i%2 == 0 && i!=2) || (i%3 ==0 && i!=3) || (i%5==0 && i!=5) ||
   (i%7==0 && i!=7))))
   
 	return i;
else
	return 0;
endfunction

function void post_randomize();
	foreach(da[i])
	begin
		if(da[i] !=0)
		begin
			prime_num.push_back(da[i]);
		end
	end
endfunction
endclass

constraint_21 c1;
module problem4(  );
initial begin
	c1=new;
	assert(c1.randomize());
		$display("\n \n da: \n %p \n",c1.da);
end
endmodule
