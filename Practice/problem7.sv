`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2026 13:05:58
// Design Name: 
// Module Name: problem7
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

//Packet size ->16 to 1500 and multiple of 4
module problem7();
	class packet;
		rand int a;
		int qx4[$];
		constraint c{
			a inside {[64:1500]};
			
			a%4 ==0;
		}
		function void post_randomize();
			qx4.push_back(a);
		endfunction
	endclass
packet p;
	initial begin
		p=new;
		repeat(10)
		assert(p.randomize());
		$display("Multiple of 4: %p",p.qx4);
		foreach(p.qx4[i])
			if(p.qx4[i] %4 ==0)
				$display("The Value [%d] is multiple of 4",p.qx4[i]);
	
	end
endmodule
