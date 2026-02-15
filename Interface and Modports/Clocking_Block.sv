`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.02.2026 01:18:51
// Design Name: 
// Module Name: Clocking_Block
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

//Signals that are specified inside a clocking block will be sampled/driven with respect 
//to that clock. There can be mulitple clocking blocks in an interface. Note that this is
//for testbench related signals.

//You want to control when the TB drives and samples signals from DUT. 
//Solves some part of race condition, but not entirely. You can also parameterize the skew values.

interface my_int2 #(parameter D_WIDTH=31)(input bit clk);
	logic [D_WIDTH-1:0] data;
	logic               enable;
	
	clocking cb_clk @(posedge clk);
		default input #3ns output #2ns;	//Input should be sampled 3ns before posedge of clk
		input enable;					//Output should be driven 2ns after posedge of clk
		output data;
	endclocking
endinterface

//NOTE:
//1) A clocking block called cb is created which will be active on the positive edge of clk
//2) By default, all input signals within the clocking block will be sampled 5ns before and
//   all output signals within the clocking block will be driven 2ns after the positive edge
//	 of the clock clk

//3) data, valid and ready are declared as inputs to the block and hence will be sampled 5ns
// 	 before the posedge of clk
//4) grant is an output signal to the block with its own time requirement. Here grant will be
//	 driven at the negedge of clk instead of the default posedge.

//IMP:Signal directions inside a clocking block are with respect to the testbench and not the DUT.
interface cb_if(input logic clk);
	logic data;
	logic valid;
	logic ready;
	logic grant;
	logic addr;
	
//Clocking block
clocking cb @ (posedge clk);
	default input #1ns output #1ns;
    input  data, valid, ready, addr;	//Note: always watch out from which perspective you are using interface "DUT or TB"
    output grant;
endclocking
endinterface

//Dummy DUT
module dut2(cb_if intf);

  // Simple handshake logic
  always @(posedge intf.clk) begin
    if (intf.valid)
      intf.ready <= 1;
    else
      intf.ready <= 0;
  end
endmodule

module Clocking_Block();

logic clk = 0;
  always #5 clk = ~clk;

  // Interface instance
  cb_if busIf(clk);

  // DUT connection
  dut2 u_dut(busIf);

  initial begin
    // Initialize
    busIf.cb.valid <= 0;
    busIf.cb.data  <= 0;
    busIf.cb.addr  <= 0;
    busIf.cb.grant <= 0;

    // Wait for clock edge via clocking block
    @(busIf.cb);

    // Drive using clocking block (output skew applied)
    busIf.cb.valid = 1;
    busIf.cb.data  = 1;
    busIf.cb.addr  = 1;

    // Wait and sample (input skew applied)
    @(busIf.cb);
    $display("Time=%0t VALID=%0b READY=%0b DATA=%0b",
              $time, busIf.cb.valid, busIf.cb.ready, busIf.cb.data);

    @(busIf.cb);
    busIf.cb.valid <= 0;

    repeat(3) @(busIf.cb);
    $finish;
  end

endmodule


//Note:  A testbench can have many clocking blocks, but only one block per clock.
//SYNTAX:
/*[default] clocking [identifier_name] @ [event_or_identifier]
	default input #[delay_or_edge] output #[delay_or_edge]
	[list of signals]
 endclocking
*/

//The delay_value represents a skew of how many time units away from the clock event a 
//signal is to be sampled or driven. If a default skew is not specified, then all input 
//signals will be sampled #1step and output signlas driven 0ns after the specified event.
