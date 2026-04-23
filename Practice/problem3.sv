`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.04.2026 01:38:17
// Design Name: 
// Module Name: problem3
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


class palindrome_array;
	rand int array[];
	rand int n;
	constraint range {n inside {[5:10]};
						array.size()==n;
						foreach(array[i])
							array[i] inside {[1:50]};
						}
						
	constraint palindrome{foreach(array[i])
							if(i<n/2)
								array[i]==array[n-1-i];
						}
	function void post_randomize();
			$display("ARRAY is %p\n",h.array);
	endfunction

endclass

palindrome_array h;

module problem3();
	initial begin
		h=new();
		repeat(5) begin
			assert(h.randomize());
		end	
	end
endmodule
