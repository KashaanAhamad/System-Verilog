`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.02.2026 00:52:01
// Design Name: 
// Module Name: Interfaces
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

//Interface is a way to encapsulate signals into a block. All related signal are grouped together
//to form an interface block so that the same 'interface' can be reused for other project.
//Also it becomes easier to connect with the DUT and other verification component.

//Example:
interface apb_if(input pclk);
	logic [31:0] paddr;
	logic [31:0] pwdata;
	login [31:0] prdata;
	logic 		 penable;
	logic 		 pwrite;
	logic		 psel;
endinterface
//Why signals are declared as Logic? --> logic ia s data type that lets you drive signals of 
//this type via assign statement and in a procedural block.

//Signals connected to the DUT should support 4-states so that X/Z values can be caught. 
//If these signals were bit then the X/Z would have shown up as 0, and you would have missed 
//that DUT had a X/Z value.

//Parameterized Interface
interface my_int #(parameter D_WIDTH=31)(input bit clk);
	logic [D_WIDTH-1:0] data;
	logic               enable;
	
endinterface


//Interface with defined port direction
interface myBus(input clk);
	logic [7:0] data;
	logic 		enable;
	
	//From Tb Perspective, 'data' is input and 'write' is output
	modport TB (input data, clk, output enable);
	
	//From DUT perspective, 'data' is output and 'enable' is input
	modport DUT (output data, input enable,clk);
endinterface


module dut (myBus busIf);
  always @ (posedge busIf.clk)
    if (busIf.enable)
      busIf.data <= busIf.data+1;
    else
      busIf.data <= 0;
endmodule

module Interfaces();

bit clk;
  // Create a clock
  always #10 clk = ~clk;

  // Create an interface object
  myBus busIf (clk);

  // Instantiate the DUT; pass modport DUT of busIf
  dut dut0 (busIf.DUT);
  
  // Testbench code : let's wiggle enable
  initial begin
    busIf.enable  <= 0;
    #10 busIf.enable <= 1;
    #40 busIf.enable <= 0;
    #20 busIf.enable <= 1;
    #100 $finish;
  end
endmodule
