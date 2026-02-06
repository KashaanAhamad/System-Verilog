`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.01.2026 01:56:04
// Design Name: 
// Module Name: disable_fork
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


module disable_fork(   );

initial begin
	
	// Fork off 3 sub-threads in parallel and the currently executing main thread
	// will finish when any of the 3 sub-threads have finished.
	fork
		// Thread1 : Will finish first at time 40ns
		#40 $display ("[%0t ns] Show #40 $display statement", $time);
		
		// Thread2 : Will finish at time 70ns
		begin
			#20 $display ("[%0t ns] Show #20 $display statement", $time);
			#50 $display ("[%0t ns] Show #50 $display statement", $time);
		end
		// Thread3 : Will finish at time 60ns
		#60 $display ("[%0t ns] TIMEOUT", $time);
	join_any
	
	// Display as soon as the fork is done
	$display ("[%0tns] Fork join is done", $time);
	//NOTE: Thread2 and Thread3 are still running even though the main thread has come out of
	//fork..join_any block.
end

//NOTE: In the Below Code note that Thread2 and thread3 got killed because of disable fork.
initial begin
   	// Fork off 3 sub-threads in parallel and the currently executing main thread
    // will finish when any of the 3 sub-threads have finished.
    $display (" Showing Threads with disable fork");
	fork

    // Thread1 : Will finish first at time 40ns
      #40 $display ("[%0t ns] Show #40 $display statement", $time);

    // Thread2 : Will finish at time 70ns
         begin
            #20 $display ("[%0t ns] Show #20 $display statement", $time);
            #50 $display ("[%0t ns] Show #50 $display statement", $time);
         end

     // Thread3 : Will finish at time 60ns
          #60 $display ("[%0t ns] TIMEOUT", $time);
      join_any

    // Display as soon as the fork is done
      $display ("[%0tns] Fork join is done, let's disable fork", $time);

      disable fork;
   end
endmodule
