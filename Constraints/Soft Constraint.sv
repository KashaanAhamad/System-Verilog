`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.01.2026 00:07:04
// Design Name: 
// Module Name: Soft_Constr
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

/*The Normal Constraint are called hard constraint because it is mandatory for the solver 
to always satisfy them. If the solver fails to find a solution ,then the randomization will 
fail*/

/*However if a constraint is declared as soft it gives the solver some flexibility that the 
constraint need to be satisfied if there are other contradiction constraint -either hard or
soft constraint with higher priority.

Soft constraints are used to specify default valus and distributions for random variables.*/

class SF;
  rand bit [3:0] data;
  rand_bit [3:0] h_data;

  // This constraint is defined as "soft"
  constraint c_data { soft data >= 4;	//soft keyword
                     data <= 12; }
  constraint c_h_data {  h_data >= 4;	//hard constraint
                     data <= 12; }
endclass

module Soft_Constr( );
SF abc;

  initial begin
    abc = new;
    for (int i = 0; i < 5; i++) begin
    	//contradicting inline constraint
      abc.randomize() with { data == 2; };
      $display ("abc = 0x%0h", abc.data);
    end
    //This will give an error because constraint solver will fail
    for (int i = 0; i < 1; i++) begin
      abc.randomize() with { h_data == 2; };
      $display ("abc = 0x%0h", abc.h_data);
    end
  end
endmodule
