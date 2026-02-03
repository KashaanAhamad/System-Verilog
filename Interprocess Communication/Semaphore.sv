`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.02.2026 23:19:42
// Design Name: 
// Module Name: Semaphore
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

//semaphore: Different thread might need to access the same resource; they take turns by using
//semaphore

//A semaphore is used to control access to a resource and is known as a mutex (mutually 
//exclusive) because only one entity can have the semaphore at a time.

module Semaphore();
semaphore key;			// Create a semaphore handle called "key"

initial begin
key=new(1);		//Create only single key; Multiple key are also possible.	
	fork
		personA();	   // personA tries to get the room and puts it back after work
		personB();     // personB also tries to get the room and puts it back after work
		#25 personA(); // personA tries to get the room a second time
	join_none
end

task getRoom(input bit [1:0] id);
	$display ("[%0t] Trying to get a room for id[%0d] ...", $time, id);
    key.get (1);
    $display ("[%0t] Room Key retrieved for id[%0d]", $time, id);
endtask

task putRoom(input bit [1:0] id);
	$display ("[%0t] Leaving room id[%0d] ...", $time, id);
    key.put (1);
    $display ("[%0t] Room Key put back id[%0d]", $time, id);
endtask

// This person tries to get the room immediately and puts
// it back 20 time units late
task personA();
	getRoom(1);
	#20 putRoom(1);
endtask

// This person tries to get the room after 5 time units and puts it back after
// 10 time units
task personB();
	#5 getRoom(2);
	#10 putRoom(2);
endtask

endmodule
//NOTE: A semaphore object key is declared and created using new() function.
//Arguments to the new() defines the number of keys

//You get the key by using the get() keyword which will wait untill a key is 
//available(Blocking)

//You put the key back using put() keyword.
