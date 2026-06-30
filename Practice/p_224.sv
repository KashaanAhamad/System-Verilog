`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2026 23:54:39
// Design Name: 
// Module Name: p_224
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

module p_224;
 class register;
   local int data;
   task set(int i);
     data=i;
   endtask
   function int get();
	return data;
   endfunction
 endclass

initial begin
  register c1=new();
  //c1.data=3;//Illegal
  c1.set(3);//legal
  $display("c1.data is %d",c1.get());
end
endmodule

