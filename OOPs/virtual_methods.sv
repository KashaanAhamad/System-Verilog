`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.03.2026 22:12:36
// Design Name: 
// Module Name: virtual_methods
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

//In Inheritance, we saw that methods invoked by a base class handle which points 
//to a child class instance would eventually end up executing the base class method
//instead of the one in child class. 
//If that function in the base class was declared as virtual, only then the child
//class method will be executed.

// Without declaring display() as virtual
class Packet_vm;
   int addr;

   function new (int addr);
      this.addr = addr;
   endfunction

   // Here the function is declared as "virtual"
   // so that a different definition can be given
   // in any child class
   virtual function void display ();
		$display ("[Base] addr=0x%0h", addr);
	endfunction
endclass

class ExtPacket_vm extends Packet_vm;

	// This is a new variable only available in child class
	int data;

   function new (int addr, int data);
      super.new (addr); 	// Calls 'new' method of parent class
      this.data = data;
   endfunction

	function void display ();
		$display ("[Child] addr=0x%0h data=0x%0h", addr, data);
	endfunction
endclass

module virtual_methods(    );
    Packet_vm bc;
   ExtPacket_vm sc;

	initial begin
        sc = new (32'hfeed_feed, 32'h1234_5678);

        bc = sc;
		bc.display ();
	end
endmodule

//Note That without virtual function the base class display() function gets executed