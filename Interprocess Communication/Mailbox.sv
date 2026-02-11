`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2026 11:09:11
// Design Name: 
// Module Name: Mailbox
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

//Mailbox is like an dedicated channel established to send data between 2 component
//e.g A mailbox can be created and the handles be passed to a data generator and a driver.
//The generator can push the data object into the mailbox and the driver will be able to
//retrieve the packet and drive the signal onto the bus.

//Data packet environment
class transaction;
	rand bit [7:0] data;
	
	function display();
		$display ("[%0t] Data = 0x%0h", $time, data);
	endfunction
endclass

// Generator class - Generate a transaction object and put into mailbox
class generator;
	mailbox mbx;
	
	function new(mailbox mbx);
		this.mbx = mbx;
	endfunction

task genData();
	transaction trns =new();
	trns.randomize();
	trns.display();
	$display ("[%0t] [Generator] Going to put data packet into mailbox", $time);
	mbx.put(trns);
	$display ("[%0t] [Generator] Data put into mailbox", $time);
endtask	
endclass

// Driver class - Get the transaction object from Generator
class driver;
	mailbox mbx;
	
	function new(mailbox mbx);
		this.mbx = mbx;
	endfunction
	
	task drvData ();
      transaction drvTrns = new ();
      $display ("[%0t] [Driver] Waiting for available data", $time);
      mbx.get (drvTrns);
      $display ("[%0t] [Driver] Data received from Mailbox", $time);
      drvTrns.display ();
   endtask
endclass

module Mailbox( );
	mailbox mbx;
	generator gen;
	driver drv;
	
initial begin
	mbx=new();
	gen=new(mbx);
	drv=new(mbx);

 fork
         #10 gen.genData ();
         drv.drvData ();
join_none
end
endmodule
