`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.01.2026 22:25:06
// Design Name: 
// Module Name: coverpoint_bins
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

//The bins construct allow the creation of a separate bin for each value in the given 
//range of possible values of a coverage point variable

/*
coverpoint mode{
	// Manually create a separate bin for each value
	bins zero={0};
	bins one ={1};
	// Allow SystemVerilog to automatically create separate bins for each value
	// Values from 0 to maximum possible value is split into separate bins
	bins range[]={[0:$]};
	
	//create automatic bins for the both the given ranges
	bins c[] = {[2:3],[5:7]};
	
	//Use fixed number of automatic bins. Entire range is broken up into 4 bins
	bins range[4] = {[0:$]};
	
	// If the number of bins cannot be equally divided for the given range, then
	// the last bin will include remaining items; Here there are 13 values to be
	// distributed into 4 bins which yields:
	// [1,2,3] [4,5,6] [7,8,9] [10, 1, 3, 6]
	bins range[4] = {[1:10], 1, 3, 6};
	
	// A single bin to store all other values that don't belong to any other bin
	bins others = default;
	}
	
*/
	
module coverpoint_bins( );

bit [2:0] mode;

  // This covergroup does not get sample automatically because
  // the sample event is missing in declaration
  covergroup cg;
    coverpoint mode {
    	bins one = {1};
    	bins five = {5};
    }
  endgroup
  
  // Stimulus : Simply randomize mode to have different values and
  // manually sample each time
  initial begin
    cg cg_inst = new();
    for (int i = 0; i < 5; i++) begin
	  #10 mode = $random;
      $display ("[%0t] mode = 0x%0h", $time, mode);
      cg_inst.sample();
    end
    $display ("Coverage = %0.2f %%", cg_inst.get_inst_coverage());
  end
endmodule
