`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.02.2026 11:59:24
// Design Name: 
// Module Name: class_basics
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


//class is a user-defined datatype, an OOP construct, that can be used to encapsulate
// data (property) and tasks/functions (methods) which operate on the data. 


class mypacket;
	bit [2:0] header;
	bit 	  encoder;
	bit [2:0] mode;
	bit [7:0] data;
	bit 	  stop;
	
	
	function new (bit [2:0] header = 3'h1, bit [2:0] mode =	5);
		this.header = header;
		this.encode = 0;
		this.mode   = mode;
		this.stop   = 1;
	endfunction
	
	function display ();
		$display ("Header = 0x%0h, Encode = %0b, Mode = 0x%0h, Stop = %0b",
		           this.header, this.encode, this.mode, this.stop);
	endfunction
endclass
//NOTE:
//function new () is called the constructor and is automatically called upon object creation.
//'this' keyword is used to refer to the current class. Normally used within a class to refer to its own properties/methods.
//display () is a function, and rightly so, because displaying values does not consume simulation time.


module class_basics(  );

    myPacket pkt0, pkt1;
    myPacket pkt [3];


		initial begin
			pkt0 = new (3'h2, 2'h3);
			pkt0.display ();
	
			pkt1 = new ();
			pkt1.display ();
		end
	
		//creating an array of Classes
		initial begin
			for(int i = 0; i < $size (pkt0); i++) begin
				pkt[i] = new ();
				pkt[i].display ();
			end
		end

endmodule
