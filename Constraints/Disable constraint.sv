`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.01.2026 02:48:19
// Design Name: 
// Module Name: Disable_constr
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

//All constraint by default are enabled
//A disabled constraint is not considered during randomization
//Constraint can be enabled or disabled by constraint_mode() method
//Constraint_mode() can be called as both task and function.

//Called as a Task--> class_obj.const_name.constraint_mode(0/1);
//Called as a function--> status = class_obj.const_name.constraint_mode()	//status is an int variable to hold return value
//Constraint_mode() is an built-in method and cannot be overriden!

class Fruits;
  rand bit[3:0]  num; 				// Declare a 4-bit variable that can be randomized

  constraint c_num { num > 4;  		// Constraint is by default enabled, and applied
                    num < 9; }; 	// during randomization giving num a value between 4 and 9
endclass
module Disable_constr();
initial begin
    Fruits f = new ();

	// 1. Print value of num before randomization
    $display ("Before randomization num = %0d", f.num);

    // 2. Call "constraint_mode" as a function, the return type gives status of constraint
    if (f.c_num.constraint_mode ())
      $display ("Constraint c_num is enabled");
    else
      $display ("Constraint c_num is disabled");

    // 3. Randomize the class object
    f.randomize ();

    // 4. Display value of num after randomization
    $display ("After randomization num = %0d", f.num);
    
     // Disable constraint
    f.c_num.constraint_mode(0);
    
    if (f.c_num.constraint_mode ())
      $display ("Constraint c_num is enabled");
    else
      $display ("Constraint c_num is disabled");

    // Randomize the variable and display
    f.randomize ();
    $display ("After randomization num = %0d", f.num);
  end
endmodule
