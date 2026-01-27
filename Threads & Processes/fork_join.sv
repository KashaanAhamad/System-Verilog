`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.01.2026 23:48:29
// Design Name: 
// Module Name: fork_join
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

//SYNTAX:
//fork
	// Thread 1
	// Thread 2
	// ...
	// Thread 3
//join
module fork_join( );
    
    initial begin
      $display ("[%0t] Main Thread: Fork join going to start", $time);
		fork
			// Thread 1
			#30 $display ("[%0t] Thread1 finished", $time);

			// Thread 2
          	begin
              	#5 $display ("[%0t] Thread2 ...", $time);
				#10 $display ("[%0t] Thread2 finished", $time);
            end

            // Thread 3
			#20 $display ("[%0t] Thread3 finished", $time);
		join
      $display ("[%0t] Main Thread: Fork join has finished", $time);
	end
endmodule

module tb2;
	initial begin
      $display ("[%0t] Main Thread: Fork join going to start", $time);
		fork
			fork
              print (20, "Thread1_0");
              print (30, "Thread1_1");
            join 
          print (10, "Thread2");
		join
      $display ("[%0t] Main Thread: Fork join has finished", $time);
	end

  // Note that this task has to be automatic
  task automatic print (int _time, string t_name);
    #(_time) $display ("[%0t] %s", $time, t_name);
  endtask
endmodule


module tb3;
	initial begin
      $display ("[%0t] Main Thread: Fork join going to start", $time);
		fork
			fork // Thread 1
              #50 $display ("[%0t] Thread1_0 ...", $time);
              #70 $display ("[%0t] Thread1_1 ...", $time);
              begin
                #10 $display ("[%0t] Thread1_2 ...", $time);
                #100 $display ("[%0t] Thread1_2 finished", $time);
              end
            join

			// Thread 2
          	begin
              	#5 $display ("[%0t] Thread2 ...", $time);
				#10 $display ("[%0t] Thread2 finished", $time);
            end

            // Thread 3
			#20 $display ("[%0t] Thread3 finished", $time);
		join
      $display ("[%0t] Main Thread: Fork join has finished", $time);
	end
endmodule
