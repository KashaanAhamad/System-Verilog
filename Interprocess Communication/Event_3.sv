`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2026 04:20:19
// Design Name: 
// Module Name: Event_3
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

//wait_order: waits for event to be triggered in the given order, and issues an error if any
//event executes out of order.
module Event_3();
//Declared 3 events
event a,b,c;

initial begin
#10 ->a;
#10 ->b;
#10 ->c;
end

// This block waits until each event is triggered in the given order
initial begin
	wait_order(a,b,c)
		$display ("Events were executed in the correct order");
    else
      	$display ("Events were NOT executed in the correct order !");
end

//Merging of events
event event_a,event_b;
initial begin
	fork
	  begin
		//T1:waits for event_a to be triggered
		$display ("[%0t] Thread1: Wait for event_a is over", $time);
      end
  	  // Thread2: waits for event_b to be triggered
      begin
        wait(event_b.triggered);
        $display ("[%0t] Thread2: Wait for event_b is over", $time);
      end
      
      // Thread3: triggers event_a at 20ns
      #20 ->event_a;

      // Thread4: triggers event_b at 30ns
      #30 ->event_b;
      
      // Thread5: Assigns event_b to event_a at 10ns
      begin
        
        #10 event_b = event_a;
      end
    join
end
endmodule
