`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2026 23:48:40
// Design Name: 
// Module Name: fork_join_none
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

program nested_F_J;
initial begin
      $display ("[%0t] Main Thread: Fork join going to start", $time);
		fork
          begin
			fork
              printN (20, "Thread1_0");
              printN (30, "Thread1_1");
            join_none
            $display("[%0t] Nested fork has finished", $time);
          end
          printN (10, "Thread2");
        join_none
      $display ("[%0t] Main Thread: Fork join has finished", $time);
	end
	// Note that we need automatic task
  task automatic printN (int _time, string t_name);
    #(_time) $display ("[%0t] %s", $time, t_name);
  endtask
endprogram


module fork_join_none( );
    initial begin
      $display ("[%0t] Main Thread: Fork join going to start", $time);
		fork
          print (20, "Thread1_0");
          print (30, "Thread1_1");
          print (10, "Thread2");
		join_none
      $display ("[%0t] Main Thread: Fork join has finished", $time);
	end
	
	// Note that we need automatic task
  task automatic print (int _time, string t_name);
    #(_time) $display ("[%0t] %s", $time, t_name);
  endtask
endmodule
