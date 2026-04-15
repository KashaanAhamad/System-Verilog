`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.04.2026 01:02:33
// Design Name: 
// Module Name: problem1
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

//Cross of Boolean condition
module problem1();

  bit [7:0] a;
  class A;
  	rand bit[7:0] v;
  endclass
  
  A obj=new();
  
  covergroup cg;
  	cp1:coverpoint (a>128);
  	cp2:coverpoint (a[0]);
  	cross cp1,cp2;
  endgroup
  
  initial begin
  	cg c=new();
  	repeat(22) begin
  		obj.randomize();
  		a=obj.v;
  		
  		c.sample();
  		$display("Problem 1 -> a=%0d",a);
  	end
  	$display("Coverage=%0.2f %%",c.get_coverage());
  end
endmodule
