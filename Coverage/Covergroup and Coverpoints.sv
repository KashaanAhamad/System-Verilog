`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.01.2026 03:17:27
// Design Name: 
// Module Name: Covergroup_Coverpoints
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

//SV covergroup is a user-defined type that encapsulate the specification of a coverage model.
//They can be defined once and instantiated multiple times at diffrent place via the 'new' function

//covergroup can be defined in either a package, module, program, interface, or class and usually 
//encapsulates the following information:
//1) A set of coverage point
//2) Cross coverage between coverage point
//3) An event that defines what the covergroup is sampled
//4) Other options to configure coverage object

module Covergroup_Coverpoints( );
//Declare some variable that can be sampled in the covergroup
bit [1:0] mode;
bit [2:0] cfg;

// Declare a clock to act as an event that can be used to sample
  // coverage points within the covergroup
  bit clk;
  always #20 clk = ~clk;
  
  // "cg" is a covergroup that is sampled at every posedge clk
  covergroup cg @ (posedge clk);
    // Coverpoints can optionally have a name before a colon ":"
    cp_mode    : coverpoint mode;
    cp_cfg_10  : coverpoint cfg[1:0];
    cp_cfg_lsb : coverpoint cfg[0];
    cp_sum     : coverpoint (mode + cfg);
  endgroup
  
  // Create an instance of the covergroup
  cg  cg_inst;
  
  initial begin
    // Instantiate the covergroup object similar to a class object
    cg_inst= new();
    // Stimulus : Simply assign random values to the coverage variables
    // so that different values can be sampled by the covergroup object
    for (int i = 0; i < 5; i++) begin
      @(negedge clk);
      mode = $random;
      cfg  = $random;
      $display ("[%0t] mode=0x%0h cfg=0x%0h", $time, mode, cfg);
    end
end

// At the end of 500ns, terminate test and print collected coverage
  initial begin
    #500 $display ("Coverage = %0.2f %%", cg_inst.get_inst_coverage());
    $finish;
  end
endmodule
