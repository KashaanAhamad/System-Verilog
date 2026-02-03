`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.02.2026 23:11:28
// Design Name: 
// Module Name: Events
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

//Events :Different threads synchronize with each other via event handles in a Testbench.
//One process waits for the event to happen while another process triggers the event.
//When the event is triggered, the process waiting for the event will resume execution.

module Events();
event A; 	//creates an event called A

initial begin
	fork
		waitForTrigger(A);		//Task wait for event A
		#5 ->A;		//Trigger event A
	join
end
	// The event is passed as an argument to this task. It simply waits for the event
	// to be triggered
	task waitForTrigger (input event A);
		$display ("[%0t] Waiting for A to be triggered", $time);
		wait (A.triggered);
		$display ("[%0t] A has triggered", $time);
	endtask
endmodule
