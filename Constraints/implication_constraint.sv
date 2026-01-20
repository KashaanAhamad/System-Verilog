`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.01.2026 23:52:38
// Design Name: 
// Module Name: implication_constraint
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


class ABC;
  rand bit [2:0] mode;
  rand bit [3:0] len;

  constraint c_mode { mode == 2 -> len > 10; }
  
  //If else constraint construct
  constraint c_len 	{ if(mode == 0)
  							len <10;
  					}
endclass

/*An implication operator -> can be used 
in a constraint expression to show conditional relationship between two variables.
*/

module implication_constraint();
  initial begin
    ABC abc = new;
    for(int i = 0; i < 10; i++) begin
      abc.randomize();
      $display ("mode=%0d len=%0d", abc.mode, abc.len);
    end
  end
endmodule

