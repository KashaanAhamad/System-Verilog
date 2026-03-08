`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.03.2026 22:35:53
// Design Name: 
// Module Name: inheritance
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

// Inheritance is a concept in OOP that allows us to extend a class to create another
// class and have access to all the properties and methods of the original parent class
// from the handle of a new class object.

class Packet_inher;
   int addr;

   function new (int addr);
      this.addr = addr;
   endfunction

	function display ();
		$display ("[Base] addr=0x%0h", addr);
	endfunction
endclass

// A subclass called 'ExtPacket_inher' is derived from the base class 'Packet_inher' using
// 'extends' keyword which makes 'ExtPacket_inher' a child of the parent class 'Packet_inher'
// The child class inherits all variables and methods from the parent class
class ExtPacket_inher extends Packet_inher;

	// This is a new variable only available in child class
	int data;

   function new (int addr, data);
      super.new (addr); 	// Calls 'new' method of parent class
      this.data = data;
   endfunction

	function display ();
		$display ("[Child] addr=0x%0h data=0x%0h", addr, data);
	endfunction
endclass

module inheritance(  );
    Packet_inher      bc; 	// bc stands for BaseClass
	ExtPacket_inher   sc; 	// sc stands for SubClass

	initial begin
		bc = new (32'hface_cafe);
		bc.display ();

        sc = new (32'hfeed_feed, 32'h1234_5678);
		sc.display ();
	end
endmodule
