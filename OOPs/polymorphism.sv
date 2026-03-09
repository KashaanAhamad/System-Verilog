`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.03.2026 21:51:10
// Design Name: 
// Module Name: polymorphism
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


//Polymorphism allows the use of a variable of the base class type to hold subclass
//objects and to reference the methods of those subclasses directly from the superclass variable.

//It also allows a child class method to have a different definition than its parent class if
//the parent class method is "virtual" in nature.

//A Class Handle is just a container to hold either parent or child class object.

// Base class
class Packet_pol;

    bit [31:0] addr;

    // Constructor
    function new(bit [31:0] a);
        addr = a;
    endfunction

    // Virtual method
    virtual function void display();
        $display("Base Packet addr = %h", addr);
    endfunction

endclass

// Subclass
class ExtPacket_pol extends Packet_pol;

    bit [31:0] data;

    // Constructor
    function new(bit [31:0] a, bit [31:0] d);
        super.new(a);   // call base class constructor
        data = d;
    endfunction

    // Override method
    function void display();
        $display("ExtPacket addr = %h data = %h", addr, data);
    endfunction

endclass


module polymorphism( );

   Packet_pol      bc,bc2;   // BaseClass handle
    ExtPacket_pol   sc, sc2;   // SubClass handle
    
    initial begin
		sc = new (32'hfeed_feed, 32'h1234_5678);

		// Assign sub-class to base-class handle
		bc = sc;


//Even though bc points to the child class instance, when display() function is
//called from bc it still invoked the display() function within the base class.

//This is because the function was called based on the type of the handle instead
//of the type of object the handle is pointing to.

//Referencing a Subclass member via a base class handle gives you compilation error
		bc.display ();
		sc.display ();
		
		bc2 = new (32'hface_cafe);
   		sc = new (32'hfeed_feed, 32'h1234_5678);
   		bc2 = sc;
   		
        // Dynamic cast base class object to sub-class type
		$cast (sc2, bc2);	

		sc2.display ();
   		$display ("data=sc2x%0h", sc2.data);
	end
    
endmodule

// Assign Base Class to Child Class
// It is illegal to directly assign a variable of a superclass type to a variable of one
// of its subclass types and hence you'll get a compilation error.

// However, "$cast" can be used to assign a superclass handle to a variable of a subclass 
// type provided the superclass handle refers to an object that is assignment compatible
// with the subclass variable.

//SOME RULES:
//Assignment of derived class handle to base class handle is allowed.
//Assignment of base class handle to derived class handle is NOT allowed and results in compilation error.
//$cast returns 0 if the cast failed, so use the return type to throw an error. Use "if" or "assert" to 
//ensure that the cast is successful.
