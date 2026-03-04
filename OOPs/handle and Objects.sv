`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.02.2026 12:37:56
// Design Name: 
// Module Name: handle_and_objects
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


// Create a new class with a single member called
// count that stores integer values
class packet;
	integer count;
endclass


module handle_and_objects( );

// Create a "handle" for the class Packet that can point to an
  	// object of the class type Packet
  	// Note: This "handle" now points to NULL
  	packet pkt;
  	
  	initial begin
      if (pkt == null)
        $display ("Packet handle 'pkt' is null");

      // Display the class member using the "handle"
      // Expect a run-time error because pkt is not an object
      // yet, and is still pointing to NULL. So pkt is not
      // aware that it should hold a member
      $display ("count = %0d", pkt.count);
  	end
  	
  	// Create a "handle" for the class Packet that can point to an
  	// object of the class type Packet
  	// Note: This "handle" now points to NULL
	Packet pkt2;
	
	initial begin
      if (pkt2 == null)
        $display ("Packet handle 'pkt2' is null");

      // Call the new() function of this class
      pkt2 = new();

      if (pkt2 == null)
        $display ("What's wrong, pkt2 is still null ?");
      else
        $display ("Packet handle 'pkt2' is now pointing to an object, and not NULL");

      // Display the class member using the "handle"
      $display ("count = %0d", pkt2.count);
  	end

//If we assign pkt to a new variable called pkt2, the new variable will also point to the contents in pkt.

packet pkt3, pkt2;

  	initial begin


      // Call the new() function of this class and
      // assign the member some value
      pkt3 = new();
      pkt3.count = 16'habcd;

      // Display the class member using the "pkt" handle
      $display ("[pkt] count = 0x%0h", pkt.count);

      // Make pkt3 handle to point to pkt and print member variable
      pkt3 = pkt;
      $display ("[pkt2] count = 0x%0h", pkt2.count);
  	end
endmodule
