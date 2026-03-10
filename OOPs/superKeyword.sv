`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.03.2026 22:48:09
// Design Name: 
// Module Name: superKeyword
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

//The super keyword is used from within a sub-class to refer to properties and methods of the base class.
//It is mandatory to use the super keyword to access properties and methods if they have been overridden
//by the sub-class.

class Packet_sup;
	int addr;
	function display ();
		$display ("[Base] addr=0x%0h", addr);
	endfunction
endclass

class extPacket_sup extends Packet_sup; 
	 

	function display();
		super.display();                          // Call base class display method
		$display ("[Child] addr=0x%0h", addr);
	  endfunction
                    
	function new ();
		super.new ();
	endfunction
endclass


module superKeyword(  );
    Packet_sup 		p;
  	extPacket_sup 	ep;

  	initial begin
      ep = new();
      p = new();
      p.display();
      ep.display();
    end
endmodule
