`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2026 03:57:49
// Design Name: 
// Module Name: Events_2
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

//Note: Events can be assigned or compared to other events variables
// ->Can be assigned to Null.
// ->When assigned to another event, both variable points to samesynchronization object. 
// ->Events can be passed to queues,function and tasks.

// event one;				Event created called one
//event one_again=one;		one_again becomes an alias to over
//event empty =null;		event variable with no synchronization object

module Events_2(  );

//Named Event can be triggered using "->" or "->>" operator
//Processes can wait for an event using "@" operator or ".triggered"
//creating event variable that processes use to trigger and wait
event A;

//T1: Triggers event using "->" operator
initial begin
	#20 ->A;
	$display ("[%0t] Thread1: triggered event_a", $time);
end

//T2: waits for the event using "@" operator
initial begin
	$display ("[%0t] Thread2: waiting for trigger ", $time);
	@(A);
    $display ("[%0t] Thread2: received event_a trigger ", $time);
end

//T3: waits for the event usign ".triggered" 
initial begin
	$display ("[%0t] Thread3: waiting for trigger ", $time);
	wait(A.triggered);
	$display ("[%0t] Thread3: received event_a trigger", $time);
end
endmodule

//Q. What is the difference between @ and .triggerd?
//An events triggered state persists throughtout the time step,until simulation advances.
//Hence if both wait for the event and trigger of the event happens at the same time there
//will be a race condition and the triggered property helps to avoid that.
//A Processes that waits on the triggered state always unblocks, regardless of the order of
//wait and triggered.
