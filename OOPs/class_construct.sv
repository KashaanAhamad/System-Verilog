`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.03.2026 02:58:03
// Design Name: 
// Module Name: class_construct
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


// Define a class called "Packet" with a 32-bit variable to store address
// Initialize "addr" to 32'hfade_cafe in the new function, also called constructor
class Packet;
  bit [31:0] addr;

  function new ();
    addr = 32'hfade_cafe;
  endfunction
endclass



//Behavior of inherited classes
// Define a simple class and initialize the class member "data" in new() function
class baseClass_2;
  bit [15:0] data;

  function new ();
    data = 16'hface;
  endfunction
endclass

// Define a child class extended from the above class with more members
// The constructor new() function accepts a value as argument, and by default is 2
class subClass extends baseClass_2;
  bit [3:0] id;
  bit [2:0] mode = 3;

  function new (int val=2 );
    // The new() function in child class calls the new function in
    // the base class using the "super" keyword
    super.new ();

    // Assign the value obtained through the argument to the class member
    id = val;
  endfunction
endclass


module class_construct(  );
 // Create a class handle called "pkt" and instantiate the class object
  initial begin
    // The class's constructor new() fn is called when the object is instantiated
    Packet pkt = new;
    
     // Create two handles for the child class
    subClass  sc1, sc2;


    // Display the class variable - Because constructor was called during
    // instantiation, this variable is expected to have 32'hfade_cafe;
    $display ("addr=0x%0h", pkt.addr);
    
    // Instantiate the child class and display member variable values
    sc1 = new ();
    $display ("data=0x%0h id=%0d mode=%0d", sc1.data, sc1.id, sc1.mode);

    // Pass a value as argument to the new function in this case and print
    sc2 = new (4);
    $display ("data=0x%0h id=%0d mode=%0d", sc2.data, sc2.id, sc2.mode);
  		
  end
endmodule

//NOTE: A constructor can be declared as local or protected, but not as static or virtual. 

//Typed Constructor
/*
class C;
endclass

class D extends C;
endclass

module tb;
   initial begin
      C c = D::new;
   end
endmodule
*/
//The difference here is that you can call the new() function of a subclass but assign it to the handle of a base class in a single statement.
//This is done by referencing the new() function of the subclass using scope operator :: as shown


//Variable c of base class C now references a newly constructed object of type D. This achieves the same effect as the code given below.
//module tb;
//	initial begin
//		D d = new;
//		C c = d;
//	end
//endmodule