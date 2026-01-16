`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.01.2026 22:19:45
// Design Name: 
// Module Name: randomization
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

class packet;
rand bit[1:0] mode;
randc bit[1:0] key;

	function display();
		$display("Mode: %d and key=%d",mode,key);
	endfunction
endclass

//This Class has Random variable with constraint
class constrainedPacket;
rand bit [1:0] mode_c;
randc bit [2:0] key_c;

constraint c_mode{ mode_c <=3;}
constraint c_key{ key_c >2;
				  key_c <7;}

	function display();
		$display("Mode_c: %d and key_c=%d",mode_c,key_c);
	endfunction

endclass
module randomization();
//Create a class Object handle
packet pkt;
constrainedPacket pkt2;

initial begin
//Instantiate the Object
	pkt=new();
	pkt2=new();
	
	for(int i=0;i<15;i++)begin
		assert(pkt.randomize());
			pkt.display();		
	end
	
	//Constaint Variable Randomization 
	for(int j=0;j<15;j++)begin
		assert(pkt2.randomize())
			pkt2.display();
	end
end
endmodule